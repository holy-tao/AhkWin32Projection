#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 */
class KS_AnalogVideoStandard extends Win32Enum {

    /**
     * Native name: KS_AnalogVideo_None
     * @type {Integer (Int32)}
     */
    static None => 0

    /**
     * Native name: KS_AnalogVideo_NTSC_M
     * @type {Integer (Int32)}
     */
    static NTSC_M => 1

    /**
     * Native name: KS_AnalogVideo_NTSC_M_J
     * @type {Integer (Int32)}
     */
    static NTSC_M_J => 2

    /**
     * Native name: KS_AnalogVideo_NTSC_433
     * @type {Integer (Int32)}
     */
    static NTSC_433 => 4

    /**
     * Native name: KS_AnalogVideo_PAL_B
     * @type {Integer (Int32)}
     */
    static PAL_B => 16

    /**
     * Native name: KS_AnalogVideo_PAL_D
     * @type {Integer (Int32)}
     */
    static PAL_D => 32

    /**
     * Native name: KS_AnalogVideo_PAL_G
     * @type {Integer (Int32)}
     */
    static PAL_G => 64

    /**
     * Native name: KS_AnalogVideo_PAL_H
     * @type {Integer (Int32)}
     */
    static PAL_H => 128

    /**
     * Native name: KS_AnalogVideo_PAL_I
     * @type {Integer (Int32)}
     */
    static PAL_I => 256

    /**
     * Native name: KS_AnalogVideo_PAL_M
     * @type {Integer (Int32)}
     */
    static PAL_M => 512

    /**
     * Native name: KS_AnalogVideo_PAL_N
     * @type {Integer (Int32)}
     */
    static PAL_N => 1024

    /**
     * Native name: KS_AnalogVideo_PAL_60
     * @type {Integer (Int32)}
     */
    static PAL_60 => 2048

    /**
     * Native name: KS_AnalogVideo_SECAM_B
     * @type {Integer (Int32)}
     */
    static SECAM_B => 4096

    /**
     * Native name: KS_AnalogVideo_SECAM_D
     * @type {Integer (Int32)}
     */
    static SECAM_D => 8192

    /**
     * Native name: KS_AnalogVideo_SECAM_G
     * @type {Integer (Int32)}
     */
    static SECAM_G => 16384

    /**
     * Native name: KS_AnalogVideo_SECAM_H
     * @type {Integer (Int32)}
     */
    static SECAM_H => 32768

    /**
     * Native name: KS_AnalogVideo_SECAM_K
     * @type {Integer (Int32)}
     */
    static SECAM_K => 65536

    /**
     * Native name: KS_AnalogVideo_SECAM_K1
     * @type {Integer (Int32)}
     */
    static SECAM_K1 => 131072

    /**
     * Native name: KS_AnalogVideo_SECAM_L
     * @type {Integer (Int32)}
     */
    static SECAM_L => 262144

    /**
     * Native name: KS_AnalogVideo_SECAM_L1
     * @type {Integer (Int32)}
     */
    static SECAM_L1 => 524288

    /**
     * Native name: KS_AnalogVideo_PAL_N_COMBO
     * @type {Integer (Int32)}
     */
    static PAL_N_COMBO => 1048576
}
