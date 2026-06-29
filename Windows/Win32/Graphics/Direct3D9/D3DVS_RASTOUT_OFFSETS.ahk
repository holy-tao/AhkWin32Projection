#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DVS_RASTOUT_OFFSETS {
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
    static D3DSRO_POSITION => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSRO_FOG => 1

    /**
     * @type {Integer (Int32)}
     */
    static D3DSRO_POINT_SIZE => 2
}
