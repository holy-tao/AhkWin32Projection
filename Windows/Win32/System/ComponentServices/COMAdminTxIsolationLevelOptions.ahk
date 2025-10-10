#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the isolation level that is to be used for transactions.
 * @remarks
 * 
  * This enumeration is used to configure the transaction isolation level for components that use transactions. It is also used to configure the isolation level for using the transaction service without components by being passed as a parameter to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iservicetransactionconfigbase-isolationlevel">IServiceTransactionConfigBase::IsolationLevel</a>. This method is called through <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> for either the work submitted through the activity created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> or the work that is enclosed between calls to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coleaveservicedomain">CoLeaveServiceDomain</a>.
  * 
  * If a downstream component is configured with a higher isolation level than an upstream component and attempts to enlist in a transaction, an error results and the transaction aborts.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//comadmin/ne-comadmin-comadmintxisolationleveloptions
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class COMAdminTxIsolationLevelOptions{

    /**
     * Any isolation level is supported. A downstream component that has this isolation level always uses the same isolation level that its immediate upstream component uses. If the root object in a transaction has its isolation level configured to COMAdminTxIsolationLevelAny, its isolation level becomes COMAdminTxIsolationLevelSerializable.
     * @type {Integer (Int32)}
     */
    static COMAdminTxIsolationLevelAny => 0

    /**
     * A transaction can read any data, even if it is being modified by another transaction. Any type of new data can be inserted during a transaction. This is the least safe isolation level but allows the highest concurrency.
     * @type {Integer (Int32)}
     */
    static COMAdminTxIsolationLevelReadUnCommitted => 1

    /**
     * A transaction cannot read data that is being modified by another transaction that has not committed. Any type of new data can be inserted during a transaction. This is the default isolation level in Microsoft SQL Server.
     * @type {Integer (Int32)}
     */
    static COMAdminTxIsolationLevelReadCommitted => 2

    /**
     * Data read by a current transaction cannot be changed by another transaction until the current transaction finishes. Any type of new data can be inserted during a transaction.
     * @type {Integer (Int32)}
     */
    static COMAdminTxIsolationLevelRepeatableRead => 3

    /**
     * Data read by a current transaction cannot be changed by another transaction until the current transaction finishes. No new data can be inserted that would affect the current transaction. This is the safest isolation level and is the default, but allows the lowest level of concurrency.
     * @type {Integer (Int32)}
     */
    static COMAdminTxIsolationLevelSerializable => 4
}
