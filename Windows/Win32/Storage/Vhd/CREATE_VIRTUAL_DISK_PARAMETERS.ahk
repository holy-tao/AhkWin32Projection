#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIRTUAL_STORAGE_TYPE.ahk

/**
 * Contains virtual hard disk (VHD) creation parameters, providing control over, and information about, the newly created virtual disk.
 * @see https://docs.microsoft.com/windows/win32/api//virtdisk/ns-virtdisk-create_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class CREATE_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * A value from the <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-create_virtual_disk_version">CREATE_VIRTUAL_DISK_VERSION</a> 
     *       enumeration that is the discriminant for the union.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_VIRTUAL_DISK_VERSION_1"></a><a id="create_virtual_disk_version_1"></a><dl>
     * <dt><b>CREATE_VIRTUAL_DISK_VERSION_1</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>Version1</b> member of this structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CREATE_VIRTUAL_DISK_VERSION_2"></a><a id="create_virtual_disk_version_2"></a><dl>
     * <dt><b>CREATE_VIRTUAL_DISK_VERSION_2</b></dt>
     * <dt>2</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Use the <b>Version2</b> member of this structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _Version1 extends Win32Struct {
        static sizeof => 136
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        UniqueId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MaximumSize {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        BlockSizeInBytes {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        SectorSizeInBytes {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
        /**
         * @type {PWSTR}
         */
        ParentPath {
            get => NumGet(this, 24, "ptr")
            set => NumPut("ptr", value, this, 24)
        }
    
        /**
         * @type {PWSTR}
         */
        SourcePath {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
    }

    class _Version2 extends Win32Struct {
        static sizeof => 136
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        UniqueId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MaximumSize {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        BlockSizeInBytes {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        SectorSizeInBytes {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
        /**
         * @type {Integer}
         */
        PhysicalSectorSizeInBytes {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {PWSTR}
         */
        ParentPath {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
        /**
         * @type {PWSTR}
         */
        SourcePath {
            get => NumGet(this, 40, "ptr")
            set => NumPut("ptr", value, this, 40)
        }
    
        /**
         * @type {Integer}
         */
        OpenFlags {
            get => NumGet(this, 48, "int")
            set => NumPut("int", value, this, 48)
        }
    
        /**
         * @type {VIRTUAL_STORAGE_TYPE}
         */
        ParentVirtualStorageType{
            get {
                if(!this.HasProp("__ParentVirtualStorageType"))
                    this.__ParentVirtualStorageType := VIRTUAL_STORAGE_TYPE(56, this)
                return this.__ParentVirtualStorageType
            }
        }
    
        /**
         * @type {VIRTUAL_STORAGE_TYPE}
         */
        SourceVirtualStorageType{
            get {
                if(!this.HasProp("__SourceVirtualStorageType"))
                    this.__SourceVirtualStorageType := VIRTUAL_STORAGE_TYPE(72, this)
                return this.__SourceVirtualStorageType
            }
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        ResiliencyGuid {
            get => NumGet(this, 88, "ptr")
            set => NumPut("ptr", value, this, 88)
        }
    
    }

    class _Version3 extends Win32Struct {
        static sizeof => 136
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        UniqueId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MaximumSize {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        BlockSizeInBytes {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        SectorSizeInBytes {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
        /**
         * @type {Integer}
         */
        PhysicalSectorSizeInBytes {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {PWSTR}
         */
        ParentPath {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
        /**
         * @type {PWSTR}
         */
        SourcePath {
            get => NumGet(this, 40, "ptr")
            set => NumPut("ptr", value, this, 40)
        }
    
        /**
         * @type {Integer}
         */
        OpenFlags {
            get => NumGet(this, 48, "int")
            set => NumPut("int", value, this, 48)
        }
    
        /**
         * @type {VIRTUAL_STORAGE_TYPE}
         */
        ParentVirtualStorageType{
            get {
                if(!this.HasProp("__ParentVirtualStorageType"))
                    this.__ParentVirtualStorageType := VIRTUAL_STORAGE_TYPE(56, this)
                return this.__ParentVirtualStorageType
            }
        }
    
        /**
         * @type {VIRTUAL_STORAGE_TYPE}
         */
        SourceVirtualStorageType{
            get {
                if(!this.HasProp("__SourceVirtualStorageType"))
                    this.__SourceVirtualStorageType := VIRTUAL_STORAGE_TYPE(72, this)
                return this.__SourceVirtualStorageType
            }
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        ResiliencyGuid {
            get => NumGet(this, 88, "ptr")
            set => NumPut("ptr", value, this, 88)
        }
    
        /**
         * @type {PWSTR}
         */
        SourceLimitPath {
            get => NumGet(this, 96, "ptr")
            set => NumPut("ptr", value, this, 96)
        }
    
        /**
         * @type {VIRTUAL_STORAGE_TYPE}
         */
        BackingStorageType{
            get {
                if(!this.HasProp("__BackingStorageType"))
                    this.__BackingStorageType := VIRTUAL_STORAGE_TYPE(104, this)
                return this.__BackingStorageType
            }
        }
    
    }

    class _Version4 extends Win32Struct {
        static sizeof => 136
        static packingSize => 8

        /**
         * @type {Pointer<Guid>}
         */
        UniqueId {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        MaximumSize {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        BlockSizeInBytes {
            get => NumGet(this, 16, "uint")
            set => NumPut("uint", value, this, 16)
        }
    
        /**
         * @type {Integer}
         */
        SectorSizeInBytes {
            get => NumGet(this, 20, "uint")
            set => NumPut("uint", value, this, 20)
        }
    
        /**
         * @type {Integer}
         */
        PhysicalSectorSizeInBytes {
            get => NumGet(this, 24, "uint")
            set => NumPut("uint", value, this, 24)
        }
    
        /**
         * @type {PWSTR}
         */
        ParentPath {
            get => NumGet(this, 32, "ptr")
            set => NumPut("ptr", value, this, 32)
        }
    
        /**
         * @type {PWSTR}
         */
        SourcePath {
            get => NumGet(this, 40, "ptr")
            set => NumPut("ptr", value, this, 40)
        }
    
        /**
         * @type {Integer}
         */
        OpenFlags {
            get => NumGet(this, 48, "int")
            set => NumPut("int", value, this, 48)
        }
    
        /**
         * @type {VIRTUAL_STORAGE_TYPE}
         */
        ParentVirtualStorageType{
            get {
                if(!this.HasProp("__ParentVirtualStorageType"))
                    this.__ParentVirtualStorageType := VIRTUAL_STORAGE_TYPE(56, this)
                return this.__ParentVirtualStorageType
            }
        }
    
        /**
         * @type {VIRTUAL_STORAGE_TYPE}
         */
        SourceVirtualStorageType{
            get {
                if(!this.HasProp("__SourceVirtualStorageType"))
                    this.__SourceVirtualStorageType := VIRTUAL_STORAGE_TYPE(72, this)
                return this.__SourceVirtualStorageType
            }
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        ResiliencyGuid {
            get => NumGet(this, 88, "ptr")
            set => NumPut("ptr", value, this, 88)
        }
    
        /**
         * @type {PWSTR}
         */
        SourceLimitPath {
            get => NumGet(this, 96, "ptr")
            set => NumPut("ptr", value, this, 96)
        }
    
        /**
         * @type {VIRTUAL_STORAGE_TYPE}
         */
        BackingStorageType{
            get {
                if(!this.HasProp("__BackingStorageType"))
                    this.__BackingStorageType := VIRTUAL_STORAGE_TYPE(104, this)
                return this.__BackingStorageType
            }
        }
    
        /**
         * @type {Pointer<Guid>}
         */
        PmemAddressAbstractionType {
            get => NumGet(this, 120, "ptr")
            set => NumPut("ptr", value, this, 120)
        }
    
        /**
         * @type {Integer}
         */
        DataAlignment {
            get => NumGet(this, 128, "uint")
            set => NumPut("uint", value, this, 128)
        }
    
    }

    /**
     * @type {_Version1}
     */
    Version1{
        get {
            if(!this.HasProp("__Version1"))
                this.__Version1 := %this.__Class%._Version1(8, this)
            return this.__Version1
        }
    }

    /**
     * @type {_Version2}
     */
    Version2{
        get {
            if(!this.HasProp("__Version2"))
                this.__Version2 := %this.__Class%._Version2(8, this)
            return this.__Version2
        }
    }

    /**
     * @type {_Version3}
     */
    Version3{
        get {
            if(!this.HasProp("__Version3"))
                this.__Version3 := %this.__Class%._Version3(8, this)
            return this.__Version3
        }
    }

    /**
     * @type {_Version4}
     */
    Version4{
        get {
            if(!this.HasProp("__Version4"))
                this.__Version4 := %this.__Class%._Version4(8, this)
            return this.__Version4
        }
    }
}
