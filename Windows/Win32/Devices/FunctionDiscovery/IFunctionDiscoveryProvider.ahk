#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IFunctionDiscoveryProviderFactory} pIFunctionDiscoveryProviderFactory 
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification 
     * @param {Integer} lcidUserDefault 
     * @param {Pointer<Integer>} pdwStgAccessCapabilities 
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pIFunctionDiscoveryProviderFactory, pIFunctionDiscoveryNotification, lcidUserDefault, pdwStgAccessCapabilities) {
        pdwStgAccessCapabilitiesMarshal := pdwStgAccessCapabilities is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, "ptr", pIFunctionDiscoveryProviderFactory, "ptr", pIFunctionDiscoveryNotification, "uint", lcidUserDefault, pdwStgAccessCapabilitiesMarshal, pdwStgAccessCapabilities, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFunctionDiscoveryProviderQuery} pIFunctionDiscoveryProviderQuery 
     * @param {Pointer<IFunctionInstanceCollection>} ppIFunctionInstanceCollection 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-query
     */
    Query(pIFunctionDiscoveryProviderQuery, ppIFunctionInstanceCollection) {
        result := ComCall(4, this, "ptr", pIFunctionDiscoveryProviderQuery, "ptr*", ppIFunctionInstanceCollection, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-endquery
     */
    EndQuery() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFunctionInstance} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Integer} dwStgAccess 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystorevalidateaccess
     */
    InstancePropertyStoreValidateAccess(pIFunctionInstance, iProviderInstanceContext, dwStgAccess) {
        result := ComCall(6, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwStgAccess, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFunctionInstance} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Integer} dwStgAccess 
     * @param {Pointer<IPropertyStore>} ppIPropertyStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystoreopen
     */
    InstancePropertyStoreOpen(pIFunctionInstance, iProviderInstanceContext, dwStgAccess, ppIPropertyStore) {
        result := ComCall(7, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwStgAccess, "ptr*", ppIPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFunctionInstance} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystoreflush
     */
    InstancePropertyStoreFlush(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(8, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFunctionInstance} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppIUnknown 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancequeryservice
     */
    InstanceQueryService(pIFunctionInstance, iProviderInstanceContext, guidService, riid, ppIUnknown) {
        result := ComCall(9, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "ptr", guidService, "ptr", riid, "ptr*", ppIUnknown, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IFunctionInstance} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancereleased
     */
    InstanceReleased(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(10, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "HRESULT")
        return result
    }
}
