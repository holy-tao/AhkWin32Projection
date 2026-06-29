#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents the per-user quota information.
 * @see https://learn.microsoft.com/windows/win32/api/dskquota/ns-dskquota-diskquota_user_information
 * @namespace Windows.Win32.Storage.FileSystem
 */
export default struct DISKQUOTA_USER_INFORMATION {
    #StructPack 8

    /**
     * The disk space charged to the user, in bytes. This is the amount of information stored, not necessarily the number of bytes used on disk.
     */
    QuotaUsed : Int64

    /**
     * The warning threshold for the user, in bytes. You can use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nf-dskquota-idiskquotacontrol-setquotalogflags">IDiskQuotaControl::SetQuotaLogFlags</a> method to configure the system to generate a system logfile entry when the disk space charged to the user exceeds this value.
     */
    QuotaThreshold : Int64

    /**
     * The quota limit for the user, in bytes. If this value is -1, the user has an unlimited quota. 
     * 
     * 
     * 
     * 
     * You can use the <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nf-dskquota-idiskquotacontrol-setquotalogflags">IDiskQuotaControl::SetQuotaLogFlags</a> method to configure the system to generate a system logfile entry when the disk space charged to the user exceeds this value. You can also use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dskquota/nf-dskquota-idiskquotacontrol-setquotastate">IDiskQuotaControl::SetQuotaState</a> method to configure the system to deny additional disk space to the user when the disk space charged to the user exceeds this value.
     */
    QuotaLimit : Int64

}
