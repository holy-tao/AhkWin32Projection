#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Describes the strategy that the Overlay Mixer Filter filter uses to scale the video image down to a smaller size.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-decimation_usage
 * @namespace Windows.Win32.Media.DirectShow
 */
class DECIMATION_USAGE extends Win32Enum {

    /**
     * Decimate the video by taking the following steps, in the order listed, until one of them succeeds.
     * 
     * <ol>
     * <li>Try to use the overlay scaler on the VGA chip.</li>
     * <li>If the Overlay Mixer is connected through a video port, try to use the scaler on the video port.</li>
     * <li>Crop the video image.</li>
     * </ol>
     * Native name: DECIMATION_LEGACY
     * @type {Integer (Int32)}
     */
    static LEGACY => 0

    /**
     * Decimate using the scaler on the video decoder. If that fails, crop the video image.
     * Native name: DECIMATION_USE_DECODER_ONLY
     * @type {Integer (Int32)}
     */
    static USE_DECODER_ONLY => 1

    /**
     * Decimate using the scaler on the video port. If that fails, crop the video image.
     * Native name: DECIMATION_USE_VIDEOPORT_ONLY
     * @type {Integer (Int32)}
     */
    static USE_VIDEOPORT_ONLY => 2

    /**
     * Decimate using the overlay scaler on the VGA chip. If that fails, crop the video image.
     * Native name: DECIMATION_USE_OVERLAY_ONLY
     * @type {Integer (Int32)}
     */
    static USE_OVERLAY_ONLY => 3

    /**
     * Decimate the video by taking the following steps, in the order listed, until one of them succeeds.
     * 
     * <ol>
     * <li>Try to use the scaler on the video decoder.</li>
     * <li>Try to use the overlay scaler on the VGA chip.</li>
     * <li>If the Overlay Mixer is connected through a video port, try to use the scaler on the video port.</li>
     * <li>Crop the video image.</li>
     * </ol>
     * This mode is the default decimation strategy.
     * Native name: DECIMATION_DEFAULT
     * @type {Integer (Int32)}
     */
    static DEFAULT => 4
}
