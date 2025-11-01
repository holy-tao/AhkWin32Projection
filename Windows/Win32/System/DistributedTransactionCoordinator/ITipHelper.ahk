#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
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
     * @param {Pointer<ITransaction>} o_ppITransaction 
     * @returns {HRESULT} 
     */
    Pull(i_pszTxUrl, o_ppITransaction) {
        i_pszTxUrlMarshal := i_pszTxUrl is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, i_pszTxUrlMarshal, i_pszTxUrl, "ptr*", o_ppITransaction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} i_pszTxUrl 
     * @param {ITipPullSink} i_pTipPullSink 
     * @param {Pointer<ITransaction>} o_ppITransaction 
     * @returns {HRESULT} 
     */
    PullAsync(i_pszTxUrl, i_pTipPullSink, o_ppITransaction) {
        i_pszTxUrlMarshal := i_pszTxUrl is VarRef ? "char*" : "ptr"

        result := ComCall(4, this, i_pszTxUrlMarshal, i_pszTxUrl, "ptr", i_pTipPullSink, "ptr*", o_ppITransaction, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Integer>>} o_ppszLocalTmUrl 
     * @returns {HRESULT} 
     */
    GetLocalTmUrl(o_ppszLocalTmUrl) {
        result := ComCall(5, this, "ptr*", o_ppszLocalTmUrl, "HRESULT")
        return result
    }
}
