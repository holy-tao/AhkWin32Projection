#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\SET_VIRTUAL_DISK_INFO_VERSION.ahk" { SET_VIRTUAL_DISK_INFO_VERSION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * Contains virtual hard disk (VHD) information to use when you call the SetVirtualDiskInformation function to set VHD properties.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-set_virtual_disk_info
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct SET_VIRTUAL_DISK_INFO {
    #StructPack 8


    struct _ParentPathWithDepthInfo {
        ChildDepth : UInt32

        ParentFilePath : PWSTR

    }

    struct _ParentLocator {
        LinkageId : Guid

        ParentFilePath : PWSTR

    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-set_virtual_disk_info_version">SET_VIRTUAL_DISK_INFO_VERSION</a> 
     *       enumeration that specifies the version of the 
     *       <b>SET_VIRTUAL_DISK_INFO</b> structure being passed to or 
     *       from the VHD functions. This determines the type of information set.
     */
    Version : SET_VIRTUAL_DISK_INFO_VERSION

    ParentFilePath : PWSTR

    static __New() {
        DefineProp(this.Prototype, 'UniqueIdentifier', { type: Guid, offset: 8 })
        DefineProp(this.Prototype, 'ParentPathWithDepthInfo', { type: SET_VIRTUAL_DISK_INFO._ParentPathWithDepthInfo, offset: 8 })
        DefineProp(this.Prototype, 'VhdPhysicalSectorSize', { type: UInt32, offset: 8 })
        DefineProp(this.Prototype, 'VirtualDiskId', { type: Guid, offset: 8 })
        DefineProp(this.Prototype, 'ChangeTrackingEnabled', { type: BOOL, offset: 8 })
        DefineProp(this.Prototype, 'ParentLocator', { type: SET_VIRTUAL_DISK_INFO._ParentLocator, offset: 8 })
        this.DeleteProp("__New")
    }
}
