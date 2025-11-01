#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfThreadMgrEventSink interface is implemented by an application or TSF text service to receive notifications of certain thread manager events. Call the TSF manager ITfSource::AdviseSink with IID_ITfThreadMgrEventSink to install this advise sink.
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfthreadmgreventsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfThreadMgrEventSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfThreadMgrEventSink
     * @type {Guid}
     */
    static IID => Guid("{aa80e80e-2021-11d2-93e0-0060b067b86e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnInitDocumentMgr", "OnUninitDocumentMgr", "OnSetFocus", "OnPushContext", "OnPopContext"]

    /**
     * 
     * @param {ITfDocumentMgr} pdim 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-oninitdocumentmgr
     */
    OnInitDocumentMgr(pdim) {
        result := ComCall(3, this, "ptr", pdim, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfDocumentMgr} pdim 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-onuninitdocumentmgr
     */
    OnUninitDocumentMgr(pdim) {
        result := ComCall(4, this, "ptr", pdim, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfDocumentMgr} pdimFocus 
     * @param {ITfDocumentMgr} pdimPrevFocus 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-onsetfocus
     */
    OnSetFocus(pdimFocus, pdimPrevFocus) {
        result := ComCall(5, this, "ptr", pdimFocus, "ptr", pdimPrevFocus, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-onpushcontext
     */
    OnPushContext(pic) {
        result := ComCall(6, this, "ptr", pic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfthreadmgreventsink-onpopcontext
     */
    OnPopContext(pic) {
        result := ComCall(7, this, "ptr", pic, "HRESULT")
        return result
    }
}
