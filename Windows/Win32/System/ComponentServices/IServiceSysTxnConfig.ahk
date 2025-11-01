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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConfigureBYOTSysTxn"]

    /**
     * 
     * @param {ITransactionProxy} pTxProxy 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicesystxnconfig-configurebyotsystxn
     */
    ConfigureBYOTSysTxn(pTxProxy) {
        result := ComCall(9, this, "ptr", pTxProxy, "HRESULT")
        return result
    }
}
