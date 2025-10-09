#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIRTUAL_STORAGE_TYPE.ahk

/**
 * Contains virtual hard disk (VHD) information.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-get_virtual_disk_info
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class GET_VIRTUAL_DISK_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * A value of the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-get_virtual_disk_info_version">GET_VIRTUAL_DISK_INFO_VERSION</a> enumeration 
     *       that specifies the version of the 
     *       <b>GET_VIRTUAL_DISK_INFO</b> structure being passed to 
     *       or from the virtual disk functions. This determines what parts of this structure will be used.
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Size extends Win32Struct {
        static sizeof => 28
        static packingSize => 8

        /**
         * @type {Integer}
         */
        VirtualSize {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        PhysicalSize {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        BlockSize {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        SectorSize {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
    }

    class _ParentLocation extends Win32Struct {
        static sizeof => 28
        static packingSize => 8

        /**
         * @type {Integer}
         */
        ParentResolved {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {String}
         */
        ParentLocationBuffer {
            get => StrGet(this.ptr + 4, 0, "UTF-16")
            set => StrPut(value, this.ptr + 4, 0, "UTF-16")
        }
    
    }

    class _PhysicalDisk extends Win32Struct {
        static sizeof => 28
        static packingSize => 8

        /**
         * @type {Integer}
         */
        LogicalSectorSize {
            get => NumGet(this, 0, "uint")
            set => NumPut("uint", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        PhysicalSectorSize {
            get => NumGet(this, 4, "uint")
            set => NumPut("uint", value, this, 4)
        }
    
        /**
         * @type {Integer}
         */
        IsRemote {
            get => NumGet(this, 8, "int")
            set => NumPut("int", value, this, 8)
        }
    
    }

    class _ChangeTrackingState extends Win32Struct {
        static sizeof => 28
        static packingSize => 8

        /**
         * @type {Integer}
         */
        Enabled {
            get => NumGet(this, 0, "int")
            set => NumPut("int", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        NewerChanges {
            get => NumGet(this, 4, "int")
            set => NumPut("int", value, this, 4)
        }
    
        /**
         * @type {String}
         */
        MostRecentId {
            get => StrGet(this.ptr + 8, 0, "UTF-16")
            set => StrPut(value, this.ptr + 8, 0, "UTF-16")
        }
    
    }

    /**
     * @type {_Size}
     */
    Size{
        get {
            if(!this.HasProp("__Size"))
                this.__Size := %this.__Class%._Size(this.ptr + 8)
            return this.__Size
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    Identifier {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {_ParentLocation}
     */
    ParentLocation{
        get {
            if(!this.HasProp("__ParentLocation"))
                this.__ParentLocation := %this.__Class%._ParentLocation(this.ptr + 8)
            return this.__ParentLocation
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    ParentIdentifier {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    ParentTimestamp {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {VIRTUAL_STORAGE_TYPE}
     */
    VirtualStorageType{
        get {
            if(!this.HasProp("__VirtualStorageType"))
                this.__VirtualStorageType := VIRTUAL_STORAGE_TYPE(this.ptr + 8)
            return this.__VirtualStorageType
        }
    }

    /**
     * @type {Integer}
     */
    ProviderSubtype {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Is4kAligned {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    IsLoaded {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {_PhysicalDisk}
     */
    PhysicalDisk{
        get {
            if(!this.HasProp("__PhysicalDisk"))
                this.__PhysicalDisk := %this.__Class%._PhysicalDisk(this.ptr + 8)
            return this.__PhysicalDisk
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
     * @type {Integer}
     */
    SmallestSafeVirtualSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    FragmentationPercentage {
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
     * @type {_ChangeTrackingState}
     */
    ChangeTrackingState{
        get {
            if(!this.HasProp("__ChangeTrackingState"))
                this.__ChangeTrackingState := %this.__Class%._ChangeTrackingState(this.ptr + 8)
            return this.__ChangeTrackingState
        }
    }
}
