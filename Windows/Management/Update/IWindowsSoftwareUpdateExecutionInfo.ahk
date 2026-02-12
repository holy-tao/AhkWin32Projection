#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\WindowsSoftwareUpdateActionInfo.ahk
#Include .\WindowsSoftwareUpdateOptionalActionInfo.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsSoftwareUpdateExecutionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsSoftwareUpdateExecutionInfo
     * @type {Guid}
     */
    static IID => Guid("{091aea19-9128-5f24-afc1-a62252df55c0}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DownloadInfo", "get_InstallInfo", "get_DeployInfo", "get_OptionalActionInfo"]

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    DownloadInfo {
        get => this.get_DownloadInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    InstallInfo {
        get => this.get_InstallInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateActionInfo} 
     */
    DeployInfo {
        get => this.get_DeployInfo()
    }

    /**
     * @type {WindowsSoftwareUpdateOptionalActionInfo} 
     */
    OptionalActionInfo {
        get => this.get_OptionalActionInfo()
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateActionInfo} 
     */
    get_DownloadInfo() {
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
    get_InstallInfo() {
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
    get_DeployInfo() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateActionInfo(value)
    }

    /**
     * 
     * @returns {WindowsSoftwareUpdateOptionalActionInfo} 
     */
    get_OptionalActionInfo() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WindowsSoftwareUpdateOptionalActionInfo(value)
    }
}
