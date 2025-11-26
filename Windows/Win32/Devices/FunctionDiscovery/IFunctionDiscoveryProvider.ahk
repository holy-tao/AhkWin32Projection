#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IFunctionInstanceCollection.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * This is the main interface implemented by a discovery provider. It is the primary interface the Function Discovery infrastructure uses to communicate with the provider and its resources.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryprovider
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
     * @param {IFunctionDiscoveryProviderFactory} pIFunctionDiscoveryProviderFactory A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryproviderfactory">IFunctionDiscoveryProviderFactory</a> interface. The provider should use this interface to create new Function Discovery objects.
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface. The provider should use this interface to send <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onupdate">OnUpdate</a>, <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onevent">OnEvent</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscoverynotification-onerror">OnError</a> notifications to the Function Discovery notification queue. Queued notifications are sent to client programs by Function Discovery.
     * @param {Integer} lcidUserDefault The locale identifier of the caller. The provider should use <i>lcidUserDefault</i> to return localized strings for the resource enumerated by the provider.
     * @returns {Integer} Specifies the least restrictive possible access mode of the  property stores associated with the function instances created by this provider.  
     * 
     * If the DWORD value is set to -1, <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystorevalidateaccess">InstancePropertyStoreValidateAccess</a> will be called every time <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-openpropertystore">OpenPropertyStore</a> is called on a function instance created by this provider.  Otherwise, the value specified by this parameter determines the least restrictive possible access mode for all property stores associated with all function insteances created by this provider. A more restrictive access mode will be applied to an individual property store if a client calls <b>OpenPropertyStore</b> with the <i>dwStgAccess</i> parameter set to a value that is more restrictive than the specified  <i>pdwStgAccessCapabilities</i> value.
     * 
     * For efficiency, specify a <i>pdwStgAccessCapabilities</i>  value whenever possible.
     * 
     * The following modes are supported: 
     * 
     * <a id="STGM_READ"></a>
     * <a id="stgm_read"></a>
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-initialize
     */
    Initialize(pIFunctionDiscoveryProviderFactory, pIFunctionDiscoveryNotification, lcidUserDefault) {
        result := ComCall(3, this, "ptr", pIFunctionDiscoveryProviderFactory, "ptr", pIFunctionDiscoveryNotification, "uint", lcidUserDefault, "uint*", &pdwStgAccessCapabilities := 0, "HRESULT")
        return pdwStgAccessCapabilities
    }

    /**
     * Retrieves a collection of function instances that meet the specified constraints.
     * @param {IFunctionDiscoveryProviderQuery} pIFunctionDiscoveryProviderQuery A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryproviderquery">IFunctionDiscoveryProviderQuery</a>  interface that contains parameters that define the query criteria.
     * @returns {IFunctionInstanceCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollection">IFunctionInstanceCollection</a> interface that the provider should use to return function instances synchronously in response to the given query.
     * 
     * When you implement the <b>Query</b> method, you can set this parameter to <b>NULL</b> if your provider supports notifications, that is, your provider returns results asynchronously. Asynchronous results should be returned using the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctiondiscoverynotification">IFunctionDiscoveryNotification</a> interface passed to the provider's <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-initialize">Initialize</a> method.
     * 
     * If the client application has not implemented notifications, it may pass a <b>NULL</b> parameter.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-query
     */
    Query(pIFunctionDiscoveryProviderQuery) {
        result := ComCall(4, this, "ptr", pIFunctionDiscoveryProviderQuery, "ptr*", &ppIFunctionInstanceCollection := 0, "HRESULT")
        return IFunctionInstanceCollection(ppIFunctionInstanceCollection)
    }

    /**
     * Terminates a query being executed by a provider.
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
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-endquery
     */
    EndQuery() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Verifies that the provider supports the requested access.
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
     * The method could not open a writeable property store because the caller has insufficient access, the discovery provider does not allow write access to its property store, or another property store is already open for this function instance.
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
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystorevalidateaccess
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
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystoreopen
     */
    InstancePropertyStoreOpen(pIFunctionInstance, iProviderInstanceContext, dwStgAccess) {
        result := ComCall(7, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwStgAccess, "ptr*", &ppIPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppIPropertyStore)
    }

    /**
     * Provides a mechanism for the provider to persist properties.
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
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystoreflush
     */
    InstancePropertyStoreFlush(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(8, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "HRESULT")
        return result
    }

    /**
     * Creates a provider-specific COM object for the function instance.
     * @param {IFunctionInstance} pIFunctionInstance A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {Pointer<Guid>} guidService The unique identifier of the service (a SID). This is the service ID defined by the provider writer. For an example, see FunctionDiscoveryServiceIDs.h.
     * @param {Pointer<Guid>} riid The unique identifier of the interface the caller wishes to receive for the service.
     * @returns {IUnknown} A pointer that receives the interface pointer of the service.  The caller is responsible for calling <b>Release</b> through this interface pointer when the service is no longer needed.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancequeryservice
     */
    InstanceQueryService(pIFunctionInstance, iProviderInstanceContext, guidService, riid) {
        result := ComCall(9, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "ptr", guidService, "ptr", riid, "ptr*", &ppIUnknown := 0, "HRESULT")
        return IUnknown(ppIUnknown)
    }

    /**
     * Releases the specified function instance and frees the memory previously allocated.
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
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancereleased
     */
    InstanceReleased(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(10, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "HRESULT")
        return result
    }
}
