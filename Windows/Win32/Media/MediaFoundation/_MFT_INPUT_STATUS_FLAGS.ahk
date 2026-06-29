#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates the status of an input stream on a Media Foundation transform (MFT).
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_input_status_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct _MFT_INPUT_STATUS_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * The input stream can receive more data at this time. To deliver more input data, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processinput">IMFTransform::ProcessInput</a>.
     * @type {Integer (Int32)}
     */
    static MFT_INPUT_STATUS_ACCEPT_DATA => 1
}
