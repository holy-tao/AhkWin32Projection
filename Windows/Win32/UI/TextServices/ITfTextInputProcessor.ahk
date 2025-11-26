#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfTextInputProcessor interface is implemented by a text service and used by the TSF manager to activate and deactivate the text service.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itftextinputprocessor
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfTextInputProcessor extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfTextInputProcessor
     * @type {Guid}
     */
    static IID => Guid("{aa80e7f7-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Activate", "Deactivate"]

    /**
     * ITfTextInputProcessor::Activate method
     * @param {ITfThreadMgr} ptim Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfthreadmgr">ITfThreadMgr</a> interface for the thread manager that owns the text service.
     * @param {Integer} tid Specifies the client identifier for the text service.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itftextinputprocessor-activate
     */
    Activate(ptim, tid) {
        result := ComCall(3, this, "ptr", ptim, "uint", tid, "HRESULT")
        return result
    }

    /**
     * ITfTextInputProcessor::Deactivate method
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//msctf/nf-msctf-itftextinputprocessor-deactivate
     */
    Deactivate() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
