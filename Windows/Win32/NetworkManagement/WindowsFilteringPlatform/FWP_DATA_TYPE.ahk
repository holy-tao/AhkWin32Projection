#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Data types that can be stored in an FWP_VALUE0 or an FWP_CONDITION_VALUE0structure.
 * @remarks
 * 
 * Not all data types are valid for each structure; see the tagged union
 * in each structure to determine which are allowed.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//fwptypes/ne-fwptypes-fwp_data_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_DATA_TYPE extends Win32Enum{

    /**
     * Indicates no data.
     * @type {Integer (Int32)}
     */
    static FWP_EMPTY => 0

    /**
     * Indicates an unsigned 8-bit integer value.
     * @type {Integer (Int32)}
     */
    static FWP_UINT8 => 1

    /**
     * Indicates an unsigned 16-bit integer value.
     * @type {Integer (Int32)}
     */
    static FWP_UINT16 => 2

    /**
     * Indicates an unsigned 32-bit integer value.
     * @type {Integer (Int32)}
     */
    static FWP_UINT32 => 3

    /**
     * Indicates an unsigned 64-bit integer value.
     * @type {Integer (Int32)}
     */
    static FWP_UINT64 => 4

    /**
     * Indicates an signed 8-bit integer value.
     * @type {Integer (Int32)}
     */
    static FWP_INT8 => 5

    /**
     * Indicates an signed 16-bit integer value.
     * @type {Integer (Int32)}
     */
    static FWP_INT16 => 6

    /**
     * Indicates an signed 32-bit integer value.
     * @type {Integer (Int32)}
     */
    static FWP_INT32 => 7

    /**
     * Indicates an signed 64-bit integer value.
     * @type {Integer (Int32)}
     */
    static FWP_INT64 => 8

    /**
     * Indicates a pointer to a single-precision floating-point  value.
     * @type {Integer (Int32)}
     */
    static FWP_FLOAT => 9

    /**
     * Indicates a pointer to a double-precision floating-point  value.
     * @type {Integer (Int32)}
     */
    static FWP_DOUBLE => 10

    /**
     * Indicates a pointer to an [FWP_BYTE_ARRAY16](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_array16) structure.
     * @type {Integer (Int32)}
     */
    static FWP_BYTE_ARRAY16_TYPE => 11

    /**
     * Indicates a pointer to an [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure.
     * @type {Integer (Int32)}
     */
    static FWP_BYTE_BLOB_TYPE => 12

    /**
     * Indicates a pointer to a SID.
     * @type {Integer (Int32)}
     */
    static FWP_SID => 13

    /**
     * Indicates a pointer to an [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that describes a security descriptor.
     * @type {Integer (Int32)}
     */
    static FWP_SECURITY_DESCRIPTOR_TYPE => 14

    /**
     * Indicates a pointer to an [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that describes token information.
     * @type {Integer (Int32)}
     */
    static FWP_TOKEN_INFORMATION_TYPE => 15

    /**
     * Indicates a pointer to an [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that describes token access information.
     * @type {Integer (Int32)}
     */
    static FWP_TOKEN_ACCESS_INFORMATION_TYPE => 16

    /**
     * Indicates a pointer to a null-terminated unicode string.
     * @type {Integer (Int32)}
     */
    static FWP_UNICODE_STRING_TYPE => 17

    /**
     * Reserved.
     * @type {Integer (Int32)}
     */
    static FWP_BYTE_ARRAY6_TYPE => 18

    /**
     * Reserved for future use.
     * @type {Integer (Int32)}
     */
    static FWP_SINGLE_DATA_TYPE_MAX => 255

    /**
     * Indicates a pointer to an [FWP_V4_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v4_addr_and_mask) structure.
     * @type {Integer (Int32)}
     */
    static FWP_V4_ADDR_MASK => 256

    /**
     * Indicates a pointer to an [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask) structure.
     * @type {Integer (Int32)}
     */
    static FWP_V6_ADDR_MASK => 257

    /**
     * Indicates a pointer to an [FWP_RANGE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_range0) structure.
     * @type {Integer (Int32)}
     */
    static FWP_RANGE_TYPE => 258

    /**
     * Maximum value for testing purposes.
     * @type {Integer (Int32)}
     */
    static FWP_DATA_TYPE_MAX => 259
}
