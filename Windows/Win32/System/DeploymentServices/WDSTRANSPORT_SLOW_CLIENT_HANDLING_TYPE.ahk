#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/wdstptmgmt/ne-wdstptmgmt-wdstransport_slow_client_handling_type
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDSTRANSPORT_SLOW_CLIENT_HANDLING_TYPE extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static WdsTptSlowClientHandlingUnknown => 0

    /**
     * @type {Integer (Int32)}
     */
    static WdsTptSlowClientHandlingNone => 1

    /**
     * @type {Integer (Int32)}
     */
    static WdsTptSlowClientHandlingAutoDisconnect => 2

    /**
     * @type {Integer (Int32)}
     */
    static WdsTptSlowClientHandlingMultistream => 3
}
