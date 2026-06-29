#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\FH_SERVICE_PIPE_HANDLE.ahk" { FH_SERVICE_PIPE_HANDLE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }

/**
 * @namespace Windows.Win32.Storage.FileHistory
 */

;@region Functions
/**
 * Opens a communication channel to the File History Service.
 * @param {BOOL} StartServiceIfStopped If the File History Service is not started yet and this parameter is <b>TRUE</b>, this function starts the File History Service before opening a communication channel to it.
 * 
 * If the File History Service is not started yet and this parameter is <b>FALSE</b>, this function fails and returns an unsuccessful <b>HRESULT</b> value.
 * @returns {FH_SERVICE_PIPE_HANDLE} On successful return, this parameter contains a non-NULL handle representing a newly opened communication channel to the File History Service.
 * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe
 * @deprecated FhServiceOpenPipe is deprecated and might not work on all platforms. For more info, see MSDN.
 * @since windows8.0
 */
export FhServiceOpenPipe(StartServiceIfStopped) {
    Pipe := FH_SERVICE_PIPE_HANDLE.Owned()
    result := DllCall("fhsvcctl.dll\FhServiceOpenPipe", BOOL, StartServiceIfStopped, FH_SERVICE_PIPE_HANDLE.Ptr, Pipe, "HRESULT")
    return Pipe
}

/**
 * Closes a communication channel to the File History Service opened with FhServiceOpenPipe.
 * @remarks
 * An application should call <b>FhServiceClosePipe</b> once for each communication channel handle it opens with <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a>. Closing a communication channel handle multiple times is not supported and may lead to unpredictable behavior.
 * @param {FH_SERVICE_PIPE_HANDLE} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
 * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhserviceclosepipe
 * @deprecated FhServiceClosePipe is deprecated and might not work on all platforms. For more info, see MSDN.
 * @since windows8.0
 */
export FhServiceClosePipe(Pipe) {
    result := DllCall("fhsvcctl.dll\FhServiceClosePipe", FH_SERVICE_PIPE_HANDLE, Pipe, "HRESULT")
    return result
}

/**
 * This function starts an immediate backup for the current user.
 * @remarks
 * This function does not wait until the immediate backup completes. If an error or warning condition is encountered during backup, it is communicated to the user via an Action Center notification and programmatically retrievable via the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-queryprotectionstatus">IFhConfigMgr::QueryProtectionStatus</a> method.
 * 
 * A backup cycle initiated by calling this function can be stopped using the <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhservicestopbackup">FhServiceStopBackup</a> function.
 * @param {FH_SERVICE_PIPE_HANDLE} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
 * @param {BOOL} LowPriorityIo If <b>TRUE</b>, the File History Service is instructed to use low priority I/O for the immediate backup scheduled by this function. Low-priority I/O reduces impact on foreground user activities. It is recommended to set this parameter to <b>TRUE.</b>
 * 
 * If <b>FALSE</b>, the File History Service is instructed to use normal priority I/O for the immediate backup scheduled by this function. This results in faster backups but negatively affects the responsiveness and performance of user applications.
 * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhservicestartbackup
 * @deprecated FhServiceStartBackup is deprecated and might not work on all platforms. For more info, see MSDN.
 * @since windows8.0
 */
export FhServiceStartBackup(Pipe, LowPriorityIo) {
    result := DllCall("fhsvcctl.dll\FhServiceStartBackup", FH_SERVICE_PIPE_HANDLE, Pipe, BOOL, LowPriorityIo, "HRESULT")
    return result
}

/**
 * This function stops an ongoing backup cycle for the current user.
 * @param {FH_SERVICE_PIPE_HANDLE} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
 * @param {BOOL} StopTracking If <b>TRUE</b>, this function both stops the ongoing backup cycle (if any) and prevents periodic backup cycles for the current user in the future.
 * 
 * If <b>FALSE</b>, this function only stops the ongoing backup cycle.
 * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhservicestopbackup
 * @deprecated FhServiceStopBackup is deprecated and might not work on all platforms. For more info, see MSDN.
 * @since windows8.0
 */
export FhServiceStopBackup(Pipe, StopTracking) {
    result := DllCall("fhsvcctl.dll\FhServiceStopBackup", FH_SERVICE_PIPE_HANDLE, Pipe, BOOL, StopTracking, "HRESULT")
    return result
}

/**
 * This function causes the File History Service to reload the current user’s File History configuration files.
 * @remarks
 * This function causes the File History Service to schedule periodic backups for the current user if they have not been scheduled yet and File History is enabled for that user.
 * 
 * It is recommended to call this function every time a policy is changed in File History configuration via the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhconfigmgr-setlocalpolicy">IFhConfigMgr::SetLocalPolicy</a> method. It should also be called after File History has been enabled or disabled for a user.
 * @param {FH_SERVICE_PIPE_HANDLE} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
 * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhservicereloadconfiguration
 * @deprecated FhServiceReloadConfiguration is deprecated and might not work on all platforms. For more info, see MSDN.
 * @since windows8.0
 */
export FhServiceReloadConfiguration(Pipe) {
    result := DllCall("fhsvcctl.dll\FhServiceReloadConfiguration", FH_SERVICE_PIPE_HANDLE, Pipe, "HRESULT")
    return result
}

/**
 * This function temporarily blocks backups for the current user.
 * @remarks
 * This function instructs the File History Service to not perform backups for the current user until the <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceunblockbackup">FhServiceUnblockBackup</a> function is called or the communication channel with the File History Service is closed by calling <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceclosepipe">FhServiceClosePipe</a>.
 * 
 * Call this function prior to performing File History configuration reassociation to ensure that File History configuration and data files are not currently in use. (Otherwise, the <a href="https://docs.microsoft.com/windows/desktop/api/fhcfg/nf-fhcfg-ifhreassociation-performreassociation">IFhReassociation::PerformReassociation</a> method may fail.)
 * @param {FH_SERVICE_PIPE_HANDLE} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
 * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhserviceblockbackup
 * @deprecated FhServiceBlockBackup is deprecated and might not work on all platforms. For more info, see MSDN.
 * @since windows8.0
 */
export FhServiceBlockBackup(Pipe) {
    result := DllCall("fhsvcctl.dll\FhServiceBlockBackup", FH_SERVICE_PIPE_HANDLE, Pipe, "HRESULT")
    return result
}

/**
 * This function unblocks backups blocked via FhServiceBlockBackup.
 * @remarks
 * This function removes the effects of a prior <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceblockbackup">FhServiceBlockBackup</a> call issued via a given communication channel with the File History Service.
 * @param {FH_SERVICE_PIPE_HANDLE} Pipe The communication channel handle returned by an earlier <a href="https://docs.microsoft.com/windows/desktop/api/fhsvcctl/nf-fhsvcctl-fhserviceopenpipe">FhServiceOpenPipe</a> call.
 * @returns {HRESULT} <b>S_OK</b> on success, or an unsuccessful <b>HRESULT</b> value on failure. Possible unsuccessful <b>HRESULT</b> values include values defined in the FhErrors.h header file.
 * @see https://learn.microsoft.com/windows/win32/api/fhsvcctl/nf-fhsvcctl-fhserviceunblockbackup
 * @deprecated FhServiceUnblockBackup is deprecated and might not work on all platforms. For more info, see MSDN.
 * @since windows8.0
 */
export FhServiceUnblockBackup(Pipe) {
    result := DllCall("fhsvcctl.dll\FhServiceUnblockBackup", FH_SERVICE_PIPE_HANDLE, Pipe, "HRESULT")
    return result
}

;@endregion Functions
