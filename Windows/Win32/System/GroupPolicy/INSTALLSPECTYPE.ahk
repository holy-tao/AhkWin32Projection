#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The INSTALLSPECTYPE enumeration values define the ways a group policy application can be specified to the InstallApplication function. The values are used in the Type member of INSTALLDATA.
 * @see https://learn.microsoft.com/windows/win32/api/appmgmt/ne-appmgmt-installspectype
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct INSTALLSPECTYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * This constant equals 1. The application is specified by its display name and group policy GUID.
     * @type {Integer (Int32)}
     */
    static APPNAME => 1

    /**
     * The application is specified by its file name extension, for example, .jpg.
     * @type {Integer (Int32)}
     */
    static FILEEXT => 2

    /**
     * @type {Integer (Int32)}
     */
    static PROGID => 3

    /**
     * @type {Integer (Int32)}
     */
    static COMCLASS => 4
}
