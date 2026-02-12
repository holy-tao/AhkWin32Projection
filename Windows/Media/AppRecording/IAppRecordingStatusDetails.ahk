#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.AppRecording
 * @version WindowsRuntime 1.4
 */
class IAppRecordingStatusDetails extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAppRecordingStatusDetails
     * @type {Guid}
     */
    static IID => Guid("{b538a9b0-14ed-4412-ac45-6d672c9c9949}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsAnyAppBroadcasting", "get_IsCaptureResourceUnavailable", "get_IsGameStreamInProgress", "get_IsTimeSpanRecordingDisabled", "get_IsGpuConstrained", "get_IsAppInactive", "get_IsBlockedForApp", "get_IsDisabledByUser", "get_IsDisabledBySystem"]

    /**
     * @type {Boolean} 
     */
    IsAnyAppBroadcasting {
        get => this.get_IsAnyAppBroadcasting()
    }

    /**
     * @type {Boolean} 
     */
    IsCaptureResourceUnavailable {
        get => this.get_IsCaptureResourceUnavailable()
    }

    /**
     * @type {Boolean} 
     */
    IsGameStreamInProgress {
        get => this.get_IsGameStreamInProgress()
    }

    /**
     * @type {Boolean} 
     */
    IsTimeSpanRecordingDisabled {
        get => this.get_IsTimeSpanRecordingDisabled()
    }

    /**
     * @type {Boolean} 
     */
    IsGpuConstrained {
        get => this.get_IsGpuConstrained()
    }

    /**
     * @type {Boolean} 
     */
    IsAppInactive {
        get => this.get_IsAppInactive()
    }

    /**
     * @type {Boolean} 
     */
    IsBlockedForApp {
        get => this.get_IsBlockedForApp()
    }

    /**
     * @type {Boolean} 
     */
    IsDisabledByUser {
        get => this.get_IsDisabledByUser()
    }

    /**
     * @type {Boolean} 
     */
    IsDisabledBySystem {
        get => this.get_IsDisabledBySystem()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsAnyAppBroadcasting() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsCaptureResourceUnavailable() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsGameStreamInProgress() {
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
    get_IsTimeSpanRecordingDisabled() {
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
    get_IsGpuConstrained() {
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
    get_IsAppInactive() {
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
    get_IsBlockedForApp() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledByUser() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsDisabledBySystem() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
