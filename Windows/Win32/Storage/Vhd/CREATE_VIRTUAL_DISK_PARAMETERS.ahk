#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\OPEN_VIRTUAL_DISK_FLAG.ahk" { OPEN_VIRTUAL_DISK_FLAG }
#Import ".\CREATE_VIRTUAL_DISK_VERSION.ahk" { CREATE_VIRTUAL_DISK_VERSION }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VIRTUAL_STORAGE_TYPE.ahk" { VIRTUAL_STORAGE_TYPE }

/**
 * Contains virtual hard disk (VHD) creation parameters, providing control over, and information about, the newly created virtual disk.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-create_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct CREATE_VIRTUAL_DISK_PARAMETERS {
    #StructPack 8


    struct _Version1 {
        UniqueId : Guid

        MaximumSize : Int64

        BlockSizeInBytes : UInt32

        SectorSizeInBytes : UInt32

        ParentPath : PWSTR

        SourcePath : PWSTR

    }

    struct _Version2 {
        UniqueId : Guid

        MaximumSize : Int64

        BlockSizeInBytes : UInt32

        SectorSizeInBytes : UInt32

        PhysicalSectorSizeInBytes : UInt32

        ParentPath : PWSTR

        SourcePath : PWSTR

        OpenFlags : OPEN_VIRTUAL_DISK_FLAG

        ParentVirtualStorageType : VIRTUAL_STORAGE_TYPE

        SourceVirtualStorageType : VIRTUAL_STORAGE_TYPE

        ResiliencyGuid : Guid

    }

    struct _Version3 {
        UniqueId : Guid

        MaximumSize : Int64

        BlockSizeInBytes : UInt32

        SectorSizeInBytes : UInt32

        PhysicalSectorSizeInBytes : UInt32

        ParentPath : PWSTR

        SourcePath : PWSTR

        OpenFlags : OPEN_VIRTUAL_DISK_FLAG

        ParentVirtualStorageType : VIRTUAL_STORAGE_TYPE

        SourceVirtualStorageType : VIRTUAL_STORAGE_TYPE

        ResiliencyGuid : Guid

        SourceLimitPath : PWSTR

        BackingStorageType : VIRTUAL_STORAGE_TYPE

    }

    struct _Version4 {
        UniqueId : Guid

        MaximumSize : Int64

        BlockSizeInBytes : UInt32

        SectorSizeInBytes : UInt32

        PhysicalSectorSizeInBytes : UInt32

        ParentPath : PWSTR

        SourcePath : PWSTR

        OpenFlags : OPEN_VIRTUAL_DISK_FLAG

        ParentVirtualStorageType : VIRTUAL_STORAGE_TYPE

        SourceVirtualStorageType : VIRTUAL_STORAGE_TYPE

        ResiliencyGuid : Guid

        SourceLimitPath : PWSTR

        BackingStorageType : VIRTUAL_STORAGE_TYPE

        PmemAddressAbstractionType : Guid

        DataAlignment : Int64

    }

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
     */
    Version : CREATE_VIRTUAL_DISK_VERSION

    Version1 : CREATE_VIRTUAL_DISK_PARAMETERS._Version1

    static __New() {
        DefineProp(this.Prototype, 'Version2', { type: CREATE_VIRTUAL_DISK_PARAMETERS._Version2, offset: 8 })
        DefineProp(this.Prototype, 'Version3', { type: CREATE_VIRTUAL_DISK_PARAMETERS._Version3, offset: 8 })
        DefineProp(this.Prototype, 'Version4', { type: CREATE_VIRTUAL_DISK_PARAMETERS._Version4, offset: 8 })
        this.DeleteProp("__New")
    }
}
