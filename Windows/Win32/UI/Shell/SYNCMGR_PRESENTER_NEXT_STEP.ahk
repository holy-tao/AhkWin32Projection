#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the next step that is to occur in sync manager conflict resolution. Used by ISyncMgrConflictPresenter.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/ne-syncmgr-syncmgr_presenter_next_step
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_PRESENTER_NEXT_STEP extends Win32Enum{

    /**
     * The conflict has been resolved and subsequent
     * selected conflicts should continue to be resolved.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PNS_CONTINUE => 0

    /**
     * The default conflict presenter should be used.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PNS_DEFAULT => 1

    /**
     * All conflict resolution should be canceled.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_PNS_CANCEL => 2
}
