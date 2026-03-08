#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfEditTransactionSink interface is implemented by a text service and used by the TSF manager to support edit transactions.
 * @remarks
 * An edit transaction involves multiple document locks, and usually includes multiple <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftexteditsink-onendedit">ITfTextEditSink::OnEndEdit</a> method callbacks.
 * @see https://learn.microsoft.com/windows/win32/api/msctf/nn-msctf-itfedittransactionsink
 * @namespace Windows.Win32.UI.TextServices
 * @version v4.0.30319
 */
class ITfEditTransactionSink extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITfEditTransactionSink
     * @type {Guid}
     */
    static IID => Guid("{708fbf70-b520-416b-b06c-2c41ab44f8ba}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["OnStartEditTransaction", "OnEndEditTransaction"]

    /**
     * ITfEditTransactionSink::OnStartEditTransaction method
     * @remarks
     * The TSF manager calls this method at the start of an edit transaction. A text service might delay reevaluation of the changing context of the transaction due to the multiple <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftexteditsink-onendedit">ITfTextEditSink::OnEndEdit</a> notifications until after receiving the corresponding <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itfedittransactionsink-onendedittransaction">ITfEditTransactionSink::OnEndEditTransaction</a> callback.
     * @param {ITfContext} pic Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface involved in the transaction.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfedittransactionsink-onstartedittransaction
     */
    OnStartEditTransaction(pic) {
        result := ComCall(3, this, "ptr", pic, "HRESULT")
        return result
    }

    /**
     * ITfEditTransactionSink::OnEndEditTransaction method
     * @remarks
     * The TSF manager calls this method at the end of an edit transaction. A text service can delay reevaluation of the changing context of the transaction due to the multiple <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftexteditsink-onendedit">ITfTextEditSink::OnEndEdit</a> method notifications until after receiving this callback.
     * @param {ITfContext} pic Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nn-msctf-itfcontext">ITfContext</a> interface involved in the transaction.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfedittransactionsink-onendedittransaction
     */
    OnEndEditTransaction(pic) {
        result := ComCall(4, this, "ptr", pic, "HRESULT")
        return result
    }
}
