#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\AudioStateMonitor.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class IAudioStateMonitorStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IAudioStateMonitorStatics
     * @type {Guid}
     */
    static IID => Guid("{6374ea4c-1b3b-4001-94d9-dd225330fa40}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateForRenderMonitoring", "CreateForRenderMonitoringWithCategory", "CreateForRenderMonitoringWithCategoryAndDeviceRole", "CreateForRenderMonitoringWithCategoryAndDeviceId", "CreateForCaptureMonitoring", "CreateForCaptureMonitoringWithCategory", "CreateForCaptureMonitoringWithCategoryAndDeviceRole", "CreateForCaptureMonitoringWithCategoryAndDeviceId"]

    /**
     * 
     * @returns {AudioStateMonitor} 
     */
    CreateForRenderMonitoring() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStateMonitor(result_)
    }

    /**
     * 
     * @param {Integer} category 
     * @returns {AudioStateMonitor} 
     */
    CreateForRenderMonitoringWithCategory(category) {
        result := ComCall(7, this, "int", category, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStateMonitor(result_)
    }

    /**
     * 
     * @param {Integer} category 
     * @param {Integer} role 
     * @returns {AudioStateMonitor} 
     */
    CreateForRenderMonitoringWithCategoryAndDeviceRole(category, role) {
        result := ComCall(8, this, "int", category, "int", role, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStateMonitor(result_)
    }

    /**
     * 
     * @param {Integer} category 
     * @param {HSTRING} deviceId 
     * @returns {AudioStateMonitor} 
     */
    CreateForRenderMonitoringWithCategoryAndDeviceId(category, deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(9, this, "int", category, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStateMonitor(result_)
    }

    /**
     * 
     * @returns {AudioStateMonitor} 
     */
    CreateForCaptureMonitoring() {
        result := ComCall(10, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStateMonitor(result_)
    }

    /**
     * 
     * @param {Integer} category 
     * @returns {AudioStateMonitor} 
     */
    CreateForCaptureMonitoringWithCategory(category) {
        result := ComCall(11, this, "int", category, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStateMonitor(result_)
    }

    /**
     * 
     * @param {Integer} category 
     * @param {Integer} role 
     * @returns {AudioStateMonitor} 
     */
    CreateForCaptureMonitoringWithCategoryAndDeviceRole(category, role) {
        result := ComCall(12, this, "int", category, "int", role, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStateMonitor(result_)
    }

    /**
     * 
     * @param {Integer} category 
     * @param {HSTRING} deviceId 
     * @returns {AudioStateMonitor} 
     */
    CreateForCaptureMonitoringWithCategoryAndDeviceId(category, deviceId) {
        if(deviceId is String) {
            pin := HSTRING.Create(deviceId)
            deviceId := pin.Value
        }
        deviceId := deviceId is Win32Handle ? NumGet(deviceId, "ptr") : deviceId

        result := ComCall(13, this, "int", category, "ptr", deviceId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return AudioStateMonitor(result_)
    }
}
