#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\STORAGE_DEPENDENCY_INFO_TYPE_2.ahk" { STORAGE_DEPENDENCY_INFO_TYPE_2 }
#Import ".\STORAGE_DEPENDENCY_INFO_VERSION.ahk" { STORAGE_DEPENDENCY_INFO_VERSION }
#Import ".\STORAGE_DEPENDENCY_INFO_TYPE_1.ahk" { STORAGE_DEPENDENCY_INFO_TYPE_1 }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\VIRTUAL_STORAGE_TYPE.ahk" { VIRTUAL_STORAGE_TYPE }
#Import ".\DEPENDENT_DISK_FLAG.ahk" { DEPENDENT_DISK_FLAG }

/**
 * Contains virtual hard disk (VHD) storage dependency information.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-storage_dependency_info
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct STORAGE_DEPENDENCY_INFO {
    #StructPack 8

    /**
     * A [STORAGE_DEPENDENCY_INFO_TYPE_1](./ns-virtdisk-storage_dependency_info_type_1.md) or [STORAGE_DEPENDENCY_INFO_TYPE_2](./ns-virtdisk-storage_dependency_info_type_2.md).
     */
    Version : STORAGE_DEPENDENCY_INFO_VERSION

    /**
     * Number of entries returned in the following unioned members.
     */
    NumberEntries : UInt32

    Version1Entries : STORAGE_DEPENDENCY_INFO_TYPE_1[1]

    static __New() {
        DefineProp(this.Prototype, 'Version2Entries', { type: STORAGE_DEPENDENCY_INFO_TYPE_2[1], offset: 8 })
        this.DeleteProp("__New")
    }
}
