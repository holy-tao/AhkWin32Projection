#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMDT_VIDEO_OUTPUT_TECHNOLOGY extends Win32Enum {

    /**
     * Native name: D3DKMDT_VOT_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static VOT_UNINITIALIZED => -2

    /**
     * Native name: D3DKMDT_VOT_OTHER
     * @type {Integer (Int32)}
     */
    static VOT_OTHER => -1

    /**
     * Native name: D3DKMDT_VOT_HD15
     * @type {Integer (Int32)}
     */
    static VOT_HD15 => 0

    /**
     * Native name: D3DKMDT_VOT_SVIDEO
     * @type {Integer (Int32)}
     */
    static VOT_SVIDEO => 1

    /**
     * Native name: D3DKMDT_VOT_COMPOSITE_VIDEO
     * @type {Integer (Int32)}
     */
    static VOT_COMPOSITE_VIDEO => 2

    /**
     * Native name: D3DKMDT_VOT_COMPONENT_VIDEO
     * @type {Integer (Int32)}
     */
    static VOT_COMPONENT_VIDEO => 3

    /**
     * Native name: D3DKMDT_VOT_DVI
     * @type {Integer (Int32)}
     */
    static VOT_DVI => 4

    /**
     * Native name: D3DKMDT_VOT_HDMI
     * @type {Integer (Int32)}
     */
    static VOT_HDMI => 5

    /**
     * Native name: D3DKMDT_VOT_LVDS
     * @type {Integer (Int32)}
     */
    static VOT_LVDS => 6

    /**
     * Native name: D3DKMDT_VOT_D_JPN
     * @type {Integer (Int32)}
     */
    static VOT_D_JPN => 8

    /**
     * Native name: D3DKMDT_VOT_SDI
     * @type {Integer (Int32)}
     */
    static VOT_SDI => 9

    /**
     * Native name: D3DKMDT_VOT_DISPLAYPORT_EXTERNAL
     * @type {Integer (Int32)}
     */
    static VOT_DISPLAYPORT_EXTERNAL => 10

    /**
     * Native name: D3DKMDT_VOT_DISPLAYPORT_EMBEDDED
     * @type {Integer (Int32)}
     */
    static VOT_DISPLAYPORT_EMBEDDED => 11

    /**
     * Native name: D3DKMDT_VOT_UDI_EXTERNAL
     * @type {Integer (Int32)}
     */
    static VOT_UDI_EXTERNAL => 12

    /**
     * Native name: D3DKMDT_VOT_UDI_EMBEDDED
     * @type {Integer (Int32)}
     */
    static VOT_UDI_EMBEDDED => 13

    /**
     * Native name: D3DKMDT_VOT_SDTVDONGLE
     * @type {Integer (Int32)}
     */
    static VOT_SDTVDONGLE => 14

    /**
     * Native name: D3DKMDT_VOT_MIRACAST
     * @type {Integer (Int32)}
     */
    static VOT_MIRACAST => 15

    /**
     * Native name: D3DKMDT_VOT_INDIRECT_WIRED
     * @type {Integer (Int32)}
     */
    static VOT_INDIRECT_WIRED => 16

    /**
     * Native name: D3DKMDT_VOT_INTERNAL
     * @type {Integer (Int32)}
     */
    static VOT_INTERNAL => -2147483648

    /**
     * Native name: D3DKMDT_VOT_SVIDEO_4PIN
     * @type {Integer (Int32)}
     */
    static VOT_SVIDEO_4PIN => 1

    /**
     * Native name: D3DKMDT_VOT_SVIDEO_7PIN
     * @type {Integer (Int32)}
     */
    static VOT_SVIDEO_7PIN => 1

    /**
     * Native name: D3DKMDT_VOT_RF
     * @type {Integer (Int32)}
     */
    static VOT_RF => 2

    /**
     * Native name: D3DKMDT_VOT_RCA_3COMPONENT
     * @type {Integer (Int32)}
     */
    static VOT_RCA_3COMPONENT => 3

    /**
     * Native name: D3DKMDT_VOT_BNC
     * @type {Integer (Int32)}
     */
    static VOT_BNC => 3
}
