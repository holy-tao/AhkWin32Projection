#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Restore
 * @version v4.0.30319
 */
class Restore {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_EVENT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static BEGIN_NESTED_SYSTEM_CHANGE_NORP => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EVENT => 104

    /**
     * @type {Integer (UInt32)}
     */
    static MIN_RPT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DESKTOP_SETTING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACCESSIBILITY_SETTING => 3

    /**
     * @type {Integer (UInt32)}
     */
    static OE_SETTING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static APPLICATION_RUN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static RESTORE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CHECKPOINT => 7

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOWS_SHUTDOWN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOWS_BOOT => 9

    /**
     * @type {Integer (UInt32)}
     */
    static FIRSTRUN => 11

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP_RECOVERY => 14

    /**
     * @type {Integer (UInt32)}
     */
    static BACKUP => 15

    /**
     * @type {Integer (UInt32)}
     */
    static MANUAL_CHECKPOINT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static WINDOWS_UPDATE => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CRITICAL_UPDATE => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_RPT => 18

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DESC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_DESC_W => 256
;@endregion Constants

;@region Methods
    /**
     * Specifies the beginning and the ending of a set of changes so that System Restore can create a restore point. (ANSI)
     * @remarks
     * You must initialize COM security to allow NetworkService, LocalService and System to call back into any process that uses <b>SRSetRestorePoint</b>. This is necessary for <b>SRSetRestorePoint</b> to operate properly. For information on setting up the COM calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>, see <a href="https://docs.microsoft.com/windows/desktop/sr/using-system-restore">Using System Restore</a>.
     * 
     * This function cannot be called in safe mode. It also fails if System Restore has been disabled (see 
     * <a href="https://docs.microsoft.com/windows/desktop/sr/disable-systemrestore">Disable</a>).
     * 
     * When you call this function, System Restore takes a full snapshot of the registry and other system databases.
     * 
     * Applications should not call System Restore functions using load-time dynamic linking. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function to load SrClient.dll and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to call the function.
     * 
     * Create restore points just prior to a system change, by calling 
     * <b>SRSetRestorePoint</b> with the <b>dwEventType</b> member of the 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-restorepointinfoa">RESTOREPOINTINFO</a> structure set to BEGIN_SYSTEM_CHANGE. After the changes to the system have been completed, call 
     * <b>SRSetRestorePoint</b> with <b>dwEventType</b> set to END_SYSTEM_CHANGE.
     * 
     * If the user cancels the application installation, the installer may remove the restore point it created when the installation began. Removing the restore point is optional and can prevent the user from recovering from unintentional changes made by the installer during the cancellation. If the installer is to remove a restore point, it can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/srrestoreptapi/nf-srrestoreptapi-srremoverestorepoint">SRRemoveRestorePoint</a> function, or call 
     * <b>SRSetRestorePoint</b> with <b>dwRestorePointType</b> set to CANCELLED_OPERATION, <b>dwEventType</b> set to END_SYSTEM_CHANGE, and <b>llSequenceNumber</b> set to the value returned by the initial call to <b>SRSetRestorePoint</b>.
     * 
     * Be careful when making nested calls to 
     * <b>SRSetRestorePoint</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/sr/nested-calls-to-srsetrestorepoint">Nested calls to SRSetRestorePoint</a>.
     * 
     * 
     * <b>Windows 8:  </b><p class="note">A new registry key enables application developers to change the frequency of restore-point creation. 
     * 
     * <p class="note">Applications should create this key to use it because it  will not preexist in the system. The following applies by default if the key does not exist. If an application calls the <b>SRSetRestorePoint</b> function to create a restore point, Windows skips creating this new restore point if any restore points have been created in the last 24 hours.   System Restore sets the <b>IISequenceNumber</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-statemgrstatus">STATEMGRSTATUS</a> structure to the sequence number for the restore point created previously in the day and sets the value of the <b>nStatus</b> member to <b>ERROR_SUCCESS</b>.
     * 
     * The <b>SRSetRestorePoint</b> function returns <b>TRUE</b>.
     * 
     * <p class="note">Developers can write applications that create the <b>DWORD</b> value <b>SystemRestorePointCreationFrequency</b> under the registry key <b>HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore</b>. The value of this registry key can change the frequency of restore point creation.    
     * 
     * <p class="note">If the application calls <b>SRSetRestorePoint</b> to create a restore point, and the registry key value is 0, system restore does not skip creating the new restore point.  
     * 
     * <p class="note">If the application calls <b>SRSetRestorePoint</b> to create a restore point, and the registry key value is the integer N, system restore skips creating a new restore point if any restore points were created in the previous N minutes.
     * 
     * 
     * 
     * 
     * 
     * 
     * <b>Windows 8:  </b><p class="note">System Restore running on Windows 8 monitors files in the boot volume that are relevant for system restore only. Snapshots of the boot volume created by System Restore running on Windows 8 may be deleted if the snapshot is subsequently exposed by an earlier version of Windows.  Note that although there is only one system volume, there is one boot volume for each operating system in a multi-boot system. 
     * 
     * <p class="note">Developers can write applications that create the <b>DWORD</b> value <b>ScopeSnapshots</b> under the registry key <b>HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore</b>. If this registry key value is 0, System Restore creates snapshots of the boot volume in the same way as in earlier versions of Windows.  If this value is deleted, System Restore running on Windows 8 resumes creating snapshots that monitor files in the boot volume that are relevant for system restore only.
     * @param {Pointer<RESTOREPOINTINFOA>} pRestorePtSpec A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-restorepointinfoa">RESTOREPOINTINFO</a> structure that specifies the restore point.
     * @param {Pointer<STATEMGRSTATUS>} pSMgrStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-statemgrstatus">STATEMGRSTATUS</a> structure that receives the status information.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. The <b>llSequenceNumber</b> member of <i>pSMgrStatus</i> receives the sequence number of the restore point.
     * 
     * If the function fails, the return value is <b>FALSE</b>. The <b>nStatus</b> member of <i>pSMgrStatus</i> receives error information.
     * @see https://learn.microsoft.com/windows/win32/api/srrestoreptapi/nf-srrestoreptapi-srsetrestorepointa
     * @since windows5.1.2600
     */
    static SRSetRestorePointA(pRestorePtSpec, pSMgrStatus) {
        result := DllCall("sfc.dll\SRSetRestorePointA", "ptr", pRestorePtSpec, "ptr", pSMgrStatus, "int")
        return result
    }

    /**
     * Specifies the beginning and the ending of a set of changes so that System Restore can create a restore point. (Unicode)
     * @remarks
     * You must initialize COM security to allow NetworkService, LocalService and System to call back into any process that uses <b>SRSetRestorePoint</b>. This is necessary for <b>SRSetRestorePoint</b> to operate properly. For information on setting up the COM calls to <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> and <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializesecurity">CoInitializeSecurity</a>, see <a href="https://docs.microsoft.com/windows/desktop/sr/using-system-restore">Using System Restore</a>.
     * 
     * This function cannot be called in safe mode. It also fails if System Restore has been disabled (see 
     * <a href="https://docs.microsoft.com/windows/desktop/sr/disable-systemrestore">Disable</a>).
     * 
     * When you call this function, System Restore takes a full snapshot of the registry and other system databases.
     * 
     * Applications should not call System Restore functions using load-time dynamic linking. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function to load SrClient.dll and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to call the function.
     * 
     * Create restore points just prior to a system change, by calling 
     * <b>SRSetRestorePoint</b> with the <b>dwEventType</b> member of the 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-restorepointinfoa">RESTOREPOINTINFO</a> structure set to BEGIN_SYSTEM_CHANGE. After the changes to the system have been completed, call 
     * <b>SRSetRestorePoint</b> with <b>dwEventType</b> set to END_SYSTEM_CHANGE.
     * 
     * If the user cancels the application installation, the installer may remove the restore point it created when the installation began. Removing the restore point is optional and can prevent the user from recovering from unintentional changes made by the installer during the cancellation. If the installer is to remove a restore point, it can call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/srrestoreptapi/nf-srrestoreptapi-srremoverestorepoint">SRRemoveRestorePoint</a> function, or call 
     * <b>SRSetRestorePoint</b> with <b>dwRestorePointType</b> set to CANCELLED_OPERATION, <b>dwEventType</b> set to END_SYSTEM_CHANGE, and <b>llSequenceNumber</b> set to the value returned by the initial call to <b>SRSetRestorePoint</b>.
     * 
     * Be careful when making nested calls to 
     * <b>SRSetRestorePoint</b>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/sr/nested-calls-to-srsetrestorepoint">Nested calls to SRSetRestorePoint</a>.
     * 
     * 
     * <b>Windows 8:  </b><p class="note">A new registry key enables application developers to change the frequency of restore-point creation. 
     * 
     * <p class="note">Applications should create this key to use it because it  will not preexist in the system. The following applies by default if the key does not exist. If an application calls the <b>SRSetRestorePoint</b> function to create a restore point, Windows skips creating this new restore point if any restore points have been created in the last 24 hours.   System Restore sets the <b>IISequenceNumber</b> member of the <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-statemgrstatus">STATEMGRSTATUS</a> structure to the sequence number for the restore point created previously in the day and sets the value of the <b>nStatus</b> member to <b>ERROR_SUCCESS</b>.
     * 
     * The <b>SRSetRestorePoint</b> function returns <b>TRUE</b>.
     * 
     * <p class="note">Developers can write applications that create the <b>DWORD</b> value <b>SystemRestorePointCreationFrequency</b> under the registry key <b>HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore</b>. The value of this registry key can change the frequency of restore point creation.    
     * 
     * <p class="note">If the application calls <b>SRSetRestorePoint</b> to create a restore point, and the registry key value is 0, system restore does not skip creating the new restore point.  
     * 
     * <p class="note">If the application calls <b>SRSetRestorePoint</b> to create a restore point, and the registry key value is the integer N, system restore skips creating a new restore point if any restore points were created in the previous N minutes.
     * 
     * 
     * 
     * 
     * 
     * 
     * <b>Windows 8:  </b><p class="note">System Restore running on Windows 8 monitors files in the boot volume that are relevant for system restore only. Snapshots of the boot volume created by System Restore running on Windows 8 may be deleted if the snapshot is subsequently exposed by an earlier version of Windows.  Note that although there is only one system volume, there is one boot volume for each operating system in a multi-boot system. 
     * 
     * <p class="note">Developers can write applications that create the <b>DWORD</b> value <b>ScopeSnapshots</b> under the registry key <b>HKLM\Software\Microsoft\Windows NT\CurrentVersion\SystemRestore</b>. If this registry key value is 0, System Restore creates snapshots of the boot volume in the same way as in earlier versions of Windows.  If this value is deleted, System Restore running on Windows 8 resumes creating snapshots that monitor files in the boot volume that are relevant for system restore only.
     * @param {Pointer<RESTOREPOINTINFOW>} pRestorePtSpec A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-restorepointinfoa">RESTOREPOINTINFO</a> structure that specifies the restore point.
     * @param {Pointer<STATEMGRSTATUS>} pSMgrStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-statemgrstatus">STATEMGRSTATUS</a> structure that receives the status information.
     * @returns {Integer} If the function succeeds, the return value is <b>TRUE</b>. The <b>llSequenceNumber</b> member of <i>pSMgrStatus</i> receives the sequence number of the restore point.
     * 
     * If the function fails, the return value is <b>FALSE</b>. The <b>nStatus</b> member of <i>pSMgrStatus</i> receives error information.
     * @see https://learn.microsoft.com/windows/win32/api/srrestoreptapi/nf-srrestoreptapi-srsetrestorepointw
     * @since windows5.1.2600
     */
    static SRSetRestorePointW(pRestorePtSpec, pSMgrStatus) {
        result := DllCall("sfc.dll\SRSetRestorePointW", "ptr", pRestorePtSpec, "ptr", pSMgrStatus, "int")
        return result
    }

    /**
     * Deletes the specified restore point.
     * @remarks
     * Applications should not call System Restore functions using load-time dynamic linking. Instead, use the <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-loadlibrarya">LoadLibrary</a> function to load SrClient.dll and <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a> to call the function.
     * @param {Integer} dwRPNum The sequence number of the restore point.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the specified restore point does not exist or cannot be removed, the return value is ERROR_INVALID_DATA. All other error codes indicate an internal error.
     * @see https://learn.microsoft.com/windows/win32/api/srrestoreptapi/nf-srrestoreptapi-srremoverestorepoint
     * @since windows5.1.2600
     */
    static SRRemoveRestorePoint(dwRPNum) {
        result := DllCall("SrClient.dll\SRRemoveRestorePoint", "uint", dwRPNum, "uint")
        return result
    }

;@endregion Methods
}
