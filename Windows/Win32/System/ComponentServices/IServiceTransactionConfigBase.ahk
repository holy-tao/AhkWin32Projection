#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Configures the transaction services for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain.
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/nn-comsvcs-iservicetransactionconfigbase
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class IServiceTransactionConfigBase extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IServiceTransactionConfigBase
     * @type {Guid}
     */
    static IID => Guid("{772b3fbe-6ffd-42fb-b5f8-8f9b260f3810}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ConfigureTransaction", "IsolationLevel", "TransactionTimeout", "BringYourOwnTransaction", "NewTransactionDescription"]

    /**
     * 
     * @param {Integer} transactionConfig 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-configuretransaction
     */
    ConfigureTransaction(transactionConfig) {
        result := ComCall(3, this, "int", transactionConfig, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-isolationlevel
     */
    IsolationLevel(option) {
        result := ComCall(4, this, "int", option, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} ulTimeoutSec 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-transactiontimeout
     */
    TransactionTimeout(ulTimeoutSec) {
        result := ComCall(5, this, "uint", ulTimeoutSec, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szTipURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-bringyourowntransaction
     */
    BringYourOwnTransaction(szTipURL) {
        szTipURL := szTipURL is String ? StrPtr(szTipURL) : szTipURL

        result := ComCall(6, this, "ptr", szTipURL, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} szTxDesc 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-newtransactiondescription
     */
    NewTransactionDescription(szTxDesc) {
        szTxDesc := szTxDesc is String ? StrPtr(szTxDesc) : szTxDesc

        result := ComCall(7, this, "ptr", szTxDesc, "HRESULT")
        return result
    }
}
