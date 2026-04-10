#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
class WHEA_PCIE_CORRECTABLE_ERROR_SECTION extends Win32Struct {
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Header {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<Pointer>}
     */
    Devices {
        get {
            if(!this.HasProp("__DevicesProxyArray"))
                this.__DevicesProxyArray := Win32FixedArray(this.ptr + 8, 1, Primitive, "ptr")
            return this.__DevicesProxyArray
        }
    }
}
