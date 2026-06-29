#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MIRROR_VIRTUAL_DISK_VERSION.ahk" { MIRROR_VIRTUAL_DISK_VERSION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains virtual hard disk (VHD) mirror request parameters.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-mirror_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct MIRROR_VIRTUAL_DISK_PARAMETERS {
    #StructPack 8


    struct _Version1 {
        MirrorVirtualDiskPath : PWSTR

    }

    /**
     * Indicates the version of this structure to use. Set this to 
     *       <b>MIRROR_VIRTUAL_DISK_VERSION_1</b> (1).
     */
    Version : MIRROR_VIRTUAL_DISK_VERSION

    Version1 : MIRROR_VIRTUAL_DISK_PARAMETERS._Version1

}
