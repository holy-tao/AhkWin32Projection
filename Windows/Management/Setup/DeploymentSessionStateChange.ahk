#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class DeploymentSessionStateChange extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static NoChange => 0

    /**
     * @type {Integer (Int32)}
     */
    static CancelRequestedByUser => 1

    /**
     * @type {Integer (Int32)}
     */
    static RetryRequestedByUser => 2
}
