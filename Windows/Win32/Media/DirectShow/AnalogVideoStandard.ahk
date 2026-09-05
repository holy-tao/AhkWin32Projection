#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * The AnalogVideoStandard enumeration specifies the format of an analog television signal.
 * @see https://learn.microsoft.com/windows/win32/api/strmif/ne-strmif-analogvideostandard
 * @namespace Windows.Win32.Media.DirectShow
 */
class AnalogVideoStandard extends Win32Enum {

    /**
     * Digital sensor.
     * Native name: AnalogVideo_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * NTSC (M) standard, 7.5 IRE black.
     * Native name: AnalogVideo_NTSC_M
     * @type {Integer (Int32)}
     */
    static NTSC_M => 1

    /**
     * NTSC (M) standard, 0 IRE black (Japan).
     * Native name: AnalogVideo_NTSC_M_J
     * @type {Integer (Int32)}
     */
    static NTSC_M_J => 2

    /**
     * NTSC-433.
     * Native name: AnalogVideo_NTSC_433
     * @type {Integer (Int32)}
     */
    static NTSC_433 => 4

    /**
     * PAL-B standard.
     * Native name: AnalogVideo_PAL_B
     * @type {Integer (Int32)}
     */
    static PAL_B => 16

    /**
     * PAL (D) standard.
     * Native name: AnalogVideo_PAL_D
     * @type {Integer (Int32)}
     */
    static PAL_D => 32

    /**
     * Native name: AnalogVideo_PAL_G
     * @type {Integer (Int32)}
     */
    static PAL_G => 64

    /**
     * PAL (H) standard.
     * Native name: AnalogVideo_PAL_H
     * @type {Integer (Int32)}
     */
    static PAL_H => 128

    /**
     * PAL (I) standard.
     * Native name: AnalogVideo_PAL_I
     * @type {Integer (Int32)}
     */
    static PAL_I => 256

    /**
     * PAL (M) standard.
     * Native name: AnalogVideo_PAL_M
     * @type {Integer (Int32)}
     */
    static PAL_M => 512

    /**
     * PAL (N) standard.
     * Native name: AnalogVideo_PAL_N
     * @type {Integer (Int32)}
     */
    static PAL_N => 1024

    /**
     * PAL-60 standard.
     * Native name: AnalogVideo_PAL_60
     * @type {Integer (Int32)}
     */
    static PAL_60 => 2048

    /**
     * SECAM (B) standard.
     * Native name: AnalogVideo_SECAM_B
     * @type {Integer (Int32)}
     */
    static SECAM_B => 4096

    /**
     * SECAM (D) standard.
     * Native name: AnalogVideo_SECAM_D
     * @type {Integer (Int32)}
     */
    static SECAM_D => 8192

    /**
     * SECAM (G) standard.
     * Native name: AnalogVideo_SECAM_G
     * @type {Integer (Int32)}
     */
    static SECAM_G => 16384

    /**
     * SECAM (H) standard.
     * Native name: AnalogVideo_SECAM_H
     * @type {Integer (Int32)}
     */
    static SECAM_H => 32768

    /**
     * SECAM (K) standard.
     * Native name: AnalogVideo_SECAM_K
     * @type {Integer (Int32)}
     */
    static SECAM_K => 65536

    /**
     * SECAM (K1) standard.
     * Native name: AnalogVideo_SECAM_K1
     * @type {Integer (Int32)}
     */
    static SECAM_K1 => 131072

    /**
     * SECAM (L) standard.
     * Native name: AnalogVideo_SECAM_L
     * @type {Integer (Int32)}
     */
    static SECAM_L => 262144

    /**
     * SECAM (L1) standard.
     * Native name: AnalogVideo_SECAM_L1
     * @type {Integer (Int32)}
     */
    static SECAM_L1 => 524288

    /**
     * Combination (N) PAL standard (Argentina).
     * Native name: AnalogVideo_PAL_N_COMBO
     * @type {Integer (Int32)}
     */
    static PAL_N_COMBO => 1048576

    /**
     * Native name: AnalogVideoMask_MCE_NTSC
     * @type {Integer (Int32)}
     */
    static Mask_MCE_NTSC => 1052167

    /**
     * Native name: AnalogVideoMask_MCE_PAL
     * @type {Integer (Int32)}
     */
    static Mask_MCE_PAL => 496

    /**
     * Native name: AnalogVideoMask_MCE_SECAM
     * @type {Integer (Int32)}
     */
    static Mask_MCE_SECAM => 1044480
}
