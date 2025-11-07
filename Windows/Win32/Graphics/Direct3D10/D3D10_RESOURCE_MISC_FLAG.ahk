#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies other, less common options for resources.
 * @remarks
 * 
 * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_buffer_desc">D3D10_BUFFER_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture1d_desc">D3D10_TEXTURE1D_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture2d_desc">D3D10_TEXTURE2D_DESC</a>, 
 *       <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ns-d3d10-cd3d10_texture3d_desc">D3D10_TEXTURE3D_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10-image-info">D3DX10_IMAGE_INFO</a>, and <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3dx10-image-load-info">D3DX10_IMAGE_LOAD_INFO</a>.
 * 
 * These flags can be combined by bitwise OR.
 * 
 * D3D10_RESOURCE_MISC_SHARED and D3D10_RESOURCE_MISC_SHARED_KEYEDMUTEX are mutually exclusive flags: 
 *       either one may be set in the resource creation calls but not both simultaneously.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d10/ne-d3d10-d3d10_resource_misc_flag
 * @namespace Windows.Win32.Graphics.Direct3D10
 * @version v4.0.30319
 */
class D3D10_RESOURCE_MISC_FLAG{

    /**
     * Enables an application to call <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-generatemips">ID3D10Device::GenerateMips</a> on 
     *         a <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">texture resource</a>. The resource must be created 
     *         with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/ne-d3d10-d3d10_bind_flag">bind flags</a> that specify that the resource is a render target and a shader resource.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_MISC_GENERATE_MIPS => 1

    /**
     * Enables the sharing of resource data between two or more Direct3D devices. The only resources that can be shared are 2D non-mipmapped textures.
     * 
     * WARP and REF devices do not support shared resources. Attempting to create a resource with this flag on either a WARP or REF device will cause the
     *         create method to return an E_OUTOFMEMORY error code.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_MISC_SHARED => 2

    /**
     * Enables an application to create a cube texture from a 
     *         <a href="https://docs.microsoft.com/windows/desktop/direct3d10/d3d10-graphics-programming-guide-resources-types">Texture2DArray</a> that contains 6 textures.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_MISC_TEXTURECUBE => 4

    /**
     * Enables the resource created to be synchronized using the IDXGIKeyedMutex::AcquireSync and ReleaseSync APIs. 
     *             The following resource creation D3D10 APIs, that all take a D3D10_RESOURCE_MISC_FLAG parameter, have been extended to support the new flag.
     * 
     * <ul>
     * <li>ID3D10Device1::CreateTexture1D</li>
     * <li>ID3D10Device1::CreateTexture2D</li>
     * <li>ID3D10Device1::CreateTexture3D</li>
     * <li>ID3D10Device1::CreateBuffer</li>
     * </ul>
     * If any of the listed functions are called with the D3D10_RESOURCE_MISC_SHARED_KEYEDMUTEX flag set, the interface returned can be 
     *             queried for an IDXGIKeyedMutex interface, which implements AcquireSync and ReleaseSync APIs to synchronize access to the surface. 
     *             The device creating the surface, and any other device opening the surface (using OpenSharedResource) is required to 
     *             call IDXGIKeyedMutex::AcquireSync before any rendering commands to the surface, and IDXGIKeyedMutex::ReleaseSync when it is done rendering.
     * 
     * WARP and REF devices do not support shared resources. Attempting to create a resource with this flag on either a WARP or REF device will cause the
     *           create method to return an E_OUTOFMEMORY error code.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_MISC_SHARED_KEYEDMUTEX => 16

    /**
     * Enables a surface to be used for GDI interoperability.  Setting this flag enables rendering on the surface 
     *         via IDXGISurface1::GetDC.
     * @type {Integer (Int32)}
     */
    static D3D10_RESOURCE_MISC_GDI_COMPATIBLE => 32
}
