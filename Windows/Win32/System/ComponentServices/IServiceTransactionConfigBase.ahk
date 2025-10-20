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
     * 
     * @param {Integer} transactionConfig 
     * @returns {HRESULT} 
     */
    ConfigureTransaction(transactionConfig) {
        result := ComCall(3, this, "int", transactionConfig, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} option 
     * @returns {HRESULT} 
     */
    IsolationLevel(option) {
        result := ComCall(4, this, "int", option, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} ulTimeoutSec 
     * @returns {HRESULT} 
     */
    TransactionTimeout(ulTimeoutSec) {
        result := ComCall(5, this, "uint", ulTimeoutSec, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szTipURL 
     * @returns {HRESULT} 
     */
    BringYourOwnTransaction(szTipURL) {
        szTipURL := szTipURL is String ? StrPtr(szTipURL) : szTipURL

        result := ComCall(6, this, "ptr", szTipURL, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szTxDesc 
     * @returns {HRESULT} 
     */
    NewTransactionDescription(szTxDesc) {
        szTxDesc := szTxDesc is String ? StrPtr(szTxDesc) : szTxDesc

        result := ComCall(7, this, "ptr", szTxDesc, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
