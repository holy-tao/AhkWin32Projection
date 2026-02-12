#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowsSoftwareUpdateActionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateOptionalActionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateOptionalActionInfo
     * @type {Guid}
     */
    static IID => Guid("{4ac035d0-e50e-5ccb-bfd8-a303562891d2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CloseAndDeployInfo", "get_CloseAndInstallInfo", "get_CloseAndRestartInfo"]

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    CloseAndDeployInfo {
        get => this.get_CloseAndDeployInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    CloseAndInstallInfo {
        get => this.get_CloseAndInstallInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    CloseAndRestartInfo {
        get => this.get_CloseAndRestartInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    get_CloseAndDeployInfo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateActionInfo(value)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    get_CloseAndInstallInfo() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateActionInfo(value)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    get_CloseAndRestartInfo() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateActionInfo(value)
    }
}
