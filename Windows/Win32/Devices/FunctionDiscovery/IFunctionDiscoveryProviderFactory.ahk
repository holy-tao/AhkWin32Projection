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
     * Enables providers to reuse the in-memory property store implementation.
     * @returns {IPropertyStore} A pointer to an <b>IPropertyStore</b> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderfactory-createpropertystore
     */
    CreatePropertyStore() {
        result := ComCall(3, this, "ptr*", &ppIPropertyStore := 0, "HRESULT")
        return IPropertyStore(ppIPropertyStore)
    }

    /**
     * Creates a function instance.
     * @param {PWSTR} pszSubCategory The subcategory string for the function instance. See <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fundisc/subcategory-definitions">Subcategory Definitions</a>.
     * @param {PWSTR} pszProviderInstanceIdentity The provider instance identifier.  
     * 
     * Function Discovery uses this identifier to ensure that function instance identifiers returned by <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getid">IFunctionInstance::GetID</a> are unique.  To that end, Function Discovery attaches a prefix to the identifier passed to <i>pszProviderInstanceIdentity</i> to ensure that a given function instance identifier is unique across all providers. Implementers only need to ensure that <i>pszProviderInstanceIdentity</i> uniquely identifies the device, resource, or instance within the scope of the provider.
     * 
     * This string  is returned to client applications that call  <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getproviderinstanceid">IFunctionInstance::GetProviderInstanceID</a>.
     * 
     * There is no upper limit on the size of this string.
     * @param {Pointer} iProviderInstanceContext The context associated with the specific function instance.
     * @param {IPropertyStore} pIPropertyStore A pointer to an <b>IPropertyStore</b> interface.
     * @param {IFunctionDiscoveryProvider} pIFunctionDiscoveryProvider A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryprovider/nn-functiondiscoveryprovider-ifunctiondiscoveryprovider">IFunctionDiscoveryProvider</a> provider instance creating this function instance.
     * @returns {IFunctionInstance} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance">IFunctionInstance</a> interface.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderfactory-createinstance
     */
    CreateInstance(pszSubCategory, pszProviderInstanceIdentity, iProviderInstanceContext, pIPropertyStore, pIFunctionDiscoveryProvider) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszProviderInstanceIdentity := pszProviderInstanceIdentity is String ? StrPtr(pszProviderInstanceIdentity) : pszProviderInstanceIdentity

        result := ComCall(4, this, "ptr", pszSubCategory, "ptr", pszProviderInstanceIdentity, "ptr", iProviderInstanceContext, "ptr", pIPropertyStore, "ptr", pIFunctionDiscoveryProvider, "ptr*", &ppIFunctionInstance := 0, "HRESULT")
        return IFunctionInstance(ppIFunctionInstance)
    }

    /**
     * Creates a function instance collection.
     * @returns {IFunctionInstanceCollection} A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstancecollection">IFunctionInstanceCollection</a> interface pointer.
     * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nf-functiondiscoveryprovider-ifunctiondiscoveryproviderfactory-createfunctioninstancecollection
     */
    CreateFunctionInstanceCollection() {
        result := ComCall(5, this, "ptr*", &ppIFunctionInstanceCollection := 0, "HRESULT")
        return IFunctionInstanceCollection(ppIFunctionInstanceCollection)
    }
}
