#Requires AutoHotkey v2.0.0 64-bit

/**
 * Identifies options for resources.
 * @remarks
 * 
  * This enumeration is used in <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_buffer_desc">D3D11_BUFFER_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture1d_desc">D3D11_TEXTURE1D_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a>, <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture3d_desc">D3D11_TEXTURE3D_DESC</a>. 
  * 
  * These flags can be combined by bitwise OR.
  *         
  * 
  * The <b>D3D11_RESOURCE_MISC_FLAG</b> cannot be used when creating resources with <b>D3D11_CPU_ACCESS</b> flags.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ne-d3d11-d3d11_resource_misc_flag
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_RESOURCE_MISC_FLAG{

    /**
     * Enables MIP map generation by using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-generatemips">ID3D11DeviceContext::GenerateMips</a> on a texture resource. The resource must be created with the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">bind flags</a> that specify that the resource is a render target and a shader resource.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_GENERATE_MIPS => 1

    /**
     * Enables resource data sharing between two or more Direct3D devices. The only resources that can be shared are 2D non-mipmapped textures.
 *             
 * 
 * <b>D3D11_RESOURCE_MISC_SHARED</b> and <b>D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX</b> are mutually exclusive.
 *             
 * 
 * <b>WARP</b> and <b>REF</b> devices do not support shared resources. 
 *               If you try to create a resource with this flag on either a <b>WARP</b> or <b>REF</b> device, the create method will return an <b>E_OUTOFMEMORY</b> error code.
 *             
 * 
 * <div class="alert"><b>Note</b>  Starting with Windows 8, <b>WARP</b> devices fully support shared resources.
 *             </div>
 * <div> </div>
 * <div class="alert"><b>Note</b>  Starting with Windows 8, we recommend that you enable resource data sharing between two or more Direct3D devices by using a combination of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_SHARED_NTHANDLE</a> and <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX</a> flags instead.
 *             </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_SHARED => 2

    /**
     * Sets a resource to be a cube texture created from a <a href="https://docs.microsoft.com/windows/desktop/direct3dhlsl/sm5-object-texture2darray">Texture2DArray</a> that contains 6 textures.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_TEXTURECUBE => 4

    /**
     * Enables instancing of GPU-generated content.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_DRAWINDIRECT_ARGS => 16

    /**
     * Enables a resource as a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-advanced-stages-cs-resources">byte address buffer</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_BUFFER_ALLOW_RAW_VIEWS => 32

    /**
     * Enables a resource as a <a href="https://docs.microsoft.com/windows/desktop/direct3d11/direct3d-11-advanced-stages-cs-resources">structured buffer</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_BUFFER_STRUCTURED => 64

    /**
     * Enables a resource with MIP map clamping for use with <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-setresourceminlod">ID3D11DeviceContext::SetResourceMinLOD</a>.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_RESOURCE_CLAMP => 128

    /**
     * Enables the resource  to be synchronized by using the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-acquiresync">IDXGIKeyedMutex::AcquireSync</a>  and 
 *           <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-releasesync">IDXGIKeyedMutex::ReleaseSync</a> APIs. 
 *           The following Direct3D 11 resource creation  APIs, that take <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_FLAG</a> parameters, have been extended to support the new flag.
 * 
 * <ul>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture1d">ID3D11Device::CreateTexture1D</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture3d">ID3D11Device::CreateTexture3D</a>
 * </li>
 * <li>
 * <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createbuffer">ID3D11Device::CreateBuffer</a>
 * </li>
 * </ul>
 * If you call any of these  methods with the <b>D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX</b> flag set, the interface returned will support the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgikeyedmutex">IDXGIKeyedMutex</a> interface.  You can retrieve a pointer to the <b>IDXGIKeyedMutex</b> interface from the resource by using <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">IUnknown::QueryInterface</a>.  The <b>IDXGIKeyedMutex</b> interface implements the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-acquiresync">IDXGIKeyedMutex::AcquireSync</a> and <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgikeyedmutex-releasesync">IDXGIKeyedMutex::ReleaseSync</a> APIs to synchronize access to the surface. The device that creates the surface, and any other device that opens the surface by using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-opensharedresource">OpenSharedResource</a>, must call <b>IDXGIKeyedMutex::AcquireSync</b> before they issue any rendering commands to the surface. When those devices finish rendering, they must call <b>IDXGIKeyedMutex::ReleaseSync</b>.
 *             
 * 
 * <b>D3D11_RESOURCE_MISC_SHARED</b> and <b>D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX</b> are mutually exclusive.
 *             
 * 
 * <b>WARP</b> and <b>REF</b> devices do not support shared resources.
 *               If you try to create a resource with this flag on either a <b>WARP</b> or <b>REF</b> device, the create method will return an <b>E_OUTOFMEMORY</b> error code.
 *             
 * 
 * <div class="alert"><b>Note</b>  Starting with Windows 8, <b>WARP</b> devices fully support shared resources.
 *             </div>
 * <div> </div>
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX => 256

    /**
     * Enables a resource compatible with GDI. You must set the <b>D3D11_RESOURCE_MISC_GDI_COMPATIBLE</b> flag  on surfaces that you use with GDI. Setting the <b>D3D11_RESOURCE_MISC_GDI_COMPATIBLE</b> flag allows GDI rendering on the surface via <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgisurface1-getdc">IDXGISurface1::GetDC</a>.
 *             
 * 
 * Consider the following programming tips for using D3D11_RESOURCE_MISC_GDI_COMPATIBLE when you create a texture or use that texture in a swap chain:
 * 
 * <ul>
 * <li>D3D11_RESOURCE_MISC_SHARED_KEYEDMUTEX and D3D11_RESOURCE_MISC_GDI_COMPATIBLE are mutually exclusive. Therefore, do not use them together.</li>
 * <li>D3D11_RESOURCE_MISC_RESOURCE_CLAMP and D3D11_RESOURCE_MISC_GDI_COMPATIBLE are mutually exclusive. Therefore, do not use them together.</li>
 * <li>You must bind the texture as a render target for the output-merger stage. For example, set the D3D11_BIND_RENDER_TARGET flag in the <b>BindFlags</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a> structure.
 *               </li>
 * <li>You must set the maximum number of MIP map levels to 1. For example, set the <b>MipLevels</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a> structure to 1.
 *               </li>
 * <li>You must specify that the texture requires read and write access by the GPU. For example, set the <b>Usage</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a> structure to D3D11_USAGE_DEFAULT.
 *               </li>
 * <li>
 * You must set the texture format to one of the following types. 
 * 
 * <ul>
 * <li>DXGI_FORMAT_B8G8R8A8_UNORM</li>
 * <li>DXGI_FORMAT_B8G8R8A8_TYPELESS</li>
 * <li>DXGI_FORMAT_B8G8R8A8_UNORM_SRGB</li>
 * </ul>For example, set the <b>Format</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a> structure to one of these  types.
 *               </li>
 * <li>You cannot use D3D11_RESOURCE_MISC_GDI_COMPATIBLE with multisampling. Therefore, set the <b>Count</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/dxgicommon/ns-dxgicommon-dxgi_sample_desc">DXGI_SAMPLE_DESC</a> structure to 1. Then, set the <b>SampleDesc</b> member of the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ns-d3d11-d3d11_texture2d_desc">D3D11_TEXTURE2D_DESC</a> structure to this <b>DXGI_SAMPLE_DESC</b> structure.
 *               </li>
 * </ul>
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_GDI_COMPATIBLE => 512

    /**
     * Set this flag to enable the use of NT HANDLE values when you create a shared resource.  By enabling this flag, you deprecate the use of existing HANDLE values.
 * 
 * The value specifies a new shared resource type that directs the runtime to use NT HANDLE values for the shared resource. The runtime then must confirm that the shared resource  works on all hardware at the specified <a href="https://docs.microsoft.com/windows/desktop/direct3d11/overviews-direct3d-11-devices-downlevel-intro">feature level</a>.
 *             
 * 
 * Without this flag set, the runtime does not strictly validate shared resource parameters (that is, formats, flags, usage, and so on). When the runtime does not validate shared resource parameters, behavior of much of the Direct3D   API might be undefined and might vary from driver to driver.  
 * 
 * <b>Direct3D 11 and earlier:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_SHARED_NTHANDLE => 2048

    /**
     * Set this flag to indicate that the resource might contain protected content; therefore, the operating system should  use the resource only when the driver and hardware support content protection.  If the driver and hardware do not support content protection and you try to create a resource with this flag, the resource creation fails.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_RESTRICTED_CONTENT => 4096

    /**
     * Set this flag to indicate that the operating system  restricts access to the shared surface. You can use this flag together with the D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE_DRIVER flag and only when you create a shared surface. The process that creates the shared resource can always open the shared resource.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE => 8192

    /**
     * Set this flag to indicate that the driver  restricts access to the shared surface. You can use this flag in conjunction with the D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE flag and only when you create a shared surface. The process that creates the shared resource can always open the shared resource.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_RESTRICT_SHARED_RESOURCE_DRIVER => 16384

    /**
     * Set this flag to indicate that the resource is guarded. Such a resource is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/dcomp/nf-dcomp-idcompositionsurface-begindraw">IDCompositionSurface::BeginDraw</a> (DirectComposition) and <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenative-begindraw">ISurfaceImageSourceNative::BeginDraw</a> (Windows Runtime) APIs.  For these APIs, you provide a region of interest (ROI) on a surface to update. This surface isn't compatible with multiple render targets (MRT).
 * 
 * A guarded resource automatically restricts all writes to the region that is related to one of the preceding APIs. Additionally, the resource enforces access to the ROI with these restrictions:
 * 
 * <ul>
 * <li>Copy operations from the resource by using <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copyresource">ID3D11DeviceContext::CopyResource</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-copysubresourceregion">ID3D11DeviceContext::CopySubresourceRegion</a> are restricted to only copy from the ROI.
 *               </li>
 * <li>When a guarded resource is set as a render target, it must be the only target.</li>
 * </ul>
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.1.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_GUARDED => 32768

    /**
     * Set this flag to indicate that the resource is a tile pool.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_TILE_POOL => 131072

    /**
     * Set this flag to indicate that the resource is a tiled resource.
 * 
 * <b>Direct3D 11:  </b>This value is not supported until Direct3D 11.2.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_TILED => 262144

    /**
     * Set this flag to indicate that the resource should be created such that it will be protected by the hardware.  Resource creation will fail if hardware content protection is not supported.
 * 
 * This flag has the following restrictions:
 * 
 * <ul>
 * <li>This flag cannot be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_usage">D3D11_USAGE</a> values:<ul>
 * <li><b>D3D11_USAGE_DYNAMIC</b></li>
 * <li><b>D3D11_USAGE_STAGING</b></li>
 * </ul>
 * </li>
 * <li>This flag cannot be used with the following <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_bind_flag">D3D11_BIND_FLAG</a> values.<ul>
 * <li><b>D3D11_BIND_VERTEX_BUFFER</b></li>
 * <li><b>D3D11_BIND_INDEX_BUFFER</b></li>
 * </ul>
 * </li>
 * <li>No CPU access flags can be specified.</li>
 * </ul>
 * <div class="alert"><b>Note</b>  <p class="note">Creating a texture using this flag does not automatically guarantee that hardware protection will be enabled for the underlying allocation. Some implementations require that the DRM components are first initialized prior to any guarantees of protection.
 * 
 * </div>
 * <div> </div>
 * <b>Note</b>  This enumeration value is supported starting with Windows 10.
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_HW_PROTECTED => 524288

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_SHARED_DISPLAYABLE => 1048576

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_SHARED_EXCLUSIVE_WRITER => 2097152

    /**
     * @type {Integer (Int32)}
     */
    static D3D11_RESOURCE_MISC_NO_SHADER_ACCESS => 4194304
}
