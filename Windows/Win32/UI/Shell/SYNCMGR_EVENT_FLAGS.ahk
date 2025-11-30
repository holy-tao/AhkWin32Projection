#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies flags for a synchronization event.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/ne-syncmgr-syncmgr_event_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_EVENT_FLAGS extends Win32Enum{

    /**
     * No flags specified.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_EF_NONE => 0

    /**
     * Same as <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_event_flags">SYNCMGR_EF_NONE</a>.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_EF_VALID => 0
}
