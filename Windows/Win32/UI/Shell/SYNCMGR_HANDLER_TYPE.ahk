#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the type of a handler. Used by ISyncMgrHandlerInfo::GetType.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_handler_type
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class SYNCMGR_HANDLER_TYPE{

    /**
     * The handler type is unknown. This value is also used if <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-gettype">ISyncMgrHandlerInfo::GetType</a> fails.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HT_UNSPECIFIED => 0

    /**
     * The handler is an application.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HT_APPLICATION => 1

    /**
     * The handler syncs with a device such as a phone or PDA.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HT_DEVICE => 2

    /**
     * The handler syncs with local or remote folders.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HT_FOLDER => 3

    /**
     * The handler syncs with a web service.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HT_SERVICE => 4

    /**
     * The handler syncs with a computer.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HT_COMPUTER => 5

    /**
     * Indicates the minimum <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_type">SYNCMGR_HANDLER_TYPE</a> value.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HT_MIN => 0

    /**
     * Indicates the maximum <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_type">SYNCMGR_HANDLER_TYPE</a> value.
     * @type {Integer (Int32)}
     */
    static SYNCMGR_HT_MAX => 5
}
