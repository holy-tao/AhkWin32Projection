#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Enumerates policies specified by a sync handler that deviate from the default policy.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_handler_policies
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGR_HANDLER_POLICIES extends Win32Enum {

    /**
     * No handler policy flags are set.
     * Native name: SYNCMGR_HPM_NONE
     * @type {Integer (Int32)}
     */
    static HPM_NONE => 0

    /**
     * Activation of the handler is not supported at the time of the call. This value can be used by a handler to implement support for group policy that prevents the handler from being activated. If this value is set, the <b>Setup</b> task is not be shown in the Setup Sync folder when this handler is selected. The handler should provide a comment—returned from its implementation of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-getcomment">ISyncMgrHandlerInfo::GetComment</a>—to let the user know why the <b>Setup</b> task is not available. Most handlers should not set this value.
     * Native name: SYNCMGR_HPM_PREVENT_ACTIVATE
     * @type {Integer (Int32)}
     */
    static HPM_PREVENT_ACTIVATE => 1

    /**
     * Deactivation of the handler is not supported at the time of the call. This value can be used by a handler to implement support for group policy that prevents the handler from being deactivated. If this value is set, the <b>Delete</b> task is not shown in the Sync Center folder when this handler is selected. The handler should provide a comment—returned from its implementation of <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-getcomment">ISyncMgrHandlerInfo::GetComment</a>—to let the user know why the <b>Setup</b> task is not available. Most handlers should not set this value.
     * Native name: SYNCMGR_HPM_PREVENT_DEACTIVATE
     * @type {Integer (Int32)}
     */
    static HPM_PREVENT_DEACTIVATE => 2

    /**
     * The handler normally supports enable, but cannot be enabled because of handler policy. If this flag is set, the <b>Enable</b> option will not be displayed on the context menu.
     * Native name: SYNCMGR_HPM_PREVENT_ENABLE
     * @type {Integer (Int32)}
     */
    static HPM_PREVENT_ENABLE => 4

    /**
     * The handler normally supports disable, but cannot be enabled because of handler policy. If this flag is set, the <b>Disable</b> option will not be displayed on the context menu.
     * Native name: SYNCMGR_HPM_PREVENT_DISABLE
     * @type {Integer (Int32)}
     */
    static HPM_PREVENT_DISABLE => 8

    /**
     * The handler normally supports sync, but cannot be synchronized because of handler policy. If this flag is set, the <b>Start Sync</b> option will not be displayed on the context menu or the command bar.
     * Native name: SYNCMGR_HPM_PREVENT_START_SYNC
     * @type {Integer (Int32)}
     */
    static HPM_PREVENT_START_SYNC => 16

    /**
     * The handler normally supports sync, but cannot be synchronized because of handler policy. If this flag is set, the <b>Stop Sync</b> option will not be displayed on the context menu or the command bar.
     * Native name: SYNCMGR_HPM_PREVENT_STOP_SYNC
     * @type {Integer (Int32)}
     */
    static HPM_PREVENT_STOP_SYNC => 32

    /**
     * The handler normally supports enable, but cannot be enabled at the time of the call. The <b>Enable</b> option will be displayed but will be disabled.
     * Native name: SYNCMGR_HPM_DISABLE_ENABLE
     * @type {Integer (Int32)}
     */
    static HPM_DISABLE_ENABLE => 256

    /**
     * The handler normally supports disable, but cannot be disabled at the time of the call. The <b>Disable</b> option will be displayed but will be disabled.
     * Native name: SYNCMGR_HPM_DISABLE_DISABLE
     * @type {Integer (Int32)}
     */
    static HPM_DISABLE_DISABLE => 512

    /**
     * The handler normally supports syncing, but cannot be synchronized at the time of the call. The <b>Start Sync</b> option will be displayed but will be disabled.
     * Native name: SYNCMGR_HPM_DISABLE_START_SYNC
     * @type {Integer (Int32)}
     */
    static HPM_DISABLE_START_SYNC => 1024

    /**
     * The handler normally supports cancel, but cannot be canceled at the time of the call. The <b>Stop Sync</b> option will be displayed but will be disabled.
     * Native name: SYNCMGR_HPM_DISABLE_STOP_SYNC
     * @type {Integer (Int32)}
     */
    static HPM_DISABLE_STOP_SYNC => 2048

    /**
     * The handler normally supports cancel, but cannot be canceled at the time of the call. The <b>Browse</b> option will be displayed but will be disabled.
     * Native name: SYNCMGR_HPM_DISABLE_BROWSE
     * @type {Integer (Int32)}
     */
    static HPM_DISABLE_BROWSE => 4096

    /**
     * The handler normally supports cancel, but cannot be canceled at the time of the call. The <b>Show Schedule</b> option will be displayed but will be disabled.
     * Native name: SYNCMGR_HPM_DISABLE_SCHEDULE
     * @type {Integer (Int32)}
     */
    static HPM_DISABLE_SCHEDULE => 8192

    /**
     * The handler should be hidden from the user unless the <b>Show Hidden Files</b> option has been enabled. This policy only applies the first time that the handler is loaded. After that, the hidden state is maintained by Sync Center and can be changed by the user through the property sheet. The hidden state is available in the folder UI as the System.Sync.Hidden (PKEY_Sync_Hidden) property.
     * Native name: SYNCMGR_HPM_HIDDEN_BY_DEFAULT
     * @type {Integer (Int32)}
     */
    static HPM_HIDDEN_BY_DEFAULT => 65536

    /**
     * The user is not offered <b>Sync</b> and <b>Stop</b> tasks in the UI. This is equivalent to <c>SYNCMGR_HPM_PREVENT_START_SYNC | SYNCMGR_HPM_PREVENT_STOP_SYNC</c>.
     * Native name: SYNCMGR_HPM_BACKGROUND_SYNC_ONLY
     * @type {Integer (Int32)}
     */
    static HPM_BACKGROUND_SYNC_ONLY => 48

    /**
     * A mask used to retrieve valid <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_policies">SYNCMGR_HANDLER_POLICIES</a> flags.
     * Native name: SYNCMGR_HPM_VALID_MASK
     * @type {Integer (Int32)}
     */
    static HPM_VALID_MASK => 77631
}
