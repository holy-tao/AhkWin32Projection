#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the requirements for compressed surfaces for DirectX Video Acceleration (DXVA).
 * @remarks
 * 
 * To create the compressed surfaces, call <a href="https://docs.microsoft.com/windows/desktop/medfound/idirect3dvideodevice9-createsurface">IDirect3DVideoDevice9::CreateSurface</a>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//dxva9typ/ns-dxva9typ-dxvacompbufferinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVACompBufferInfo extends Win32Struct
{
    static sizeof => 28

    static packingSize => 4

    /**
     * The number of surfaces of this type to create.
     * @type {Integer}
     */
    NumCompBuffers {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The width of the surface, in pixels.
     * @type {Integer}
     */
    WidthToCreate {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The height of the surface, in pixels.
     * @type {Integer}
     */
    HeightToCreate {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The size of the surface, in bytes.
     * @type {Integer}
     */
    BytesToAllocate {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * A bitwise <b>OR</b> of one or more <b>D3DUSAGE</b> constants.
     * @type {Integer}
     */
    Usage {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The memory pool in which to create the surface, specified as a <b>D3DPOOL</b> value.
     * @type {Integer}
     */
    Pool {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * The pixel format, specified as a <b>D3DFORMAT</b> value.
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }
}
