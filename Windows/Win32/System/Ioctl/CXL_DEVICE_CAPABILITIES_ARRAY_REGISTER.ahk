#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\CXL_DEVICE_CAPABILITIES_ARRAY_REGISTER_HEADER.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class CXL_DEVICE_CAPABILITIES_ARRAY_REGISTER extends Win32Struct {
    static sizeof => 20

    static packingSize => 4

    /**
     * @type {CXL_DEVICE_CAPABILITIES_ARRAY_REGISTER_HEADER}
     */
    Header {
        get {
            if(!this.HasProp("__Header"))
                this.__Header := CXL_DEVICE_CAPABILITIES_ARRAY_REGISTER_HEADER(0, this)
            return this.__Header
        }
    }

    /**
     * @type {Integer}
     */
    CapabilitiesCount {
        get => NumGet(this, 8, "ushort")
        set => NumPut("ushort", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Reserved {
        get => NumGet(this, 10, "ushort")
        set => NumPut("ushort", value, this, 10)
    }

    /**
     * @type {Array<Integer>}
     */
    Reserved1 {
        get {
            if(!this.HasProp("__Reserved1ProxyArray"))
                this.__Reserved1ProxyArray := Win32FixedArray(this.ptr + 12, 2, Primitive, "uint")
            return this.__Reserved1ProxyArray
        }
    }
}
