#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the processing mode of the Video Stabilization MFT.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-videodsp-mode">MF_VIDEODSP_MODE</a> attribute.
 * 
 * In pass-through mode, the MFT does not apply any processing to the video.
 * @see https://learn.microsoft.com/windows/win32/api/wmcodecdsp/ne-wmcodecdsp-mfvideodspmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFVideoDSPMode extends Win32Enum {

    /**
     * Pass-through mode. Video stabilization is not applied.
     * Native name: MFVideoDSPMode_Passthrough
     * @type {Integer (Int32)}
     */
    static Passthrough => 1

    /**
     * Video stabilization is applied.
     * Native name: MFVideoDSPMode_Stabilization
     * @type {Integer (Int32)}
     */
    static Stabilization => 4
}
