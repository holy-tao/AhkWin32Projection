#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The DS_REPSYNCALL_ERROR enumeration is used with the DS_REPSYNCALL_ERRINFO structure to indicate where in the replication process an error occurred.
 * @see https://learn.microsoft.com/windows/win32/api/ntdsapi/ne-ntdsapi-ds_repsyncall_error
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DS_REPSYNCALL_ERROR extends Win32Enum{

    /**
     * The server referred to by the <b>pszSvrId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_errinfoa">DS_REPSYNCALL_ERRINFO</a> structure cannot be contacted.
     * @type {Integer (Int32)}
     */
    static DS_REPSYNCALL_WIN32_ERROR_CONTACTING_SERVER => 0

    /**
     * An error occurred during replication of the server identified by the <b>pszSvrId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_errinfoa">DS_REPSYNCALL_ERRINFO</a> structure.
     * @type {Integer (Int32)}
     */
    static DS_REPSYNCALL_WIN32_ERROR_REPLICATING => 1

    /**
     * The server identified by the <b>pszSvrId</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_errinfoa">DS_REPSYNCALL_ERRINFO</a> structure cannot be contacted.
     * @type {Integer (Int32)}
     */
    static DS_REPSYNCALL_SERVER_UNREACHABLE => 2
}
