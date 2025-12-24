#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IServiceTransactionConfigBase.ahk

/**
 * Configures the transaction services for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicetransactionconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceTransactionConfig extends IServiceTransactionConfigBase{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceTransactionConfig
     * @type {Guid}
     */
    static IID => Guid("{59f4c2a3-d3d7-4a31-b6e4-6ab3177c50b9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 8

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConfigureBYOT"]

    /**
     * Enables you to configure the transaction that you use when you bring your own transaction.
     * @param {ITransaction} pITxByot A pointer to the <b>ITransaction</b> interface of the existing transaction in which you want to run the enclosed code.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nf-comsvcs-iservicetransactionconfig-configurebyot
     */
    ConfigureBYOT(pITxByot) {
        result := ComCall(8, this, "ptr", pITxByot, "HRESULT")
        return result
    }
}
