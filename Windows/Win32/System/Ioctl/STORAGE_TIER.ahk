#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\STORAGE_TIER_CLASS.ahk
#Include .\STORAGE_TIER_MEDIA_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_TIER extends Win32Struct {
    static sizeof => 1064

    static packingSize => 8

    /**
     * @type {Guid}
     */
    Id {
        get {
            if(!this.HasProp("__Id"))
                this.__Id := Guid(0, this)
            return this.__Id
        }
    }

    /**
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 16, 255, "UTF-16")
        set => StrPut(value, this.ptr + 16, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 528, 255, "UTF-16")
        set => StrPut(value, this.ptr + 528, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 1040, "uint")
        set => NumPut("uint", value, this, 1040)
    }

    /**
     * @type {Integer}
     */
    ProvisionedCapacity {
        get => NumGet(this, 1048, "uint")
        set => NumPut("uint", value, this, 1048)
    }

    /**
     * @type {STORAGE_TIER_MEDIA_TYPE}
     */
    MediaType {
        get => NumGet(this, 1056, "int")
        set => NumPut("int", value, this, 1056)
    }

    /**
     * @type {STORAGE_TIER_CLASS}
     */
    Class {
        get => NumGet(this, 1060, "int")
        set => NumPut("int", value, this, 1060)
    }
}
