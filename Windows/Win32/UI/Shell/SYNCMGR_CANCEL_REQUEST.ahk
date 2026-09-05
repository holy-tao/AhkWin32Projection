#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes a request by the user to cancel a synchronization.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_cancel_request
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGR_CANCEL_REQUEST extends Win32Enum {

    /**
     * No cancelation request has been made.
     * Native name: SYNCMGR_CR_NONE
     * @type {Integer (Int32)}
     */
    static CR_NONE => 0

    /**
     * Stop the synchronization of the current item, but continue the synchronization of other items.
     * Native name: SYNCMGR_CR_CANCEL_ITEM
     * @type {Integer (Int32)}
     */
    static CR_CANCEL_ITEM => 1

    /**
     * Stop the synchronization entirely.
     * Native name: SYNCMGR_CR_CANCEL_ALL
     * @type {Integer (Int32)}
     */
    static CR_CANCEL_ALL => 2

    /**
     * The maximum valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_cancel_request">SYNCMGR_CANCEL_REQUEST</a> value.
     * Native name: SYNCMGR_CR_MAX
     * @type {Integer (Int32)}
     */
    static CR_MAX => 2
}
