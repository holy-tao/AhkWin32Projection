#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_PRESENT_MODEL {
    value : Int32

    __value {
        get => this.value
        set => this.value := value
    }

    __New(value := 0) {
        this.value := value
    }

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
