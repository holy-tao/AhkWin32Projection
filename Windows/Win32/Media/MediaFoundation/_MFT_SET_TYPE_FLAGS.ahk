#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines flags for the setting or testing the media type on a Media Foundation transform (MFT).
 * @see https://learn.microsoft.com/windows/win32/api/mftransform/ne-mftransform-_mft_set_type_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct _MFT_SET_TYPE_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Test the proposed media type, but do not set it.
     * @type {Integer (Int32)}
     */
    static MFT_SET_TYPE_TEST_ONLY => 1
}
