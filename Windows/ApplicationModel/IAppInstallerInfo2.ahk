#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\PackageVersion.ahk
#Include ..\Foundation\DateTime.ahk
#Include ..\Foundation\IReference.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\Foundation\Uri.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IAppInstallerInfo2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallerInfo2
     * @type {Guid}
     */
    static IID => Guid("{d20f1388-8256-597c-8511-c84ec50d5e2b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_OnLaunch", "get_HoursBetweenUpdateChecks", "get_ShowPrompt", "get_UpdateBlocksActivation", "get_AutomaticBackgroundTask", "get_ForceUpdateFromAnyVersion", "get_IsAutoRepairEnabled", "get_Version", "get_LastChecked", "get_PausedUntil", "get_UpdateUris", "get_RepairUris", "get_DependencyPackageUris", "get_OptionalPackageUris", "get_PolicySource"]

    /**
     * @type {Boolean} 
     */
    OnLaunch {
        get => this.get_OnLaunch()
    }

    /**
     * @type {Integer} 
     */
    HoursBetweenUpdateChecks {
        get => this.get_HoursBetweenUpdateChecks()
    }

    /**
     * @type {Boolean} 
     */
    ShowPrompt {
        get => this.get_ShowPrompt()
    }

    /**
     * @type {Boolean} 
     */
    UpdateBlocksActivation {
        get => this.get_UpdateBlocksActivation()
    }

    /**
     * @type {Boolean} 
     */
    AutomaticBackgroundTask {
        get => this.get_AutomaticBackgroundTask()
    }

    /**
     * @type {Boolean} 
     */
    ForceUpdateFromAnyVersion {
        get => this.get_ForceUpdateFromAnyVersion()
    }

    /**
     * @type {Boolean} 
     */
    IsAutoRepairEnabled {
        get => this.get_IsAutoRepairEnabled()
    }

    /**
     * @type {PackageVersion} 
     */
    Version {
        get => this.get_Version()
    }

    /**
     * @type {DateTime} 
     */
    LastChecked {
        get => this.get_LastChecked()
    }

    /**
     * @type {IReference<DateTime>} 
     */
    PausedUntil {
        get => this.get_PausedUntil()
    }

    /**
     * @type {IVectorView<Uri>} 
     */
    UpdateUris {
        get => this.get_UpdateUris()
    }

    /**
     * @type {IVectorView<Uri>} 
     */
    RepairUris {
        get => this.get_RepairUris()
    }

    /**
     * @type {IVectorView<Uri>} 
     */
    DependencyPackageUris {
        get => this.get_DependencyPackageUris()
    }

    /**
     * @type {IVectorView<Uri>} 
     */
    OptionalPackageUris {
        get => this.get_OptionalPackageUris()
    }

    /**
     * @type {Integer} 
     */
    PolicySource {
        get => this.get_PolicySource()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_OnLaunch() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HoursBetweenUpdateChecks() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ShowPrompt() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UpdateBlocksActivation() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_AutomaticBackgroundTask() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_ForceUpdateFromAnyVersion() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAutoRepairEnabled() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {PackageVersion} 
     */
    get_Version() {
        value := PackageVersion()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_LastChecked() {
        value := DateTime()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_PausedUntil() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_UpdateUris() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Uri, value)
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_RepairUris() {
        result := ComCall(17, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Uri, value)
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_DependencyPackageUris() {
        result := ComCall(18, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Uri, value)
    }

    /**
     * 
     * @returns {IVectorView<Uri>} 
     */
    get_OptionalPackageUris() {
        result := ComCall(19, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Uri, value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PolicySource() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
