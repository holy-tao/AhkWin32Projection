#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
class DXVA_VideoPrimaries extends Win32Enum {

    /**
     * Native name: DXVA_VideoPrimariesShift
     * @type {Integer (Int32)}
     */
    static Shift => 22

    /**
     * Native name: DXVA_VideoPrimariesMask
     * @type {Integer (Int32)}
     */
    static Mask => 130023424

    /**
     * Native name: DXVA_VideoPrimaries_Unknown
     * @type {Integer (Int32)}
     */
    static Unknown => 0

    /**
     * Native name: DXVA_VideoPrimaries_reserved
     * @type {Integer (Int32)}
     */
    static reserved => 1

    /**
     * Native name: DXVA_VideoPrimaries_BT709
     * @type {Integer (Int32)}
     */
    static BT709 => 2

    /**
     * Native name: DXVA_VideoPrimaries_BT470_2_SysM
     * @type {Integer (Int32)}
     */
    static BT470_2_SysM => 3

    /**
     * Native name: DXVA_VideoPrimaries_BT470_2_SysBG
     * @type {Integer (Int32)}
     */
    static BT470_2_SysBG => 4

    /**
     * Native name: DXVA_VideoPrimaries_SMPTE170M
     * @type {Integer (Int32)}
     */
    static SMPTE170M => 5

    /**
     * Native name: DXVA_VideoPrimaries_SMPTE240M
     * @type {Integer (Int32)}
     */
    static SMPTE240M => 6

    /**
     * Native name: DXVA_VideoPrimaries_EBU3213
     * @type {Integer (Int32)}
     */
    static EBU3213 => 7

    /**
     * Native name: DXVA_VideoPrimaries_SMPTE_C
     * @type {Integer (Int32)}
     */
    static SMPTE_C => 8
}
