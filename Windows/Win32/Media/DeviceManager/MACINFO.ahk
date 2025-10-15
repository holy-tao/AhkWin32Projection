#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Media.DeviceManager
 * @version v4.0.30319
 */
class MACINFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fUsed{
        get {
            if(!this.HasProp("__fUsed"))
                this.__fUsed := BOOL(this.ptr + 0)
            return this.__fUsed
        }
    }

    /**
     * @type {Array<Byte>}
     */
    abMacState{
        get {
            if(!this.HasProp("__abMacStateProxyArray"))
                this.__abMacStateProxyArray := Win32FixedArray(this.ptr + 4, 36, Primitive, "char")
            return this.__abMacStateProxyArray
        }
    }
}
