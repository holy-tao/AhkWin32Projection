#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.Dialogs
 * @version v4.0.30319
 */
class OPEN_FILENAME_FLAGS_EX extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_EX_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static OFN_EX_NOPLACESBAR => 1
}
