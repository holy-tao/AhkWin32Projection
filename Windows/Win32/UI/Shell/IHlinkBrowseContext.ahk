#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IHlinkBrowseContext extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHlinkBrowseContext
     * @type {Guid}
     */
    static IID => Guid("{79eac9c7-baf9-11ce-8c82-00aa004ba90b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Register", "GetObject", "Revoke", "SetBrowseWindowInfo", "GetBrowseWindowInfo", "SetInitialHlink", "OnNavigateHlink", "UpdateHlink", "EnumNavigationStack", "QueryHlink", "GetHlink", "SetCurrentHlink", "Clone", "Close"]

    /**
     * 
     * @param {Integer} reserved 
     * @param {IUnknown} piunk 
     * @param {IMoniker} pimk 
     * @param {Pointer<Integer>} pdwRegister 
     * @returns {HRESULT} 
     */
    Register(reserved, piunk, pimk, pdwRegister) {
        result := ComCall(3, this, "uint", reserved, "ptr", piunk, "ptr", pimk, "uint*", pdwRegister, "HRESULT")
        return result
    }

    /**
     * The GetObject function retrieves information for the specified graphics object.
     * @param {IMoniker} pimk 
     * @param {BOOL} fBindIfRootRegistered 
     * @param {Pointer<IUnknown>} ppiunk 
     * @returns {HRESULT} If the function succeeds, and <i>lpvObject</i> is a valid pointer, the return value is the number of bytes stored into the buffer.
     * 
     * If the function succeeds, and <i>lpvObject</i> is <b>NULL</b>, the return value is the number of bytes required to hold the information the function would store into the buffer.
     * 
     * If the function fails, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//wingdi/nf-wingdi-getobject
     */
    GetObject(pimk, fBindIfRootRegistered, ppiunk) {
        result := ComCall(4, this, "ptr", pimk, "int", fBindIfRootRegistered, "ptr*", ppiunk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwRegister 
     * @returns {HRESULT} 
     */
    Revoke(dwRegister) {
        result := ComCall(5, this, "uint", dwRegister, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HLBWINFO>} phlbwi 
     * @returns {HRESULT} 
     */
    SetBrowseWindowInfo(phlbwi) {
        result := ComCall(6, this, "ptr", phlbwi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<HLBWINFO>} phlbwi 
     * @returns {HRESULT} 
     */
    GetBrowseWindowInfo(phlbwi) {
        result := ComCall(7, this, "ptr", phlbwi, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {HRESULT} 
     */
    SetInitialHlink(pimkTarget, pwzLocation, pwzFriendlyName) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(8, this, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLNF 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @param {Pointer<Integer>} puHLID 
     * @returns {HRESULT} 
     */
    OnNavigateHlink(grfHLNF, pimkTarget, pwzLocation, pwzFriendlyName, puHLID) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(9, this, "uint", grfHLNF, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "uint*", puHLID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @param {IMoniker} pimkTarget 
     * @param {PWSTR} pwzLocation 
     * @param {PWSTR} pwzFriendlyName 
     * @returns {HRESULT} 
     */
    UpdateHlink(uHLID, pimkTarget, pwzLocation, pwzFriendlyName) {
        pwzLocation := pwzLocation is String ? StrPtr(pwzLocation) : pwzLocation
        pwzFriendlyName := pwzFriendlyName is String ? StrPtr(pwzFriendlyName) : pwzFriendlyName

        result := ComCall(10, this, "uint", uHLID, "ptr", pimkTarget, "ptr", pwzLocation, "ptr", pwzFriendlyName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwReserved 
     * @param {Integer} grfHLFNAMEF 
     * @param {Pointer<IEnumHLITEM>} ppienumhlitem 
     * @returns {HRESULT} 
     */
    EnumNavigationStack(dwReserved, grfHLFNAMEF, ppienumhlitem) {
        result := ComCall(11, this, "uint", dwReserved, "uint", grfHLFNAMEF, "ptr*", ppienumhlitem, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} grfHLQF 
     * @param {Integer} uHLID 
     * @returns {HRESULT} 
     */
    QueryHlink(grfHLQF, uHLID) {
        result := ComCall(12, this, "uint", grfHLQF, "uint", uHLID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @param {Pointer<IHlink>} ppihl 
     * @returns {HRESULT} 
     */
    GetHlink(uHLID, ppihl) {
        result := ComCall(13, this, "uint", uHLID, "ptr*", ppihl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uHLID 
     * @returns {HRESULT} 
     */
    SetCurrentHlink(uHLID) {
        result := ComCall(14, this, "uint", uHLID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IUnknown} piunkOuter 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppiunkObj 
     * @returns {HRESULT} 
     */
    Clone(piunkOuter, riid, ppiunkObj) {
        result := ComCall(15, this, "ptr", piunkOuter, "ptr", riid, "ptr*", ppiunkObj, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} reserved 
     * @returns {HRESULT} 
     */
    Close(reserved) {
        result := ComCall(16, this, "uint", reserved, "HRESULT")
        return result
    }
}
