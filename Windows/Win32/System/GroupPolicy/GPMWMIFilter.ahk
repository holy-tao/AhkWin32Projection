#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The IGPMWMIFilter interface contains methods that allow you to set and retrieve security attributes and various properties for a WMI filter. WMI filter queries are specified using WMI Query Language (WQL).
 * @remarks
 * For information about importing, exporting, and copying WMI filters, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-getobjecttext">IWbemClassObject::GetObjectText</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-imofcompiler-compilebuffer">IMofCompiler::CompileBuffer</a> methods in the WMI SDK.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmwmifilter
 * @namespace Windows.Win32.System.GroupPolicy
 */
export default struct GPMWMIFilter {
    #StructPack 1

}
