#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes a request by the user to cancel a synchronization.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/ne-syncmgr-syncmgr_cancel_request
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_CANCEL_REQUEST extends Win32Enum{

    /**
     * No cancelation request has been made.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CR_NONE => 0

    /**
     * Stop the synchronization of the current item, but continue the synchronization of other items.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CR_CANCEL_ITEM => 1

    /**
     * Stop the synchronization entirely.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CR_CANCEL_ALL => 2

    /**
     * The maximum valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a> value.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CR_MAX => 2
}
