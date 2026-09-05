#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The state of a placeholder file or folder.
 * @remarks
 * Placeholder state information can be obtained by calling the following functions:
 * 
 * - [CfGetPlaceholderStateFromAttributeTag](nf-cfapi-cfgetplaceholderstatefromattributetag.md)
 * - [CfGetPlaceholderStateFromFileInfo](nf-cfapi-cfgetplaceholderstatefromfileinfo.md)
 * - [CfGetPlaceholderStateFromFindData](nf-cfapi-cfgetplaceholderstatefromfinddata.md)
 * @see https://learn.microsoft.com/windows/win32/api/cfapi/ne-cfapi-cf_placeholder_state
 * @namespace Windows.Win32.Storage.CloudFilters
 */
class CF_PLACEHOLDER_STATE extends Win32BitflagEnum {

    /**
     * When returned, the file or directory whose *FileAttributes* and *ReparseTag* examined by the API is not a placeholder.
     * Native name: CF_PLACEHOLDER_STATE_NO_STATES
     * @type {Integer (UInt32)}
     */
    static NO_STATES => 0

    /**
     * The file or directory whose *FileAttributes* and *ReparseTag* examined by the API is a placeholder.
     * Native name: CF_PLACEHOLDER_STATE_PLACEHOLDER
     * @type {Integer (UInt32)}
     */
    static PLACEHOLDER => 1

    /**
     * The directory is both a placeholder directory as well as the sync root.
     * Native name: CF_PLACEHOLDER_STATE_SYNC_ROOT
     * @type {Integer (UInt32)}
     */
    static SYNC_ROOT => 2

    /**
     * The file or directory must be a placeholder and there exists an essential property in the property store of the file or directory.
     * Native name: CF_PLACEHOLDER_STATE_ESSENTIAL_PROP_PRESENT
     * @type {Integer (UInt32)}
     */
    static ESSENTIAL_PROP_PRESENT => 4

    /**
     * The file or directory must be a placeholder and its content in sync with the cloud.
     * Native name: CF_PLACEHOLDER_STATE_IN_SYNC
     * @type {Integer (UInt32)}
     */
    static IN_SYNC => 8

    /**
     * The file or directory must be a placeholder and its content is not ready to be consumed by the user application, though it may or may not be fully present locally. An example is a placeholder file whose content has been fully downloaded to the local disk, but is yet to be validated by a sync provider that has registered the sync root with the hydration modifier **VERIFICATION_REQUIRED**.
     * Native name: CF_PLACEHOLDER_STATE_PARTIAL
     * @type {Integer (UInt32)}
     */
    static PARTIAL => 16

    /**
     * The file or directory must be a placeholder and its content is not fully present locally. When this is set, **CF_PLACEHOLDER_STATE_PARTIAL** must also be set.
     * Native name: CF_PLACEHOLDER_STATE_PARTIALLY_ON_DISK
     * @type {Integer (UInt32)}
     */
    static PARTIALLY_ON_DISK => 32

    /**
     * This is an invalid state when the API fails to parse the information of the file or directory.
     * Native name: CF_PLACEHOLDER_STATE_INVALID
     * @type {Integer (UInt32)}
     */
    static INVALID => 4294967295
}
