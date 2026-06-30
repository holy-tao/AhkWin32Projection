#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DeviceManager
 */
class MACINFO extends Win32Struct {
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fUsed {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {Array<Integer>}
     */
    abMacState {
        get {
            if(!this.HasProp("__abMacStateProxyArray"))
                this.__abMacStateProxyArray := Win32FixedArray(this.ptr + 4, 36, Primitive, "char")
            return this.__abMacStateProxyArray
        }
    }
}
