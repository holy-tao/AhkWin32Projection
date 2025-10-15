#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
/**
 * @namespace Windows.Win32.System.WindowsSync
 * @version v4.0.30319
 */
class WindowsSync {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_VERSION_FLAG_FROM_FEED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_VERSION_FLAG_HAS_BY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_SERIALIZE_REPLICA_KEY_MAP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_FILTER_INFO_FLAG_ITEM_LIST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_FILTER_INFO_FLAG_CHANGE_UNIT_LIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_FILTER_INFO_FLAG_CUSTOM => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_FILTER_INFO_COMBINED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_CHANGE_FLAG_DELETED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_CHANGE_FLAG_DOES_NOT_EXIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_CHANGE_FLAG_GHOST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_CAN_CREATE_WITHOUT_UI => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_CAN_MODIFY_WITHOUT_UI => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_CREATE_NOT_SUPPORTED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SCC_MODIFY_NOT_SUPPORTED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SPC_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_PROVIDER_STATE_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_PROVIDER_STATE_DIRTY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_PROVIDER_CONFIGURATION_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_PROVIDER_CONFIGUI_CONFIGURATION_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_32_BIT_SUPPORTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SYNC_64_BIT_SUPPORTED => 2
;@endregion Constants

;@region Methods
;@endregion Methods
}
