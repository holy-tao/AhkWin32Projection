#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IServiceTransactionConfig.ahk

/**
 * Enables you to run a set of code in the scope of an existing transaction that you specify with a transaction proxy.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicesystxnconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceSysTxnConfig extends IServiceTransactionConfig{
    /**
     * The interface identifier for IServiceSysTxnConfig
     * @type {Guid}
     */
    static IID => Guid("{33caf1a1-fcb8-472b-b45e-967448ded6d8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 9

    /**
     * 
     * @param {Pointer<ITransactionProxy>} pTxProxy 
     * @returns {HRESULT} 
     */
    ConfigureBYOTSysTxn(pTxProxy) {
        result := ComCall(9, this, "ptr", pTxProxy, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
