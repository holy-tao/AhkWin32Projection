#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHlink extends IUnknown{
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
     * 
     * @param {Pointer<IHlinkSite>} pihlSite 
     * @param {Integer} dwSiteData 
     * @returns {HRESULT} 
     */
    SetHlinkSite(pihlSite, dwSiteData) {
        result := ComCall(3, this, "ptr", pihlSite, "uint", dwSiteData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHlinkSite>} ppihlSite 
     * @param {Pointer<UInt32>} pdwSiteData 
     * @returns {HRESULT} 
     */
    GetHlinkSite(ppihlSite, pdwSiteData) {
        result := ComCall(4, this, "ptr", ppihlSite, "uint*", pdwSiteData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfHLSETF 
     * @param {Pointer<IMoniker>} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @returns {HRESULT} 
     */
    SetMonikerReference(grfHLSETF, pimkTarget, pwzLocation) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation

        result := ComCall(5, this, "uint", grfHLSETF, "ptr", pimkTarget, "ptr", pwzLocation, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(6, this, "uint", dwWhichRef, "ptr", ppimkTarget, "ptr", ppwzLocation, "int")
        if(result != 0)
            throw OSError(result)

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

        result := ComCall(7, this, "uint", grfHLSETF, "ptr", pwzTarget, "ptr", pwzLocation, "int")
        if(result != 0)
            throw OSError(result)

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
        result := ComCall(8, this, "uint", dwWhichRef, "ptr", ppwzTarget, "ptr", ppwzLocation, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {HRESULT} 
     */
    SetFriendlyName(pwzFriendlyName) {
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(9, this, "ptr", pwzFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfHLFNAMEF 
     * @param {Pointer<PWSTR>} ppwzFriendlyName 
     * @returns {HRESULT} 
     */
    GetFriendlyName(grfHLFNAMEF, ppwzFriendlyName) {
        result := ComCall(10, this, "uint", grfHLFNAMEF, "ptr", ppwzFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzTargetFrameName 
     * @returns {HRESULT} 
     */
    SetTargetFrameName(pwzTargetFrameName) {
        pwzTargetFrameName := pwzTargetFrameName is String ? StrPtr(pwzTargetFrameName) : pwzTargetFrameName

        result := ComCall(11, this, "ptr", pwzTargetFrameName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwzTargetFrameName 
     * @returns {HRESULT} 
     */
    GetTargetFrameName(ppwzTargetFrameName) {
        result := ComCall(12, this, "ptr", ppwzTargetFrameName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwStatus 
     * @returns {HRESULT} 
     */
    GetMiscStatus(pdwStatus) {
        result := ComCall(13, this, "uint*", pdwStatus, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {Pointer<IBindCtx>} pibc 
     * @param {Pointer<IBindStatusCallback>} pibsc 
     * @param {Pointer<IHlinkBrowseContext>} pihlbc 
     * @returns {HRESULT} 
     */
    Navigate(grfHLNF, pibc, pibsc, pihlbc) {
        result := ComCall(14, this, "uint", grfHLNF, "ptr", pibc, "ptr", pibsc, "ptr", pihlbc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} pwzAdditionalParams 
     * @returns {HRESULT} 
     */
    SetAdditionalParams(pwzAdditionalParams) {
        pwzAdditionalParams := pwzAdditionalParams is String ? StrPtr(pwzAdditionalParams) : pwzAdditionalParams

        result := ComCall(15, this, "ptr", pwzAdditionalParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<PWSTR>} ppwzAdditionalParams 
     * @returns {HRESULT} 
     */
    GetAdditionalParams(ppwzAdditionalParams) {
        result := ComCall(16, this, "ptr", ppwzAdditionalParams, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
