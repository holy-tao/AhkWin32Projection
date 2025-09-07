#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class BULK_SECURITY_TEST_DATA extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * @type {Integer}
     */
    DesiredAccess {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Array<UInt32>}
     */
    SecurityIds{
        get {
            if(!this.HasProp("__SecurityIdsProxyArray"))
                this.__SecurityIdsProxyArray := Win32FixedArray(this.ptr + 4, 4, Primitive, "uint")
            return this.__SecurityIdsProxyArray
        }
    }
}
