#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.UI.Controls.RichEdit
 * @version v4.0.30319
 */
class RICH_EDIT_GET_CONTEXT_MENU_SEL_TYPE extends Win32BitflagEnum{

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_EMPTY => 0

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_TEXT => 1

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_OBJECT => 2

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_MULTICHAR => 4

    /**
     * @type {Integer (UInt16)}
     */
    static SEL_MULTIOBJECT => 8

    /**
     * @type {Integer (UInt16)}
     */
    static GCM_RIGHTMOUSEDROP => 32768
}
