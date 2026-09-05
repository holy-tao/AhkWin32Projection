#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
class D3DKMT_PRESENT_MODEL extends Win32Enum {

    /**
     * Native name: D3DKMT_PM_UNINITIALIZED
     * @type {Integer (Int32)}
     */
    static PM_UNINITIALIZED => 0

    /**
     * Native name: D3DKMT_PM_REDIRECTED_GDI
     * @type {Integer (Int32)}
     */
    static PM_REDIRECTED_GDI => 1

    /**
     * Native name: D3DKMT_PM_REDIRECTED_FLIP
     * @type {Integer (Int32)}
     */
    static PM_REDIRECTED_FLIP => 2

    /**
     * Native name: D3DKMT_PM_REDIRECTED_BLT
     * @type {Integer (Int32)}
     */
    static PM_REDIRECTED_BLT => 3

    /**
     * Native name: D3DKMT_PM_REDIRECTED_VISTABLT
     * @type {Integer (Int32)}
     */
    static PM_REDIRECTED_VISTABLT => 4

    /**
     * Native name: D3DKMT_PM_SCREENCAPTUREFENCE
     * @type {Integer (Int32)}
     */
    static PM_SCREENCAPTUREFENCE => 5

    /**
     * Native name: D3DKMT_PM_REDIRECTED_GDI_SYSMEM
     * @type {Integer (Int32)}
     */
    static PM_REDIRECTED_GDI_SYSMEM => 6

    /**
     * Native name: D3DKMT_PM_REDIRECTED_COMPOSITION
     * @type {Integer (Int32)}
     */
    static PM_REDIRECTED_COMPOSITION => 7

    /**
     * Native name: D3DKMT_PM_SURFACECOMPLETE
     * @type {Integer (Int32)}
     */
    static PM_SURFACECOMPLETE => 8

    /**
     * Native name: D3DKMT_PM_FLIPMANAGER
     * @type {Integer (Int32)}
     */
    static PM_FLIPMANAGER => 9
}
