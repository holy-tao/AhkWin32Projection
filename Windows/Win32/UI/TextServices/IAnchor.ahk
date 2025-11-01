#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IAnchor interface is implemented by the TSF manager. Clients of Microsoft Active Accessibility use IAnchor anchor objects to delimit a range of text within a text stream.
 * @see https://docs.microsoft.com/windows/win32/api//textstor/nn-textstor-ianchor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IAnchor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAnchor
     * @type {Guid}
     */
    static IID => Guid("{0feb7e34-5a60-4356-8ef7-abdec2ff7cf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetGravity", "GetGravity", "IsEqual", "Compare", "Shift", "ShiftTo", "ShiftRegion", "SetChangeHistoryMask", "GetChangeHistory", "ClearChangeHistory", "Clone"]

    /**
     * 
     * @param {Integer} gravity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-setgravity
     */
    SetGravity(gravity) {
        result := ComCall(3, this, "int", gravity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pgravity 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-getgravity
     */
    GetGravity(pgravity) {
        pgravityMarshal := pgravity is VarRef ? "int*" : "ptr"

        result := ComCall(4, this, pgravityMarshal, pgravity, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAnchor} paWith 
     * @param {Pointer<BOOL>} pfEqual 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-isequal
     */
    IsEqual(paWith, pfEqual) {
        result := ComCall(5, this, "ptr", paWith, "ptr", pfEqual, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAnchor} paWith 
     * @param {Pointer<Integer>} plResult 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-compare
     */
    Compare(paWith, plResult) {
        plResultMarshal := plResult is VarRef ? "int*" : "ptr"

        result := ComCall(6, this, "ptr", paWith, plResultMarshal, plResult, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cchReq 
     * @param {Pointer<Integer>} pcch 
     * @param {IAnchor} paHaltAnchor 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-shift
     */
    Shift(dwFlags, cchReq, pcch, paHaltAnchor) {
        pcchMarshal := pcch is VarRef ? "int*" : "ptr"

        result := ComCall(7, this, "uint", dwFlags, "int", cchReq, pcchMarshal, pcch, "ptr", paHaltAnchor, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IAnchor} paSite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-shiftto
     */
    ShiftTo(paSite) {
        result := ComCall(8, this, "ptr", paSite, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dir 
     * @param {Pointer<BOOL>} pfNoRegion 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-shiftregion
     */
    ShiftRegion(dwFlags, dir, pfNoRegion) {
        result := ComCall(9, this, "uint", dwFlags, "int", dir, "ptr", pfNoRegion, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} dwMask 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-setchangehistorymask
     */
    SetChangeHistoryMask(dwMask) {
        result := ComCall(10, this, "uint", dwMask, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} pdwHistory 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-getchangehistory
     */
    GetChangeHistory(pdwHistory) {
        pdwHistoryMarshal := pdwHistory is VarRef ? "uint*" : "ptr"

        result := ComCall(11, this, pdwHistoryMarshal, pdwHistory, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-clearchangehistory
     */
    ClearChangeHistory() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} ppaClone 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-clone
     */
    Clone(ppaClone) {
        result := ComCall(13, this, "ptr*", ppaClone, "HRESULT")
        return result
    }
}
