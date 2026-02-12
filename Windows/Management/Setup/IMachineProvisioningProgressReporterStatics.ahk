#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\MachineProvisioningProgressReporter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Setup
 * @version WindowsRuntime 1.4
 */
class IMachineProvisioningProgressReporterStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMachineProvisioningProgressReporterStatics
     * @type {Guid}
     */
    static IID => Guid("{77682c17-5da3-51fc-a042-c7b53458ddb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetForLaunchUri"]

    /**
     * 
     * @param {Uri} launchUri 
     * @param {DeploymentSessionHeartbeatRequested} heartbeatHandler 
     * @returns {MachineProvisioningProgressReporter} 
     */
    GetForLaunchUri(launchUri, heartbeatHandler) {
        result := ComCall(6, this, "ptr", launchUri, "ptr", heartbeatHandler, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MachineProvisioningProgressReporter(result_)
    }
}
