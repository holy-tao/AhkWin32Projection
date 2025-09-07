#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DISC_CONTROL_BLOCK_SESSION_ITEM extends Win32Struct
{
    static sizeof => 16

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    AsByte{
        get {
            if(!this.HasProp("__AsByteProxyArray"))
                this.__AsByteProxyArray := Win32FixedArray(this.ptr + 0, 1, Primitive, "char")
            return this.__AsByteProxyArray
        }
    }
}
