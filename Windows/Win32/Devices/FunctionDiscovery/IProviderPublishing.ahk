#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Is implemented by a discovery provider to enable a client program to add and remove function instances.
 * @remarks
 * 
  * Clients access the function instance through <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-addinstance">IFunctionDiscovery::AddInstance</a> and <a href="https://docs.microsoft.com/windows/desktop/api/functiondiscoveryapi/nf-functiondiscoveryapi-ifunctiondiscovery-removeinstance">IFunctionDiscovery::RemoveInstance</a>.
  * 
  * The <b>IProviderPublishing</b> interface can only be implemented by discovery providers that support category change notification. At this time only PnP providers support change notification.
  * 
 * @see https://docs.microsoft.com/windows/win32/api//functiondiscoveryprovider/nn-functiondiscoveryprovider-iproviderpublishing
 * @namespace Windows.Win32.Devices.FunctionDiscovery
 * @version v4.0.30319
 */
class IProviderPublishing extends IUnknown{
    /**
     * The interface identifier for IProviderPublishing
     * @type {Guid}
     */
    static IID => Guid("{cd1b9a04-206c-4a05-a0c8-1635a21a2b7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} enumVisibilityFlags 
     * @param {PWSTR} pszSubCategory 
     * @param {PWSTR} pszProviderInstanceIdentity 
     * @param {Pointer<IFunctionInstance>} ppIFunctionInstance 
     * @returns {HRESULT} 
     */
    CreateInstance(enumVisibilityFlags, pszSubCategory, pszProviderInstanceIdentity, ppIFunctionInstance) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszProviderInstanceIdentity := pszProviderInstanceIdentity is String ? StrPtr(pszProviderInstanceIdentity) : pszProviderInstanceIdentity

        result := ComCall(3, this, "int", enumVisibilityFlags, "ptr", pszSubCategory, "ptr", pszProviderInstanceIdentity, "ptr", ppIFunctionInstance, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} enumVisibilityFlags 
     * @param {PWSTR} pszSubCategory 
     * @param {PWSTR} pszProviderInstanceIdentity 
     * @returns {HRESULT} 
     */
    RemoveInstance(enumVisibilityFlags, pszSubCategory, pszProviderInstanceIdentity) {
        pszSubCategory := pszSubCategory is String ? StrPtr(pszSubCategory) : pszSubCategory
        pszProviderInstanceIdentity := pszProviderInstanceIdentity is String ? StrPtr(pszProviderInstanceIdentity) : pszProviderInstanceIdentity

        result := ComCall(4, this, "int", enumVisibilityFlags, "ptr", pszSubCategory, "ptr", pszProviderInstanceIdentity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
