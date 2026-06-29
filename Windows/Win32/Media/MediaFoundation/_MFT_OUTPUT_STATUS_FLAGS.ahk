#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Indicates whether a Media Foundation transform (MFT) can produce output data.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_output_status_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct _MFT_OUTPUT_STATUS_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * There is a sample available for at least one output stream. To retrieve the available output samples, call <a href="https://docs.microsoft.com/windows/desktop/api/mftransform/nf-mftransform-imftransform-processoutput">IMFTransform::ProcessOutput</a>.
     * @type {Integer (Int32)}
     */
    static MFT_OUTPUT_STATUS_SAMPLE_READY => 1
}
