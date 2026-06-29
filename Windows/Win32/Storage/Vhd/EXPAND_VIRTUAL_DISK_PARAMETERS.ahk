#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\EXPAND_VIRTUAL_DISK_VERSION.ahk" { EXPAND_VIRTUAL_DISK_VERSION }

/**
 * Contains virtual disk expansion request parameters.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-expand_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct EXPAND_VIRTUAL_DISK_PARAMETERS {
    #StructPack 8


    struct _Version1 {
        NewSize : Int64

    }

    /**
     * An <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-expand_virtual_disk_version">EXPAND_VIRTUAL_DISK_VERSION</a> 
     *       enumeration value that specifies the version of the 
     *       <b>EXPAND_VIRTUAL_DISK_PARAMETERS</b> structure 
     *       being passed to or from the virtual disk functions.
     */
    Version : EXPAND_VIRTUAL_DISK_VERSION

    Version1 : EXPAND_VIRTUAL_DISK_PARAMETERS._Version1

}
