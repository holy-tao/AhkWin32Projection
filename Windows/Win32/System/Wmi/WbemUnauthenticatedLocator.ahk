#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The IWbemLocator::ConnectServer method creates a connection through DCOM to a WMI namespace on the computer specified in the strNetworkResource parameter.
 * @remarks
 * Do not specify <i>strUser</i>, <i>strPassword</i>, or <i>strAuthority</i>  when making a connection to a local namespace. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/connecting-to-wmi-on-a-remote-computer">Connecting to WMI on a Remote Computer</a>.
 * 
 * For more information on how to use <b>ConnectServer</b>, see <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/creating-a-connection-to-a-wmi-namespace">Creating a Connection to a WMI Namespace</a>. Note that the connection to <a href="https://docs.microsoft.com/windows/desktop/api/wbemcli/nn-wbemcli-iwbemlocator">IWbemLocator</a> is one of the connections that you must shut down at the end of your application, as described in <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/cleaning-up-and-shutting-down-a-wmi-application">Cleaning up and Shutting Down a WMI Application</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/wbemcli/nf-wbemcli-iwbemlocator-connectserver
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemUnauthenticatedLocator extends Win32Struct
{
    static sizeof => 0

    static packingSize => 1
}
