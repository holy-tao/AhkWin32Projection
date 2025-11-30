#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines a security flag that is used as a parameter in calls to the SWbemLocator.ConnectServer method when a connection to WMI on a remote machine is failing.
 * @see https://docs.microsoft.com/windows/win32/api//wbemdisp/ne-wbemdisp-wbemconnectoptionsenum
 * @namespace Windows.Win32.System.Wmi
 * @version v4.0.30319
 */
class WbemConnectOptionsEnum extends Win32Enum{

    /**
     * Shortens the timeout for the <a href="https://docs.microsoft.com/windows/desktop/WmiSdk/swbemlocator-connectserver">SWbemLocator.ConnectServer</a> method call to two minutes.
     * @type {Integer (Int32)}
     */
    static wbemConnectFlagUseMaxWait => 128
}
