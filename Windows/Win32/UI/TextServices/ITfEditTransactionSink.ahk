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
     * 
     * @param {Pointer<ITfContext>} pic 
     * @returns {HRESULT} 
     */
    OnStartEditTransaction(pic) {
        result := ComCall(3, this, "ptr", pic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ITfContext>} pic 
     * @returns {HRESULT} 
     */
    OnEndEditTransaction(pic) {
        result := ComCall(4, this, "ptr", pic, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
