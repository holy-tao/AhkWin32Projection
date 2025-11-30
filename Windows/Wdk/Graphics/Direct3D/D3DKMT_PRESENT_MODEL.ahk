#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_PRESENT_MODEL extends Win32Enum{

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_UNINITIALIZED => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_REDIRECTED_GDI => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_REDIRECTED_FLIP => 2

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_REDIRECTED_BLT => 3

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_REDIRECTED_VISTABLT => 4

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_SCREENCAPTUREFENCE => 5

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_REDIRECTED_GDI_SYSMEM => 6

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_REDIRECTED_COMPOSITION => 7

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_SURFACECOMPLETE => 8

    /**
     * @type {Integer (Int32)}
     */
    static D3DKMT_PM_FLIPMANAGER => 9
}
