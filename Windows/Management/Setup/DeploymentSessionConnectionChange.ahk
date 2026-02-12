#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentSessionConnectionChange extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NoChange => 0

    /**
     * @type {Integer (Int32)}
     */
    static HostConnectionLost => 1

    /**
     * @type {Integer (Int32)}
     */
    static HostConnectionRestored => 2

    /**
     * @type {Integer (Int32)}
     */
    static AgentConnectionLost => 3

    /**
     * @type {Integer (Int32)}
     */
    static AgentConnectionRestored => 4

    /**
     * @type {Integer (Int32)}
     */
    static InternetConnectionLost => 5

    /**
     * @type {Integer (Int32)}
     */
    static InternetConnectionRestored => 6
}
