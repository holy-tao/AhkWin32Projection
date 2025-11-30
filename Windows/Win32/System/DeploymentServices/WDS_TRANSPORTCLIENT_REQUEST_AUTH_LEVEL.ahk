#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.System.DeploymentServices
 * @version v4.0.30319
 */
class WDS_TRANSPORTCLIENT_REQUEST_AUTH_LEVEL extends Win32Enum{

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_AUTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static WDS_TRANSPORTCLIENT_NO_AUTH => 2
}
