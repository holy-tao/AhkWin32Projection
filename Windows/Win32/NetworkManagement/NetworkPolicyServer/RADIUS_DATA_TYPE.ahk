#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The RADIUS_DATA_TYPE type enumerates the possible data type for a RADIUS attribute or extended attribute.
 * @see https://docs.microsoft.com/windows/win32/api//authif/ne-authif-radius_data_type
 * @namespace Windows.Win32.NetworkManagement.NetworkPolicyServer
 * @version v4.0.30319
 */
class RADIUS_DATA_TYPE extends Win32Enum{

    /**
     * The value is a pointer to an unknown data type.
     * @type {Integer (Int32)}
     */
    static rdtUnknown => 0

    /**
     * The value of the attribute is a pointer to a character string.
     * @type {Integer (Int32)}
     */
    static rdtString => 1

    /**
     * The value of the attribute is a 32-bit <b>DWORD</b> value that represents an address.
     * @type {Integer (Int32)}
     */
    static rdtAddress => 2

    /**
     * The value of the attribute is a 32-bit <b>DWORD</b> value that represents an integer.
     * @type {Integer (Int32)}
     */
    static rdtInteger => 3

    /**
     * The value of the attribute is a 32-bit <b>DWORD</b> value that represents a time.
     * @type {Integer (Int32)}
     */
    static rdtTime => 4

    /**
     * The value of the attribute is a <b>BYTE*</b> value that represents an IPv6 address.
     * @type {Integer (Int32)}
     */
    static rdtIpv6Address => 5
}
