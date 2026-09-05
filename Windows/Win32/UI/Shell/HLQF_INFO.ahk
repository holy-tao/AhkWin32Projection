#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 */
class HLQF_INFO extends Win32Enum {

    /**
     * Native name: HLQF_ISVALID
     * @type {Integer (Int32)}
     */
    static ISVALID => 1

    /**
     * Native name: HLQF_ISCURRENT
     * @type {Integer (Int32)}
     */
    static ISCURRENT => 2
}
