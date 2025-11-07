#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITfComposition.ahk
#Include .\IEnumITfCompositionView.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextComposition interface is implemented by the TSF manager and is used by a text service to create and manipulate compositions. An instance of this interface is provided by ITfContext::QueryInterface with IID_ITfContextComposition.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextcomposition
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextComposition extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextComposition
     * @type {Guid}
     */
    static IID => Guid("{d40c8aae-ac92-4fc7-9a11-0ee0e23aa39b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["StartComposition", "EnumCompositions", "FindComposition", "TakeOwnership"]

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {ITfRange} pCompositionRange 
     * @param {ITfCompositionSink} pSink 
     * @returns {ITfComposition} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextcomposition-startcomposition
     */
    StartComposition(ecWrite, pCompositionRange, pSink) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pCompositionRange, "ptr", pSink, "ptr*", &ppComposition := 0, "HRESULT")
        return ITfComposition(ppComposition)
    }

    /**
     * 
     * @returns {IEnumITfCompositionView} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextcomposition-enumcompositions
     */
    EnumCompositions() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumITfCompositionView(ppEnum)
    }

    /**
     * 
     * @param {Integer} ecRead 
     * @param {ITfRange} pTestRange 
     * @returns {IEnumITfCompositionView} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextcomposition-findcomposition
     */
    FindComposition(ecRead, pTestRange) {
        result := ComCall(5, this, "uint", ecRead, "ptr", pTestRange, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumITfCompositionView(ppEnum)
    }

    /**
     * 
     * @param {Integer} ecWrite 
     * @param {ITfCompositionView} pComposition 
     * @param {ITfCompositionSink} pSink 
     * @returns {ITfComposition} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfcontextcomposition-takeownership
     */
    TakeOwnership(ecWrite, pComposition, pSink) {
        result := ComCall(6, this, "uint", ecWrite, "ptr", pComposition, "ptr", pSink, "ptr*", &ppComposition := 0, "HRESULT")
        return ITfComposition(ppComposition)
    }
}
