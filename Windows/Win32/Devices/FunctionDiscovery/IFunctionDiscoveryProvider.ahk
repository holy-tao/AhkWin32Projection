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
     * Initializes a thread to use Windows Runtime APIs.
     * @param {IFunctionDiscoveryProviderFactory} pIFunctionDiscoveryProviderFactory 
     * @param {IFunctionDiscoveryNotification} pIFunctionDiscoveryNotification 
     * @param {Integer} lcidUserDefault 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(pIFunctionDiscoveryProviderFactory, pIFunctionDiscoveryNotification, lcidUserDefault) {
        result := ComCall(3, this, "ptr", pIFunctionDiscoveryProviderFactory, "ptr", pIFunctionDiscoveryNotification, "uint", lcidUserDefault, "uint*", &pdwStgAccessCapabilities := 0, "HRESULT")
        return pdwStgAccessCapabilities
    }

    /**
     * 
     * @param {IFunctionDiscoveryProviderQuery} pIFunctionDiscoveryProviderQuery 
     * @returns {IFunctionInstanceCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-query
     */
    Query(pIFunctionDiscoveryProviderQuery) {
        result := ComCall(4, this, "ptr", pIFunctionDiscoveryProviderQuery, "ptr*", &ppIFunctionInstanceCollection := 0, "HRESULT")
        return IFunctionInstanceCollection(ppIFunctionInstanceCollection)
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
     * @returns {IPropertyStore} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancepropertystoreopen
     */
    InstancePropertyStoreOpen(pIFunctionInstance, iProviderInstanceContext, dwStgAccess) {
        result := ComCall(7, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "uint", dwStgAccess, "ptr*", &ppIPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppIPropertyStore)
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
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryprovider-instancequeryservice
     */
    InstanceQueryService(pIFunctionInstance, iProviderInstanceContext, guidService, riid) {
        result := ComCall(9, this, "ptr", pIFunctionInstance, "ptr", iProviderInstanceContext, "ptr", guidService, "ptr", riid, "ptr*", &ppIUnknown := 0, "HRESULT")
        return IUnknown(ppIUnknown)
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
