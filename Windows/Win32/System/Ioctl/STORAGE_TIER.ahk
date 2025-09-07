#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_TIER extends Win32Struct
{
    static sizeof => 1056

    static packingSize => 8

    /**
     * @type {Pointer<Guid>}
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
     * @type {Integer}
     */
    MediaType {
        get => NumGet(this, 1048, "int")
        set => NumPut("int", value, this, 1048)
    }

    /**
     * @type {Integer}
     */
    Class {
        get => NumGet(this, 1052, "int")
        set => NumPut("int", value, this, 1052)
    }
}
