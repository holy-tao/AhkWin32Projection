#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import ".\FORK_VIRTUAL_DISK_VERSION.ahk" { FORK_VIRTUAL_DISK_VERSION }

/**
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct FORK_VIRTUAL_DISK_PARAMETERS {
    #StructPack 8


    struct _Version1 {
        ForkedVirtualDiskPath : PWSTR

    }

    Version : FORK_VIRTUAL_DISK_VERSION

    Version1 : FORK_VIRTUAL_DISK_PARAMETERS._Version1

}
