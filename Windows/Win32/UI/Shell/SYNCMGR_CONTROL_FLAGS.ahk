#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies how an operation requested on certain methods of ISyncMgrControl should be performed.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_control_flags
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGR_CONTROL_FLAGS extends Win32Enum {

    /**
     * Perform the operation not using any of the other flags in this enumeration.
     * Native name: SYNCMGR_CF_NONE
     * @type {Integer (Int32)}
     */
    static CF_NONE => 0

    /**
     * Perform the operation asynchronously.
     * Native name: SYNCMGR_CF_NOWAIT
     * @type {Integer (Int32)}
     */
    static CF_NOWAIT => 0

    /**
     * Perform the operation synchronously.
     * Native name: SYNCMGR_CF_WAIT
     * @type {Integer (Int32)}
     */
    static CF_WAIT => 1

    /**
     * Perform the operation without asking the sync handler to display the UI during the operation.
     * Native name: SYNCMGR_CF_NOUI
     * @type {Integer (Int32)}
     */
    static CF_NOUI => 2

    /**
     * A mask used to determine valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_control_flags">SYNCMGR_CONTROL_FLAGS</a> flags.
     * Native name: SYNCMGR_CF_VALID
     * @type {Integer (Int32)}
     */
    static CF_VALID => 3
}
