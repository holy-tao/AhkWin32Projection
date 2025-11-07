#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates how synchronization is configured for CServiceConfig.
 * @remarks
 * 
 * This enumeration is used to configure synchronization through <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> for either the work submitted through the activity created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> or the work that is enclosed between calls to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coleaveservicedomain">CoLeaveServiceDomain</a>.
 * 
 * Synchronization can affect the components created by the contained code even if it has no immediate impact on the contained code itself. For example, if the same code is running on two different threads and this code calls <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> asking for synchronization services, each thread is contained in its own synchronization domain.
 * 
 * If it is incompatible with the transaction setting from <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_transactionconfig">CSC_TransactionConfig</a>, the synchronization setting is increased to the minimum that is required for the transaction.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ne-comsvcs-csc_synchronizationconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CSC_SynchronizationConfig{

    /**
     * The code is forced to run unsynchronized. This is the default synchronization setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Ignore.
     * @type {Integer (Int32)}
     */
    static CSC_NoSynchronization => 0

    /**
     * The code runs in the containing synchronization domain if one exists. This is the default synchronization setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Inherit.
     * @type {Integer (Int32)}
     */
    static CSC_IfContainerIsSynchronized => 1

    /**
     * Synchronization is always used. The existing synchronization domain is used, or if the enclosed context does not already use synchronization, a new synchronization domain is created.
     * @type {Integer (Int32)}
     */
    static CSC_NewSynchronizationIfNecessary => 2

    /**
     * A new synchronization domain is always created.
     * @type {Integer (Int32)}
     */
    static CSC_NewSynchronization => 3
}
