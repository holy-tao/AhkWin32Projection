#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk

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
     * Specifies the beginning and the ending of a set of changes so that System Restore can create a restore point.
     * @param {Pointer<RESTOREPOINTINFOA>} pRestorePtSpec A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-restorepointinfoa">RESTOREPOINTINFO</a> structure that specifies the restore point.
     * @param {Pointer<STATEMGRSTATUS>} pSMgrStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-statemgrstatus">STATEMGRSTATUS</a> structure that receives the status information.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. The <b>llSequenceNumber</b> member of <i>pSMgrStatus</i> receives the sequence number of the restore point.
     * 
     * If the function fails, the return value is <b>FALSE</b>. The <b>nStatus</b> member of <i>pSMgrStatus</i> receives error information.
     * @see https://docs.microsoft.com/windows/win32/api//srrestoreptapi/nf-srrestoreptapi-srsetrestorepointa
     * @since windows5.1.2600
     */
    static SRSetRestorePointA(pRestorePtSpec, pSMgrStatus) {
        result := DllCall("sfc.dll\SRSetRestorePointA", "ptr", pRestorePtSpec, "ptr", pSMgrStatus, "int")
        return result
    }

    /**
     * Specifies the beginning and the ending of a set of changes so that System Restore can create a restore point.
     * @param {Pointer<RESTOREPOINTINFOW>} pRestorePtSpec A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-restorepointinfoa">RESTOREPOINTINFO</a> structure that specifies the restore point.
     * @param {Pointer<STATEMGRSTATUS>} pSMgrStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/win32/api/srrestoreptapi/ns-srrestoreptapi-statemgrstatus">STATEMGRSTATUS</a> structure that receives the status information.
     * @returns {BOOL} If the function succeeds, the return value is <b>TRUE</b>. The <b>llSequenceNumber</b> member of <i>pSMgrStatus</i> receives the sequence number of the restore point.
     * 
     * If the function fails, the return value is <b>FALSE</b>. The <b>nStatus</b> member of <i>pSMgrStatus</i> receives error information.
     * @see https://docs.microsoft.com/windows/win32/api//srrestoreptapi/nf-srrestoreptapi-srsetrestorepointw
     * @since windows5.1.2600
     */
    static SRSetRestorePointW(pRestorePtSpec, pSMgrStatus) {
        result := DllCall("sfc.dll\SRSetRestorePointW", "ptr", pRestorePtSpec, "ptr", pSMgrStatus, "int")
        return result
    }

    /**
     * Deletes the specified restore point.
     * @param {Integer} dwRPNum The sequence number of the restore point.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the specified restore point does not exist or cannot be removed, the return value is ERROR_INVALID_DATA. All other error codes indicate an internal error.
     * @see https://docs.microsoft.com/windows/win32/api//srrestoreptapi/nf-srrestoreptapi-srremoverestorepoint
     * @since windows5.1.2600
     */
    static SRRemoveRestorePoint(dwRPNum) {
        result := DllCall("SrClient.dll\SRRemoveRestorePoint", "uint", dwRPNum, "uint")
        return result
    }

;@endregion Methods
}
