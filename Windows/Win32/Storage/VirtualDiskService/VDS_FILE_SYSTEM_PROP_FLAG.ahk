#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the details of file-system compression.
 * @remarks
 * 
 * This enumeration provides the values for the <i>ulFlags</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_file_system_prop">VDS_FILE_SYSTEM_PROP</a> structure.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_FILE_SYSTEM_PROP_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_FILE_SYSTEM_PROP_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_file_system_prop_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_FILE_SYSTEM_PROP_FLAG extends Win32Enum{

    /**
     * If set, the file system supports file compression.
     * @type {Integer (Int32)}
     */
    static VDS_FPF_COMPRESSED => 1
}
