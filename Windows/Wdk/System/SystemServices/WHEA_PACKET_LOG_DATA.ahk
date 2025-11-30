#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class WHEA_PACKET_LOG_DATA extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {Array<Byte>}
     */
    LogData{
        get {
            if(!this.HasProp("__LogDataProxyArray"))
                this.__LogDataProxyArray := Win32FixedArray(this.ptr + 0, 36, Primitive, "char")
            return this.__LogDataProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ExtraBytes{
        get {
            if(!this.HasProp("__ExtraBytesProxyArray"))
                this.__ExtraBytesProxyArray := Win32FixedArray(this.ptr + 36, 36, Primitive, "char")
            return this.__ExtraBytesProxyArray
        }
    }

    /**
     * @type {Pointer}
     */
    BcParam3 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    BcParam4 {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    LogDataLength {
        get => NumGet(this, 88, "uint")
        set => NumPut("uint", value, this, 88)
    }

    /**
     * @type {Integer}
     */
    LogTag {
        get => NumGet(this, 92, "ushort")
        set => NumPut("ushort", value, this, 92)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 94, "ushort")
        set => NumPut("ushort", value, this, 94)
    }

    /**
     * @type {Pointer<WHEA_REPORT_HW_ERROR_DEVICE_DRIVER_FLAGS>}
     */
    Flags {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
