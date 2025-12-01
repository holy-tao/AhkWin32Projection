#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains and manipulates both class definitions and class object instances.
 * @remarks
 * Users and providers should never implement this interface. The implementation provided by WMI is the only one 
 *      that is supported.
 * 
 * From the WMI client perspective, this interface is always in-process. Write 
 *      (<a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-put">Put</a>) operations only affect the local copy of the 
 *      object, and read (<a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemclassobject-get">Get</a>) operations always retrieve 
 *      values from the local copy. You can perform updates to WMI only when entire objects are read or written using 
 *      methods on the <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemservices">IWbemServices</a> interface. Examples of such 
 *      updates are: <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putinstance">IWbemServices::PutInstance</a> or 
 *      <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nf-wbemcli-iwbemservices-putclass">IWbemServices::PutClass</a>.
 * @see https://learn.microsoft.com/windows/win32/api/wbemcli/nn-wbemcli-iwbemclassobject
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemClassObject extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
