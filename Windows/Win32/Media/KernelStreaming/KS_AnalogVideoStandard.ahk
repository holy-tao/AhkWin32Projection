#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.KernelStreaming
 * @version v4.0.30319
 */
class KS_AnalogVideoStandard extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_None => 0

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_NTSC_M => 1

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_NTSC_M_J => 2

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_NTSC_433 => 4

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_PAL_B => 16

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_PAL_D => 32

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_PAL_G => 64

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_PAL_H => 128

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_PAL_I => 256

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_PAL_M => 512

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_PAL_N => 1024

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_PAL_60 => 2048

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_SECAM_B => 4096

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_SECAM_D => 8192

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_SECAM_G => 16384

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_SECAM_H => 32768

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_SECAM_K => 65536

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_SECAM_K1 => 131072

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_SECAM_L => 262144

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_SECAM_L1 => 524288

    /**
     * @type {Integer (Int32)}
     */
    static KS_AnalogVideo_PAL_N_COMBO => 1048576
}
