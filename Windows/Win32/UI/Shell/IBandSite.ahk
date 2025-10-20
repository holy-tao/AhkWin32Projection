#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Exposes methods that control band objects.
 * @remarks
 * 
  * <b>IBandSite</b> is used to host band objects, such as <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ideskband">IDeskBand</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-ibandsite
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IBandSite extends IUnknown{
    /**
     * The interface identifier for IBandSite
     * @type {Guid}
     */
    static IID => Guid("{4cf504b0-de96-11d0-8b3f-00a0c911e8e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<IUnknown>} punk 
     * @returns {HRESULT} 
     */
    AddBand(punk) {
        result := ComCall(3, this, "ptr", punk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} uBand 
     * @param {Pointer<UInt32>} pdwBandID 
     * @returns {HRESULT} 
     */
    EnumBands(uBand, pdwBandID) {
        result := ComCall(4, this, "uint", uBand, "uint*", pdwBandID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBandID 
     * @param {Pointer<IDeskBand>} ppstb 
     * @param {Pointer<UInt32>} pdwState 
     * @param {PWSTR} pszName 
     * @param {Integer} cchName 
     * @returns {HRESULT} 
     */
    QueryBand(dwBandID, ppstb, pdwState, pszName, cchName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        result := ComCall(5, this, "uint", dwBandID, "ptr", ppstb, "uint*", pdwState, "ptr", pszName, "int", cchName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBandID 
     * @param {Integer} dwMask 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     */
    SetBandState(dwBandID, dwMask, dwState) {
        result := ComCall(6, this, "uint", dwBandID, "uint", dwMask, "uint", dwState, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBandID 
     * @returns {HRESULT} 
     */
    RemoveBand(dwBandID) {
        result := ComCall(7, this, "uint", dwBandID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwBandID 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<Void>} ppv 
     * @returns {HRESULT} 
     */
    GetBandObject(dwBandID, riid, ppv) {
        result := ComCall(8, this, "uint", dwBandID, "ptr", riid, "ptr", ppv, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BANDSITEINFO>} pbsinfo 
     * @returns {HRESULT} 
     */
    SetBandSiteInfo(pbsinfo) {
        result := ComCall(9, this, "ptr", pbsinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BANDSITEINFO>} pbsinfo 
     * @returns {HRESULT} 
     */
    GetBandSiteInfo(pbsinfo) {
        result := ComCall(10, this, "ptr", pbsinfo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
