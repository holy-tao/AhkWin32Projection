#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WindowsNetworkVirtualization
 * @version v4.0.30319
 */
class WindowsNetworkVirtualization {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WNV_API_MAJOR_VERSION_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WNV_API_MINOR_VERSION_0 => 0
;@endregion Constants

;@region Methods
    /**
     * Provides a handle to the Windows Network Virtualization (WNV) driver object to be used to request and receive WNV notifications.
     * @returns {HANDLE} Type: <b>HANDLE</b>
     * 
     * If the function succeeds, it returns the handle to the WNV driver object. If the function fails, it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//wnvapi/nf-wnvapi-wnvopen
     * @since windowsserver2012
     */
    static WnvOpen() {
        result := DllCall("wnvapi.dll\WnvOpen", "ptr")
        return HANDLE({Value: result}, True)
    }

    /**
     * Requests notification from the Windows Network Virtualization (WNV) driver whenever a certain type of event occurs.
     * @param {HANDLE} WnvHandle Type: <b>HANDLE</b>
     * 
     * An object handle that is returned from a call to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/wnvapi/nf-wnvapi-wnvopen">WnvOpen</a> function.
     * @param {Pointer<WNV_NOTIFICATION_PARAM>} NotificationParam Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/wnvapi/ns-wnvapi-wnv_notification_param">PWNV_NOTIFICATION_PARAM</a></b>
     * 
     * A pointer to the notification type for the request.
     * @param {Pointer<OVERLAPPED>} Overlapped Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">LPOVERLAPPED</a></b>
     * 
     * Information about the asynchronous completion of this request. If this parameter is <b>NULL</b>, the request is synchronous.
     * @param {Pointer<Integer>} BytesTransferred Type: <b>PULONG</b>
     * 
     * When this function returns, the <i>BytesTransferred</i> parameter points to the size of the buffer that is filled with the notification structures of the specific event type.
     * @returns {Integer} Type: <b>ULONG</b>
     * 
     * If the operation succeeds, the function returns <b>ERROR_SUCCESS</b>.
     * 
     * If the operation fails, the function returns one of the following system error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is a problem with the <i>NotificationParam</i> parameter, in the <a href="/windows/desktop/api/wnvapi/ns-wnvapi-wnv_notification_param">WNV_NOTIFICATION_PARAM</a> structure's <b>Header</b> field:
     * 
     * <ul>
     * <li>The major and minor version values of the <a href="/windows/desktop/api/wnvapi/ns-wnvapi-wnv_object_header">WNV_OBJECT_HEADER</a>   structure are incorrect</li>
     * <li>The size specified in the <a href="/windows/desktop/api/wnvapi/ns-wnvapi-wnv_object_header">WNV_OBJECT_HEADER</a>   structure is smaller than at least one notification structure of these types:<ul>
     * <li>
     * <a href="/windows/desktop/api/wnvapi/ns-wnvapi-wnv_object_change_param">WNV_OBJECT_CHANGE_PARAM</a>
     * </li>
     * <li>
     * <a href="/windows/desktop/api/wnvapi/ns-wnvapi-wnv_policy_mismatch_param">WNV_POLICY_MISMATCH_PARAM</a>
     * </li>
     * <li>
     * <a href="/windows/desktop/api/wnvapi/ns-wnvapi-wnv_redirect_param">WNV_REDIRECT_PARAM</a>
     * </li>
     * </ul>
     * </li>
     * </ul>
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//wnvapi/nf-wnvapi-wnvrequestnotification
     * @since windowsserver2012
     */
    static WnvRequestNotification(WnvHandle, NotificationParam, Overlapped, BytesTransferred) {
        WnvHandle := WnvHandle is Win32Handle ? NumGet(WnvHandle, "ptr") : WnvHandle

        BytesTransferredMarshal := BytesTransferred is VarRef ? "uint*" : "ptr"

        result := DllCall("wnvapi.dll\WnvRequestNotification", "ptr", WnvHandle, "ptr", NotificationParam, "ptr", Overlapped, BytesTransferredMarshal, BytesTransferred, "uint")
        return result
    }

;@endregion Methods
}
