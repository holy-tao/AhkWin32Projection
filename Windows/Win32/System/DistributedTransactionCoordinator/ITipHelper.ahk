#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.System.DistributedTransactionCoordinator
 * @version v4.0.30319
 */
class ITipHelper extends IUnknown{
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
     * 
     * @param {Pointer<Byte>} i_pszTxUrl 
     * @param {Pointer<ITransaction>} o_ppITransaction 
     * @returns {HRESULT} 
     */
    Pull(i_pszTxUrl, o_ppITransaction) {
        result := ComCall(3, this, "char*", i_pszTxUrl, "ptr", o_ppITransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} i_pszTxUrl 
     * @param {Pointer<ITipPullSink>} i_pTipPullSink 
     * @param {Pointer<ITransaction>} o_ppITransaction 
     * @returns {HRESULT} 
     */
    PullAsync(i_pszTxUrl, i_pTipPullSink, o_ppITransaction) {
        result := ComCall(4, this, "char*", i_pszTxUrl, "ptr", i_pTipPullSink, "ptr", o_ppITransaction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} o_ppszLocalTmUrl 
     * @returns {HRESULT} 
     */
    GetLocalTmUrl(o_ppszLocalTmUrl) {
        result := ComCall(5, this, "char*", o_ppszLocalTmUrl, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
