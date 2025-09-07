#Requires AutoHotkey v2.0.0 64-bit

/**
 * Specifies the types of CPU access allowed for a resource. (D3D10_CPU_ACCESS_FLAG)
 * @remarks
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_buffer_desc">D3D10_BUFFER_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture1d_desc">D3D10_TEXTURE1D_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture2d_desc">D3D10_TEXTURE2D_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture3d_desc">D3D10_TEXTURE3D_DESC</a>, and <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10-image-load-info">D3DX10_IMAGE_LOAD_INFO</a>. See <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-creating">Creating Buffer Resources (Direct3D 10)</a> for more details.
  * 
  * Applications can combine one or more of these flags with a bitwise OR. When possible, create resources with no CPU access flags, as this enables better resource optimization.
 * @see https://learn.microsoft.com/windows/win32/api/d3d10/ne-d3d10-d3d10_cpu_access_flag
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_CPU_ACCESS_FLAG{

    /**
     * The resource is to be <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">mappable</a> so that the CPU can change its contents. Resources created with this flag cannot be set as outputs of the pipeline and must be created with either dynamic or staging usage (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE</a>).
     * @type {Integer (Int32)}
     */
    static D3D10_CPU_ACCESS_WRITE => 65536

    /**
     * The resource is to be <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-mapping">mappable</a> so that the CPU can read its contents. Resources created with this flag cannot be set as either inputs or outputs to the pipeline and must be created with staging usage (see <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_usage">D3D10_USAGE</a>).
     * @type {Integer (Int32)}
     */
    static D3D10_CPU_ACCESS_READ => 131072
}
