#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IHTMLChangeSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHTMLChangeSink
     * @type {Guid}
     */
    static IID => Guid("{3050f64a-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Notify"]

    /**
     * The NotifyAddrChange function causes a notification to be sent to the caller whenever a change occurs in the table that maps IPv4 addresses to interfaces.
     * @remarks
     * The  
     * <b>NotifyAddrChange</b> function may be called in two ways:<ul>
     * <li>Synchronous method</li>
     * <li>Asynchronous method</li>
     * </ul>
     * 
     * 
     * If the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters, the call to 
     * <b>NotifyAddrChange</b> is synchronous and will block until an IP address change occurs. In this case if a change occurs, the <b>NotifyAddrChange</b> function completes to indicate that a change has occurred. 
     * 
     * If the <b>NotifyAddrChange</b> function is called synchronously, a notification will be sent on the next IPv4 address change until the application terminates. 
     * 
     * If the caller specifies a handle variable and an 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-overlapped">OVERLAPPED</a> structure, then the <b>NotifyAddrChange</b> function call is asynchronous and the caller can use the returned handle with the <b>OVERLAPPED</b> structure to receive asynchronous notification of IPv4 address changes using the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a> function. See the following topics for information about using the handle and 
     * <b>OVERLAPPED</b> structure to receive notifications:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/Sync/synchronization-and-overlapped-input-and-output">Synchronization and Overlapped Input and Output</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getoverlappedresult">GetOverlappedResult</a>
     * </li>
     * </ul>
     * The <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-cancelipchangenotify">CancelIPChangeNotify</a> function cancels notification of IPv4 address and route changes previously requested with successful calls to the <b>NotifyAddrChange</b> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-notifyroutechange">NotifyRouteChange</a> functions.
     * 
     * Once an application has been notified of a change, the application can then call the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getipaddrtable">GetIpAddrTable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getadaptersaddresses">GetAdaptersAddresses</a> function to retrieve the table of IPv4 addresses to determine what has changed. If the application is notified and requires notification for the next change, then the <b>NotifyAddrChange</b> function must be called again.
     * 
     * If the <b>NotifyAddrChange</b> function is called asynchronously, a notification will be sent on the next IPv4 address change until either the application cancels the notification by calling the <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-cancelipchangenotify">CancelIPChangeNotify</a> function or the application terminates. If the application terminates, the system will automatically cancel the registration for the notification. It is still recommended that an application explicitly cancel any notification before it terminates.  
     * 
     * Any registration for a notification does not persist across a system shut down or reboot.
     * 
     * On Windows Vista and later, the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/netioapi/nf-netioapi-notifyipinterfacechange">NotifyIpInterfaceChange</a> function  can be used to  register to be notified for changes to IPv4 and IPv6 interfaces on  the local computer.
     * @returns {HRESULT} If the function succeeds, the return value is NO_ERROR if the caller specifies <b>NULL</b> for the <i>Handle</i> and <i>overlapped</i> parameters. If the caller specifies non-<b>NULL</b> parameters, the return value for success is ERROR_IO_PENDING.
     * 
     * If the function fails, use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> to obtain the message string for the returned error.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANCELLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The context is being deregistered, so the call was canceled immediately.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An invalid parameter was passed. This error is returned if the both the <i>Handle</i> and <i>overlapped</i> parameters are not <b>NULL</b>, but the memory specified by the
     *     input parameters cannot be written by the calling process.  This error is also returned if the client already has made a change notification request, so this duplicate request will fail.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There was insufficient memory available to complete the operation.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_SUPPORTED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error is returned on versions of Windows where this function is not supported such as Windows 98/95 and Windows NT 4.0.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/iphlpapi/nf-iphlpapi-notifyaddrchange
     */
    Notify() {
        result := ComCall(3, this, "HRESULT")
        return result
    }
}
