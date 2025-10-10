#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates how transactions are configured for CServiceConfig.
 * @remarks
 * 
  * This enumeration is used to configure transactions through <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> for either the work submitted through the activity created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> or the work that is enclosed between calls to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coleaveservicedomain">CoLeaveServiceDomain</a>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ne-comsvcs-csc_transactionconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CSC_TransactionConfig{

    /**
     * Transactions are never used within the enclosed context. This is the default transaction setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Ignore.
     * @type {Integer (Int32)}
     */
    static CSC_NoTransaction => 0

    /**
     * Transactions are used only if the enclosed context is using a transaction; a new transaction is never created. This is the default transaction setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Inherit.
     * @type {Integer (Int32)}
     */
    static CSC_IfContainerIsTransactional => 1

    /**
     * Transactions are always used. The existing transaction is used, or if the enclosed context does not already use transactions, a new transaction is created.
     * @type {Integer (Int32)}
     */
    static CSC_CreateTransactionIfNecessary => 2

    /**
     * A new transaction is always created.
     * @type {Integer (Int32)}
     */
    static CSC_NewTransaction => 3
}
