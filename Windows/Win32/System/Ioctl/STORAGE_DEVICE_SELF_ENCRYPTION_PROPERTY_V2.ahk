#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOLEAN.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_DEVICE_SELF_ENCRYPTION_PROPERTY_V2 extends Win32Struct
{
    static sizeof => 16

    static packingSize => 4

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Size {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {BOOLEAN}
     */
    SupportsSelfEncryption{
        get {
            if(!this.HasProp("__SupportsSelfEncryption"))
                this.__SupportsSelfEncryption := BOOLEAN(this.ptr + 8)
            return this.__SupportsSelfEncryption
        }
    }

    /**
     * @type {Integer}
     */
    EncryptionType {
        get => NumGet(this, 12, "int")
        set => NumPut("int", value, this, 12)
    }
}
