#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags for the IMFTransform::ProcessInput method. Currently no flags are defined.
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_input_data_buffer_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct _MFT_INPUT_DATA_BUFFER_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Reserved. Do not use.
     * @type {Integer (Int32)}
     */
    static MFT_INPUT_DATA_BUFFER_PLACEHOLDER => -1
}
