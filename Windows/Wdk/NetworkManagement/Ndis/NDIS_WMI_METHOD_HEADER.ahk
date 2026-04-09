#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_WMI_METHOD_HEADER extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    PortNumber {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    NetLuid {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    RequestId {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Timeout {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<Integer>}
     */
    Padding {
        get {
            if(!this.HasProp("__PaddingProxyArray"))
                this.__PaddingProxyArray := Win32FixedArray(this.ptr + 36, 4, Primitive, "char")
            return this.__PaddingProxyArray
        }
    }
}
