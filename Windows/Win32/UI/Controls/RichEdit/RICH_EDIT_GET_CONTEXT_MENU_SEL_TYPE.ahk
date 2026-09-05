#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 */
class RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE extends Win32BitflagEnum {

    /**
     * Native name: SEL_EMPTY
     * @type {Integer (UInt16)}
     */
    static EMPTY => 0

    /**
     * Native name: SEL_TEXT
     * @type {Integer (UInt16)}
     */
    static TEXT => 1

    /**
     * Native name: SEL_OBJECT
     * @type {Integer (UInt16)}
     */
    static OBJECT => 2

    /**
     * Native name: SEL_MULTICHAR
     * @type {Integer (UInt16)}
     */
    static MULTICHAR => 4

    /**
     * Native name: SEL_MULTIOBJECT
     * @type {Integer (UInt16)}
     */
    static MULTIOBJECT => 8

    /**
     * @type {Integer (UInt16)}
     */
    static GCM_RIGHTMOUSEDROP => 32768
}
