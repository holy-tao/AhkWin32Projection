#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class NDIS_TIMEOUT_DPC_REQUEST_CAPABILITIES extends Win32Struct {
    static sizeof => 24

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
    Flags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TimeoutArrayLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    TimeoutArray {
        get {
            if(!this.HasProp("__TimeoutArrayProxyArray"))
                this.__TimeoutArrayProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "uint")
            return this.__TimeoutArrayProxyArray
        }
    }
}
