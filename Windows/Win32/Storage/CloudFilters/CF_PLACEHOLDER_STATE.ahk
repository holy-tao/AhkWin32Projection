#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The state of a placeholder file or folder.
 * @remarks
 * 
 * Placeholder state information can be obtained by calling: <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfgetplaceholderstatefromattributetag">CfGetPlaceholderStateFromAttributeTag</a>, <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfgetplaceholderstatefromfileinfo">CfGetPlaceholderStateFromFileInfo</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfgetplaceholderstatefromfinddata">CfGetPlaceholderStateFromFindData</a>.
 * 
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_placeholder_state
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_PLACEHOLDER_STATE extends Win32BitflagEnum{

    /**
     * When returned, the file or directory whose <i>FileAttributes</i> and <i>ReparseTag</i> examined by the API is not a placeholder.
     * @type {Integer (UInt32)}
     */
    static CF_PLACEHOLDER_STATE_NO_STATES => 0

    /**
     * The file or directory whose <i>FileAttributes</i> and <i>ReparseTag</i> examined by the API is a placeholder.
     * @type {Integer (UInt32)}
     */
    static CF_PLACEHOLDER_STATE_PLACEHOLDER => 1

    /**
     * The directory is both a placeholder directory as well as the sync root.
     * @type {Integer (UInt32)}
     */
    static CF_PLACEHOLDER_STATE_SYNC_ROOT => 2

    /**
     * The file or directory must be a placeholder and there exists an essential property in the property store of the file or directory.
     * @type {Integer (UInt32)}
     */
    static CF_PLACEHOLDER_STATE_ESSENTIAL_PROP_PRESENT => 4

    /**
     * The file or directory must be a placeholder and its content in sync with the cloud.
     * @type {Integer (UInt32)}
     */
    static CF_PLACEHOLDER_STATE_IN_SYNC => 8

    /**
     * The file or directory must be a placeholder and its content is not ready to be consumed by the user application, though it may or may not be fully present locally. An example is a placeholder file whose content has been fully downloaded to the local disk, but is yet to be validated by a sync provider that has registered the sync root with the hydration modifier VERIFICATION_REQUIRED.
     * @type {Integer (UInt32)}
     */
    static CF_PLACEHOLDER_STATE_PARTIAL => 16

    /**
     * The file or directory must be a placeholder and its content is not fully present locally. When this is set, <b>CF_PLACEHOLDER_STATE_PARTIAL</b> must also be set.
     * @type {Integer (UInt32)}
     */
    static CF_PLACEHOLDER_STATE_PARTIALLY_ON_DISK => 32

    /**
     * This is an invalid state when the API fails to parse the information of the file or directory.
     * @type {Integer (UInt32)}
     */
    static CF_PLACEHOLDER_STATE_INVALID => 4294967295
}
