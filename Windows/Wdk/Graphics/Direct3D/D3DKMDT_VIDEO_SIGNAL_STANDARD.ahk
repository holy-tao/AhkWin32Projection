#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_VIDEO_SIGNAL_STANDARD extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_VESA_DMT => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_VESA_GTF => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_VESA_CVT => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_IBM => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_APPLE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_NTSC_M => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_NTSC_J => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_NTSC_443 => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_B => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_B1 => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_G => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_H => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_I => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_D => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_N => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_NC => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_SECAM_B => 17

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_SECAM_D => 18

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_SECAM_G => 19

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_SECAM_H => 20

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_SECAM_K => 21

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_SECAM_K1 => 22

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_SECAM_L => 23

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_SECAM_L1 => 24

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_EIA_861 => 25

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_EIA_861A => 26

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_EIA_861B => 27

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_K => 28

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_K1 => 29

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_L => 30

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_PAL_M => 31

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VSS_OTHER => 255
}
