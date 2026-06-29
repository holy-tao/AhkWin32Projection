#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The SCESVC_CALLBACK_INFO structure contains an opaque database handle and callback function pointers to query, set, and free information.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_callback_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 */
export default struct SCESVC_CALLBACK_INFO {
    #StructPack 8

    /**
     * Specifies the opaque handle passed to the attachment by the Security Configuration tool set. This handle is used by support functions to read information from and write information to the security database.
     */
    sceHandle : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_query_info">PFSCE_QUERY_INFO</a> callback function that queries information in the security database.
     */
    pfQueryInfo : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_set_info">PFSCE_SET_INFO</a> callback function that sets information in the security database.
     */
    pfSetInfo : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_free_info">PFSCE_FREE_INFO</a> callback function that frees information in the security database.
     */
    pfFreeInfo : IntPtr

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_log_info">PFSCE_LOG_INFO</a> callback function that logs messages to the configuration log file or analysis log file.
     */
    pfLogInfo : IntPtr

}
