#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Defines the sampler texture types for vertex shaders.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dsampler-texture-type
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DSAMPLER_TEXTURE_TYPE extends Win32Enum{

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
