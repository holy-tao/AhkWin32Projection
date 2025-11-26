#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This interface is implemented by the client program to support asynchronous queries and is called by Function Discovery to notify the client program when a function instance that meets the query parameters has been added or removed.
 * @remarks
 * 
 * This interface must be implemented by the client program in order to receive notifications from Function Discovery. The address of the client program's implementation is passed to one of the query methods to enable notifications for function instances which meet the query parameters.
 * 
 *  Function Discovery calls the client program's <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate">IFunctionDiscoveryNotification::OnUpdate</a> method to perform the actual notification, which is generated for a function instance when it is added or removed. <div class="alert"><b>Note</b>  Some Function discovery providers will also generate a notification when a function instance is modified by changing a category or one or more properties assigned to it.</div>
 * <div> </div>
 * 
 * 
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionDiscoveryNotification extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionDiscoveryNotification
     * @type {Guid}
     */
    static IID => Guid("{5f6c1ba8-5330-422e-a368-572b244d3f87}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnUpdate", "OnError", "OnEvent"]

    /**
     * Indicates that a function instance has been added, removed, or changed.
     * @param {Integer} enumQueryUpdateAction A <a href="https://docs.microsoft.com/windows/win32/api/functiondiscoveryapi/ne-functiondiscoveryapi-queryupdateaction">QueryUpdateAction</a> value that specifies the type of action Function Discovery is performing on the specified function instance.
     * @param {Integer} fdqcQueryContext The context registered for change notification. The type <b>FDQUERYCONTEXT</b> is defined as a DWORDLONG. This parameter can be <b>NULL</b>.
     * @param {IFunctionInstance} pIFunctionInstance An <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface pointer that represents the function instance being affected by the update.
     * @returns {HRESULT} The client program's implementation of the <b>OnUpdate</b> method should return one of the following <b>HRESULT</b> values to the caller.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of one of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate
     */
    OnUpdate(enumQueryUpdateAction, fdqcQueryContext, pIFunctionInstance) {
        result := ComCall(3, this, "int", enumQueryUpdateAction, "uint", fdqcQueryContext, "ptr", pIFunctionInstance, "HRESULT")
        return result
    }

    /**
     * Receives errors that occur during asynchronous query processing.
     * @param {HRESULT} hr The query error that is being reported.
     * @param {Integer} fdqcQueryContext The context registered for change notification. The type <b>FDQUERYCONTEXT</b> is defined as a DWORDLONG.
     * @param {PWSTR} pszProvider The name of the provider.
     * @returns {HRESULT} The client program's implementation of the <b>OnError</b> method should return one of the following <b>HRESULT</b> values to the caller.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of one of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onerror
     */
    OnError(hr, fdqcQueryContext, pszProvider) {
        pszProvider := pszProvider is String ? StrPtr(pszProvider) : pszProvider

        result := ComCall(4, this, "int", hr, "uint", fdqcQueryContext, "ptr", pszProvider, "HRESULT")
        return result
    }

    /**
     * Receives any add, remove, or update events during a notification.
     * @param {Integer} dwEventID The type of event.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FD_EVENTID_SEARCHCOMPLETE"></a><a id="fd_eventid_searchcomplete"></a><dl>
     * <dt><b>FD_EVENTID_SEARCHCOMPLETE</b></dt>
     * <dt>1000</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The search was completed by a provider. Typically, this notification is sent by network protocol providers where the protocol specifies a defined interval in which search results will be accepted.  Both the WSD and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/ssdp-provider">SSDP</a> providers use this event type. 
     * 
     * Once this notification is sent, a query ignores all incoming responses to the initial search or probe request. However, the query will still monitor for Hello or Bye messages (used to indicate when a device is added or removed). The query will continue to monitor for these events until <b>Release</b> is called on the query object.
     * 
     * This notification will not be sent if a catastrophic error occurs.
     * 
     * For information about how this event is implemented or used by a specific provider, follow the link to the provider documentation from the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/built-in-providers">Built-in Providers</a> topic.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FD_EVENTID_ASYNCTHREADEXIT"></a><a id="fd_eventid_asyncthreadexit"></a><dl>
     * <dt><b>FD_EVENTID_ASYNCTHREADEXIT</b></dt>
     * <dt>1001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used by Function Discovery clients.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FD_EVENTID_SEARCHSTART"></a><a id="fd_eventid_searchstart"></a><dl>
     * <dt><b>FD_EVENTID_SEARCHSTART</b></dt>
     * <dt>1002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not used by Function Discovery clients.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="FD_EVENTID_IPADDRESSCHANGE"></a><a id="fd_eventid_ipaddresschange"></a><dl>
     * <dt><b>FD_EVENTID_IPADDRESSCHANGE</b></dt>
     * <dt>1003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The IP address of the NIC changed. The WSD provider implements this notification. Events may be sent when a power event occurs (for example, when machine wakes from sleep) or when roaming with a laptop.
     * 
     * <div class="alert"><b>Note</b>  This value is not available for use on Windows Vista. It is available on Windows Vista with SP1, Windows Server 2008, and subsequent versions of the operating system.</div>
     * <div> </div>
     * </td>
     * </tr>
     * </table>
     * @param {Integer} fdqcQueryContext The context registered for change notification. The type <b>FDQUERYCONTEXT</b> is defined as a <b>DWORDLONG</b>. This parameter can be <b>NULL</b>.
     * @param {PWSTR} pszProvider The name of the provider.
     * @returns {HRESULT} The client program's implementation of the <b>OnEvent</b> method should return one of the following <b>HRESULT</b> values to the caller.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_OK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method completed successfully.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_INVALIDARG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The value of one of the input parameters is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onevent
     */
    OnEvent(dwEventID, fdqcQueryContext, pszProvider) {
        pszProvider := pszProvider is String ? StrPtr(pszProvider) : pszProvider

        result := ComCall(5, this, "uint", dwEventID, "uint", fdqcQueryContext, "ptr", pszProvider, "HRESULT")
        return result
    }
}
