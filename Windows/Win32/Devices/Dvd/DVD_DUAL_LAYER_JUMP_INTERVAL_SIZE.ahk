#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DUAL_LAYER_JUMP_INTERVAL_SIZE extends Win32Struct
{
    static sizeof => 8

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    Reserved1{
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__Reserved1ProxyArray
        }
    }

    /**
     * @type {Array<Byte>}
     */
    JumpIntervalSize{
        get {
            if(!this.HasProp("__JumpIntervalSizeProxyArray"))
                this.__JumpIntervalSizeProxyArray := Win32FixedArray(this.ptr + 4, 1, Primitive, "char")
            return this.__JumpIntervalSizeProxyArray
        }
    }
}
