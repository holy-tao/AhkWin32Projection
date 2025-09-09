#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.Devices.Dvd
 * @version v4.0.30319
 */
class DVD_DISK_KEY_DESCRIPTOR extends Win32Struct
{
    static sizeof => 2048

    static packingSize => 1

    /**
     * @type {Array<Byte>}
     */
    DiskKeyData{
        get {
            if(!this.HasProp("__DiskKeyDataProxyArray"))
                this.__DiskKeyDataProxyArray := Win32FixedArray(this.ptr + 0, 2048, Primitive, "char")
            return this.__DiskKeyDataProxyArray
        }
    }
}
