#Requires AutoHotkey v2.0.0 64-bit

/**
 * Additional information that can be requested by a sync provider when its callbacks are invoked.
 * @see https://docs.microsoft.com/windows/win32/api//cfapi/ne-cfapi-cf_connect_flags
 * @namespace Windows.Win32.Storage.CloudFilters
 * @version v4.0.30319
 */
class CF_CONNECT_FLAGS{

    /**
     * No connection flags.
     * @type {Integer (Int32)}
     */
    static CF_CONNECT_FLAG_NONE => 0

    /**
     * When this flag is specified, the platform returns the full image path of the hydrating process in the callback parameters.
     * @type {Integer (Int32)}
     */
    static CF_CONNECT_FLAG_REQUIRE_PROCESS_INFO => 2

    /**
     * When this flag is specified, the platform returns the full path of the placeholder being requested in the callback parameters.
     * @type {Integer (Int32)}
     */
    static CF_CONNECT_FLAG_REQUIRE_FULL_FILE_PATH => 4

    /**
     * <b>Note</b>  This value is new for Windows 10, version 1803.
 * 
 * When this flag is specified, The implicit hydration, which is not performed via <a href="https://docs.microsoft.com/windows/desktop/api/cfapi/nf-cfapi-cfhydrateplaceholder">CfHydratePlaceholder</a>, can happen when the anti-virus software scans a sync provider’s file system activities on non-hydrated cloud file placeholders. This kind of implicit hydration is not expected. If the sync provider never initiates implicit hydration operations, it can instruct the platform to block all such implicit hydration operations, as opposed to failing the <b>FETCH_DATA</b> callbacks later.
     * @type {Integer (Int32)}
     */
    static CF_CONNECT_FLAG_BLOCK_SELF_IMPLICIT_HYDRATION => 8
}
