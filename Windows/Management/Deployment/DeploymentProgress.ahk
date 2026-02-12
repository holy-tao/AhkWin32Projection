#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32Struct.ahk

/**
 * Contains progress information for the deployment request.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.management.deployment.deploymentprogress
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class DeploymentProgress extends Win32Struct
{
    static sizeof => 8

    static packingSize => 4

    /**
     * The progress state of the deployment request.
     * @type {Integer}
     */
    state {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The progress percentage of the deployment request.
     * @type {Integer}
     */
    percentage {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }
}
