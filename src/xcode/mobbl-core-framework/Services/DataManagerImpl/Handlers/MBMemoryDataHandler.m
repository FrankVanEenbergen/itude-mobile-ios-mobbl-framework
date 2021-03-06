/*
 * (C) Copyright Itude Mobile B.V., The Netherlands.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *   http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#import "MBMemoryDataHandler.h"
#import "MBMetadataService.h"
#import "MBDocumentFactory.h"
#import "MBResourceService.h"

@implementation MBMemoryDataHandler

- (id) init {
	if (self = [super init]) {
		_dictionary = [[NSMutableDictionary alloc] init];
	}
	return self;
}

- (void) dealloc {
	[_dictionary release];
	[super dealloc];
}

- (MBDocument *) loadDocument:(NSString *)documentName {
	MBDocument *doc = [_dictionary objectForKey:documentName];
	if(doc == nil)
	{
		// Not yet in the store; handle default construction of the document using a file as template
		NSData *data = [[MBResourceService sharedInstance].fileManager dataWithContentsOfMainBundle: documentName];
		MBDocumentDefinition *docDef = [[MBMetadataService sharedInstance] definitionForDocumentName: documentName];
		return [[MBDocumentFactory sharedInstance] documentWithData: data withType:PARSER_XML andDefinition:docDef];
	}
	return doc;
}

- (MBDocument *) loadDocument:(NSString *)documentName withArguments:(MBDocument *)args {
    // Memory does not know what to do with arguments; so just ignore them
    return [self loadDocument: documentName];
}

- (void) storeDocument:(MBDocument *)document {
	[_dictionary setValue:document forKey:[document name]];
}

@end
