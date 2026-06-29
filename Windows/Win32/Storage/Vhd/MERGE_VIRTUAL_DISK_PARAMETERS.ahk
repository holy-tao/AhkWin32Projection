#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\MERGE_VIRTUAL_DISK_VERSION.ahk" { MERGE_VIRTUAL_DISK_VERSION }

/**
 * Contains virtual hard disk (VHD) merge request parameters.
 * @remarks
 * The depth of a merge request specified by the <b>MergeDepth</b> member is the number of  
 *     parent VHD image files in the differencing chain to be merged.  For more information, see 
 *     <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/nf-virtdisk-mergevirtualdisk">MergeVirtualDisk</a>.
 * @see https://learn.microsoft.com/windows/win32/api/virtdisk/ns-virtdisk-merge_virtual_disk_parameters
 * @namespace Windows.Win32.Storage.Vhd
 */
export default struct MERGE_VIRTUAL_DISK_PARAMETERS {
    #StructPack 4


    struct _Version1 {
        MergeDepth : UInt32

    }

    struct _Version2 {
        MergeSourceDepth : UInt32

        MergeTargetDepth : UInt32

    }

    /**
     * A <a href="https://docs.microsoft.com/windows/win32/api/virtdisk/ne-virtdisk-merge_virtual_disk_version">MERGE_VIRTUAL_DISK_VERSION</a> enumeration 
     *       that specifies the version of the 
     *       <b>MERGE_VIRTUAL_DISK_PARAMETERS</b> structure 
     *       being passed to or from the VHD functions.
     */
    Version : MERGE_VIRTUAL_DISK_VERSION

    Version1 : MERGE_VIRTUAL_DISK_PARAMETERS._Version1

    static __New() {
        DefineProp(this.Prototype, 'Version2', { type: MERGE_VIRTUAL_DISK_PARAMETERS._Version2, offset: 4 })
        this.DeleteProp("__New")
    }
}
