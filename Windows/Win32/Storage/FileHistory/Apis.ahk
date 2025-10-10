#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Storage.FileHistory
 * @version v4.0.30319
 */
class FileHistory {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_CORRUPT_CONFIG_FILE => -2147220736

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_CONFIG_FILE_NOT_FOUND => -2147220735

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_CONFIG_ALREADY_EXISTS => -2147220734

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_NO_VALID_CONFIGURATION_LOADED => -2147220733

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_TARGET_NOT_CONNECTED => -2147220732

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_CONFIGURATION_PREVIOUSLY_LOADED => -2147220731

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_TARGET_VERIFICATION_FAILED => -2147220730

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_TARGET_NOT_CONFIGURED => -2147220729

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_TARGET_NOT_ENOUGH_FREE_SPACE => -2147220728

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_TARGET_CANNOT_BE_USED => -2147220727

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_INVALID_REHYDRATION_STATE => -2147220726

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_RECOMMENDATION_CHANGE_NOT_ALLOWED => -2147220720

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_TARGET_REHYDRATED_ELSEWHERE => -2147220719

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_LEGACY_TARGET_UNSUPPORTED => -2147220718

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_LEGACY_TARGET_VALIDATION_UNSUPPORTED => -2147220717

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_LEGACY_BACKUP_USER_EXCLUDED => -2147220716

    /**
     * @type {Integer (Int32)}
     */
    static FHCFG_E_LEGACY_BACKUP_NOT_FOUND => -2147220715

    /**
     * @type {Integer (Int32)}
     */
    static FHSVC_E_BACKUP_BLOCKED => -2147219968

    /**
     * @type {Integer (Int32)}
     */
    static FHSVC_E_NOT_CONFIGURED => -2147219967

    /**
     * @type {Integer (Int32)}
     */
    static FHSVC_E_CONFIG_DISABLED => -2147219966

    /**
     * @type {Integer (Int32)}
     */
    static FHSVC_E_CONFIG_DISABLED_GP => -2147219965

    /**
     * @type {Integer (Int32)}
     */
    static FHSVC_E_FATAL_CONFIG_ERROR => -2147219964

    /**
     * @type {Integer (Int32)}
     */
    static FHSVC_E_CONFIG_REHYDRATING => -2147219963

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_NOT_TRACKED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_OFF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_DISABLED_BY_GP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_FATAL_CONFIG_ERROR => 3

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_MIGRATING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_REHYDRATING => 5

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_TARGET_FS_LIMITATION => 13

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_TARGET_ACCESS_DENIED => 14

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_TARGET_VOLUME_DIRTY => 15

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_TARGET_FULL_RETENTION_MAX => 16

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_TARGET_FULL => 17

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_STAGING_FULL => 18

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_TARGET_LOW_SPACE_RETENTION_MAX => 19

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_TARGET_LOW_SPACE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_TARGET_ABSENT => 21

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_TOO_MUCH_BEHIND => 240

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_NO_ERROR => 255

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_BACKUP_NOT_SUPPORTED => 2064

    /**
     * @type {Integer (UInt32)}
     */
    static FH_STATE_RUNNING => 256
;@endregion Constants

;@region Methods
    /**
     * Opens a communication channel to the File History Service.
     * @param {Integer} StartServiceIfStopped If the File History Service is not started yet and this parameter is <b>TRUE</b>, this function starts the File History Service before opening a communication channel to it.
     * 
     * If the File History Service is not started yet and this parameter is <b>FALSE</b>, this function fails and returns an unsuccessful <b>HRESULT</b> value.
     * @param {Pointer<Void>} Pipe On successful return, this parameter contains a non-NULL handle representing a newly opened communication channel to the File History Service.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhsvcctl/nf-fhsvcctl-fhserviceopenpipe
     * @deprecated
     * @since windows8.0
     */
    static FhServiceOpenPipe(StartServiceIfStopped, Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceOpenPipe", "int", StartServiceIfStopped, "ptr", Pipe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Closes a communication channel to the File History Service opened with FhServiceOpenPipe.
     * @param {Pointer<Void>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhsvcctl/nf-fhsvcctl-fhserviceclosepipe
     * @deprecated
     * @since windows8.0
     */
    static FhServiceClosePipe(Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceClosePipe", "ptr", Pipe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function starts an immediate backup for the current user.
     * @param {Pointer<Void>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @param {Integer} LowPriorityIo If <b>TRUE</b>, the File History Service is instructed to use low priority I/O for the immediate backup scheduled by this function. Low-priority I/O reduces impact on foreground user activities. It is recommended to set this parameter to <b>TRUE.</b>
     * 
     * If <b>FALSE</b>, the File History Service is instructed to use normal priority I/O for the immediate backup scheduled by this function. This results in faster backups but negatively affects the responsiveness and performance of user applications.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhsvcctl/nf-fhsvcctl-fhservicestartbackup
     * @deprecated
     * @since windows8.0
     */
    static FhServiceStartBackup(Pipe, LowPriorityIo) {
        result := DllCall("fhsvcctl.dll\FhServiceStartBackup", "ptr", Pipe, "int", LowPriorityIo, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function stops an ongoing backup cycle for the current user.
     * @param {Pointer<Void>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @param {Integer} StopTracking If <b>TRUE</b>, this function both stops the ongoing backup cycle (if any) and prevents periodic backup cycles for the current user in the future.
     * 
     * If <b>FALSE</b>, this function only stops the ongoing backup cycle.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhsvcctl/nf-fhsvcctl-fhservicestopbackup
     * @deprecated
     * @since windows8.0
     */
    static FhServiceStopBackup(Pipe, StopTracking) {
        result := DllCall("fhsvcctl.dll\FhServiceStopBackup", "ptr", Pipe, "int", StopTracking, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function causes the File History Service to reload the current user’s File History configuration files.
     * @param {Pointer<Void>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhsvcctl/nf-fhsvcctl-fhservicereloadconfiguration
     * @deprecated
     * @since windows8.0
     */
    static FhServiceReloadConfiguration(Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceReloadConfiguration", "ptr", Pipe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function temporarily blocks backups for the current user.
     * @param {Pointer<Void>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhsvcctl/nf-fhsvcctl-fhserviceblockbackup
     * @deprecated
     * @since windows8.0
     */
    static FhServiceBlockBackup(Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceBlockBackup", "ptr", Pipe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * This function unblocks backups blocked via FhServiceBlockBackup.
     * @param {Pointer<Void>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://docs.microsoft.com/windows/win32/api//fhsvcctl/nf-fhsvcctl-fhserviceunblockbackup
     * @deprecated
     * @since windows8.0
     */
    static FhServiceUnblockBackup(Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceUnblockBackup", "ptr", Pipe, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
