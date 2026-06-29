#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains flags that define the behavior of the MFCreatePMPMediaSession function.
 * @see https://learn.microsoft.com/windows/win32/api/mfidl/ne-mfidl-mfpmpsession_creation_flags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFPMPSESSION_CREATION_FLAGS {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * If this flag is set, the Protected Media Path (PMP) Media Session is created in an unprotected process. You can use the unprotected process to play clear content but not protected content. If this flag is not set, the PMP Media Session is created in a protected process. In that case, the protected process is used for both protected content and clear content.
     * @type {Integer (Int32)}
     */
    static MFPMPSESSION_UNPROTECTED_PROCESS => 1

    /**
     * @type {Integer (Int32)}
     */
    static MFPMPSESSION_IN_PROCESS => 2
}
