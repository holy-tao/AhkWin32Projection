#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.Preview.InstallControl
 * @version WindowsRuntime 1.4
 */
class IAppInstallItem5 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppInstallItem5
     * @type {Guid}
     */
    static IID => Guid("{5510e7cc-4076-4a0b-9472-c21d9d380e55}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PinToDesktopAfterInstall", "put_PinToDesktopAfterInstall", "get_PinToStartAfterInstall", "put_PinToStartAfterInstall", "get_PinToTaskbarAfterInstall", "put_PinToTaskbarAfterInstall", "get_CompletedInstallToastNotificationMode", "put_CompletedInstallToastNotificationMode", "get_InstallInProgressToastNotificationMode", "put_InstallInProgressToastNotificationMode"]

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
}
