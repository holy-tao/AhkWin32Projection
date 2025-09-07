#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates whether to create a new context based on the current context or to create a new context based solely upon the information in CServiceConfig.
 * @remarks
 * The different values of this enumeration can be used to establish the default configurations for the various services provided through <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a>. The default inheritance configuration for <b>CServiceConfig</b> is CSC_Ignore. It is often useful to use CSC_Ignore when calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a>, while CSC_Inherit is useful when augmenting an existing context, such as when calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a>.
  * 
  * Calling <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-iserviceinheritanceconfig-containingcontexttreatment">IServiceInheritanceConfig::ContainingContextTreatment</a> overwrites any previous configuration settings of the <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> object with the following defaults.
  * 
  * <h3><a id="For_CSC_InheritanceConfig_set_to_CSC_Inherit"></a><a id="for_csc_inheritanceconfig_set_to_csc_inherit"></a><a id="FOR_CSC_INHERITANCECONFIG_SET_TO_CSC_INHERIT"></a>For CSC_InheritanceConfig set to CSC_Inherit</h3>
  * <table>
  * <tr>
  * <th>Enumeration</th>
  * <th>Default</th>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_comtiintrinsicsconfig">CSC_COMTIIntrinsicsConfig</a>
  * </td>
  * <td>CSC_InheritCOMTIIntrinsics</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_iisintrinsicsconfig">CSC_IISIntrinsicsConfig</a>
  * </td>
  * <td>CSC_InheritIISIntrinsics</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_partitionconfig">CSC_PartitionConfig</a>
  * </td>
  * <td>CSC_InheritPartition</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_sxsconfig">CSC_SxsConfig</a>
  * </td>
  * <td>CSC_InheritSxs</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_synchronizationconfig">CSC_SynchronizationConfig</a>
  * </td>
  * <td>CSC_IfContainerIsSynchronized</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_threadpool">CSC_ThreadPool</a>
  * </td>
  * <td>CSC_ThreadPoolInherit</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_transactionconfig">CSC_TransactionConfig</a>
  * </td>
  * <td>CSC_IfContainerIsTransactional</td>
  * </tr>
  * </table>
  *  
  * 
  * <h3><a id="For_CSC_InheritanceConfig_set_to_CSC_Ignore"></a><a id="for_csc_inheritanceconfig_set_to_csc_ignore"></a><a id="FOR_CSC_INHERITANCECONFIG_SET_TO_CSC_IGNORE"></a>For CSC_InheritanceConfig set to CSC_Ignore</h3>
  * <table>
  * <tr>
  * <th>Enumeration</th>
  * <th>Default</th>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_comtiintrinsicsconfig">CSC_COMTIIntrinsicsConfig</a>
  * </td>
  * <td>CSC_NoCOMTIIntrinsics</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_iisintrinsicsconfig">CSC_IISIntrinsicsConfig</a>
  * </td>
  * <td>CSC_NoIISIntrinsics</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_partitionconfig">CSC_PartitionConfig</a>
  * </td>
  * <td>CSC_NoPartition</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_sxsconfig">CSC_SxsConfig</a>
  * </td>
  * <td>CSC_NoSxs</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_synchronizationconfig">CSC_SynchronizationConfig</a>
  * </td>
  * <td>CSC_NoSynchronization</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_threadpool">CSC_ThreadPool</a>
  * </td>
  * <td>CSC_ThreadPoolNone</td>
  * </tr>
  * <tr>
  * <td>
  * <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_transactionconfig">CSC_TransactionConfig</a>
  * </td>
  * <td>CSC_NoTransaction</td>
  * </tr>
  * </table>
 * @see https://learn.microsoft.com/windows/win32/api/comsvcs/ne-comsvcs-csc_inheritanceconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CSC_InheritanceConfig{

    /**
     * The new context is created from the existing context.
     * @type {Integer (Int32)}
     */
    static CSC_Inherit => 0

    /**
     * The new context is created from the default context.
     * @type {Integer (Int32)}
     */
    static CSC_Ignore => 1
}
