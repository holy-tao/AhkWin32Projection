#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFunctionInstanceCollection.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This is the main interface implemented by a discovery provider. It is the primary interface the Function Discovery infrastructure uses to communicate with the provider and its resources.
 * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryprovider
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionDiscoveryProvider extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionDiscoveryProvider
     * @type {Guid}
     */
    static IID => Guid("{dcde394f-1478-4813-a402-f6fb10657222}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "Query", "EndQuery", "InstancePropertyStoreValidateAccess", "InstancePropertyStoreOpen", "InstancePropertyStoreFlush", "InstanceQueryService", "InstanceReleased"]

    /**
     * Initializes the Function Discovery provider object.
     * @remarks
     * If your provider is going to create Function Discovery objects, queue notifications, or enumerate resources with localized strings, you must call <b>AddRef</b> on and cache  the initialized <i>pIFunctionDiscoveryProviderFactory</i>, <i>pIFunctionDiscoveryNotification</i>, and <i>lcidUserDefault</i> parameters for later use when you implement the <b>Initialize</b> method.
     * @param {IFunctionDiscoveryProviderFactory} pIFunctionDiscoveryProviderFactory A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryproviderfactory">IFunctionDiscoveryProviderFactory</a> interface. The provider should use this interface to create new Function Discovery objects.
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface. The provider should use this interface to send <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate">OnUpdate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onevent">OnEvent</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onerror">OnError</a> notifications to the Function Discovery notification queue. Queued notifications are sent to client programs by Function Discovery.
     * @param {Integer} lcidUserDefault The locale identifier of the caller. The provider should use <i>lcidUserDefault</i> to return localized strings for the resource enumerated by the provider.
     * @returns {Integer} Specifies the least restrictive possible access mode of the  property stores associated with the function instances created by this provider.  
     * 
     * If the DWORD value is set to -1, <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystorevalidateaccess">InstancePropertyStoreValidateAccess</a> will be called every time <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-openpropertystore">OpenPropertyStore</a> is called on a function instance created by this provider.  Otherwise, the value specified by this parameter determines the least restrictive possible access mode for all property stores associated with all function instances created by this provider. A more restrictive access mode will be applied to an individual property store if a client calls <b>OpenPropertyStore</b> with the <i>dwStgAccess</i> parameter set to a value that is more restrictive than the specified  <i>pdwStgAccessCapabilities</i> value.
     * 
     * For efficiency, specify a <i>pdwStgAccessCapabilities</i>  value whenever possible.
     * 
     * The following modes are supported: 
     * 
     * <a id="STGM_READ"></a>
     * <a id="stgm_read"></a>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-initialize
     */
    Initialize(pIFunctionDiscoveryProviderFactory, pIFunctionDiscoveryNotification, lcidUserDefault) {
        result := ComCall(3, this, "ptr", pIFunctionDiscoveryProviderFactory, "ptr", pIFunctionDiscoveryNotification, "uint", lcidUserDefault, "uint*", &pdwStgAccessCapabilities := 0, "HRESULT")
        return pdwStgAccessCapabilities
    }

    /**
     * Retrieves a collection of function instances that meet the specified constraints.
     * @remarks
     * An active query is terminated by Function Discovery with a call to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-endquery">EndQuery</a> method.  Note that <b>EndQuery</b> will only be called if the client specified a <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface for the query.  If a <b>IFunctionDiscoveryNotification</b> was not provided, the query must be considered ended by the provider once the <b>Query</b> call is complete.
     * 
     * A client can re-execute a query at any time after the previous <b>Query</b> call has returned. The implementation of <b>Query</b> must be able to return an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollection">IFunctionInstanceCollection</a> for the new query. <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-endquery">EndQuery</a> will only be called before a subsequent <b>Query</b> call when a client passed an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface passed to the provider's <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-initialize">Initialize</a> method.
     * 
     * If <b>Query</b> returns <b>E_PENDING</b>, the provider must call the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onevent">OnEvent</a> method of the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface with <b>FD_EVENTID_SEARCHCOMPLETE</b> to indicate that the enumeration of results is complete.  Failure to send the <b>FD_EVENTID_SEARCHCOMPLETE</b> event can result in clients hanging indefinitely
     * @param {IFunctionDiscoveryProviderQuery} pIFunctionDiscoveryProviderQuery A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryproviderquery">IFunctionDiscoveryProviderQuery</a>  interface that contains parameters that define the query criteria.
     * @returns {IFunctionInstanceCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollection">IFunctionInstanceCollection</a> interface that the provider should use to return function instances synchronously in response to the given query.
     * 
     * When you implement the <b>Query</b> method, you can set this parameter to <b>NULL</b> if your provider supports notifications, that is, your provider returns results asynchronously. Asynchronous results should be returned using the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface passed to the provider's <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-initialize">Initialize</a> method.
     * 
     * If the client application has not implemented notifications, it may pass a <b>NULL</b> parameter.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-query
     */
    Query(pIFunctionDiscoveryProviderQuery) {
        result := ComCall(4, this, "ptr", pIFunctionDiscoveryProviderQuery, "ptr*", &ppIFunctionInstanceCollection := 0, "HRESULT")
        return IFunctionInstanceCollection(ppIFunctionInstanceCollection)
    }

    /**
     * Terminates a query being executed by a provider.
     * @remarks
     * This method is called by Function Discovery to indicate to a provider that no further query notifications will be sent to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> callback interface. Implementers should try to ensure that no further query notifications are sent to Function Discovery after the call to <b>EndQuery</b> returns. If a provider implementation sends a notification after <b>EndQuery</b>  returns, Function Discovery returns an error to the provider and the notification is not forwarded to the client. 
     * 
     * <b>EndQuery</b> is only called when a client passed an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface passed to the provider's <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-initialize">Initialize</a> method.
     * 
     * Any data structures associated with the query can be deleted in the implementation of <b>EndQuery</b>. Any private context memory allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-query">Query</a> method should also be deleted.
     * 
     * Note that <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-query">Query</a> can be invoked again once <b>EndQuery</b> has returned.
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
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
     * One of the parameters contains an invalid argument.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-endquery
     */
    EndQuery() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Verifies that the provider supports the requested access.
     * @remarks
     * The precise meaning of the STG_E_ACCESSDENIED return value is implementation-specific. When you implement the <b>InstancePropertyStoreValidateAccess</b> method, you can return STG_E_ACCESSDENIED for any supplied <i>dwStgAccess</i> mode value on any supplied function instance.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Integer} dwStgAccess The access mode to be verified.  For this method, the following modes are supported: 
     * 
     * <a id="STGM_READ"></a>
     * <a id="stgm_read"></a>
     * @returns {HRESULT} Possible return values include, but are not limited to, the following.
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not implement an instance property store.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>STG_E_ACCESSDENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method could not open a writable property store because the caller has insufficient access, the discovery provider does not allow write access to its property store, or another property store is already open for this function instance.
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
     * The value of <i>dwStgAccess</i> is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystorevalidateaccess
     */
    InstancePropertyStoreValidateAccess(pIFunctionInstance, iProviderInstanceContext, dwStgAccess) {
        result := ComCall(6, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwStgAccess, "HRESULT")
        return result
    }

    /**
     * Opens the property store of the provider.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface for the store that is to be opened. Each property store is associated with a function instance.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Integer} dwStgAccess The access mode to be assigned to the open stream.  For this method, the following modes are supported:
     * 
     * <a id="STGM_READ"></a>
     * <a id="stgm_read"></a>
     * @returns {IPropertyStore} A pointer to an <b>IPropertyStore</b> interface pointer.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystoreopen
     */
    InstancePropertyStoreOpen(pIFunctionInstance, iProviderInstanceContext, dwStgAccess) {
        result := ComCall(7, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwStgAccess, "ptr*", &ppIPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppIPropertyStore)
    }

    /**
     * Provides a mechanism for the provider to persist properties.
     * @remarks
     * If the provider keeps the new values that are passed through <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-iproviderproperties-setvalue">SetValue</a> cached in memory, this method should implement the code to persist the updated values to the underlying API/store.
     * 
     * If you implement this method, you should call <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-openpropertystore">OpenPropertyStore</a> to return the current property store before persisting the data.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * <dt><b>E_NOTIMPL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The provider does not implement an instance property store.
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
     * One of the parameters contains an invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystoreflush
     */
    InstancePropertyStoreFlush(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(8, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "HRESULT")
        return result
    }

    /**
     * Creates a provider-specific COM object for the function instance.
     * @remarks
     * <b>InstanceQueryService</b> creates or accesses the implementation the service identified with <i>guidService</i>, returning the address of the interface specified by <i>riid</i> in the <i>ppv</i> argument.  Providers can implement the service and this method provides a mechanism for the provider to supply this implementation rather then requiring the creation of a new object to implement the service.
     * 
     * The provider should return <b>E_NOINTERFACE</b> if the <i>guidService</i> does not belong to this provider, or the <i>riid</i> interface  is not supported.  The provider should return <b>E_NOTIMPL</b> if it simply does not implement this method or does not implement the requested SID.
     * 
     * Any provider that supports embedded services or devices must implement the SID_PNPXServiceCollection service.  If the SID_PNPXServiceCollection service is supported, the client can call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa364381(v=vs.85)">IFunctionInstance::QueryService</a> to access the information and metadata associated with the embedded services or devices. For example, the PnP-X providers (that is, the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/ssdp-provider">SSDP provider</a> and the WSD provider) implement support for the SID_PNPXServiceCollection service. Not all providers implement SID_PNPXServiceCollection service support.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Pointer<Guid>} guidService The unique identifier of the service (a SID). This is the service ID defined by the provider writer. For an example, see FunctionDiscoveryServiceIDs.h.
     * @param {Pointer<Guid>} riid The unique identifier of the interface the caller wishes to receive for the service.
     * @returns {IUnknown} A pointer that receives the interface pointer of the service.  The caller is responsible for calling <b>Release</b> through this interface pointer when the service is no longer needed.
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancequeryservice
     */
    InstanceQueryService(pIFunctionInstance, iProviderInstanceContext, guidService, riid) {
        result := ComCall(9, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "ptr", guidService, "ptr", riid, "ptr*", &ppIUnknown := 0, "HRESULT")
        return IUnknown(ppIUnknown)
    }

    /**
     * Releases the specified function instance and frees the memory previously allocated.
     * @remarks
     * When you implement this method, you must clean up the memory allocated for <i>ppvProviderInstanceContext</i> as necessary.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @returns {HRESULT} This method can return one of these values.
     * 
     * 
     * Possible return values include, but are not limited to, the following.
     * 
     * 
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
     * One of the parameters contains an invalid argument.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_OUTOFMEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The method is unable to allocate the memory required to perform this operation.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancereleased
     */
    InstanceReleased(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(10, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "HRESULT")
        return result
    }
}
