#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the case requirements of keywords, if any, for a query.
 * @remarks
 * 
  * Keywords include Boolean operators such as AND, NOT, and OR.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//structuredquery/ne-structuredquery-case_requirement
 * @namespace Windows.Win32.System.Search
 * @version v4.0.30319
 */
class CASE_REQUIREMENT{

    /**
     * Keywords are recognized regardless of case.
     * @type {Integer (Int32)}
     */
    static CASE_REQUIREMENT_ANY => 0

    /**
     * Keywords are recognized only if uppercase when AQS is the syntax. When AQS is not the syntax, keywords are recognized regardless of case.
     * @type {Integer (Int32)}
     */
    static CASE_REQUIREMENT_UPPER_IF_AQS => 1
}
