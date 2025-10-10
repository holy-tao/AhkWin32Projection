#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the types of CPU access allowed for a resource.
 * @remarks
 * 
  * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture1d_desc">D3D11_TEXTURE1D_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture3d_desc">D3D11_TEXTURE3D_DESC</a>. 
  * 
  * Applications may combine one or more of these flags with a logical OR. When possible, create resources with no CPU access flags, as this enables better resource optimization.
  * 
  * The <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_FLAG</a> cannot be used when creating resources with <b>D3D11_CPU_ACCESS</b> flags.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_cpu_access_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_CPU_ACCESS_FLAG{

    /**
     * The resource is to be mappable so that the CPU can change its contents. Resources created with this flag cannot be set as outputs of the pipeline and must be created with either dynamic or staging usage (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a>).
     * @type {Integer (Int32)}
     */
    static D3D11_CPU_ACCESS_WRITE => 65536

    /**
     * The resource is to be mappable so that the CPU can read its contents. Resources created with this flag cannot be set as either inputs or outputs to the pipeline and must be created with staging usage (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a>).
     * @type {Integer (Int32)}
     */
    static D3D11_CPU_ACCESS_READ => 131072
}
