#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags for the setting or testing the media type on a Media Foundation transform (MFT).
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_set_type_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class _MFT_SET_TYPE_FLAGS{

    /**
     * Test the proposed media type, but do not set it.
     * @type {Integer (Int32)}
     */
    static MFT_SET_TYPE_TEST_ONLY => 1
}
