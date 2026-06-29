#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used by the STORAGE_PROPERTY_QUERY structure passed to the IOCTL_STORAGE_QUERY_PROPERTY control code to indicate what information is returned about a property of a storage device or adapter.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_query_type
 * @namespace Windows.Win32.System.Ioctl
 */
export default struct STORAGE_QUERY_TYPE {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Instructs the driver to return an appropriate descriptor.
     * @type {Integer (Int32)}
     */
    static PropertyStandardQuery => 0

    /**
     * Instructs the driver to report whether the descriptor is supported.
     * @type {Integer (Int32)}
     */
    static PropertyExistsQuery => 1

    /**
     * Not currently supported. Do not use.
     * @type {Integer (Int32)}
     */
    static PropertyMaskQuery => 2

    /**
     * Specifies the upper limit of the list of query types. This is used to validate the query type.
     * @type {Integer (Int32)}
     */
    static PropertyQueryMaxDefined => 3
}
