#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ATTACH_VIRTUAL_DISK_VERSION.ahk" { ATTACH_VIRTUAL_DISK_VERSION }

/**
 * Contains virtual hard disk (VHD) attach request parameters.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-attach_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct ATTACH_VIRTUAL_DISK_PARAMETERS {
    #StructPack 8


    struct _Version1 {
        Reserved : UInt32

    }

    struct _Version2 {
        RestrictedOffset : Int64

        RestrictedLength : Int64

    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-attach_virtual_disk_version">ATTACH_VIRTUAL_DISK_VERSION</a> 
     *      enumeration that specifies the version of the 
     *      <b>ATTACH_VIRTUAL_DISK_PARAMETERS</b> 
     *      structure being passed to or from the VHD functions.
     */
    Version : ATTACH_VIRTUAL_DISK_VERSION

    Version1 : ATTACH_VIRTUAL_DISK_PARAMETERS._Version1

    static __New() {
        DefineProp(this.Prototype, 'Version2', { type: ATTACH_VIRTUAL_DISK_PARAMETERS._Version2, offset: 8 })
        this.DeleteProp("__New")
    }
}
