#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies the processing mode of the Video Stabilization MFT.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-videodsp-mode">MF_VIDEODSP_MODE</a> attribute.
 * 
 * In pass-through mode, the MFT does not apply any processing to the video.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ne-wmcodecdsp-mfvideodspmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct MFVideoDSPMode {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

    /**
     * Pass-through mode. Video stabilization is not applied.
     * @type {Integer (Int32)}
     */
    static MFVideoDSPMode_Passthrough => 1

    /**
     * Video stabilization is applied.
     * @type {Integer (Int32)}
     */
    static MFVideoDSPMode_Stabilization => 4
}
