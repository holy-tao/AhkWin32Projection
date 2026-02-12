#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\ApplicationModel\PackageVersion.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Deployment
 * @version WindowsRuntime 1.4
 */
class IAutoUpdateSettingsOptions extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAutoUpdateSettingsOptions
     * @type {Guid}
     */
    static IID => Guid("{67491d87-35e1-512a-8968-1ae88d1be6d3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Version", "put_Version", "get_AppInstallerUri", "put_AppInstallerUri", "get_OnLaunch", "put_OnLaunch", "get_HoursBetweenUpdateChecks", "put_HoursBetweenUpdateChecks", "get_ShowPrompt", "put_ShowPrompt", "get_UpdateBlocksActivation", "put_UpdateBlocksActivation", "get_AutomaticBackgroundTask", "put_AutomaticBackgroundTask", "get_ForceUpdateFromAnyVersion", "put_ForceUpdateFromAnyVersion", "get_IsAutoRepairEnabled", "put_IsAutoRepairEnabled", "get_UpdateUris", "get_RepairUris", "get_DependencyPackageUris", "get_OptionalPackageUris"]

    /**
     * @type {PackageVersion} 
     */
    Version {
        get => this.get_Version()
        set => this.put_Version(value)
    }

    /**
     * @type {Uri} 
     */
    AppInstallerUri {
        get => this.get_AppInstallerUri()
        set => this.put_AppInstallerUri(value)
    }

    /**
     * @type {Boolean} 
     */
    OnLaunch {
        get => this.get_OnLaunch()
        set => this.put_OnLaunch(value)
    }

    /**
     * @type {Integer} 
     */
    HoursBetweenUpdateChecks {
        get => this.get_HoursBetweenUpdateChecks()
        set => this.put_HoursBetweenUpdateChecks(value)
    }

    /**
     * @type {Boolean} 
     */
    ShowPrompt {
        get => this.get_ShowPrompt()
        set => this.put_ShowPrompt(value)
    }

    /**
     * @type {Boolean} 
     */
    UpdateBlocksActivation {
        get => this.get_UpdateBlocksActivation()
        set => this.put_UpdateBlocksActivation(value)
    }

    /**
     * @type {Boolean} 
     */
    AutomaticBackgroundTask {
        get => this.get_AutomaticBackgroundTask()
        set => this.put_AutomaticBackgroundTask(value)
    }

    /**
     * @type {Boolean} 
     */
    ForceUpdateFromAnyVersion {
        get => this.get_ForceUpdateFromAnyVersion()
        set => this.put_ForceUpdateFromAnyVersion(value)
    }

    /**
     * @type {Boolean} 
     */
    IsAutoRepairEnabled {
        get => this.get_IsAutoRepairEnabled()
        set => this.put_IsAutoRepairEnabled(value)
    }

    /**
     * @type {IVector<Uri>} 
     */
    UpdateUris {
        get => this.get_UpdateUris()
    }

    /**
     * @type {IVector<Uri>} 
     */
    RepairUris {
        get => this.get_RepairUris()
    }

    /**
     * @type {IVector<Uri>} 
     */
    DependencyPackageUris {
        get => this.get_DependencyPackageUris()
    }

    /**
     * @type {IVector<Uri>} 
     */
    OptionalPackageUris {
        get => this.get_OptionalPackageUris()
    }

    /**
     * 
     * @returns {PackageVersion} 
     */
    get_Version() {
        value := PackageVersion()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {PackageVersion} value 
     * @returns {HRESULT} 
     */
    put_Version(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_AppInstallerUri() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @param {Uri} value 
     * @returns {HRESULT} 
     */
    put_AppInstallerUri(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OnLaunch() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_OnLaunch(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoursBetweenUpdateChecks() {
        result := ComCall(12, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_HoursBetweenUpdateChecks(value) {
        result := ComCall(13, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowPrompt() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ShowPrompt(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UpdateBlocksActivation() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UpdateBlocksActivation(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutomaticBackgroundTask() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_AutomaticBackgroundTask(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUpdateFromAnyVersion() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_ForceUpdateFromAnyVersion(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutoRepairEnabled() {
        result := ComCall(22, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsAutoRepairEnabled(value) {
        result := ComCall(23, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_UpdateUris() {
        result := ComCall(24, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_RepairUris() {
        result := ComCall(25, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_DependencyPackageUris() {
        result := ComCall(26, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }

    /**
     * 
     * @returns {IVector<Uri>} 
     */
    get_OptionalPackageUris() {
        result := ComCall(27, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(Uri, value)
    }
}
