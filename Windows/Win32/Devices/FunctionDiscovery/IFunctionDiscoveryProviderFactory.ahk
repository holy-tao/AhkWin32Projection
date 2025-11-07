#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\UI\Shell\PropertiesSystem\IPropertyStore.ahk
#Include .\IFunctionInstance.ahk
#Include .\IFunctionInstanceCollection.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides factory methods to create Function Discovery objects.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryproviderfactory
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionDiscoveryProviderFactory extends IUnknown{

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreatePropertyStore", "CreateInstance", "CreateFunctionInstanceCollection"]

    /**
     * Creates an empty property store object.
     * @returns {IPropertyStore} 
     * @see https://docs.microsoft.com/windows/win32/api//mfidl/nf-mfidl-createpropertystore
     */
    CreatePropertyStore() {
        result := ComCall(3, this, "ptr*", &ppIPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppIPropertyStore)
    }

    /**
     * 
     * @param {PWSTR} pszSubCategory 
     * @param {PWSTR} pszProviderInstanceIdentity 
     * @param {Pointer} iProviderInstanceContext 
     * @param {IPropertyStore} pIPropertyStore 
     * @param {IFunctionDiscoveryProvider} pIFunctionDiscoveryProvider 
     * @returns {IFunctionInstance} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderfactory-createinstance
     */
    CreateInstance(pszSubCategory, pszProviderInstanceIdentity, iProviderInstanceContext, pIPropertyStore, pIFunctionDiscoveryProvider) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszProviderInstanceIdentity := pszProviderInstanceIdentity is String ? StrPtr(pszProviderInstanceIdentity) : pszProviderInstanceIdentity

        result := ComCall(4, this, "ptr", pszSubCategory, "ptr", pszProviderInstanceIdentity, "ptr", iProviderInstanceContext, "ptr", pIPropertyStore, "ptr", pIFunctionDiscoveryProvider, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * 
     * @returns {IFunctionInstanceCollection} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderfactory-createfunctioninstancecollection
     */
    CreateFunctionInstanceCollection() {
        result := ComCall(5, this, "ptr*", &ppIFunctionInstanceCollection := 0, "HRESULT")
        return IFunctionInstanceCollection(ppIFunctionInstanceCollection)
    }
}
