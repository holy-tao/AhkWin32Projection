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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["AddBand", "EnumBands", "QueryBand", "SetBandState", "RemoveBand", "GetBandObject", "SetBandSiteInfo", "GetBandSiteInfo"]

    /**
     * 
     * @param {IUnknown} punk 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-addband
     */
    AddBand(punk) {
        result := ComCall(3, this, "ptr", punk, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} uBand 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-enumbands
     */
    EnumBands(uBand) {
        result := ComCall(4, this, "uint", uBand, "uint*", &pdwBandID := 0, "HRESULT")
        return pdwBandID
    }

    /**
     * 
     * @param {Integer} dwBandID 
     * @param {Pointer<IDeskBand>} ppstb 
     * @param {Pointer<Integer>} pdwState 
     * @param {PWSTR} pszName 
     * @param {Integer} cchName 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-queryband
     */
    QueryBand(dwBandID, ppstb, pdwState, pszName, cchName) {
        pszName := pszName is String ? StrPtr(pszName) : pszName

        pdwStateMarshal := pdwState is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, "uint", dwBandID, "ptr*", ppstb, pdwStateMarshal, pdwState, "ptr", pszName, "int", cchName, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBandID 
     * @param {Integer} dwMask 
     * @param {Integer} dwState 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-setbandstate
     */
    SetBandState(dwBandID, dwMask, dwState) {
        result := ComCall(6, this, "uint", dwBandID, "uint", dwMask, "uint", dwState, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBandID 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-removeband
     */
    RemoveBand(dwBandID) {
        result := ComCall(7, this, "uint", dwBandID, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwBandID 
     * @param {Pointer<Guid>} riid 
     * @returns {Pointer<Void>} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-getbandobject
     */
    GetBandObject(dwBandID, riid) {
        result := ComCall(8, this, "uint", dwBandID, "ptr", riid, "ptr*", &ppv := 0, "HRESULT")
        return ppv
    }

    /**
     * 
     * @param {Pointer<BANDSITEINFO>} pbsinfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-setbandsiteinfo
     */
    SetBandSiteInfo(pbsinfo) {
        result := ComCall(9, this, "ptr", pbsinfo, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<BANDSITEINFO>} pbsinfo 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-ibandsite-getbandsiteinfo
     */
    GetBandSiteInfo(pbsinfo) {
        result := ComCall(10, this, "ptr", pbsinfo, "HRESULT")
        return result
    }
}
