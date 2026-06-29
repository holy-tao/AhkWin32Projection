#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Graphics\Direct3D9\D3DPOOL.ahk" { D3DPOOL }
#Import "..\..\Graphics\Direct3D9\D3DFORMAT.ahk" { D3DFORMAT }

/**
 * Specifies the requirements for compressed surfaces for DirectX Video Acceleration (DXVA).
 * @remarks
 * To create the compressed surfaces, call <a href="https://docs.microsoft.com/windows/desktop/medfound/idirect3dvideodevice9-createsurface">IDirect3DVideoDevice9::CreateSurface</a>.
 * @see https://learn.microsoft.com/windows/win32/api/dxva9typ/ns-dxva9typ-dxvacompbufferinfo
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVACompBufferInfo {
    #StructPack 4

    /**
     * The number of surfaces of this type to create.
     */
    NumCompBuffers : UInt32

    /**
     * The width of the surface, in pixels.
     */
    WidthToCreate : UInt32

    /**
     * The height of the surface, in pixels.
     */
    HeightToCreate : UInt32

    /**
     * The size of the surface, in bytes.
     */
    BytesToAllocate : UInt32

    /**
     * A bitwise <b>OR</b> of one or more <b>D3DUSAGE</b> constants.
     */
    Usage : UInt32

    /**
     * The memory pool in which to create the surface, specified as a <b>D3DPOOL</b> value.
     */
    Pool : D3DPOOL

    /**
     * The pixel format, specified as a <b>D3DFORMAT</b> value.
     */
    Format : D3DFORMAT

}
