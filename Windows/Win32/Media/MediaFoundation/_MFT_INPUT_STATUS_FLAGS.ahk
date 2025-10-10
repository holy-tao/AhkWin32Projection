#Requires AutoHotkey v2.0.0 64-bit

/**
 * Indicates the status of an input stream on a Media Foundation transform (MFT).
 * @see https://docs.microsoft.com/windows/win32/api//mftransform/ne-mftransform-_mft_input_status_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class _MFT_INPUT_STATUS_FLAGS{

    /**
     * The input stream can receive more data at this time. To deliver more input data, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">IMFTransform::ProcessInput</a>.
     * @type {Integer (Int32)}
     */
    static MFT_INPUT_STATUS_ACCEPT_DATA => 1
}
