#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMDT_VIDEO_OUTPUT_TECHNOLOGY extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_UNINITIALIZED => -2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_OTHER => -1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_HD15 => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_SVIDEO => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_COMPOSITE_VIDEO => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_COMPONENT_VIDEO => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_DVI => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_HDMI => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_LVDS => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_D_JPN => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_SDI => 9

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_DISPLAYPORT_EXTERNAL => 10

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_DISPLAYPORT_EMBEDDED => 11

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_UDI_EXTERNAL => 12

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_UDI_EMBEDDED => 13

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_SDTVDONGLE => 14

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_MIRACAST => 15

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_INDIRECT_WIRED => 16

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_INTERNAL => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_SVIDEO_4PIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_SVIDEO_7PIN => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_RF => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_RCA_3COMPONENT => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMDT_VOT_BNC => 3
}
