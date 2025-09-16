#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains values that are used in filter conditions when testing for matching filters.
 * @remarks
 * The data type of 
  * **FWP_CONDITION_VALUE0** must be compatible with the data type of the
  * [FWP_VALUE0](ns-fwptypes-fwp_value0.md) to which it is being compared. However, this does not mean the data types
  * necessarily need to be the same. For example, an FWP_V4_ADDR_MASK can be
  * compared to an FWP_UINT32 containing an IPv4 address. See [FWP_MATCH_TYPE](ne-fwptypes-fwp_match_type.md) for detailed information about **FWP_CONDITION_VALUE0** and **FWP_VALUE0** compatibility rules.
  * 
  * **FWP_CONDITION_VALUE0** is a specific implementation of FWP_CONDITION_VALUE. See [WFP Version-Independent Names and Targeting Specific Versions of Windows](/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows)  for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_condition_value0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_CONDITION_VALUE0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * Specifies the data type of the condition value.
     * 
     * See [FWP_DATA_TYPE](ne-fwptypes-fwp_data_type.md) for more information.
     * @type {Integer}
     */
    type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    uint8 {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uint16 {
        get => NumGet(this, 4, "ushort")
        set => NumPut("ushort", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    uint32 {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<UInt64>}
     */
    uint64 {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    int8 {
        get => NumGet(this, 4, "char")
        set => NumPut("char", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    int16 {
        get => NumGet(this, 4, "short")
        set => NumPut("short", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    int32 {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<Int64>}
     */
    int64 {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Float}
     */
    float32 {
        get => NumGet(this, 4, "float")
        set => NumPut("float", value, this, 4)
    }

    /**
     * @type {Pointer<Double>}
     */
    double64 {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<FWP_BYTE_ARRAY16>}
     */
    byteArray16 {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<FWP_BYTE_BLOB>}
     */
    byteBlob {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<SID>}
     */
    sid {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<FWP_BYTE_BLOB>}
     */
    sd {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<FWP_TOKEN_INFORMATION>}
     */
    tokenInformation {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<FWP_BYTE_BLOB>}
     */
    tokenAccessInformation {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<PWSTR>}
     */
    unicodeString {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<FWP_BYTE_ARRAY6>}
     */
    byteArray6 {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<FWP_V4_ADDR_AND_MASK>}
     */
    v4AddrMask {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<FWP_V6_ADDR_AND_MASK>}
     */
    v6AddrMask {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Pointer<FWP_RANGE0>}
     */
    rangeValue {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }
}
