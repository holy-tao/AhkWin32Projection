#Requires AutoHotkey v2.0.0 64-bit

/**
 * The AnalogVideoStandard enumeration specifies the format of an analog television signal.
 * @see https://docs.microsoft.com/windows/win32/api//strmif/ne-strmif-analogvideostandard
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class AnalogVideoStandard{

    /**
     * Digital sensor.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_None => 0

    /**
     * NTSC (M) standard, 7.5 IRE black.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_NTSC_M => 1

    /**
     * NTSC (M) standard, 0 IRE black (Japan).
     * @type {Integer (Int32)}
     */
    static AnalogVideo_NTSC_M_J => 2

    /**
     * NTSC-433.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_NTSC_433 => 4

    /**
     * PAL-B standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_PAL_B => 16

    /**
     * PAL (D) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_PAL_D => 32

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AnalogVideo_PAL_G => 64

    /**
     * PAL (H) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_PAL_H => 128

    /**
     * PAL (I) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_PAL_I => 256

    /**
     * PAL (M) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_PAL_M => 512

    /**
     * PAL (N) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_PAL_N => 1024

    /**
     * PAL-60 standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_PAL_60 => 2048

    /**
     * SECAM (B) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_SECAM_B => 4096

    /**
     * SECAM (D) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_SECAM_D => 8192

    /**
     * SECAM (G) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_SECAM_G => 16384

    /**
     * SECAM (H) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_SECAM_H => 32768

    /**
     * SECAM (K) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_SECAM_K => 65536

    /**
     * SECAM (K1) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_SECAM_K1 => 131072

    /**
     * SECAM (L) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_SECAM_L => 262144

    /**
     * SECAM (L1) standard.
     * @type {Integer (Int32)}
     */
    static AnalogVideo_SECAM_L1 => 524288

    /**
     * Combination (N) PAL standard (Argentina).
     * @type {Integer (Int32)}
     */
    static AnalogVideo_PAL_N_COMBO => 1048576

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AnalogVideoMask_MCE_NTSC => 1052167

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AnalogVideoMask_MCE_PAL => 496

    /**
     * 
     * @type {Integer (Int32)}
     */
    static AnalogVideoMask_MCE_SECAM => 1044480
}
