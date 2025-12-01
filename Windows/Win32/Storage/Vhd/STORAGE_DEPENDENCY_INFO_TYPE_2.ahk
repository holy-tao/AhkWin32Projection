#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIRTUAL_STORAGE_TYPE.ahk

/**
 * Contains VHD or ISO storage dependency information for type 2.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-storage_dependency_info_type_2
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class STORAGE_DEPENDENCY_INFO_TYPE_2 extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-dependent_disk_flag">DEPENDENT_DISK_FLAG</a> enumeration.
     * @type {Integer}
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
    VirtualStorageType{
        get {
            if(!this.HasProp("__VirtualStorageType"))
                this.__VirtualStorageType := VIRTUAL_STORAGE_TYPE(8, this)
            return this.__VirtualStorageType
        }
    }

    /**
     * The ancestor level.
     * @type {Integer}
     */
    AncestorLevel {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * The device name of the dependent device. If the device is a virtual hard drive then this will be in the 
     *       form \\.\PhysicalDrive<i>N</i>. If the device is a virtual CD or DVD drive 
     *       (ISO) then this will be in the form \\.\CDRom<i>N</i>. In either case 
     *       <i>N</i> is an integer that represents a unique identifier for the caller's host 
     *       system.
     * @type {PWSTR}
     */
    DependencyDeviceName {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * The host disk volume name in the form \\?\Volume{<i>GUID</i>}\ where 
     *       <i>GUID</i> is the <b>GUID</b> that identifies the volume.
     * @type {PWSTR}
     */
    HostVolumeName {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * The name of the dependent volume, if any, in the form 
     *       \\?\Volume{<i>GUID</i>}\ where <i>GUID</i> is the 
     *       <b>GUID</b> that identifies the volume.
     * @type {PWSTR}
     */
    DependentVolumeName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The relative path to the dependent volume.
     * @type {PWSTR}
     */
    DependentVolumeRelativePath {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
