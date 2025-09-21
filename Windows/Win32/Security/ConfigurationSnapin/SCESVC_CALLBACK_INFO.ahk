#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The SCESVC_CALLBACK_INFO structure contains an opaque database handle and callback function pointers to query, set, and free information.
 * @see https://learn.microsoft.com/windows/win32/api/scesvc/ns-scesvc-scesvc_callback_info
 * @namespace Windows.Win32.Security.ConfigurationSnapin
 * @version v4.0.30319
 */
class SCESVC_CALLBACK_INFO extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Specifies the opaque handle passed to the attachment by the Security Configuration tool set. This handle is used by support functions to read information from and write information to the security database.
     * @type {Pointer<Void>}
     */
    sceHandle {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_query_info">PFSCE_QUERY_INFO</a> callback function that queries information in the security database.
     * @type {Pointer<PFSCE_QUERY_INFO>}
     */
    pfQueryInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_set_info">PFSCE_SET_INFO</a> callback function that sets information in the security database.
     * @type {Pointer<PFSCE_SET_INFO>}
     */
    pfSetInfo {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_free_info">PFSCE_FREE_INFO</a> callback function that frees information in the security database.
     * @type {Pointer<PFSCE_FREE_INFO>}
     */
    pfFreeInfo {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/scesvc/nc-scesvc-pfsce_log_info">PFSCE_LOG_INFO</a> callback function that logs messages to the configuration log file or analysis log file.
     * @type {Pointer<PFSCE_LOG_INFO>}
     */
    pfLogInfo {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
