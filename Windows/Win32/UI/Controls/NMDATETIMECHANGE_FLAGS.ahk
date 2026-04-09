#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 */
class NMDATETIMECHANGE_FLAGS extends Win32Enum {

    /**
     * @type {Integer (UInt32)}
     */
    static GDT_NONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static GDT_VALID => 0
}
