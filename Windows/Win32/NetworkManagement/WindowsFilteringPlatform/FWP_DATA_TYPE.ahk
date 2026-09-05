#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Data types that can be stored in an FWP_VALUE0 or an FWP_CONDITION_VALUE0structure.
 * @remarks
 * Not all data types are valid for each structure; see the tagged union
 * in each structure to determine which are allowed.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ne-fwptypes-fwp_data_type
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 */
class FWP_DATA_TYPE extends Win32Enum {

    /**
     * Indicates no data.
     * Native name: FWP_EMPTY
     * @type {Integer (Int32)}
     */
    static EMPTY => 0

    /**
     * Indicates an unsigned 8-bit integer value.
     * Native name: FWP_UINT8
     * @type {Integer (Int32)}
     */
    static UINT8 => 1

    /**
     * Indicates an unsigned 16-bit integer value.
     * Native name: FWP_UINT16
     * @type {Integer (Int32)}
     */
    static UINT16 => 2

    /**
     * Indicates an unsigned 32-bit integer value.
     * Native name: FWP_UINT32
     * @type {Integer (Int32)}
     */
    static UINT32 => 3

    /**
     * Indicates an unsigned 64-bit integer value.
     * Native name: FWP_UINT64
     * @type {Integer (Int32)}
     */
    static UINT64 => 4

    /**
     * Indicates a signed 8-bit integer value.
     * Native name: FWP_INT8
     * @type {Integer (Int32)}
     */
    static INT8 => 5

    /**
     * Indicates a signed 16-bit integer value.
     * Native name: FWP_INT16
     * @type {Integer (Int32)}
     */
    static INT16 => 6

    /**
     * Indicates a signed 32-bit integer value.
     * Native name: FWP_INT32
     * @type {Integer (Int32)}
     */
    static INT32 => 7

    /**
     * Indicates a signed 64-bit integer value.
     * Native name: FWP_INT64
     * @type {Integer (Int32)}
     */
    static INT64 => 8

    /**
     * Indicates a pointer to a single-precision floating-point  value.
     * Native name: FWP_FLOAT
     * @type {Integer (Int32)}
     */
    static FLOAT => 9

    /**
     * Indicates a pointer to a double-precision floating-point  value.
     * Native name: FWP_DOUBLE
     * @type {Integer (Int32)}
     */
    static DOUBLE => 10

    /**
     * Indicates a pointer to an [FWP_BYTE_ARRAY16](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_array16) structure.
     * Native name: FWP_BYTE_ARRAY16_TYPE
     * @type {Integer (Int32)}
     */
    static BYTE_ARRAY16_TYPE => 11

    /**
     * Indicates a pointer to an [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure.
     * Native name: FWP_BYTE_BLOB_TYPE
     * @type {Integer (Int32)}
     */
    static BYTE_BLOB_TYPE => 12

    /**
     * Indicates a pointer to a SID.
     * Native name: FWP_SID
     * @type {Integer (Int32)}
     */
    static SID => 13

    /**
     * Indicates a pointer to an [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that describes a security descriptor.
     * Native name: FWP_SECURITY_DESCRIPTOR_TYPE
     * @type {Integer (Int32)}
     */
    static SECURITY_DESCRIPTOR_TYPE => 14

    /**
     * Indicates a pointer to an [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that describes token information.
     * Native name: FWP_TOKEN_INFORMATION_TYPE
     * @type {Integer (Int32)}
     */
    static TOKEN_INFORMATION_TYPE => 15

    /**
     * Indicates a pointer to an [FWP_BYTE_BLOB](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_byte_blob) structure that describes token access information.
     * Native name: FWP_TOKEN_ACCESS_INFORMATION_TYPE
     * @type {Integer (Int32)}
     */
    static TOKEN_ACCESS_INFORMATION_TYPE => 16

    /**
     * Indicates a pointer to a null-terminated unicode string.
     * Native name: FWP_UNICODE_STRING_TYPE
     * @type {Integer (Int32)}
     */
    static UNICODE_STRING_TYPE => 17

    /**
     * Reserved.
     * Native name: FWP_BYTE_ARRAY6_TYPE
     * @type {Integer (Int32)}
     */
    static BYTE_ARRAY6_TYPE => 18

    /**
     * Reserved for future use.
     * Native name: FWP_SINGLE_DATA_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static SINGLE_DATA_TYPE_MAX => 255

    /**
     * Indicates a pointer to an [FWP_V4_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v4_addr_and_mask) structure.
     * Native name: FWP_V4_ADDR_MASK
     * @type {Integer (Int32)}
     */
    static V4_ADDR_MASK => 256

    /**
     * Indicates a pointer to an [FWP_V6_ADDR_AND_MASK](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_v6_addr_and_mask) structure.
     * Native name: FWP_V6_ADDR_MASK
     * @type {Integer (Int32)}
     */
    static V6_ADDR_MASK => 257

    /**
     * Indicates a pointer to an [FWP_RANGE0](/windows/desktop/api/fwptypes/ns-fwptypes-fwp_range0) structure.
     * Native name: FWP_RANGE_TYPE
     * @type {Integer (Int32)}
     */
    static RANGE_TYPE => 258

    /**
     * Maximum value for testing purposes.
     * Native name: FWP_DATA_TYPE_MAX
     * @type {Integer (Int32)}
     */
    static MAX => 259
}
