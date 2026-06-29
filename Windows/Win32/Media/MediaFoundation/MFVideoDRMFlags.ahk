#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the type of copy protection required for a video stream.
 * @remarks
 * Use these flags with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-drm-flags-attribute">MF_MT_DRM_FLAGS</a> attribute.
 * @see https://learn.microsoft.com/windows/win32/api/mfapi/ne-mfapi-mfvideodrmflags
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoDRMFlags {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * No copy protection is required.
     * @type {Integer (Int32)}
     */
    static MFVideoDRMFlag_None => 0

    /**
     * Analog copy protection should be applied.
     * @type {Integer (Int32)}
     */
    static MFVideoDRMFlag_AnalogProtected => 1

    /**
     * Digital copy protection should be applied.
     * @type {Integer (Int32)}
     */
    static MFVideoDRMFlag_DigitallyProtected => 2
}
