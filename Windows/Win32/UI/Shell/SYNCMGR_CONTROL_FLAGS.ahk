#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how an operation requested on certain methods of ISyncMgrControl should be performed.
 * @see https://docs.microsoft.com/windows/win32/api//syncmgr/ne-syncmgr-syncmgr_control_flags
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_CONTROL_FLAGS extends Win32Enum{

    /**
     * Perform the operation not using any of the other flags in this enumeration.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CF_NONE => 0

    /**
     * Perform the operation asynchronously.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CF_NOWAIT => 0

    /**
     * Perform the operation synchronously.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CF_WAIT => 1

    /**
     * Perform the operation without asking the sync handler to display the UI during the operation.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CF_NOUI => 2

    /**
     * A mask used to determine valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> flags.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_CF_VALID => 3
}
