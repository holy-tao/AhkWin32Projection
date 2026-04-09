#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 */
class AACS_SERIAL_NUMBER extends Win32Struct {
    static sizeof => 32

    static packingSize => 1

    /**
     * @type {Array<Integer>}
     */
    PrerecordedSerialNumber {
        get {
            if(!this.HasProp("__PrerecordedSerialNumberProxyArray"))
                this.__PrerecordedSerialNumberProxyArray := Win32FixedArray(this.ptr + 0, 16, Primitive, "char")
            return this.__PrerecordedSerialNumberProxyArray
        }
    }

    /**
     * @type {Array<Integer>}
     */
    MAC {
        get {
            if(!this.HasProp("__MACProxyArray"))
                this.__MACProxyArray := Win32FixedArray(this.ptr + 16, 16, Primitive, "char")
            return this.__MACProxyArray
        }
    }
}
