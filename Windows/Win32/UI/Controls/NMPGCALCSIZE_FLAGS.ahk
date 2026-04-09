#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class NMPGCALCSIZE_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static PGF_CALCHEIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PGF_CALCWIDTH => 1
}
