#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVector.ahk
#Include .\AppResourceGroupBackgroundTaskReport.ahk
#Include .\AppResourceGroupMemoryReport.ahk
#Include Diagnostics\ProcessDiagnosticInfo.ahk
#Include .\AppResourceGroupStateReport.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IAppResourceGroupInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppResourceGroupInfo
     * @type {Guid}
     */
    static IID => Guid("{b913f77a-e807-49f4-845e-7b8bdcfe8ee7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_InstanceId", "get_IsShared", "GetBackgroundTaskReports", "GetMemoryReport", "GetProcessDiagnosticInfos", "GetStateReport"]

    /**
     * @type {Guid} 
     */
    InstanceId {
        get => this.get_InstanceId()
    }

    /**
     * @type {Boolean} 
     */
    IsShared {
        get => this.get_IsShared()
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_InstanceId() {
        value := Guid()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsShared() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<AppResourceGroupBackgroundTaskReport>} 
     */
    GetBackgroundTaskReports() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(AppResourceGroupBackgroundTaskReport, result_)
    }

    /**
     * 
     * @returns {AppResourceGroupMemoryReport} 
     */
    GetMemoryReport() {
        result := ComCall(9, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppResourceGroupMemoryReport(result_)
    }

    /**
     * 
     * @returns {IVector<ProcessDiagnosticInfo>} 
     */
    GetProcessDiagnosticInfos() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(ProcessDiagnosticInfo, result_)
    }

    /**
     * 
     * @returns {AppResourceGroupStateReport} 
     */
    GetStateReport() {
        result := ComCall(11, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AppResourceGroupStateReport(result_)
    }
}
