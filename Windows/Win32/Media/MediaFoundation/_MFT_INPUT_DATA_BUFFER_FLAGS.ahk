#Requires AutoHotkey v2.0.0 64-bit

/**
 * Defines flags for the IMFTransform::ProcessInput method. Currently no flags are defined.
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/ne-mftransform-_mft_input_data_buffer_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class _MFT_INPUT_DATA_BUFFER_FLAGS{

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static MFT_INPUT_DATA_BUFFER_PLACEHOLDER => -1
}
