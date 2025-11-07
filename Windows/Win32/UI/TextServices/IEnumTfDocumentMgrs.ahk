#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfDocumentMgrs.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfDocumentMgrs interface is implemented by the TSF manager to provide an enumeration of document manager objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfdocumentmgrs
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfDocumentMgrs extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTfDocumentMgrs
     * @type {Guid}
     */
    static IID => Guid("{aa80e808-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Clone", "Next", "Reset", "Skip"]

    /**
     * 
     * @returns {IEnumTfDocumentMgrs} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfdocumentmgrs-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfDocumentMgrs(ppEnum)
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfDocumentMgr>} rgDocumentMgr 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfdocumentmgrs-next
     */
    Next(ulCount, rgDocumentMgr, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, "ptr*", rgDocumentMgr, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfdocumentmgrs-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfdocumentmgrs-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}
