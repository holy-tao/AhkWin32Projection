#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the set of valid flags for a drive letter.
 * @remarks
 * This enumeration provides the values for the <i>ulFlags</i> member of the <a href="https://docs.microsoft.com/windows/desktop/api/vds/ns-vds-vds_drive_letter_prop">VDS_DRIVE_LETTER_PROP</a> structure.
 * 
 * <div class="alert"><b>Note</b>  Additional constants might be added to the <b>VDS_DRIVE_LETTER_FLAG</b> enumeration in future Windows versions. For this reason, your application must be designed to gracefully handle an unrecognized <b>VDS_DRIVE_LETTER_FLAG</b> enumeration constant.</div>
 * <div> </div>
 * @see https://learn.microsoft.com/windows/win32/api/vds/ne-vds-vds_drive_letter_flag
 * @namespace Windows.Win32.Storage.VirtualDiskService
 * @version v4.0.30319
 */
class VDS_DRIVE_LETTER_FLAG extends Win32Enum{

    /**
     * If set, the drive letter disappears after the computer reboots.
     * @type {Integer (Int32)}
     */
    static VDS_DLF_NON_PERSISTENT => 1
}
