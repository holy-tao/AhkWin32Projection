#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Storage.OfflineFiles
 */

;@region Functions
/**
 * Enables or disables the Offline Files feature.
 * @remarks
 * The Offline Files feature is implemented in two parts, the Offline Files service and the CSC driver.  When the  Offline Files feature is enabled, this means that the CSC driver's start type is set to SERVICE_SYSTEM_START and the Offline Files service's start type is set to SERVICE_AUTO_START.  If the driver is not already running, the caller must restart the computer after calling this method.
 * 
 * Disabling Offline Files disables both the service and the driver.  To disable the feature, the caller must restart the computer after calling this method.
 * 
 * The caller must be an administrator on the local computer.
 * @param {BOOL} bEnable Specify <b>TRUE</b> to enable Offline Files, or <b>FALSE</b> to disable.
 * @param {Pointer<BOOL>} pbRebootRequired Receives <b>TRUE</b> if a system restart is necessary to apply the desired configuration, or <b>FALSE</b> otherwise.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/cscapi/nf-cscapi-offlinefilesenable
 * @since windows6.0.6000
 */
export OfflineFilesEnable(bEnable, pbRebootRequired) {
    pbRebootRequiredMarshal := pbRebootRequired is VarRef ? "int*" : "ptr"

    result := DllCall("CSCAPI.dll\OfflineFilesEnable", BOOL, bEnable, pbRebootRequiredMarshal, pbRebootRequired, UInt32)
    return result
}

/**
 * Starts the Offline Files service.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/cscapi/nf-cscapi-offlinefilesstart
 * @since windows8.0
 */
export OfflineFilesStart() {
    result := DllCall("CSCAPI.dll\OfflineFilesStart", UInt32)
    return result
}

/**
 * Determines whether the Offline Files feature is enabled and, if so, whether it is active.
 * @remarks
 * If the values returned in the <i>pbActive</i> and <i>pbEnabled</i> parameters are not both <b>TRUE</b>, the caller must restart the computer to enable or disable the Offline Files feature.  If one of the values is still <b>FALSE</b> after the computer is restarted, check the system event logs to identify the problem with starting either the CSC driver or the Offline Files service.
 * @param {Pointer<BOOL>} pbActive Receives <b>TRUE</b> if both the CSC driver and Offline Files Service are in the running state, or  <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
 * @param {Pointer<BOOL>} pbEnabled Receives <b>TRUE</b> if the CSC driver's start type is set to <b>SERVICE_SYSTEM_START</b> and the Offline Files service's start type is set to <b>SERVICE_AUTO_START</b>, or <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/cscapi/nf-cscapi-offlinefilesquerystatus
 * @since windows6.0.6000
 */
export OfflineFilesQueryStatus(pbActive, pbEnabled) {
    pbActiveMarshal := pbActive is VarRef ? "int*" : "ptr"
    pbEnabledMarshal := pbEnabled is VarRef ? "int*" : "ptr"

    result := DllCall("CSCAPI.dll\OfflineFilesQueryStatus", pbActiveMarshal, pbActive, pbEnabledMarshal, pbEnabled, UInt32)
    return result
}

/**
 * Determines whether the Offline Files feature is enabled and, if so, whether it is active and available. This function is identical to the OfflineFilesQueryStatus function, except that it has an additional output parameter.
 * @remarks
 * If the <i>pbAvailable</i> parameter is <b>TRUE</b> on return, the caller can use the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/cscapi/nf-cscapi-offlinefilesstart">OfflineFilesStart</a> function to start the Offline Files feature.
 * @param {Pointer<BOOL>} pbActive Receives <b>TRUE</b> if both the CSC driver and Offline Files Service are in the running state, or  <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
 * @param {Pointer<BOOL>} pbEnabled Receives <b>TRUE</b> if the CSC driver's start type is set to <b>SERVICE_SYSTEM_START</b> and the Offline Files service's start type is set to <b>SERVICE_AUTO_START</b>, or <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
 * @param {Pointer<BOOL>} pbAvailable Receives <b>TRUE</b> if the Offline Files Service is ready to be started without requiring the computer to be restarted, or  <b>FALSE</b> otherwise. This parameter is optional and can be <b>NULL</b>.
 * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error value otherwise.
 * @see https://learn.microsoft.com/windows/win32/api/cscapi/nf-cscapi-offlinefilesquerystatusex
 * @since windows8.0
 */
export OfflineFilesQueryStatusEx(pbActive, pbEnabled, pbAvailable) {
    pbActiveMarshal := pbActive is VarRef ? "int*" : "ptr"
    pbEnabledMarshal := pbEnabled is VarRef ? "int*" : "ptr"
    pbAvailableMarshal := pbAvailable is VarRef ? "int*" : "ptr"

    result := DllCall("CSCAPI.dll\OfflineFilesQueryStatusEx", pbActiveMarshal, pbActive, pbEnabledMarshal, pbEnabled, pbAvailableMarshal, pbAvailable, UInt32)
    return result
}

;@endregion Functions
