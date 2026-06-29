#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RESIZE_VIRTUAL_DISK_VERSION.ahk" { RESIZE_VIRTUAL_DISK_VERSION }

/**
 * Contains the parameters for a ResizeVirtualDisk function.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-resize_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct RESIZE_VIRTUAL_DISK_PARAMETERS {
    #StructPack 8


    struct _Version1 {
        NewSize : Int64

    }

    /**
     * Discriminant for the union containing a value enumerated from the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/virtdisk/ne-virtdisk-resize_virtual_disk_version">RESIZE_VIRTUAL_DISK_VERSION</a> 
     *       enumeration.
     */
    Version : RESIZE_VIRTUAL_DISK_VERSION

    Version1 : RESIZE_VIRTUAL_DISK_PARAMETERS._Version1

}
