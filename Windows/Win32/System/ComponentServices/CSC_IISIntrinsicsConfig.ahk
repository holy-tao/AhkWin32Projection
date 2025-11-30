#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Indicates whether the current IIS intrinsics are propagated into the new context.
 * @remarks
 * 
 * This enumeration is used to configure the IIS intrinsics settings through <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> for either the work submitted through the activity created by <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-cocreateactivity">CoCreateActivity</a> or the work that is enclosed between calls to <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coenterservicedomain">CoEnterServiceDomain</a> and <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/nf-comsvcs-coleaveservicedomain">CoLeaveServiceDomain</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//comsvcs/ne-comsvcs-csc_iisintrinsicsconfig
 * @namespace Windows.Win32.System.ComponentServices
 * @version v4.0.30319
 */
class CSC_IISIntrinsicsConfig extends Win32Enum{

    /**
     * The current IIS intrinsics do not propagate to the new context. This is the default setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Ignore.
     * @type {Integer (Int32)}
     */
    static CSC_NoIISIntrinsics => 0

    /**
     * The current IIS intrinsics propagate to the new context. This is the default setting for <a href="https://docs.microsoft.com/windows/desktop/cossdk/cserviceconfig">CServiceConfig</a> when <a href="https://docs.microsoft.com/windows/desktop/api/comsvcs/ne-comsvcs-csc_inheritanceconfig">CSC_InheritanceConfig</a> is set to CSC_Inherit.
     * @type {Integer (Int32)}
     */
    static CSC_InheritIISIntrinsics => 1
}
