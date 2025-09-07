#Requires AutoHotkey v2.0.0 64-bit

/**
 * The InputScope enumeration contains values that specify which input scopes are applied to a given field.
 * @remarks
 * Whether a given input scope value is supported can vary across technologies.
 * @see https://learn.microsoft.com/windows/win32/api/inputscope/ne-inputscope-inputscope
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class InputScope{

    /**
     * Indicates the standard recognition bias. Treated as default and uses the default lexicon. If combined with another input scope, it does not force coercion on the other input scope.
     * @type {Integer (Int32)}
     */
    static IS_DEFAULT => 0

    /**
     * Indicates a URL, File, or FTP format. Examples include the following.
 * 
 * <ul>
 * <li>http://www.humongousinsurance.com/</li>
 * <li>ftp://ftp.microsoft.com</li>
 * <li>www.microsoft.com</li>
 * <li>file:///C:\templ.txt</li>
 * <li>$</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_URL => 1

    /**
     * Indicates a file path. The following conditions are enforced.
 * 
 * <ul>
 * <li>For server name and share name, allows all IS_ONECHAR characters except: * ? : &lt; &gt; |</li>
 * <li>For file name, allows all IS_ONECHAR characters except: \ / : &lt; &gt; |</li>
 * <li>Input must start with \\ or drive name or \ or ..\ or .\ or /</li>
 * <li>Spaces are allowed.</li>
 * </ul>
 * Examples include the following.
 * 
 * <ul>
 * <li>\\servername\sharename\filename.txt</li>
 * <li>C:\temp\current work.doc</li>
 * <li>../images/hank.jpg</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_FILE_FULLFILEPATH => 2

    /**
     * Indicates a file name. The following conditions are enforced.
 * 
 * <ul>
 * <li>Accepts either extension or no extension.</li>
 * <li>Allows all IS_ONECHAR characters except: \ / : &lt; &gt; |</li>
 * <li>Spaces are allowed.</li>
 * </ul>
 * Examples include the following:
 * 
 * <ul>
 * <li>filename.txt</li>
 * <li>filename</li>
 * <li>file name.txt</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_FILE_FILENAME => 3

    /**
     * Indicates email user names. Examples include the following.
 * 
 * <ul>
 * <li>jeffsm</li>
 * <li>JeffSm</li>
 * <li>Jsmith</li>
 * <li>JSmith</li>
 * <li>jeffsmith</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_EMAIL_USERNAME => 4

    /**
     * Indicates a complete SMTP email address, for example, someone@example.com.
     * @type {Integer (Int32)}
     */
    static IS_EMAIL_SMTPEMAILADDRESS => 5

    /**
     * Indicates a log-in name and domain. The following conditions are enforced.
 * 
 * <ul>
 * <li>Allows all IS_ONECHAR characters.</li>
 * <li>Does not allow domain or username to start or end in a non-alphanumeric character.</li>
 * <li>Spaces are not allowed.</li>
 * </ul>
 * Examples include the following.
 * 
 * <ul>
 * <li>CHICAGO\JSMITH</li>
 * <li>JSMITH</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_LOGINNAME => 6

    /**
     * Indicates a combination of first, middle, and last names. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>Mr. Jeff A. Smith, Jr.</li>
 * <li>Jeff Smith</li>
 * <li>Smith, Jeff</li>
 * <li>Smith, Jeff A</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_PERSONALNAME_FULLNAME => 7

    /**
     * Indicates a honorific or title preceding a name. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>Mr.</li>
 * <li>Dr.</li>
 * <li>Miss</li>
 * <li>Sir</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_PERSONALNAME_PREFIX => 8

    /**
     * Indicates a first name or initial. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>Jeff</li>
 * <li>J.</li>
 * <li>J.A.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_PERSONALNAME_GIVENNAME => 9

    /**
     * Indicates a middle name or initial. Examples include the following.
 * 
 * <ul>
 * <li>Albert</li>
 * <li>A.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_PERSONALNAME_MIDDLENAME => 10

    /**
     * Indicates a last name. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>Smith</li>
 * <li>Smith Jones</li>
 * <li>Smith-Jones</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_PERSONALNAME_SURNAME => 11

    /**
     * Indicates a name suffix abbreviation or Roman numerals. Examples include the following.
 * 
 * <ul>
 * <li>Jr.</li>
 * <li>III</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_PERSONALNAME_SUFFIX => 12

    /**
     * Indicates a full address, including numbers. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>123 Main Street, Anytown, WA 98989</li>
 * <li>PO Box 123 Anytown, WA 98989</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_ADDRESS_FULLPOSTALADDRESS => 13

    /**
     * Indicates an alphanumeric postal code. The value is alphanumeric to support international zip codes. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>98989</li>
 * <li>98989-1234</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_ADDRESS_POSTALCODE => 14

    /**
     * Indicates a house number, street number, apartment name and number, and/or postal box. Examples include the following.
 * 
 * <ul>
 * <li>123 Main Street</li>
 * <li>P.O. Box 1234</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_ADDRESS_STREET => 15

    /**
     * Indicates a full name or abbreviation of state or province. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>WA</li>
 * <li>Washington</li>
 * <li>Wa</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_ADDRESS_STATEORPROVINCE => 16

    /**
     * Indicates the name or abbreviation of a city. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>New York</li>
 * <li>NYC</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_ADDRESS_CITY => 17

    /**
     * Indicates the name of a country/region. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>Italy</li>
 * <li>Japan</li>
 * <li>United States of America</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_ADDRESS_COUNTRYNAME => 18

    /**
     * Indicates the abbreviation of the name of a country/region. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>USA</li>
 * <li>U.S.A.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_ADDRESS_COUNTRYSHORTNAME => 19

    /**
     * Indicates currency symbols and numbers. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>$ 2,100.25</li>
 * <li>$.35</li>
 * <li>$1,234.50 USD</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_CURRENCY_AMOUNTANDSYMBOL => 20

    /**
     * Indicates a numeric value for currency, excluding currency symbols. For example, 2,100.25.
     * @type {Integer (Int32)}
     */
    static IS_CURRENCY_AMOUNT => 21

    /**
     * Indicates a full date, in a variety of formats. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>07-17-2001</li>
 * <li>7/17/01</li>
 * <li>7/17</li>
 * <li>Dec. 12</li>
 * <li>July 17</li>
 * <li>July 17, 2001</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_DATE_FULLDATE => 22

    /**
     * Indicates a numeric representation of months, constrained to 1-12. Examples include the following.
 * 
 * <ul>
 * <li>7</li>
 * <li>07</li>
 * <li>11</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_DATE_MONTH => 23

    /**
     * Indicates a numeric representation of days, constrained to 1-31. Examples include the following.
 * 
 * <ul>
 * <li>1</li>
 * <li>04</li>
 * <li>17</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_DATE_DAY => 24

    /**
     * Indicates a numeric representation of years. Examples include the following.
 * 
 * <ul>
 * <li>1988</li>
 * <li>2004</li>
 * <li>88</li>
 * <li>04</li>
 * <li>'88</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_DATE_YEAR => 25

    /**
     * Indicates a character representation of months. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>December</li>
 * <li>Dec</li>
 * <li>Dec.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_DATE_MONTHNAME => 26

    /**
     * Indicates a character representation of days. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>Wednesday</li>
 * <li>Weds</li>
 * <li>Weds.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_DATE_DAYNAME => 27

    /**
     * Indicates positive whole numbers, constrained to 0-9.
     * @type {Integer (Int32)}
     */
    static IS_DIGITS => 28

    /**
     * Indicates numbers, including commas, negative sign, and decimal. For United States locations, the following conditions are enforced.
 * 
 * <ul>
 * <li>The thousand separator is a comma.</li>
 * <li>The decimal separator is a period.</li>
 * <li>Negative numbers are represented with a hyphen without a space, not with parentheses.</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_NUMBER => 29

    /**
     * Indicates a single ANSI character, codepage 1252. For United States locations, this includes the following characters.
 * 
 * ABCDEFGHIJKLMNOPQRSTUVWXYZabcdEfghijklmnopqrstuvwxyz0123456789!\"#$%&amp;'()*+,-./:;&lt;=&gt;?@[\]^_`{|}~
     * @type {Integer (Int32)}
     */
    static IS_ONECHAR => 30

    /**
     * Indicates a password. <b>IS_PASSWORD</b> is not supported and may be altered or unavailable in the future.
 * 
 * 
 * <div class="alert"><b>Note</b>  <b>IS_PASSWORD</b> only indicates the password; it doesn't provide any security around the password. All passwords fields should have text services disabled to maintain password secrecy, and therefore it is not valid to have a password field with an <b>IS_PASSWORD</b> input scope.</div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static IS_PASSWORD => 31

    /**
     * Indicates a telephone number. Alphabetical input is not allowed. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>(206) 555-0123</li>
 * <li>555-0123</li>
 * <li>555.0123</li>
 * <li>206-555-0123</li>
 * <li>1-206-555-0123x1234</li>
 * <li>+1 (206) 555-1234</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_TELEPHONE_FULLTELEPHONENUMBER => 32

    /**
     * Indicates telephone country codes. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>+1</li>
 * <li>+44</li>
 * <li>001</li>
 * <li>00 44</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_TELEPHONE_COUNTRYCODE => 33

    /**
     * Indicates telephone area codes. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>(206)</li>
 * <li>206</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_TELEPHONE_AREACODE => 34

    /**
     * Indicates a telephone number, excluding country or area code. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>555-0123</li>
 * <li>555 0123</li>
 * <li>555.0123</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_TELEPHONE_LOCALNUMBER => 35

    /**
     * Indicates hours, minutes, seconds, and alphabetical time abbreviations. US English uses the 12 hour clock. Leading zeros are optional for hours but required for minutes and seconds. Hours are constrained to 0-24; minutes and seconds are constrained to 0-59. Examples include the following, formatted for English (United States).
 * 
 * <ul>
 * <li>3:20</li>
 * <li>04:30</li>
 * <li>11:20:55</li>
 * <li>11:15 am</li>
 * <li>4:30 AM</li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static IS_TIME_FULLTIME => 36

    /**
     * Indicates a numeric representation of hours, constrained to 0-24.
     * @type {Integer (Int32)}
     */
    static IS_TIME_HOUR => 37

    /**
     * Indicates a numeric representation of minutes or seconds, constrained to 0-59.
     * @type {Integer (Int32)}
     */
    static IS_TIME_MINORSEC => 38

    /**
     * Indicates full-width number, used for Japanese only. Constrained to full-width numbers and Kanji numbers.
     * @type {Integer (Int32)}
     */
    static IS_NUMBER_FULLWIDTH => 39

    /**
     * Indicates half-width alphanumeric characters for East-Asian languages, constrained to half-width alphabetical characters and numbers.
     * @type {Integer (Int32)}
     */
    static IS_ALPHANUMERIC_HALFWIDTH => 40

    /**
     * Indicates full-width alphanumeric characters for East-Asian languages, constrained to full-width alphabet characters and numbers.
     * @type {Integer (Int32)}
     */
    static IS_ALPHANUMERIC_FULLWIDTH => 41

    /**
     * Indicates Chinese currency.
     * @type {Integer (Int32)}
     */
    static IS_CURRENCY_CHINESE => 42

    /**
     * Indicates Bopomofo characters.
     * @type {Integer (Int32)}
     */
    static IS_BOPOMOFO => 43

    /**
     * Indicates Hiragana characters.
     * @type {Integer (Int32)}
     */
    static IS_HIRAGANA => 44

    /**
     * Indicates half-width Katakana characters.
     * @type {Integer (Int32)}
     */
    static IS_KATAKANA_HALFWIDTH => 45

    /**
     * Indicates full-width Katakana characters.
     * @type {Integer (Int32)}
     */
    static IS_KATAKANA_FULLWIDTH => 46

    /**
     * Indicates Hanja characters.
     * @type {Integer (Int32)}
     */
    static IS_HANJA => 47

    /**
     * Indicates half-width Hangul characters.
     * @type {Integer (Int32)}
     */
    static IS_HANGUL_HALFWIDTH => 48

    /**
     * Indicates full-width Hangul characters.
     * @type {Integer (Int32)}
     */
    static IS_HANGUL_FULLWIDTH => 49

    /**
     * <b>Starting with Windows 8:</b> Indicates a search string.
     * @type {Integer (Int32)}
     */
    static IS_SEARCH => 50

    /**
     * <b>Starting with Windows 8:</b> Indicates a formula control, for example, a spreadsheet field.
     * @type {Integer (Int32)}
     */
    static IS_FORMULA => 51

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for search boxes where incremental results are displayed as the user types.
     * @type {Integer (Int32)}
     */
    static IS_SEARCH_INCREMENTAL => 52

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for Chinese half-width characters.
     * @type {Integer (Int32)}
     */
    static IS_CHINESE_HALFWIDTH => 53

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for Chinese full-width characters.
     * @type {Integer (Int32)}
     */
    static IS_CHINESE_FULLWIDTH => 54

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for native script.
     * @type {Integer (Int32)}
     */
    static IS_NATIVE_SCRIPT => 55

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for Japanese names.
     * @type {Integer (Int32)}
     */
    static IS_YOMI => 56

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for working with text.
     * @type {Integer (Int32)}
     */
    static IS_TEXT => 57

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for chat strings.
     * @type {Integer (Int32)}
     */
    static IS_CHAT => 58

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for working with a name or telephone number.
     * @type {Integer (Int32)}
     */
    static IS_NAME_OR_PHONENUMBER => 59

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for working with an email name or full email address.
     * @type {Integer (Int32)}
     */
    static IS_EMAILNAME_OR_ADDRESS => 60

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for working with private data.
     * @type {Integer (Int32)}
     */
    static IS_PRIVATE => 61

    /**
     * <b>Starting with Windows 10:</b> Indicates input scope is intended for working with a map location.
     * @type {Integer (Int32)}
     */
    static IS_MAPS => 62

    /**
     * <b>Starting with Windows 10:</b> Indicates expected input is a numeric password, or PIN.
     * @type {Integer (Int32)}
     */
    static IS_NUMERIC_PASSWORD => 63

    /**
     * <b>Starting with Windows 10:</b> Indicates expected input is a numeric PIN.
     * @type {Integer (Int32)}
     */
    static IS_NUMERIC_PIN => 64

    /**
     * <b>Starting with Windows 10:</b> Indicates expected input is an alphanumeric PIN.
     * @type {Integer (Int32)}
     */
    static IS_ALPHANUMERIC_PIN => 65

    /**
     * <b>Starting with Windows 10:</b> Indicates expected input is an alphanumeric PIN for lock screen.
     * @type {Integer (Int32)}
     */
    static IS_ALPHANUMERIC_PIN_SET => 66

    /**
     * <b>Starting with Windows 10:</b> Indicates expected input is a mathematical formula.
     * @type {Integer (Int32)}
     */
    static IS_FORMULA_NUMBER => 67

    /**
     * <b>Starting with Windows 10:</b> Indicates expected input does not include emoji.
     * @type {Integer (Int32)}
     */
    static IS_CHAT_WITHOUT_EMOJI => 68

    /**
     * Indicates a phrase list.
     * @type {Integer (Int32)}
     */
    static IS_PHRASELIST => -1

    /**
     * Indicates a regular expression.
     * @type {Integer (Int32)}
     */
    static IS_REGULAREXPRESSION => -2

    /**
     * Indicates an XML string that conforms to the Speech Recognition Grammar Specification (SRGS) standard. Information on SRGS can be found at <a href="https://www.w3.org/tr/speech-grammar">http://www.w3.org/TR/speech-grammar</a>.
     * @type {Integer (Int32)}
     */
    static IS_SRGS => -3

    /**
     * Indicates a custom xml string.
     * @type {Integer (Int32)}
     */
    static IS_XML => -4

    /**
     * The scope contains the IEnumString interface pointer. The Text Input Processor (TIP) can call <a href="https://docs.microsoft.com/windows/desktop/api/inputscope/nf-inputscope-itfinputscope2-enumwordlist">ITfInputScope2::EnumWordList</a> to retrieve it.
     * @type {Integer (Int32)}
     */
    static IS_ENUMSTRING => -5
}
