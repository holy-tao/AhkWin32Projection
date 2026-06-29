#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IGPMConstants interface supports methods that retrieve the value of multiple Group Policy Management Console (GPMC) constants. To create a GPMConstants object, call the IGPM::GetConstants method.
 * @remarks
 * Properties that begin with <b>PermGPO</b> apply only to GPOs. Properties that begin with <b>PermWMIFilter</b> apply only to Windows Management Instrumentation (WMI) filters.
 * 
 * For more information about policy-related permissions, see 
 * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/gpmgmt/nf-gpmgmt-igpm-createpermission">IGPM::CreatePermission</a> (<b>GPM.CreatePermission</b>).
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmconstants
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPMConstants {
    #StructPack 1

}
