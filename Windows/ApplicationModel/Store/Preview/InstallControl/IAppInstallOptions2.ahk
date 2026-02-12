#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallOptions2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallOptions2
     * @type {Guid}
     */
    static IID => Guid("{8a04c0d7-c94b-425e-95b4-bf27faeaee89}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinToDesktopAfterInstall", "put_PinToDesktopAfterInstall", "get_PinToStartAfterInstall", "put_PinToStartAfterInstall", "get_PinToTaskbarAfterInstall", "put_PinToTaskbarAfterInstall", "get_CompletedInstallToastNotificationMode", "put_CompletedInstallToastNotificationMode", "get_InstallInProgressToastNotificationMode", "put_InstallInProgressToastNotificationMode", "get_InstallForAllUsers", "put_InstallForAllUsers", "get_StageButDoNotInstall", "put_StageButDoNotInstall", "get_CampaignId", "put_CampaignId", "get_ExtendedCampaignId", "put_ExtendedCampaignId"]

    /**
     * @type {Boolean} 
     */
    PinToDesktopAfterInstall {
        get => this.get_PinToDesktopAfterInstall()
        set => this.put_PinToDesktopAfterInstall(value)
    }

    /**
     * @type {Boolean} 
     */
    PinToStartAfterInstall {
        get => this.get_PinToStartAfterInstall()
        set => this.put_PinToStartAfterInstall(value)
    }

    /**
     * @type {Boolean} 
     */
    PinToTaskbarAfterInstall {
        get => this.get_PinToTaskbarAfterInstall()
        set => this.put_PinToTaskbarAfterInstall(value)
    }

    /**
     * @type {Integer} 
     */
    CompletedInstallToastNotificationMode {
        get => this.get_CompletedInstallToastNotificationMode()
        set => this.put_CompletedInstallToastNotificationMode(value)
    }

    /**
     * @type {Integer} 
     */
    InstallInProgressToastNotificationMode {
        get => this.get_InstallInProgressToastNotificationMode()
        set => this.put_InstallInProgressToastNotificationMode(value)
    }

    /**
     * @type {Boolean} 
     */
    InstallForAllUsers {
        get => this.get_InstallForAllUsers()
        set => this.put_InstallForAllUsers(value)
    }

    /**
     * @type {Boolean} 
     */
    StageButDoNotInstall {
        get => this.get_StageButDoNotInstall()
        set => this.put_StageButDoNotInstall(value)
    }

    /**
     * @type {HSTRING} 
     */
    CampaignId {
        get => this.get_CampaignId()
        set => this.put_CampaignId(value)
    }

    /**
     * @type {HSTRING} 
     */
    ExtendedCampaignId {
        get => this.get_ExtendedCampaignId()
        set => this.put_ExtendedCampaignId(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PinToDesktopAfterInstall() {
        result := ComCall(6, this, "int*", &value := 0, "int")
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
    put_PinToDesktopAfterInstall(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PinToStartAfterInstall() {
        result := ComCall(8, this, "int*", &value := 0, "int")
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
    put_PinToStartAfterInstall(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PinToTaskbarAfterInstall() {
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
    put_PinToTaskbarAfterInstall(value) {
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
    get_CompletedInstallToastNotificationMode() {
        result := ComCall(12, this, "int*", &value := 0, "int")
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
    put_CompletedInstallToastNotificationMode(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_InstallInProgressToastNotificationMode() {
        result := ComCall(14, this, "int*", &value := 0, "int")
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
    put_InstallInProgressToastNotificationMode(value) {
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
    get_InstallForAllUsers() {
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
    put_InstallForAllUsers(value) {
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
    get_StageButDoNotInstall() {
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
    put_StageButDoNotInstall(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_CampaignId() {
        value := HSTRING()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_CampaignId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ExtendedCampaignId() {
        value := HSTRING()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ExtendedCampaignId(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
