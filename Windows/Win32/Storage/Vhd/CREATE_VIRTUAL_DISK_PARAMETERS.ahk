#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\VIRTUAL_STORAGE_TYPE.ahk

/**
 * Contains virtual hard disk (VHD) creation parameters, providing control over, and information about, the newly created virtual disk.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-create_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 * @version v4.0.30319
 */
class CREATE_VIRTUAL_DISK_PARAMETERS extends Win32Struct
{
    static sizeof => 48

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

    /**
     * @type {Pointer<Guid>}
     */
    UniqueId {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    MaximumSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    BlockSizeInBytes {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    SectorSizeInBytes {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ParentPath {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SourcePath {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Integer}
     */
    PhysicalSectorSizeInBytes {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ParentPath1 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SourcePath1 {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Integer}
     */
    OpenFlags {
        get => NumGet(this, 56, "int")
        set => NumPut("int", value, this, 56)
    }

    /**
     * @type {VIRTUAL_STORAGE_TYPE}
     */
    ParentVirtualStorageType{
        get {
            if(!this.HasProp("__ParentVirtualStorageType"))
                this.__ParentVirtualStorageType := VIRTUAL_STORAGE_TYPE(this.ptr + 64)
            return this.__ParentVirtualStorageType
        }
    }

    /**
     * @type {VIRTUAL_STORAGE_TYPE}
     */
    SourceVirtualStorageType{
        get {
            if(!this.HasProp("__SourceVirtualStorageType"))
                this.__SourceVirtualStorageType := VIRTUAL_STORAGE_TYPE(this.ptr + 80)
            return this.__SourceVirtualStorageType
        }
    }

    /**
     * @type {Pointer<Guid>}
     */
    ResiliencyGuid {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ParentPath12 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SourcePath12 {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SourceLimitPath {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {VIRTUAL_STORAGE_TYPE}
     */
    BackingStorageType{
        get {
            if(!this.HasProp("__BackingStorageType"))
                this.__BackingStorageType := VIRTUAL_STORAGE_TYPE(this.ptr + 112)
            return this.__BackingStorageType
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    ParentPath123 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    SourcePath123 {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer<Guid>}
     */
    PmemAddressAbstractionType {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Integer}
     */
    DataAlignment {
        get => NumGet(this, 136, "uint")
        set => NumPut("uint", value, this, 136)
    }
}
