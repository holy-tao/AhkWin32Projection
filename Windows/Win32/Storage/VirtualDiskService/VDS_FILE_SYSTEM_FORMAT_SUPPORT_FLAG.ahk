#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the properties of file systems that are supported for formatting volumes.
 * @remarks
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_FILE_SYSTEM_FORMAT_SUPPORT_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_FILE_SYSTEM_FORMAT_SUPPORT_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//vds/ne-vds-vds_file_system_format_support_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_FILE_SYSTEM_FORMAT_SUPPORT_FLAG extends Win32Enum{

    /**
     * The file system is the default file system to be used for formatting the volume.
     * @type {Integer (Int32)}
     */
    static VDS_FSS_DEFAULT => 1

    /**
     * The revision of the file system is not the latest revision supported for formatting the volume.
     * @type {Integer (Int32)}
     */
    static VDS_FSS_PREVIOUS_REVISION => 2

    /**
     * The file system is the recommended file system to be used for formatting the volume.
     * @type {Integer (Int32)}
     */
    static VDS_FSS_RECOMMENDED => 4
}
