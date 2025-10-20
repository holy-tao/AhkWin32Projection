#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHlinkFrame extends IUnknown{
    /**
     * The interface identifier for IHlinkFrame
     * @type {Guid}
     */
    static IID => Guid("{79eac9c5-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IHlinkBrowseContext>} pihlbc 
     * @returns {HRESULT} 
     */
    SetBrowseContext(pihlbc) {
        result := ComCall(3, this, "ptr", pihlbc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IHlinkBrowseContext>} ppihlbc 
     * @returns {HRESULT} 
     */
    GetBrowseContext(ppihlbc) {
        result := ComCall(4, this, "ptr", ppihlbc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {Pointer<IBindCtx>} pbc 
     * @param {Pointer<IBindStatusCallback>} pibsc 
     * @param {Pointer<IHlink>} pihlNavigate 
     * @returns {HRESULT} 
     */
    Navigate(grfHLNF, pbc, pibsc, pihlNavigate) {
        result := ComCall(5, this, "uint", grfHLNF, "ptr", pbc, "ptr", pibsc, "ptr", pihlNavigate, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {Pointer<IMoniker>} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @param {Integer} dwreserved 
     * @returns {HRESULT} 
     */
    OnNavigate(grfHLNF, pimkTarget, pwzLocation, pwzFriendlyName, dwreserved) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(6, this, "uint", grfHLNF, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "uint", dwreserved, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @param {Pointer<IMoniker>} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {HRESULT} 
     */
    UpdateHlink(uHLID, pimkTarget, pwzLocation, pwzFriendlyName) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(7, this, "uint", uHLID, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
