#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.System.SystemServices
 * @version v4.0.30319
 */
class PCI_COMMON_CONFIG extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Pointer<PCI_COMMON_HEADER>}
     */
    Base {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Array<Byte>}
     */
    DeviceSpecific{
        get {
            if(!this.HasProp("__DeviceSpecificProxyArray"))
                this.__DeviceSpecificProxyArray := Win32FixedArray(this.ptr + 8, 192, Primitive, "char")
            return this.__DeviceSpecificProxyArray
        }
    }
}
