#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains resource information and an application-defined value for a dialog box supported by a Control Panel application. (CPLINFO)
 * @remarks
 * If the icon or display strings of the dialog box can change based on the state of the computer, you can specify the CPL_DYNAMIC_RES value for the <b>idIcon</b>, <b>idName</b>, or <b>idInfo</b> members rather than specifying a valid resource identifier. This causes the Control Panel to send the <a href="https://docs.microsoft.com/windows/desktop/shell/glossary">CPL_NEWINQUIRE</a> message each time it needs the icon and display strings. Using this technique is significantly slower, however, because the Control Panel will need to load your application each time it sends the <b>CPL_NEWINQUIRE</b> message.
 * @see https://learn.microsoft.com/windows/win32/api/cpl/ns-cpl-cplinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class CPLINFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: <b>int</b>
     * 
     * The resource identifier of the icon that represents the dialog box.
     * @type {Integer}
     */
    idIcon {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Type: <b>int</b>
     * 
     * The resource identifier of the string containing the short name for the dialog box. This name is intended to be displayed below the icon.
     * @type {Integer}
     */
    idName {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>int</b>
     * 
     * The resource identifier of the string containing the description for the dialog box that is intended to be displayed when the application icon is selected.
     * @type {Integer}
     */
    idInfo {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * Type: <b>LONG_PTR</b>
     * 
     * A pointer to data defined by the application. When the Control Panel sends the <a href="https://docs.microsoft.com/windows/desktop/shell/fa-associationarray">CPL_DBLCLK</a> and <a href="https://docs.microsoft.com/windows/desktop/shell/library-functions-bumper">CPL_STOP</a> messages, it passes this value back to your application.
     * @type {Pointer}
     */
    lData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
