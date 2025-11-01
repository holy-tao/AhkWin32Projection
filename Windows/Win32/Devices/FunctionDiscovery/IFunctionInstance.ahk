#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IServiceProvider.ahk

/**
 * A function instance is created as the result of calling one of the IFunctionDiscovery methods; client program do not create these objects themselves.
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryapi/nn-functiondiscoveryapi-ifunctioninstance
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IFunctionInstance extends IServiceProvider{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IFunctionInstance
     * @type {Guid}
     */
    static IID => Guid("{33591c10-0bed-4f02-b0ab-1530d5533ee9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 4

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetID", "GetProviderInstanceID", "OpenPropertyStore", "GetCategory"]

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppszCoMemIdentity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getid
     */
    GetID(ppszCoMemIdentity) {
        result := ComCall(4, this, "ptr*", ppszCoMemIdentity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppszCoMemProviderInstanceIdentity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getproviderinstanceid
     */
    GetProviderInstanceID(ppszCoMemProviderInstanceIdentity) {
        result := ComCall(5, this, "ptr*", ppszCoMemProviderInstanceIdentity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwStgAccess 
     * @param {Pointer<IPropertyStore>} ppIPropertyStore 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-openpropertystore
     */
    OpenPropertyStore(dwStgAccess, ppIPropertyStore) {
        result := ComCall(6, this, "uint", dwStgAccess, "ptr*", ppIPropertyStore, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} ppszCoMemCategory 
     * @param {Pointer<Pointer<Integer>>} ppszCoMemSubCategory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctioninstance-getcategory
     */
    GetCategory(ppszCoMemCategory, ppszCoMemSubCategory) {
        result := ComCall(7, this, "ptr*", ppszCoMemCategory, "ptr*", ppszCoMemSubCategory, "HRESULT")
        return result
    }
}
