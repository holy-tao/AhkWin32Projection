#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SYSTEM_FIRMWARE_TABLE_ACTION.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class SYSTEM_FIRMWARE_TABLE_INFORMATION extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {Integer}
     */
    ProviderSignature {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {SYSTEM_FIRMWARE_TABLE_ACTION}
     */
    Action {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    TableID {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    TableBufferLength {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Array<Integer>}
     */
    TableBuffer {
        get {
            if(!this.HasProp("__TableBufferProxyArray"))
                this.__TableBufferProxyArray := Win32FixedArray(this.ptr + 16, 1, Primitive, "char")
            return this.__TableBufferProxyArray
        }
    }
}
