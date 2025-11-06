#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IDataObject.ahk
#Include ..\..\System\Com\IUnknown.ahk
#Include .\ITfRange.ahk
#Include .\ITfContext.ahk

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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetText", "SetText", "GetFormattedText", "GetEmbedded", "InsertEmbedded", "ShiftStart", "ShiftEnd", "ShiftStartToRange", "ShiftEndToRange", "ShiftStartRegion", "ShiftEndRegion", "IsEmpty", "Collapse", "IsEqualStart", "IsEqualEnd", "CompareStart", "CompareEnd", "AdjustForInsert", "GetGravity", "SetGravity", "Clone", "GetContext"]

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cchMax 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-gettext
     */
    GetText(ec, dwFlags, pchText, cchMax) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(3, this, "uint", ec, "uint", dwFlags, "ptr", pchText, "uint", cchMax, "uint*", &pcch := 0, "HRESULT")
        return pcch
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dwFlags 
     * @param {PWSTR} pchText 
     * @param {Integer} cch 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-settext
     */
    SetText(ec, dwFlags, pchText, cch) {
        pchText := pchText is String ? StrPtr(pchText) : pchText

        result := ComCall(4, this, "uint", ec, "uint", dwFlags, "ptr", pchText, "int", cch, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @returns {IDataObject} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-getformattedtext
     */
    GetFormattedText(ec) {
        result := ComCall(5, this, "uint", ec, "ptr*", &ppDataObject := 0, "HRESULT")
        return IDataObject(ppDataObject)
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Pointer<Guid>} rguidService 
     * @param {Pointer<Guid>} riid 
     * @returns {IUnknown} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-getembedded
     */
    GetEmbedded(ec, rguidService, riid) {
        result := ComCall(6, this, "uint", ec, "ptr", rguidService, "ptr", riid, "ptr*", &ppunk := 0, "HRESULT")
        return IUnknown(ppunk)
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dwFlags 
     * @param {IDataObject} pDataObject 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-insertembedded
     */
    InsertEmbedded(ec, dwFlags, pDataObject) {
        result := ComCall(7, this, "uint", ec, "uint", dwFlags, "ptr", pDataObject, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} cchReq 
     * @param {Pointer<TF_HALTCOND>} pHalt 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-shiftstart
     */
    ShiftStart(ec, cchReq, pHalt) {
        result := ComCall(8, this, "uint", ec, "int", cchReq, "int*", &pcch := 0, "ptr", pHalt, "HRESULT")
        return pcch
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} cchReq 
     * @param {Pointer<TF_HALTCOND>} pHalt 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-shiftend
     */
    ShiftEnd(ec, cchReq, pHalt) {
        result := ComCall(9, this, "uint", ec, "int", cchReq, "int*", &pcch := 0, "ptr", pHalt, "HRESULT")
        return pcch
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @param {Integer} aPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-shiftstarttorange
     */
    ShiftStartToRange(ec, pRange, aPos) {
        result := ComCall(10, this, "uint", ec, "ptr", pRange, "int", aPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pRange 
     * @param {Integer} aPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-shiftendtorange
     */
    ShiftEndToRange(ec, pRange, aPos) {
        result := ComCall(11, this, "uint", ec, "ptr", pRange, "int", aPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dir 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-shiftstartregion
     */
    ShiftStartRegion(ec, dir) {
        result := ComCall(12, this, "uint", ec, "int", dir, "int*", &pfNoRegion := 0, "HRESULT")
        return pfNoRegion
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} dir 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-shiftendregion
     */
    ShiftEndRegion(ec, dir) {
        result := ComCall(13, this, "uint", ec, "int", dir, "int*", &pfNoRegion := 0, "HRESULT")
        return pfNoRegion
    }

    /**
     * 
     * @param {Integer} ec 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-isempty
     */
    IsEmpty(ec) {
        result := ComCall(14, this, "uint", ec, "int*", &pfEmpty := 0, "HRESULT")
        return pfEmpty
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} aPos 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-collapse
     */
    Collapse(ec, aPos) {
        result := ComCall(15, this, "uint", ec, "int", aPos, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pWith 
     * @param {Integer} aPos 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-isequalstart
     */
    IsEqualStart(ec, pWith, aPos) {
        result := ComCall(16, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pWith 
     * @param {Integer} aPos 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-isequalend
     */
    IsEqualEnd(ec, pWith, aPos) {
        result := ComCall(17, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", &pfEqual := 0, "HRESULT")
        return pfEqual
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pWith 
     * @param {Integer} aPos 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-comparestart
     */
    CompareStart(ec, pWith, aPos) {
        result := ComCall(18, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {ITfRange} pWith 
     * @param {Integer} aPos 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-compareend
     */
    CompareEnd(ec, pWith, aPos) {
        result := ComCall(19, this, "uint", ec, "ptr", pWith, "int", aPos, "int*", &plResult := 0, "HRESULT")
        return plResult
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} cchInsert 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-adjustforinsert
     */
    AdjustForInsert(ec, cchInsert) {
        result := ComCall(20, this, "uint", ec, "uint", cchInsert, "int*", &pfInsertOk := 0, "HRESULT")
        return pfInsertOk
    }

    /**
     * 
     * @param {Pointer<Integer>} pgStart 
     * @param {Pointer<Integer>} pgEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-getgravity
     */
    GetGravity(pgStart, pgEnd) {
        pgStartMarshal := pgStart is VarRef ? "int*" : "ptr"
        pgEndMarshal := pgEnd is VarRef ? "int*" : "ptr"

        result := ComCall(21, this, pgStartMarshal, pgStart, pgEndMarshal, pgEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ec 
     * @param {Integer} gStart 
     * @param {Integer} gEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-setgravity
     */
    SetGravity(ec, gStart, gEnd) {
        result := ComCall(22, this, "uint", ec, "int", gStart, "int", gEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {ITfRange} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-clone
     */
    Clone() {
        result := ComCall(23, this, "ptr*", &ppClone := 0, "HRESULT")
        return ITfRange(ppClone)
    }

    /**
     * 
     * @returns {ITfContext} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfrange-getcontext
     */
    GetContext() {
        result := ComCall(24, this, "ptr*", &ppContext := 0, "HRESULT")
        return ITfContext(ppContext)
    }
}
