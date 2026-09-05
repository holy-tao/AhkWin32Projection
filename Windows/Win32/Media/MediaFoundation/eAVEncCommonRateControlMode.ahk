#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies the rate control mode for an encoder. This enumeration is used with the AVEncCommonRateControlMode codec property.
 * @remarks
 * This enumeration is also used with <a href="https://docs.microsoft.com/windows/desktop/medfound/camera-encoder-h264-uvc-1-5">H.264 UVC 1.5 camera encoders</a>.
 * @see https://learn.microsoft.com/windows/win32/api/codecapi/ne-codecapi-eavenccommonratecontrolmode
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class eAVEncCommonRateControlMode extends Win32Enum {

    /**
     * Constant bit rate (CBR) encoding.
     * Native name: eAVEncCommonRateControlMode_CBR
     * @type {Integer (Int32)}
     */
    static CBR => 0

    /**
     * Constrained variable bit rate (VBR) encoding.
     * Native name: eAVEncCommonRateControlMode_PeakConstrainedVBR
     * @type {Integer (Int32)}
     */
    static PeakConstrainedVBR => 1

    /**
     * Unconstrained VBR encoding.
     * Native name: eAVEncCommonRateControlMode_UnconstrainedVBR
     * @type {Integer (Int32)}
     */
    static UnconstrainedVBR => 2

    /**
     * Quality-based VBR encoding. The encoder selects the bit rate to match a specified quality level. To specify the quality level, set the <a href="https://docs.microsoft.com/windows/desktop/DirectShow/avenccommonquality-property">AVEncCommonQuality</a> property.
     * Native name: eAVEncCommonRateControlMode_Quality
     * @type {Integer (Int32)}
     */
    static Quality => 3

    /**
     * Low delay VBR encoding. H.264 extension.
     * 
     * Requires Windows 8.
     * Native name: eAVEncCommonRateControlMode_LowDelayVBR
     * @type {Integer (Int32)}
     */
    static LowDelayVBR => 4

    /**
     * Global VBR encoding. H.264 extension.
     * 
     * Requires Windows 8.
     * Native name: eAVEncCommonRateControlMode_GlobalVBR
     * @type {Integer (Int32)}
     */
    static GlobalVBR => 5

    /**
     * Global low delay VBR encoding. H.264 extension.
     * 
     * Requires Windows 8.
     * Native name: eAVEncCommonRateControlMode_GlobalLowDelayVBR
     * @type {Integer (Int32)}
     */
    static GlobalLowDelayVBR => 6
}
