#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\STORAGE_TIER_MEDIA_TYPE.ahk
#Include .\STORAGE_TIER_CLASS.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 */
class STORAGE_TIER extends Win32Struct {
    static sizeof => 1056

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Id {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {String}
     */
    Name {
        get => StrGet(this.ptr + 8, 255, "UTF-16")
        set => StrPut(value, this.ptr + 8, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    Description {
        get => StrGet(this.ptr + 520, 255, "UTF-16")
        set => StrPut(value, this.ptr + 520, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 1032, "uint")
        set => NumPut("uint", value, this, 1032)
    }

    /**
     * @type {Integer}
     */
    ProvisionedCapacity {
        get => NumGet(this, 1040, "uint")
        set => NumPut("uint", value, this, 1040)
    }

    /**
     * @type {STORAGE_TIER_MEDIA_TYPE}
     */
    MediaType {
        get => NumGet(this, 1048, "int")
        set => NumPut("int", value, this, 1048)
    }

    /**
     * @type {STORAGE_TIER_CLASS}
     */
    Class {
        get => NumGet(this, 1052, "int")
        set => NumPut("int", value, this, 1052)
    }
}
