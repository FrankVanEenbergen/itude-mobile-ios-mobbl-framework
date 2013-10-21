/*
 * (C) Copyright ItudeMobile.
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

// A subclass of NSLocale that forces Dutch decimal and grouping separators


#define LOCALECODEDUTCH   @"nl_NL" // A string for the dutch Locale
#define LOCALECODEITALIAN @"it_IT" // A string for the italian Locale

@interface NSLocale (DutchLocale) 

/**
 * Returns the decimal seperator depending on the device locale settings.
 * @return String with a decimal seperator character.
 * @note Returns a , (comma) when the localeCode is dutch 
 */
- (NSString *)getDecimalSeparator;


/** 
 * Returns a grouping seperator depending on the device locale settings. 
 * @return String with a grouping seperator character.
 * @note Returns a . (dot) when the localeCode is dutch 
 */
- (NSString *)getGroupingSeparator;


@end