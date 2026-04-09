#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.Com
 */
class BINDINFOF extends Win32Enum {

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFOF_URLENCODESTGMEDDATA => 1

    /**
     * @type {Integer (Int32)}
     */
    static BINDINFOF_URLENCODEDEXTRAINFO => 2
}
