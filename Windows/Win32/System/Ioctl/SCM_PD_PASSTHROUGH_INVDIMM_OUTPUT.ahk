#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class SCM_PD_PASSTHROUGH_INVDIMM_OUTPUT extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    GeneralStatus {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    ExtendedStatus {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {Integer}
     */
    OutputDataLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Byte>}
     */
    OutputData{
        get {
            if(!this.HasProp("__OutputDataProxyArray"))
                this.__OutputDataProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__OutputDataProxyArray
        }
    }
}
