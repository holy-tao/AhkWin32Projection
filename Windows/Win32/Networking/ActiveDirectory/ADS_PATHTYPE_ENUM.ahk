#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ADS_PATHTYPE_ENUM enumeration specifies the type of object on which the IADsSecurityUtility interface is going to add or modify a security descriptor.
 * @see https://learn.microsoft.com/windows/win32/api/iads/ne-iads-ads_pathtype_enum
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */
export default struct ADS_PATHTYPE_ENUM {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Indicates that the security descriptor will be retrieved or set on a file object.
     * @type {Integer (Int32)}
     */
    static ADS_PATH_FILE => 1

    /**
     * Indicates that the security descriptor will be retrieved or set on a file share object.
     * @type {Integer (Int32)}
     */
    static ADS_PATH_FILESHARE => 2

    /**
     * Indicates that the security descriptor will be retrieved or set on a registry key object.
     * @type {Integer (Int32)}
     */
    static ADS_PATH_REGISTRY => 3
}
