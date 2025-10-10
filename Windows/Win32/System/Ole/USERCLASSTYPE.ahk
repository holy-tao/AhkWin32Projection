#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the different variants of the display name associated with a class of objects.
 * @see https://docs.microsoft.com/windows/win32/api//oleidl/ne-oleidl-userclasstype
 * @namespace Windows.Win32.System.Ole
 * @version v4.0.30319
 */
class USERCLASSTYPE{

    /**
     * The full type name of the class.
     * @type {Integer (Int32)}
     */
    static USERCLASSTYPE_FULL => 1

    /**
     * A short name (maximum of 15 characters) that is used for popup menus and the <b>Links</b> dialog box.
     * @type {Integer (Int32)}
     */
    static USERCLASSTYPE_SHORT => 2

    /**
     * The name of the application servicing the class and is used in the result text in dialog boxes.
     * @type {Integer (Int32)}
     */
    static USERCLASSTYPE_APPNAME => 3
}
