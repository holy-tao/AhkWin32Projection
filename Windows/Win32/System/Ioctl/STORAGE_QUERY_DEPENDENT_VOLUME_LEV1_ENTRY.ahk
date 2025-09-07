#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Storage\Vhd\VIRTUAL_STORAGE_TYPE.ahk

/**
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class STORAGE_QUERY_DEPENDENT_VOLUME_LEV1_ENTRY extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    EntryLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    DependencyTypeFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ProviderSpecificFlags {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {VIRTUAL_STORAGE_TYPE}
     */
    VirtualStorageType{
        get {
            if(!this.HasProp("__VirtualStorageType"))
                this.__VirtualStorageType := VIRTUAL_STORAGE_TYPE(this.ptr + 16)
            return this.__VirtualStorageType
        }
    }
}
