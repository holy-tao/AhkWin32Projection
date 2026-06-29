#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the different variants of the display name associated with a class of objects.
 * @see https://learn.microsoft.com/windows/win32/api/oleidl/ne-oleidl-userclasstype
 * @namespace Windows.Win32.System.Ole
 */
export default struct USERCLASSTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
