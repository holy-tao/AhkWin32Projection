#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides factory methods to create Function Discovery objects.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryproviderfactory
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionDiscoveryProviderFactory extends IUnknown{
    /**
     * The interface identifier for IFunctionDiscoveryProviderFactory
     * @type {Guid}
     */
    static IID => Guid("{86443ff0-1ad5-4e68-a45a-40c2c329de3b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * Creates an empty property store object.
     * @param {Pointer<IPropertyStore>} ppIPropertyStore 
     * @returns {HRESULT} If this function succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-createpropertystore
     */
    CreatePropertyStore(ppIPropertyStore) {
        result := ComCall(3, this, "ptr", ppIPropertyStore, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pszSubCategory 
     * @param {PWSTR} pszProviderInstanceIdentity 
     * @param {Pointer} iProviderInstanceContext 
     * @param {Pointer<IPropertyStore>} pIPropertyStore 
     * @param {Pointer<IFunctionDiscoveryProvider>} pIFunctionDiscoveryProvider 
     * @param {Pointer<IFunctionInstance>} ppIFunctionInstance 
     * @returns {HRESULT} 
     */
    CreateInstance(pszSubCategory, pszProviderInstanceIdentity, iProviderInstanceContext, pIPropertyStore, pIFunctionDiscoveryProvider, ppIFunctionInstance) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszProviderInstanceIdentity := pszProviderInstanceIdentity is String ? StrPtr(pszProviderInstanceIdentity) : pszProviderInstanceIdentity

        result := ComCall(4, this, "ptr", pszSubCategory, "ptr", pszProviderInstanceIdentity, "ptr", iProviderInstanceContext, "ptr", pIPropertyStore, "ptr", pIFunctionDiscoveryProvider, "ptr", ppIFunctionInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IFunctionInstanceCollection>} ppIFunctionInstanceCollection 
     * @returns {HRESULT} 
     */
    CreateFunctionInstanceCollection(ppIFunctionInstanceCollection) {
        result := ComCall(5, this, "ptr", ppIFunctionInstanceCollection, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
