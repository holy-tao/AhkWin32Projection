#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
class ELEMENTDESCRIPTOR_FLAGS extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENTDESCRIPTORFLAGS_LITERAL => 1

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENTDESCRIPTORFLAGS_NESTED_LITERAL => 2

    /**
     * @type {Integer (Int32)}
     */
    static ELEMENTDESCRIPTOR_FLAGS_Max => 2147483647
}
