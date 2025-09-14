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
     * @param {Pointer<FH_SERVICE_PIPE_HANDLE>} Pipe On successful return, this parameter contains a non-NULL handle representing a newly opened communication channel to the File History Service.
     * @returns {Integer} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe
     * @deprecated
     * @since windows8.0
     */
    static FhServiceOpenPipe(StartServiceIfStopped, Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceOpenPipe", "int", StartServiceIfStopped, "ptr", Pipe, "int")
        return result
    }

    /**
     * Closes a communication channel to the File History Service opened with FhServiceOpenPipe.
     * @remarks
     * An application should call <b>FhServiceClosePipe</b> once for each communication channel handle it opens with <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a>. Closing a communication channel handle multiple times is not supported and may lead to unpredictable behavior.
     * @param {Pointer<FH_SERVICE_PIPE_HANDLE>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @returns {Integer} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhserviceclosepipe
     * @deprecated
     * @since windows8.0
     */
    static FhServiceClosePipe(Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceClosePipe", "ptr", Pipe, "int")
        return result
    }

    /**
     * This function starts an immediate backup for the current user.
     * @remarks
     * This function does not wait until the immediate backup completes. If an error or warning condition is encountered during backup, it is communicated to the user via an Action Center notification and programmatically retrievable via the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-queryprotectionstatus">IFhConfigMgr::QueryProtectionStatus</a> method.
     * 
     * A backup cycle initiated by calling this function can be stopped using the <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhservicestopbackup">FhServiceStopBackup</a> function.
     * @param {Pointer<FH_SERVICE_PIPE_HANDLE>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @param {Integer} LowPriorityIo If <b>TRUE</b>, the File History Service is instructed to use low priority I/O for the immediate backup scheduled by this function. Low-priority I/O reduces impact on foreground user activities. It is recommended to set this parameter to <b>TRUE.</b>
     * 
     * If <b>FALSE</b>, the File History Service is instructed to use normal priority I/O for the immediate backup scheduled by this function. This results in faster backups but negatively affects the responsiveness and performance of user applications.
     * @returns {Integer} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhservicestartbackup
     * @deprecated
     * @since windows8.0
     */
    static FhServiceStartBackup(Pipe, LowPriorityIo) {
        result := DllCall("fhsvcctl.dll\FhServiceStartBackup", "ptr", Pipe, "int", LowPriorityIo, "int")
        return result
    }

    /**
     * This function stops an ongoing backup cycle for the current user.
     * @param {Pointer<FH_SERVICE_PIPE_HANDLE>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @param {Integer} StopTracking If <b>TRUE</b>, this function both stops the ongoing backup cycle (if any) and prevents periodic backup cycles for the current user in the future.
     * 
     * If <b>FALSE</b>, this function only stops the ongoing backup cycle.
     * @returns {Integer} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhservicestopbackup
     * @deprecated
     * @since windows8.0
     */
    static FhServiceStopBackup(Pipe, StopTracking) {
        result := DllCall("fhsvcctl.dll\FhServiceStopBackup", "ptr", Pipe, "int", StopTracking, "int")
        return result
    }

    /**
     * This function causes the File History Service to reload the current user’s File History configuration files.
     * @remarks
     * This function causes the File History Service to schedule periodic backups for the current user if they have not been scheduled yet and File History is enabled for that user.
     * 
     * It is recommended to call this function every time a policy is changed in File History configuration via the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-setlocalpolicy">IFhConfigMgr::SetLocalPolicy</a> method. It should also be called after File History has been enabled or disabled for a user.
     * @param {Pointer<FH_SERVICE_PIPE_HANDLE>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @returns {Integer} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhservicereloadconfiguration
     * @deprecated
     * @since windows8.0
     */
    static FhServiceReloadConfiguration(Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceReloadConfiguration", "ptr", Pipe, "int")
        return result
    }

    /**
     * This function temporarily blocks backups for the current user.
     * @remarks
     * This function instructs the File History Service to not perform backups for the current user until the <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceunblockbackup">FhServiceUnblockBackup</a> function is called or the communication channel with the File History Service is closed by calling <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceclosepipe">FhServiceClosePipe</a>.
     * 
     * Call this function prior to performing File History configuration reassociation to ensure that File History configuration and data files are not currently in use. (Otherwise, the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhreassociation-performreassociation">IFhReassociation::PerformReassociation</a> method may fail.)
     * @param {Pointer<FH_SERVICE_PIPE_HANDLE>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @returns {Integer} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhserviceblockbackup
     * @deprecated
     * @since windows8.0
     */
    static FhServiceBlockBackup(Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceBlockBackup", "ptr", Pipe, "int")
        return result
    }

    /**
     * This function unblocks backups blocked via FhServiceBlockBackup.
     * @remarks
     * This function removes the effects of a prior <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceblockbackup">FhServiceBlockBackup</a> call issued via a given communication channel with the File History Service.
     * @param {Pointer<FH_SERVICE_PIPE_HANDLE>} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
     * @returns {Integer} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
     * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhserviceunblockbackup
     * @deprecated
     * @since windows8.0
     */
    static FhServiceUnblockBackup(Pipe) {
        result := DllCall("fhsvcctl.dll\FhServiceUnblockBackup", "ptr", Pipe, "int")
        return result
    }

;@endregion Methods
}
