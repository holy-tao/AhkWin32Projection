#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates the COM+ partition on which the enclosed context runs.
 * @remarks
 * 
 * This enumeration is used to specify the working COM+ partition through <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> for either the work submitted through the activity created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> or the work that is enclosed between calls to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coleaveservicedomain">CoLeaveServiceDomain</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ne-comsvcs-csc_partitionconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CSC_PartitionConfig extends Win32Enum{

    /**
     * The enclosed context runs on the Base Application Partition. This is the default setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Ignore.
     * @type {Integer (Int32)}
     */
    static CSC_NoPartition => 0

    /**
     * The enclosed context runs in the current containing COM+ partition. This is the default setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Inherit.
     * @type {Integer (Int32)}
     */
    static CSC_InheritPartition => 1

    /**
     * The enclosed context runs in a COM+ partition that is different from the current containing partition.
     * @type {Integer (Int32)}
     */
    static CSC_NewPartition => 2
}
