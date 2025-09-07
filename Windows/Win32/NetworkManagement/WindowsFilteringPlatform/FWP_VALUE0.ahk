#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Defines a data value that can be one of a number of different data types.
 * @remarks
 * For the unnamed union, switch_type(FWP_DATA_TYPE), switch_is(type).
  * 
  * This is primarily used to supply incoming values to the
  * filter engine.
  * 
  * When IP addresses are stored in FWP_UINT32 format or when IP port is stored in FWP_UINT16 format, they are stored in host-order not network-order. 
  * 
  * <b>FWP_VALUE0</b> is a specific implementation of FWP_VALUE. See <a href="https://docs.microsoft.com/windows/desktop/FWP/wfp-version-independent-names-and-targeting-specific-versions-of-windows">WFP Version-Independent Names and Targeting Specific Versions of Windows</a> for more information.
 * @see https://learn.microsoft.com/windows/win32/api/fwptypes/ns-fwptypes-fwp_value0
 * @namespace Windows.Win32.NetworkManagement.WindowsFilteringPlatform
 * @version v4.0.30319
 */
class FWP_VALUE0 extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The type of data for this value. 
     * 
     * See [FWP_DATA_TYPE](/windows/desktop/api/fwptypes/ne-fwptypes-fwp_data_type) for more information.
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
     * @type {PWSTR}
     */
    unicodeString{
        get {
            if(!this.HasProp("__unicodeString"))
                this.__unicodeString := PWSTR(this.ptr + 4)
            return this.__unicodeString
        }
    }

    /**
     * @type {Pointer<FWP_BYTE_ARRAY6>}
     */
    byteArray6 {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }
}
