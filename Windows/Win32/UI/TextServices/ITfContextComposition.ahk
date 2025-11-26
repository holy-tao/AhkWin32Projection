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
     * ITfContextComposition::StartComposition method
     * @param {Integer} ecWrite Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pCompositionRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that specifies the text that the composition initially covers.
     * @param {ITfCompositionSink} pSink Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompositionsink">ITfCompositionSink</a> object that receives composition event notifications. This parameter is optional and can be <b>NULL</b>. If supplied, the object is released when the composition is terminated.
     * @returns {ITfComposition} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcomposition">ITfComposition</a> interface pointer that receives the new composition object. This parameter receives <b>NULL</b> if the context owner rejects the composition.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextcomposition-startcomposition
     */
    StartComposition(ecWrite, pCompositionRange, pSink) {
        result := ComCall(3, this, "uint", ecWrite, "ptr", pCompositionRange, "ptr", pSink, "ptr*", &ppComposition := 0, "HRESULT")
        return ITfComposition(ppComposition)
    }

    /**
     * ITfContextComposition::EnumCompositions method
     * @returns {IEnumITfCompositionView} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumitfcompositionview">IEnumITfCompositionView</a> interface pointer that receives the enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextcomposition-enumcompositions
     */
    EnumCompositions() {
        result := ComCall(4, this, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumITfCompositionView(ppEnum)
    }

    /**
     * ITfContextComposition::FindComposition method
     * @param {Integer} ecRead Contains an edit cookie that identifies the edit context. This is obtained from <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfeditsession-doeditsession">ITfEditSession::DoEditSession</a>.
     * @param {ITfRange} pTestRange Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that specifies the range to search. This parameter can be <b>NULL</b>. If this parameter is <b>NULL</b>, the enumerator will contain all compositions in the edit context.
     * @returns {IEnumITfCompositionView} Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-ienumitfcompositionview">IEnumITfCompositionView</a> interface pointer that receives the enumerator object.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextcomposition-findcomposition
     */
    FindComposition(ecRead, pTestRange) {
        result := ComCall(5, this, "uint", ecRead, "ptr", pTestRange, "ptr*", &ppEnum := 0, "HRESULT")
        return IEnumITfCompositionView(ppEnum)
    }

    /**
     * ITfContextComposition::TakeOwnership method
     * @param {Integer} ecWrite Not used.
     * @param {ITfCompositionView} pComposition Not used.
     * @param {ITfCompositionSink} pSink Not used.
     * @returns {ITfComposition} Not used.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextcomposition-takeownership
     */
    TakeOwnership(ecWrite, pComposition, pSink) {
        result := ComCall(6, this, "uint", ecWrite, "ptr", pComposition, "ptr", pSink, "ptr*", &ppComposition := 0, "HRESULT")
        return ITfComposition(ppComposition)
    }
}
