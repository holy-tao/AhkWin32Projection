#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IGPMWMIFilter interface contains methods that allow you to set and retrieve security attributes and various properties for a WMI filter. WMI filter queries are specified using WMI Query Language (WQL).
 * @remarks
 * For information about importing, exporting, and copying WMI filters, see the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-getobjecttext">IWbemClassObject::GetObjectText</a> and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-imofcompiler-compilebuffer">IMofCompiler::CompileBuffer</a> methods in the WMI SDK.
 * @see https://learn.microsoft.com/windows/win32/api/gpmgmt/nn-gpmgmt-igpmwmifilter
 * @namespace Windows.Win32.System.GroupPolicy
 * @version v4.0.30319
 */
class GPMWMIFilter extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
