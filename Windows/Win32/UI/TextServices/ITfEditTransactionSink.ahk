#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The ITfEditTransactionSink interface is implemented by a text service and used by the TSF manager to support edit transactions.
 * @remarks
 * 
 * An edit transaction involves multiple document locks, and usually includes multiple <a href="https://docs.microsoft.com/windows/desktop/api/msctf/nf-msctf-itftexteditsink-onendedit">ITfTextEditSink::OnEndEdit</a> method callbacks.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//msctf/nn-msctf-itfedittransactionsink
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
     * 
     * @param {ITfContext} pic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfedittransactionsink-onstartedittransaction
     */
    OnStartEditTransaction(pic) {
        result := ComCall(3, this, "ptr", pic, "HRESULT")
        return result
    }

    /**
     * 
     * @param {ITfContext} pic 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/msctf/nf-msctf-itfedittransactionsink-onendedittransaction
     */
    OnEndEditTransaction(pic) {
        result := ComCall(4, this, "ptr", pic, "HRESULT")
        return result
    }
}
