#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfContextOwnerCompositionSink interface is implemented by an application to receive composition-related notifications.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfcontextownercompositionsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfContextOwnerCompositionSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfContextOwnerCompositionSink
     * @type {Guid}
     */
    static IID => Guid("{5f20aa40-b57a-4f34-96ab-3576f377cc79}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStartComposition", "OnUpdateComposition", "OnEndComposition"]

    /**
     * ITfContextOwnerCompositionSink::OnStartComposition method
     * @param {ITfCompositionView} pComposition Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompositionview">ITfCompositionView</a> object that represents the new composition.
     * @returns {BOOL} Pointer to a <b>BOOL</b> value that receives a value that allows or denies the new composition. Receives a nonzero value to allow the composition or zero to deny the composition.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownercompositionsink-onstartcomposition
     */
    OnStartComposition(pComposition) {
        result := ComCall(3, this, "ptr", pComposition, "int*", &pfOk := 0, "HRESULT")
        return pfOk
    }

    /**
     * ITfContextOwnerCompositionSink::OnUpdateComposition method
     * @param {ITfCompositionView} pComposition Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompositionview">ITfCompositionView</a> object that represents the composition updated.
     * @param {ITfRange} pRangeNew Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfrange">ITfRange</a> object that contains the range of text the composition will cover after the composition is updated.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownercompositionsink-onupdatecomposition
     */
    OnUpdateComposition(pComposition, pRangeNew) {
        result := ComCall(4, this, "ptr", pComposition, "ptr", pRangeNew, "HRESULT")
        return result
    }

    /**
     * ITfContextOwnerCompositionSink::OnEndComposition method
     * @param {ITfCompositionView} pComposition Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcompositionview">ITfCompositionView</a> object that represents the composition terminated.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itfcontextownercompositionsink-onendcomposition
     */
    OnEndComposition(pComposition) {
        result := ComCall(5, this, "ptr", pComposition, "HRESULT")
        return result
    }
}
