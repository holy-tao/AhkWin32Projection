#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Defines the sampler texture types for vertex shaders.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dsampler-texture-type
 * @namespace Windows.Win32.Graphics.Direct3D9
 */
export default struct D3DSAMPLER_TEXTURE_TYPE {
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
    static D3DSTT_UNKNOWN => 0

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTT_2D => 268435456

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTT_CUBE => 402653184

    /**
     * @type {Integer (Int32)}
     */
    static D3DSTT_VOLUME => 536870912
}
