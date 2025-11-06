#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\ITransaction.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITipHelper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ITipHelper
     * @type {Guid}
     */
    static IID => Guid("{17cf72d1-bac5-11d1-b1bf-00c04fc2f3ef}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Pull", "PullAsync", "GetLocalTmUrl"]

    /**
     * 
     * @param {Pointer<Integer>} i_pszTxUrl 
     * @returns {ITransaction} 
     */
    Pull(i_pszTxUrl) {
        i_pszTxUrlMarshal := i_pszTxUrl is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, i_pszTxUrlMarshal, i_pszTxUrl, "ptr*", &o_ppITransaction := 0, "HRESULT")
        return ITransaction(o_ppITransaction)
    }

    /**
     * 
     * @param {Pointer<Integer>} i_pszTxUrl 
     * @param {ITipPullSink} i_pTipPullSink 
     * @returns {ITransaction} 
     */
    PullAsync(i_pszTxUrl, i_pTipPullSink) {
        i_pszTxUrlMarshal := i_pszTxUrl is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, i_pszTxUrlMarshal, i_pszTxUrl, "ptr", i_pTipPullSink, "ptr*", &o_ppITransaction := 0, "HRESULT")
        return ITransaction(o_ppITransaction)
    }

    /**
     * 
     * @returns {Pointer<Integer>} 
     */
    GetLocalTmUrl() {
        result := ComCall(5, this, "ptr*", &o_ppszLocalTmUrl := 0, "HRESULT")
        return o_ppszLocalTmUrl
    }
}
