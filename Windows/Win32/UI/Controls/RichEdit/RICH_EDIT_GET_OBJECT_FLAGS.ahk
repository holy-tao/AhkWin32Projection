#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class RICH_EDIT_GET_OBJECT_FLAGS extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_POLEOBJ => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_PSTG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_POLESITE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_NO_INTERFACES => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REO_GETOBJ_ALL_INTERFACES => 7
}
