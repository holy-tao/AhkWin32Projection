#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The ADS_PATHTYPE_ENUM enumeration specifies the type of object on which the IADsSecurityUtility interface is going to add or modify a security descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_pathtype_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
class ADS_PATHTYPE_ENUM extends Win32Enum {

    /**
     * Indicates that the security descriptor will be retrieved or set on a file object.
     * Native name: ADS_PATH_FILE
     * @type {Integer (Int32)}
     */
    static PATH_FILE => 1

    /**
     * Indicates that the security descriptor will be retrieved or set on a file share object.
     * Native name: ADS_PATH_FILESHARE
     * @type {Integer (Int32)}
     */
    static PATH_FILESHARE => 2

    /**
     * Indicates that the security descriptor will be retrieved or set on a registry key object.
     * Native name: ADS_PATH_REGISTRY
     * @type {Integer (Int32)}
     */
    static PATH_REGISTRY => 3
}
