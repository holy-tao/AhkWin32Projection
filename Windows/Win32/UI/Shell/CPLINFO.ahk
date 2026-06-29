#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains resource information and an application-defined value for a dialog box supported by a Control Panel application. (CPLINFO)
 * @remarks
 * If the icon or display strings of the dialog box can change based on the state of the computer, you can specify the CPL_DYNAMIC_RES value for the <b>idIcon</b>, <b>idName</b>, or <b>idInfo</b> members rather than specifying a valid resource identifier. This causes the Control Panel to send the <a href="https://docs.microsoft.com/windows/desktop/shell/glossary">CPL_NEWINQUIRE</a> message each time it needs the icon and display strings. Using this technique is significantly slower, however, because the Control Panel will need to load your application each time it sends the <b>CPL_NEWINQUIRE</b> message.
 * @see https://learn.microsoft.com/windows/win32/api/cpl/ns-cpl-cplinfo
 * @namespace Windows.Win32.UI.Shell
 */
export default struct CPLINFO {
    #StructPack 8

    /**
     * Type: <b>int</b>
     * 
     * The resource identifier of the icon that represents the dialog box.
     */
    idIcon : Int32

    /**
     * Type: <b>int</b>
     * 
     * The resource identifier of the string containing the short name for the dialog box. This name is intended to be displayed below the icon.
     */
    idName : Int32

    /**
     * Type: <b>int</b>
     * 
     * The resource identifier of the string containing the description for the dialog box that is intended to be displayed when the application icon is selected.
     */
    idInfo : Int32

    /**
     * Type: <b>LONG_PTR</b>
     * 
     * A pointer to data defined by the application. When the Control Panel sends the <a href="https://docs.microsoft.com/windows/desktop/shell/fa-associationarray">CPL_DBLCLK</a> and <a href="https://docs.microsoft.com/windows/desktop/shell/library-functions-bumper">CPL_STOP</a> messages, it passes this value back to your application.
     */
    lData : IntPtr

}
