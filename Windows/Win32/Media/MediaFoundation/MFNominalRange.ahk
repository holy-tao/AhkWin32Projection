#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Specifies whether color data includes headroom and toeroom.
 * @remarks
 * This enumeration is used with the <a href="https://docs.microsoft.com/windows/desktop/medfound/mf-mt-video-nominal-range-attribute">MF_MT_VIDEO_NOMINAL_RANGE</a> attribute.
 *       
 * 
 * For more information about these values, see the remarks for the <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ne-dxva2api-dxva2_nominalrange">DXVA2_NominalRange</a> enumeration, which is the DirectX Video Acceleration (DXVA) equivalent of this enumeration.
 * @see https://learn.microsoft.com/windows/win32/api/mfobjects/ne-mfobjects-mfnominalrange
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class MFNominalRange extends Win32Enum {

    /**
     * Unknown nominal range.
     * Native name: MFNominalRange_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Equivalent to MFNominalRange_0_255.
     * Native name: MFNominalRange_Normal
     * @type {Integer (Int32)}
     */
    static Normal => 1

    /**
     * Equivalent to MFNominalRange_16_235.
     * Native name: MFNominalRange_Wide
     * @type {Integer (Int32)}
     */
    static Wide => 2

    /**
     * The normalized range [0...1] maps to [0...255] for 8-bit samples or [0...1023] for 10-bit samples.
     * Native name: MFNominalRange_0_255
     * @type {Integer (Int32)}
     */
    static 0_255 => 1

    /**
     * The normalized range [0...1] maps to [16...235] for 8-bit samples or [64...940] for 10-bit samples.
     * Native name: MFNominalRange_16_235
     * @type {Integer (Int32)}
     */
    static 16_235 => 2

    /**
     * The normalized range [0..1] maps to [48...208] for 8-bit samples or [64...940] for 10-bit samples.
     * Native name: MFNominalRange_48_208
     * @type {Integer (Int32)}
     */
    static 48_208 => 3

    /**
     * The normalized range [0..1] maps to [64...127] for 8-bit samples or [256...508] for 10-bit samples. This range is used in the xRGB color space.
     * 
     * <div class="alert"><b>Note</b>  Requires Windows 7 or later.</div>
     * <div> </div>
     * Native name: MFNominalRange_64_127
     * @type {Integer (Int32)}
     */
    static 64_127 => 4

    /**
     * Native name: MFNominalRange_Last
     * @type {Integer (Int32)}
     */
    static Last => 5

    /**
     * Native name: MFNominalRange_ForceDWORD
     * @type {Integer (Int32)}
     */
    static ForceDWORD => 2147483647
}
