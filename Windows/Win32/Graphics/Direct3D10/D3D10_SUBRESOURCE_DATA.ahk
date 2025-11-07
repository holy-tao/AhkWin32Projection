#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies data for initializing a subresource.
 * @remarks
 * 
 * This structure is used in calls to create buffers (<a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createbuffer">ID3D10Device::CreateBuffer</a>) and textures (<a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture1d">ID3D10Device::CreateTexture1D</a>, 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture2d">ID3D10Device::CreateTexture2D</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture3d">ID3D10Device::CreateTexture3D</a>). 
 *       If the resource being created does not require a system-memory pitch or a system-memory-pitch slice, then you are free to use those members to 
 *       pass size information which may help you when debugging a problem creating a resource.
 * 
 * Note that an application should not rely on <b>SysMemPitch</b> being exactly equal to the number of texels in a line times the size of a texel.
 *       In some cases <b>SysMemPitch</b> will include padding to skip past additional data in a line.  This could be padding for alignment or 
 *       the texture could be a subsection of a larger texture.  For example the D3D10_SUBRESOURCE_DATA structure could represent a 32 by 32 subsection of a 128 by 128 texture.  
 *       The value for <b>SysMemSlicePitch</b> will reflect any padding included in <b>SysMemPitch</b>.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ns-d3d10-d3d10_subresource_data
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_SUBRESOURCE_DATA extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>const void*</b>
     * 
     * Pointer to the initialization data.
     * @type {Pointer<Void>}
     */
    pSysMem {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The distance (in bytes) from the beginning of one line of a texture to the next line.  
     *         System-memory pitch is used only for 2D and 3D texture data as it is has no meaning for the other resource types.
     * @type {Integer}
     */
    SysMemPitch {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">UINT</a></b>
     * 
     * The distance (in bytes) from the beginning of one depth level to the next.  
     *         System-memory-slice pitch is only used for 3D texture data as it has no meaning for the other resource types.
     * @type {Integer}
     */
    SysMemSlicePitch {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
