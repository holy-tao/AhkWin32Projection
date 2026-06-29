#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The ERRLOG_OTHER_INFO structure contains error log information. The NetAlertRaise and NetAlertRaiseEx functions use the ERRLOG_OTHER_INFO structure to specify information when adding a new entry to the error log.
 * @remarks
 * The calling application must allocate and free the memory for all structures and variable-length data in an alert message buffer.
 * @see https://learn.microsoft.com/windows/win32/api/lmalert/ns-lmalert-errlog_other_info
 * @namespace Windows.Win32.NetworkManagement.NetManagement
 */
export default struct ERRLOG_OTHER_INFO {
    #StructPack 4

    /**
     * Specifies the error code that was written to the error log.
     */
    alrter_errcode : UInt32

    /**
     * Specifies the offset for the new entry in the error log.
     */
    alrter_offset : UInt32

}
