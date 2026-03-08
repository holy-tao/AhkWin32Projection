#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Com\IUnknown.ahk

/**
 * Configures the transaction services for the work that is done when calling either CoCreateActivity or CoEnterServiceDomain. (IServiceTransactionConfigBase)
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nn-comsvcs-iservicetransactionconfigbase
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
     * Configures how transactions are used in the enclosed work.
     * @param {Integer} transactionConfig A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_transactionconfig">CSC_TransactionConfig</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-configuretransaction
     */
    ConfigureTransaction(transactionConfig) {
        result := ComCall(3, this, "int", transactionConfig, "HRESULT")
        return result
    }

    /**
     * Sets the isolation level of the transactions.
     * @remarks
     * A new transaction is created if the enclosing transaction is not running at the specified isolation level. This method is ignored if the enclosed code would not otherwise run in a transaction.
     * @param {Integer} option A value from the <a href="https://docs.microsoft.com/windows/desktop/api/comadmin/ne-comadmin-comadmintxisolationleveloptions">COMAdminTxIsolationLevelOptions</a> enumeration.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-isolationlevel
     */
    IsolationLevel(option) {
        result := ComCall(4, this, "int", option, "HRESULT")
        return result
    }

    /**
     * Sets the transaction time-out for a new transaction.
     * @remarks
     * If the transaction does not either commit or abort within the transaction time-out period, the transaction must automatically abort. This method is ignored if the new context enlists as a nonroot transaction or does not use transactions.
     * @param {Integer} ulTimeoutSec The transaction time-out, in seconds.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-transactiontimeout
     */
    TransactionTimeout(ulTimeoutSec) {
        result := ComCall(5, this, "uint", ulTimeoutSec, "HRESULT")
        return result
    }

    /**
     * Enables you to run the enclosed code in an existing transaction that you provide.
     * @remarks
     * When you bring your own transaction, that transaction's settings override the settings from the inherited methods of the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nn-comsvcs-iservicetransactionconfigbase">IServiceTransactionConfigBase</a> interface.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicetransactionconfig-configurebyot">IServiceTransactionConfig::ConfigureBYOT</a> and the <b>BringYourOwnTransaction</b> methods are identical in behavior; the only difference is the type of parameter passed to each method.
     * @param {PWSTR} szTipURL The Transaction Internet Protocol (TIP) URL of the existing transaction in which you want to run the enclosed code.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-bringyourowntransaction
     */
    BringYourOwnTransaction(szTipURL) {
        szTipURL := szTipURL is String ? StrPtr(szTipURL) : szTipURL

        result := ComCall(6, this, "ptr", szTipURL, "HRESULT")
        return result
    }

    /**
     * Sets the name that is used when transaction statistics are displayed.
     * @remarks
     * If you do not provide a description by using this method, the value of the <i>szTrackerCtxName</i> parameter from the <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicetrackerconfig-trackerconfig">IServiceTrackerConfig::TrackerConfig</a> method is used to describe the transaction.
     * @param {PWSTR} szTxDesc The description of the transaction.
     * @returns {HRESULT} This method can return the standard return values E_INVALIDARG, E_OUTOFMEMORY, E_FAIL, and S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-newtransactiondescription
     */
    NewTransactionDescription(szTxDesc) {
        szTxDesc := szTxDesc is String ? StrPtr(szTxDesc) : szTxDesc

        result := ComCall(7, this, "ptr", szTxDesc, "HRESULT")
        return result
    }
}
