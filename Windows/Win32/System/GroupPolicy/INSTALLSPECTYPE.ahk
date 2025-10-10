#Requires AutoHotkey v2.0.0 64-bit

/**
 * The INSTALLSPECTYPE enumeration values define the ways a group policy application can be specified to the InstallApplication function. The values are used in the Type member of INSTALLDATA.
 * @see https://docs.microsoft.com/windows/win32/api//appmgmt/ne-appmgmt-installspectype
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class INSTALLSPECTYPE{

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
     * 
     * @type {Integer (Int32)}
     */
    static PROGID => 3

    /**
     * 
     * @type {Integer (Int32)}
     */
    static COMCLASS => 4
}
