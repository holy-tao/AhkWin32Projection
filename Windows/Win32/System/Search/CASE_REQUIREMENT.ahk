#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the case requirements of keywords, if any, for a query.
 * @remarks
 * Keywords include Boolean operators such as AND, NOT, and OR.
 * @see https://learn.microsoft.com/windows/win32/api/structuredquery/ne-structuredquery-case_requirement
 * @namespace Windows.Win32.System.Search
 */
export default struct CASE_REQUIREMENT {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
