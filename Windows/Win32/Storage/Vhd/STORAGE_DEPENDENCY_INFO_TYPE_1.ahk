#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\VIRTUAL_STORAGE_TYPE.ahk
#Include .\DEPENDENT_DISK_FLAG.ahk

/**
 * Contains virtual hard disk (VHD) storage dependency information for type 1.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-storage_dependency_info_type_1
 * @namespace Windows.Win32.Storage.Vhd
 */
class STORAGE_DEPENDENCY_INFO_TYPE_1 extends Win32Struct {
    static sizeof => 28

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-dependent_disk_flag">DEPENDENT_DISK_FLAG</a> enumeration.
     * @type {DEPENDENT_DISK_FLAG}
     */
    DependencyTypeFlags {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * Flags specific to the VHD provider.
     * @type {Integer}
     */
    ProviderSpecificFlags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-virtual_storage_type">VIRTUAL_STORAGE_TYPE</a> structure.
     * @type {VIRTUAL_STORAGE_TYPE}
     */
    VirtualStorageType {
        get {
            if(!this.HasProp("__VirtualStorageType"))
                this.__VirtualStorageType := VIRTUAL_STORAGE_TYPE(8, this)
            return this.__VirtualStorageType
        }
    }
}
