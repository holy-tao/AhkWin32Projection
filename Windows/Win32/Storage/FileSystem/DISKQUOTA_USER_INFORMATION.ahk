#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents the per-user quota information.
 * @see https://docs.microsoft.com/windows/win32/api//dskquota/ns-dskquota-diskquota_user_information
 * @namespace Windows.Win32.Storage.FileSystem
 * @version v4.0.30319
 */
class DISKQUOTA_USER_INFORMATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The disk space charged to the user, in bytes. This is the amount of information stored, not necessarily the number of bytes used on disk.
     * @type {Integer}
     */
    QuotaUsed {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * The warning threshold for the user, in bytes. You can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nf-dskquota-idiskquotacontrol-setquotalogflags">IDiskQuotaControl::SetQuotaLogFlags</a> method to configure the system to generate a system logfile entry when the disk space charged to the user exceeds this value.
     * @type {Integer}
     */
    QuotaThreshold {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * The quota limit for the user, in bytes. If this value is -1, the user has an unlimited quota. 
     * 
     * 
     * 
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nf-dskquota-idiskquotacontrol-setquotalogflags">IDiskQuotaControl::SetQuotaLogFlags</a> method to configure the system to generate a system logfile entry when the disk space charged to the user exceeds this value. You can also use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nf-dskquota-idiskquotacontrol-setquotastate">IDiskQuotaControl::SetQuotaState</a> method to configure the system to deny additional disk space to the user when the disk space charged to the user exceeds this value.
     * @type {Integer}
     */
    QuotaLimit {
        get => NumGet(this, 16, "int64")
        set => NumPut("int64", value, this, 16)
    }
}
