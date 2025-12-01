#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether to continue, retry, or stop processing items.
 * @see https://learn.microsoft.com/windows/win32/api/cscobj/ne-cscobj-offlinefiles_op_response
 * @namespace Windows.Win32.Storage.OfflineFiles
 * @version v4.0.30319
 */
class OFFLINEFILES_OP_RESPONSE extends Win32Enum{

    /**
     * Continue processing items.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OP_CONTINUE => 0

    /**
     * Repeat processing of this item.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OP_RETRY => 1

    /**
     * Stop processing now.
     * @type {Integer (Int32)}
     */
    static OFFLINEFILES_OP_ABORT => 2
}
