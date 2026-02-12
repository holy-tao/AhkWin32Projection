#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Enum.ahk

/**
 * Represents the state of a deployment request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deploymentprogressstate
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class DeploymentProgressState extends Win32Enum{

    /**
     * The deployment request is queued.
     * @type {Integer (Int32)}
     */
    static Queued => 0

    /**
     * The deployment request is being processed.
     * @type {Integer (Int32)}
     */
    static Processing => 1
}
