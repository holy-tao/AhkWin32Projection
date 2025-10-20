#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfRange interface is used by text services and applications to reference and manipulate text within a given context. The interface ID is IID_ITfRange.
 * @remarks
 * 
  * The TSF manager implements this interface. For more information about ranges, anchors, embedded objects, and other text properties used by TSF, see <a href="https://docs.microsoft.com/windows/desktop/TSF/ranges">Ranges</a>, <a href="https://docs.microsoft.com/windows/desktop/TSF/embedded-objects">Embedded Objects</a>, and other topics within <a href="https://docs.microsoft.com/windows/desktop/TSF/using-text-services-framework">Using Text Services Framework</a>.
  * 
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfrange
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfRange extends IUnknown{
    /**
     * The interface identifier for ITfRange
     * @type {Guid}
     */
    static IID => Guid("{aa80e7ff-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cchMax 
     * @param {Pointer<UInt32>} pcch 
     * @returns {HRESULT} 
     */
    GetText(ec, dwFlags, pchText, cchMax, pcch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(3, this, "uint", ec, "uint", dwFlags, "ptr", pchText, "uint", cchMax, "uint*", pcch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     */
    SetText(ec, dwFlags, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(4, this, "uint", ec, "uint", dwFlags, "ptr", pchText, "int", cch, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<IDataObject>} ppDataObject 
     * @returns {HRESULT} 
     */
    GetFormattedText(ec, ppDataObject) {
        result := ComCall(5, this, "uint", ec, "ptr", ppDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @param {Pointer<IUnknown>} ppunk 
     * @returns {HRESULT} 
     */
    GetEmbedded(ec, rguidService, riid, ppunk) {
        result := ComCall(6, this, "uint", ec, "ptr", rguidService, "ptr", riid, "ptr", ppunk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dwFlags 
     * @param {Pointer<IDataObject>} pDataObject 
     * @returns {HRESULT} 
     */
    InsertEmbedded(ec, dwFlags, pDataObject) {
        result := ComCall(7, this, "uint", ec, "uint", dwFlags, "ptr", pDataObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} cchReq 
     * @param {Pointer<Int32>} pcch 
     * @param {Pointer<TF_HALTCOND>} pHalt 
     * @returns {HRESULT} 
     */
    ShiftStart(ec, cchReq, pcch, pHalt) {
        result := ComCall(8, this, "uint", ec, "int", cchReq, "int*", pcch, "ptr", pHalt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} cchReq 
     * @param {Pointer<Int32>} pcch 
     * @param {Pointer<TF_HALTCOND>} pHalt 
     * @returns {HRESULT} 
     */
    ShiftEnd(ec, cchReq, pcch, pHalt) {
        result := ComCall(9, this, "uint", ec, "int", cchReq, "int*", pcch, "ptr", pHalt, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} pRange 
     * @param {Integer} aPos 
     * @returns {HRESULT} 
     */
    ShiftStartToRange(ec, pRange, aPos) {
        result := ComCall(10, this, "uint", ec, "ptr", pRange, "int", aPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} pRange 
     * @param {Integer} aPos 
     * @returns {HRESULT} 
     */
    ShiftEndToRange(ec, pRange, aPos) {
        result := ComCall(11, this, "uint", ec, "ptr", pRange, "int", aPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dir 
     * @param {Pointer<BOOL>} pfNoRegion 
     * @returns {HRESULT} 
     */
    ShiftStartRegion(ec, dir, pfNoRegion) {
        result := ComCall(12, this, "uint", ec, "int", dir, "ptr", pfNoRegion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dir 
     * @param {Pointer<BOOL>} pfNoRegion 
     * @returns {HRESULT} 
     */
    ShiftEndRegion(ec, dir, pfNoRegion) {
        result := ComCall(13, this, "uint", ec, "int", dir, "ptr", pfNoRegion, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<BOOL>} pfEmpty 
     * @returns {HRESULT} 
     */
    IsEmpty(ec, pfEmpty) {
        result := ComCall(14, this, "uint", ec, "ptr", pfEmpty, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} aPos 
     * @returns {HRESULT} 
     */
    Collapse(ec, aPos) {
        result := ComCall(15, this, "uint", ec, "int", aPos, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} pWith 
     * @param {Integer} aPos 
     * @param {Pointer<BOOL>} pfEqual 
     * @returns {HRESULT} 
     */
    IsEqualStart(ec, pWith, aPos, pfEqual) {
        result := ComCall(16, this, "uint", ec, "ptr", pWith, "int", aPos, "ptr", pfEqual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} pWith 
     * @param {Integer} aPos 
     * @param {Pointer<BOOL>} pfEqual 
     * @returns {HRESULT} 
     */
    IsEqualEnd(ec, pWith, aPos, pfEqual) {
        result := ComCall(17, this, "uint", ec, "ptr", pWith, "int", aPos, "ptr", pfEqual, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} pWith 
     * @param {Integer} aPos 
     * @param {Pointer<Int32>} plResult 
     * @returns {HRESULT} 
     */
    CompareStart(ec, pWith, aPos, plResult) {
        result := ComCall(18, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<ITfRange>} pWith 
     * @param {Integer} aPos 
     * @param {Pointer<Int32>} plResult 
     * @returns {HRESULT} 
     */
    CompareEnd(ec, pWith, aPos, plResult) {
        result := ComCall(19, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", plResult, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} cchInsert 
     * @param {Pointer<BOOL>} pfInsertOk 
     * @returns {HRESULT} 
     */
    AdjustForInsert(ec, cchInsert, pfInsertOk) {
        result := ComCall(20, this, "uint", ec, "uint", cchInsert, "ptr", pfInsertOk, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pgStart 
     * @param {Pointer<Int32>} pgEnd 
     * @returns {HRESULT} 
     */
    GetGravity(pgStart, pgEnd) {
        result := ComCall(21, this, "int*", pgStart, "int*", pgEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} gStart 
     * @param {Integer} gEnd 
     * @returns {HRESULT} 
     */
    SetGravity(ec, gStart, gEnd) {
        result := ComCall(22, this, "uint", ec, "int", gStart, "int", gEnd, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfRange>} ppClone 
     * @returns {HRESULT} 
     */
    Clone(ppClone) {
        result := ComCall(23, this, "ptr", ppClone, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} ppContext 
     * @returns {HRESULT} 
     */
    GetContext(ppContext) {
        result := ComCall(24, this, "ptr", ppContext, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
