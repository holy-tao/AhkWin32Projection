#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\PWSTR.ahk

/**
 * Contains virtual hard disk (VHD) information to use when you call the SetVirtualDiskInformation function to set VHD properties.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-set_virtual_disk_info
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class SET_VIRTUAL_DISK_INFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-set_virtual_disk_info_version">SET_VIRTUAL_DISK_INFO_VERSION</a> 
     *       enumeration that specifies the version of the 
     *       <b>SET_VIRTUAL_DISK_INFO</b> structure being passed to or 
     *       from the VHD functions. This determines the type of information set.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * @type {PWSTR}
     */
    ParentFilePath{
        get {
            if(!this.HasProp("__ParentFilePath"))
                this.__ParentFilePath := PWSTR(this.ptr + 4)
            return this.__ParentFilePath
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    UniqueIdentifier {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ChildDepth {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    ParentFilePath1{
        get {
            if(!this.HasProp("__ParentFilePath1"))
                this.__ParentFilePath1 := PWSTR(this.ptr + 12)
            return this.__ParentFilePath1
        }
    }

    /**
     * @type {Integer}
     */
    VhdPhysicalSectorSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    VirtualDiskId {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    ChangeTrackingEnabled {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * @type {Pointer<Guid>}
     */
    LinkageId {
        get => NumGet(this, 4, "ptr")
        set => NumPut("ptr", value, this, 4)
    }

    /**
     * @type {PWSTR}
     */
    ParentFilePath12{
        get {
            if(!this.HasProp("__ParentFilePath12"))
                this.__ParentFilePath12 := PWSTR(this.ptr + 12)
            return this.__ParentFilePath12
        }
    }
}
