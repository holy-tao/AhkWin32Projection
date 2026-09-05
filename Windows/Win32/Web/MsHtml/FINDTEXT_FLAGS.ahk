#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class FINDTEXT_FLAGS extends Win32Enum {

    /**
     * Native name: FINDTEXT_BACKWARDS
     * @type {Integer (Int32)}
     */
    static BACKWARDS => 1

    /**
     * Native name: FINDTEXT_WHOLEWORD
     * @type {Integer (Int32)}
     */
    static WHOLEWORD => 2

    /**
     * Native name: FINDTEXT_MATCHCASE
     * @type {Integer (Int32)}
     */
    static MATCHCASE => 4

    /**
     * Native name: FINDTEXT_RAW
     * @type {Integer (Int32)}
     */
    static RAW => 131072

    /**
     * Native name: FINDTEXT_MATCHREPEATEDWHITESPACE
     * @type {Integer (Int32)}
     */
    static MATCHREPEATEDWHITESPACE => 262144

    /**
     * Native name: FINDTEXT_MATCHDIAC
     * @type {Integer (Int32)}
     */
    static MATCHDIAC => 536870912

    /**
     * Native name: FINDTEXT_MATCHKASHIDA
     * @type {Integer (Int32)}
     */
    static MATCHKASHIDA => 1073741824

    /**
     * Native name: FINDTEXT_MATCHALEFHAMZA
     * @type {Integer (Int32)}
     */
    static MATCHALEFHAMZA => -2147483648

    /**
     * Native name: FINDTEXT_FLAGS_Max
     * @type {Integer (Int32)}
     */
    static Max => 2147483647
}
