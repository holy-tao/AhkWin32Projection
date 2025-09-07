#Requires AutoHotkey v2.0.0 64-bit

/**
 * The DMO_SET_TYPE_FLAGS enumeration defines flags for setting the media type on a stream.
 * @remarks
 * The DMO_SET_TYPEF_TEST_ONLY and DMO_SET_TYPEF_CLEAR flags are mutually exclusive. Do not set both flags.
 * @see https://learn.microsoft.com/windows/win32/api/mediaobj/ne-mediaobj-_dmo_set_type_flags
 * @namespace Windows.Win32.Media.DxMediaObjects
 * @version v4.0.30319
 */
class _DMO_SET_TYPE_FLAGS{

    /**
     * Test the media type but do not set it.
     * @type {Integer (Int32)}
     */
    static DMO_SET_TYPEF_TEST_ONLY => 1

    /**
     * Clear the media type that was set for the stream.
     * @type {Integer (Int32)}
     */
    static DMO_SET_TYPEF_CLEAR => 2
}
