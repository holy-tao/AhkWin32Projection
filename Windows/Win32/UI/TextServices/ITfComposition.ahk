#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfComposition interface is implemented by the TSF manager and is used by a text service to obtain data about and terminate a composition. An instance of this interface is provided by the ITfContextComposition::StartComposition method.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcomposition
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfComposition extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfComposition
     * @type {Guid}
     */
    static IID => Guid("{20168d64-5a8f-4a5a-b7bd-cfa29f4d0fd9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetRange", "ShiftStart", "ShiftEnd", "EndComposition"]

    /**
     * 
     * @param {Pointer<ITfRange>} ppRange 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcomposition-getrange
     */
    GetRange(ppRange) {
        result := ComCall(3, this, "ptr*", ppRange, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {ITfRange} pNewStart 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcomposition-shiftstart
     */
    ShiftStart(ecWrite, pNewStart) {
        result := ComCall(4, this, "uint", ecWrite, "ptr", pNewStart, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {ITfRange} pNewEnd 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcomposition-shiftend
     */
    ShiftEnd(ecWrite, pNewEnd) {
        result := ComCall(5, this, "uint", ecWrite, "ptr", pNewEnd, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ecWrite 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcomposition-endcomposition
     */
    EndComposition(ecWrite) {
        result := ComCall(6, this, "uint", ecWrite, "HRESULT")
        return result
    }
}
