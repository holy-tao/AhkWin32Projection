#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.NetworkManagement.Ndis
 */
class CO_SAP extends Win32Struct {
    static sizeof => 12

    static packingSize => 4

    /**
     * @type {Integer}
     */
    SapType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    SapLength {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Array<Integer>}
     */
    Sap {
        get {
            if(!this.HasProp("__SapProxyArray"))
                this.__SapProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "char")
            return this.__SapProxyArray
        }
    }
}
