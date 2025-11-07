#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IEnumTfRanges.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The IEnumTfRanges interface is implemented by the TSF manager to provide an enumeration of range objects.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-ienumtfranges
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class IEnumTfRanges extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnumTfRanges
     * @type {Guid}
     */
    static IID => Guid("{f99d3f40-8e32-11d2-bf46-00105a2799b5}")

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
     * @returns {IEnumTfRanges} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfranges-clone
     */
    Clone() {
        result := ComCall(3, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumTfRanges(ppEnum)
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @param {Pointer<ITfRange>} ppRange 
     * @param {Pointer<Integer>} pcFetched 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfranges-next
     */
    Next(ulCount, ppRange, pcFetched) {
        pcFetchedMarshal := pcFetched is VarRef ? "uint*" : "ptr"

        result := ComCall(4, this, "uint", ulCount, "ptr*", ppRange, pcFetchedMarshal, pcFetched, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfranges-reset
     */
    Reset() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulCount 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-ienumtfranges-skip
     */
    Skip(ulCount) {
        result := ComCall(6, this, "uint", ulCount, "HRESULT")
        return result
    }
}
