#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DUAL_LAYER_MANUAL_LAYER_JUMP extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 4, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    ManualJumpLayerAddress{
        get {
            if(!this.HasProp("__ManualJumpLayerAddressProxyArray"))
                this.__ManualJumpLayerAddressProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "char")
            return this.__ManualJumpLayerAddressProxyArray
        }
    }
}
