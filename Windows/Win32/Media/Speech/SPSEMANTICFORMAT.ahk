#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.Speech
 * @version v4.0.30319
 */
class SPSEMANTICFORMAT extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static SPSMF_SAPI_PROPERTIES => 0

    /**
     * @type {Integer (Int32)}
     */
    static SPSMF_SRGS_SEMANTICINTERPRETATION_MS => 1

    /**
     * @type {Integer (Int32)}
     */
    static SPSMF_SRGS_SAPIPROPERTIES => 2

    /**
     * @type {Integer (Int32)}
     */
    static SPSMF_UPS => 4

    /**
     * @type {Integer (Int32)}
     */
    static SPSMF_SRGS_SEMANTICINTERPRETATION_W3C => 8
}
