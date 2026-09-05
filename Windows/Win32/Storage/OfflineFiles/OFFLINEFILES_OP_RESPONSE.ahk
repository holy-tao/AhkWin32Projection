#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to continue, retry, or stop processing items.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_op_response
 * @namespace Windows.Win32.Storage.OfflineFiles
 */
class OFFLINEFILES_OP_RESPONSE extends Win32Enum {

    /**
     * Continue processing items.
     * Native name: OFFLINEFILES_OP_CONTINUE
     * @type {Integer (Int32)}
     */
    static CONTINUE => 0

    /**
     * Repeat processing of this item.
     * Native name: OFFLINEFILES_OP_RETRY
     * @type {Integer (Int32)}
     */
    static RETRY => 1

    /**
     * Stop processing now.
     * Native name: OFFLINEFILES_OP_ABORT
     * @type {Integer (Int32)}
     */
    static ABORT => 2
}
