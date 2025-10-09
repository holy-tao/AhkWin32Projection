#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains virtual hard disk (VHD) information to use when you call the SetVirtualDiskInformation function to set VHD properties.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-set_virtual_disk_info
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class SET_VIRTUAL_DISK_INFO extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

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

    class _ParentPathWithDepthInfo extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ChildDepth {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        ParentFilePath {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _ParentLocator extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        LinkageId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Char>}
         */
        ParentFilePath {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    /**
     * @type {Pointer<Char>}
     */
    ParentFilePath {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    UniqueIdentifier {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {_ParentPathWithDepthInfo}
     */
    ParentPathWithDepthInfo{
        get {
            if(!this.HasProp("__ParentPathWithDepthInfo"))
                this.__ParentPathWithDepthInfo := %this.__Class%._ParentPathWithDepthInfo(this.ptr + 8)
            return this.__ParentPathWithDepthInfo
        }
    }

    /**
     * @type {Integer}
     */
    VhdPhysicalSectorSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer<Guid>}
     */
    VirtualDiskId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ChangeTrackingEnabled {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {_ParentLocator}
     */
    ParentLocator{
        get {
            if(!this.HasProp("__ParentLocator"))
                this.__ParentLocator := %this.__Class%._ParentLocator(this.ptr + 8)
            return this.__ParentLocator
        }
    }
}
