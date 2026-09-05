#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the different variants of the display name associated with a class of objects.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-userclasstype
 * @namespace Windows.Win32.System.Ole
 */
class USERCLASSTYPE extends Win32Enum {

    /**
     * The full type name of the class.
     * Native name: USERCLASSTYPE_FULL
     * @type {Integer (Int32)}
     */
    static FULL => 1

    /**
     * A short name (maximum of 15 characters) that is used for popup menus and the <b>Links</b> dialog box.
     * Native name: USERCLASSTYPE_SHORT
     * @type {Integer (Int32)}
     */
    static SHORT => 2

    /**
     * The name of the application servicing the class and is used in the result text in dialog boxes.
     * Native name: USERCLASSTYPE_APPNAME
     * @type {Integer (Int32)}
     */
    static APPNAME => 3
}
