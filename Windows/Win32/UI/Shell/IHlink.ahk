#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHlink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHlink
     * @type {Guid}
     */
    static IID => Guid("{79eac9c3-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetHlinkSite", "GetHlinkSite", "SetMonikerReference", "GetMonikerReference", "SetStringReference", "GetStringReference", "SetFriendlyName", "GetFriendlyName", "SetTargetFrameName", "GetTargetFrameName", "GetMiscStatus", "Navigate", "SetAdditionalParams", "GetAdditionalParams"]

    /**
     * 
     * @param {IHlinkSite} pihlSite 
     * @param {Integer} dwSiteData 
     * @returns {HRESULT} 
     */
    SetHlinkSite(pihlSite, dwSiteData) {
        result := ComCall(3, this, "ptr", pihlSite, "uint", dwSiteData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IHlinkSite>} ppihlSite 
     * @param {Pointer<Integer>} pdwSiteData 
     * @returns {HRESULT} 
     */
    GetHlinkSite(ppihlSite, pdwSiteData) {
        pdwSiteDataMarshal := pdwSiteData is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "ptr*", ppihlSite, pdwSiteDataMarshal, pdwSiteData, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLSETF 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @returns {HRESULT} 
     */
    SetMonikerReference(grfHLSETF, pimkTarget, pwzLocation) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(5, this, "uint", grfHLSETF, "ptr", pimkTarget, "ptr", pwzLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWhichRef 
     * @param {Pointer<IMoniker>} ppimkTarget 
     * @param {Pointer<PWSTR>} ppwzLocation 
     * @returns {HRESULT} 
     */
    GetMonikerReference(dwWhichRef, ppimkTarget, ppwzLocation) {
        result := ComCall(6, this, "uint", dwWhichRef, "ptr*", ppimkTarget, "ptr", ppwzLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLSETF 
     * @param {PWSTR} pwzTarget 
     * @param {PWSTR} pwzLocation 
     * @returns {HRESULT} 
     */
    SetStringReference(grfHLSETF, pwzTarget, pwzLocation) {
        pwzTarget := pwzTarget is String ? StrPtr(pwzTarget) : pwzTarget
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(7, this, "uint", grfHLSETF, "ptr", pwzTarget, "ptr", pwzLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwWhichRef 
     * @param {Pointer<PWSTR>} ppwzTarget 
     * @param {Pointer<PWSTR>} ppwzLocation 
     * @returns {HRESULT} 
     */
    GetStringReference(dwWhichRef, ppwzTarget, ppwzLocation) {
        result := ComCall(8, this, "uint", dwWhichRef, "ptr", ppwzTarget, "ptr", ppwzLocation, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {HRESULT} 
     */
    SetFriendlyName(pwzFriendlyName) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(9, this, "ptr", pwzFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLFNAMEF 
     * @param {Pointer<PWSTR>} ppwzFriendlyName 
     * @returns {HRESULT} 
     */
    GetFriendlyName(grfHLFNAMEF, ppwzFriendlyName) {
        result := ComCall(10, this, "uint", grfHLFNAMEF, "ptr", ppwzFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzTargetFrameName 
     * @returns {HRESULT} 
     */
    SetTargetFrameName(pwzTargetFrameName) {
        pwzTargetFrameName := pwzTargetFrameName is String ? StrPtr(pwzTargetFrameName) : pwzTargetFrameName

        result := ComCall(11, this, "ptr", pwzTargetFrameName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwzTargetFrameName 
     * @returns {HRESULT} 
     */
    GetTargetFrameName(ppwzTargetFrameName) {
        result := ComCall(12, this, "ptr", ppwzTargetFrameName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetMiscStatus(pdwStatus) {
        pdwStatusMarshal := pdwStatus is VarRef ? "uint*" : "ptr"

        result := ComCall(13, this, pdwStatusMarshal, pdwStatus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {IBindCtx} pibc 
     * @param {IBindStatusCallback} pibsc 
     * @param {IHlinkBrowseContext} pihlbc 
     * @returns {HRESULT} 
     */
    Navigate(grfHLNF, pibc, pibsc, pihlbc) {
        result := ComCall(14, this, "uint", grfHLNF, "ptr", pibc, "ptr", pibsc, "ptr", pihlbc, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAdditionalParams 
     * @returns {HRESULT} 
     */
    SetAdditionalParams(pwzAdditionalParams) {
        pwzAdditionalParams := pwzAdditionalParams is String ? StrPtr(pwzAdditionalParams) : pwzAdditionalParams

        result := ComCall(15, this, "ptr", pwzAdditionalParams, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwzAdditionalParams 
     * @returns {HRESULT} 
     */
    GetAdditionalParams(ppwzAdditionalParams) {
        result := ComCall(16, this, "ptr", ppwzAdditionalParams, "HRESULT")
        return result
    }
}
