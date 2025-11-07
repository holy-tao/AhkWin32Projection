#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IAnchor.ahk
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-getgravity
     */
    GetGravity() {
        result := ComCall(4, this, "int*", &pgravity := 0, "HRESULT")
        return pgravity
    }

    /**
     * 
     * @param {IAnchor} paWith 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-isequal
     */
    IsEqual(paWith) {
        result := ComCall(5, this, "ptr", paWith, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }

    /**
     * 
     * @param {IAnchor} paWith 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-compare
     */
    Compare(paWith) {
        result := ComCall(6, this, "ptr", paWith, "int*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cchReq 
     * @param {IAnchor} paHaltAnchor 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-shift
     */
    Shift(dwFlags, cchReq, paHaltAnchor) {
        result := ComCall(7, this, "uint", dwFlags, "int", cchReq, "int*", &pcch := 0, "ptr", paHaltAnchor, "HRESULT")
        return pcch
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
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-shiftregion
     */
    ShiftRegion(dwFlags, dir) {
        result := ComCall(9, this, "uint", dwFlags, "int", dir, "int*", &pfNoRegion := 0, "HRESULT")
        return pfNoRegion
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
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-getchangehistory
     */
    GetChangeHistory() {
        result := ComCall(11, this, "uint*", &pdwHistory := 0, "HRESULT")
        return pdwHistory
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
     * @returns {IAnchor} 
     * @see https://learn.microsoft.com/windows/win32/api/textstor/nf-textstor-ianchor-clone
     */
    Clone() {
        result := ComCall(13, this, "ptr*", &ppaClone := 0, "HRESULT")
        return IAnchor(ppaClone)
    }
}
