#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the type of a handler. Used by ISyncMgrHandlerInfo::GetType.
 * @see https://learn.microsoft.com/windows/win32/api/syncmgr/ne-syncmgr-syncmgr_handler_type
 * @namespace Windows.Win32.UI.Shell
 */
class SYNCMGR_HANDLER_TYPE extends Win32Enum {

    /**
     * The handler type is unknown. This value is also used if <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/nf-syncmgr-isyncmgrhandlerinfo-gettype">ISyncMgrHandlerInfo::GetType</a> fails.
     * Native name: SYNCMGR_HT_UNSPECIFIED
     * @type {Integer (Int32)}
     */
    static HT_UNSPECIFIED => 0

    /**
     * The handler is an application.
     * Native name: SYNCMGR_HT_APPLICATION
     * @type {Integer (Int32)}
     */
    static HT_APPLICATION => 1

    /**
     * The handler syncs with a device such as a phone or PDA.
     * Native name: SYNCMGR_HT_DEVICE
     * @type {Integer (Int32)}
     */
    static HT_DEVICE => 2

    /**
     * The handler syncs with local or remote folders.
     * Native name: SYNCMGR_HT_FOLDER
     * @type {Integer (Int32)}
     */
    static HT_FOLDER => 3

    /**
     * The handler syncs with a web service.
     * Native name: SYNCMGR_HT_SERVICE
     * @type {Integer (Int32)}
     */
    static HT_SERVICE => 4

    /**
     * The handler syncs with a computer.
     * Native name: SYNCMGR_HT_COMPUTER
     * @type {Integer (Int32)}
     */
    static HT_COMPUTER => 5

    /**
     * Indicates the minimum <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_type">SYNCMGR_HANDLER_TYPE</a> value.
     * Native name: SYNCMGR_HT_MIN
     * @type {Integer (Int32)}
     */
    static HT_MIN => 0

    /**
     * Indicates the maximum <a href="https://docs.microsoft.com/windows/desktop/api/syncmgr/ne-syncmgr-syncmgr_handler_type">SYNCMGR_HANDLER_TYPE</a> value.
     * Native name: SYNCMGR_HT_MAX
     * @type {Integer (Int32)}
     */
    static HT_MAX => 5
}
