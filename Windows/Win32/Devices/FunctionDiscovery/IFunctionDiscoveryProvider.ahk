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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Pointer<IFunctionDiscoveryProviderFactory>} pIFunctionDiscoveryProviderFactory 
     * @param {Pointer<IFunctionDiscoveryNotification>} pIFunctionDiscoveryNotification 
     * @param {Integer} lcidUserDefault 
     * @param {Pointer<UInt32>} pdwStgAccessCapabilities 
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
        result := ComCall(3, this, "ptr", pIFunctionDiscoveryProviderFactory, "ptr", pIFunctionDiscoveryNotification, "uint", lcidUserDefault, "uint*", pdwStgAccessCapabilities, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionDiscoveryProviderQuery>} pIFunctionDiscoveryProviderQuery 
     * @param {Pointer<IFunctionInstanceCollection>} ppIFunctionInstanceCollection 
     * @returns {HRESULT} 
     */
    Query(pIFunctionDiscoveryProviderQuery, ppIFunctionInstanceCollection) {
        result := ComCall(4, this, "ptr", pIFunctionDiscoveryProviderQuery, "ptr", ppIFunctionInstanceCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    EndQuery() {
        result := ComCall(5, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionInstance>} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Integer} dwStgAccess 
     * @returns {HRESULT} 
     */
    InstancePropertyStoreValidateAccess(pIFunctionInstance, iProviderInstanceContext, dwStgAccess) {
        result := ComCall(6, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwStgAccess, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionInstance>} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Integer} dwStgAccess 
     * @param {Pointer<IPropertyStore>} ppIPropertyStore 
     * @returns {HRESULT} 
     */
    InstancePropertyStoreOpen(pIFunctionInstance, iProviderInstanceContext, dwStgAccess, ppIPropertyStore) {
        result := ComCall(7, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwStgAccess, "ptr", ppIPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionInstance>} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @returns {HRESULT} 
     */
    InstancePropertyStoreFlush(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(8, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionInstance>} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Pointer<Guid>} guidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppIUnknown 
     * @returns {HRESULT} 
     */
    InstanceQueryService(pIFunctionInstance, iProviderInstanceContext, guidService, riid, ppIUnknown) {
        result := ComCall(9, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "ptr", guidService, "ptr", riid, "ptr", ppIUnknown, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionInstance>} pIFunctionInstance 
     * @param {Pointer} iProviderInstanceContext 
     * @returns {HRESULT} 
     */
    InstanceReleased(pIFunctionInstance, iProviderInstanceContext) {
        result := ComCall(10, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
