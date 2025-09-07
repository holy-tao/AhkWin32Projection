#Requires AutoHotkey v2.0.0 64-bit

/**
 * Used by the STORAGE_PROPERTY_QUERY structure passed to the IOCTL_STORAGE_QUERY_PROPERTY control code to indicate what information is returned about a property of a storage device or adapter.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ne-winioctl-storage_query_type
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_QUERY_TYPE{

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
