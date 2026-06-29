#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\GET_VIRTUAL_DISK_INFO_VERSION.ahk" { GET_VIRTUAL_DISK_INFO_VERSION }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VIRTUAL_STORAGE_TYPE.ahk" { VIRTUAL_STORAGE_TYPE }
#Import "..\..\Foundation\WCHAR.ahk" { WCHAR }

/**
 * Contains virtual hard disk (VHD) information.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-get_virtual_disk_info
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct GET_VIRTUAL_DISK_INFO {
    #StructPack 8


    struct _Size {
        VirtualSize : Int64

        PhysicalSize : Int64

        BlockSize : UInt32

        SectorSize : UInt32

    }

    struct _ParentLocation {
        ParentResolved : BOOL

        ParentLocationBuffer : WCHAR[1]

    }

    struct _PhysicalDisk {
        LogicalSectorSize : UInt32

        PhysicalSectorSize : UInt32

        IsRemote : BOOL

    }

    struct _ChangeTrackingState {
        Enabled : BOOL

        NewerChanges : BOOL

        MostRecentId : WCHAR[1]

    }

    /**
     * A value of the 
     *       <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-get_virtual_disk_info_version">GET_VIRTUAL_DISK_INFO_VERSION</a> enumeration 
     *       that specifies the version of the 
     *       <b>GET_VIRTUAL_DISK_INFO</b> structure being passed to 
     *       or from the virtual disk functions. This determines what parts of this structure will be used.
     */
    Version : GET_VIRTUAL_DISK_INFO_VERSION

    Size : GET_VIRTUAL_DISK_INFO._Size

    static __New() {
        DefineProp(this.Prototype, 'Identifier', { type: Guid, offset: 8 })
        DefineProp(this.Prototype, 'ParentLocation', { type: GET_VIRTUAL_DISK_INFO._ParentLocation, offset: 8 })
        DefineProp(this.Prototype, 'ParentIdentifier', { type: Guid, offset: 8 })
        DefineProp(this.Prototype, 'ParentTimestamp', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'VirtualStorageType', { type: VIRTUAL_STORAGE_TYPE, offset: 8 })
        DefineProp(this.Prototype, 'ProviderSubtype', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'Is4kAligned', { type: BOOL, offset: 8 })
        DefineProp(this.Prototype, 'IsLoaded', { type: BOOL, offset: 8 })
        DefineProp(this.Prototype, 'PhysicalDisk', { type: GET_VIRTUAL_DISK_INFO._PhysicalDisk, offset: 8 })
        DefineProp(this.Prototype, 'VhdPhysicalSectorSize', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'SmallestSafeVirtualSize', { type: Int64, offset: 8 })
        DefineProp(this.Prototype, 'FragmentationPercentage', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'VirtualDiskId', { type: Guid, offset: 8 })
        DefineProp(this.Prototype, 'ChangeTrackingState', { type: GET_VIRTUAL_DISK_INFO._ChangeTrackingState, offset: 8 })
        this.DeleteProp("__New")
    }
}
