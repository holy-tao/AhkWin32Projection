#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes Sync Manager resolution feedback. Used by ISyncMgrResolutionHandler.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/ne-syncmgr-syncmgr_resolution_feedback
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_RESOLUTION_FEEDBACK extends Win32Enum{

    /**
     * Proceed to the next conflict.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RF_CONTINUE => 0

    /**
     * <b>Apply to All</b> is stopped and the dialog will be displayed for this conflict.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RF_REFRESH => 1

    /**
     * Cancels resolution of any more conflicts in the set.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_RF_CANCEL => 2
}
