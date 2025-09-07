#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class FINDTEXT_FLAGS{

    /**
     * @type {Integer (Int32)}
     */
    static FINDTEXT_BACKWARDS => 1

    /**
     * @type {Integer (Int32)}
     */
    static FINDTEXT_WHOLEWORD => 2

    /**
     * @type {Integer (Int32)}
     */
    static FINDTEXT_MATCHCASE => 4

    /**
     * @type {Integer (Int32)}
     */
    static FINDTEXT_RAW => 131072

    /**
     * @type {Integer (Int32)}
     */
    static FINDTEXT_MATCHREPEATEDWHITESPACE => 262144

    /**
     * @type {Integer (Int32)}
     */
    static FINDTEXT_MATCHDIAC => 536870912

    /**
     * @type {Integer (Int32)}
     */
    static FINDTEXT_MATCHKASHIDA => 1073741824

    /**
     * @type {Integer (Int32)}
     */
    static FINDTEXT_MATCHALEFHAMZA => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static FINDTEXT_FLAGS_Max => 2147483647
}
