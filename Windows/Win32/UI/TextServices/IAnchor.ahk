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
     * 
     * @param {Integer} gravity 
     * @returns {HRESULT} 
     */
    SetGravity(gravity) {
        result := ComCall(3, this, "int", gravity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pgravity 
     * @returns {HRESULT} 
     */
    GetGravity(pgravity) {
        result := ComCall(4, this, "int*", pgravity, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} paWith 
     * @param {Pointer<BOOL>} pfEqual 
     * @returns {HRESULT} 
     */
    IsEqual(paWith, pfEqual) {
        result := ComCall(5, this, "ptr", paWith, "ptr", pfEqual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} paWith 
     * @param {Pointer<Int32>} plResult 
     * @returns {HRESULT} 
     */
    Compare(paWith, plResult) {
        result := ComCall(6, this, "ptr", paWith, "int*", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} cchReq 
     * @param {Pointer<Int32>} pcch 
     * @param {Pointer<IAnchor>} paHaltAnchor 
     * @returns {HRESULT} 
     */
    Shift(dwFlags, cchReq, pcch, paHaltAnchor) {
        result := ComCall(7, this, "uint", dwFlags, "int", cchReq, "int*", pcch, "ptr", paHaltAnchor, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} paSite 
     * @returns {HRESULT} 
     */
    ShiftTo(paSite) {
        result := ComCall(8, this, "ptr", paSite, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwFlags 
     * @param {Integer} dir 
     * @param {Pointer<BOOL>} pfNoRegion 
     * @returns {HRESULT} 
     */
    ShiftRegion(dwFlags, dir, pfNoRegion) {
        result := ComCall(9, this, "uint", dwFlags, "int", dir, "ptr", pfNoRegion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} dwMask 
     * @returns {HRESULT} 
     */
    SetChangeHistoryMask(dwMask) {
        result := ComCall(10, this, "uint", dwMask, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} pdwHistory 
     * @returns {HRESULT} 
     */
    GetChangeHistory(pdwHistory) {
        result := ComCall(11, this, "uint*", pdwHistory, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ClearChangeHistory() {
        result := ComCall(12, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IAnchor>} ppaClone 
     * @returns {HRESULT} 
     */
    Clone(ppaClone) {
        result := ComCall(13, this, "ptr", ppaClone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
