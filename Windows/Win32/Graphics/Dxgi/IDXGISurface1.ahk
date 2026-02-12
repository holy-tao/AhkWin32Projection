#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Gdi\HDC.ahk
#Include .\IDXGISurface.ahk

/**
 * The IDXGISurface1 interface extends the IDXGISurface by adding support for using Windows Graphics Device Interface (GDI) to render to a Microsoft DirectX Graphics Infrastructure (DXGI) surface.
 * @remarks
 * This interface is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
 *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
 * 
 * An image-data object is a 2D section of memory, commonly called a surface. To get the surface from an output, call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata">IDXGIOutput::GetDisplaySurfaceData</a>. Then, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> object that <b>IDXGIOutput::GetDisplaySurfaceData</b> returns to retrieve the <b>IDXGISurface1</b> interface.
 * 
 * Any object that supports <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> also supports <b>IDXGISurface1</b>.
 * 
 * The runtime automatically creates an <b>IDXGISurface1</b> interface when it creates a Direct3D resource object that represents a surface. For example, the runtime creates an <b>IDXGISurface1</b> interface when you call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture2d">ID3D10Device::CreateTexture2D</a> to create a 2D texture. To retrieve the <b>IDXGISurface1</b> interface that represents the 2D texture surface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">ID3D11Texture2D::QueryInterface</a> or <b>ID3D10Texture2D::QueryInterface</b>. In this call, you must pass the identifier of <b>IDXGISurface1</b>. If the 2D texture has only a single MIP-map level and does not consist of an array of textures, <b>QueryInterface</b> succeeds and returns a pointer to the <b>IDXGISurface1</b> interface pointer. Otherwise, <b>QueryInterface</b> fails and does not return the pointer to <b>IDXGISurface1</b>.
 * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nn-dxgi-idxgisurface1
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class IDXGISurface1 extends IDXGISurface{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDXGISurface1
     * @type {Guid}
     */
    static IID => Guid("{4ae63092-6327-4c1b-80ae-bfe12ea32b86}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 11

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetDC", "ReleaseDC"]

    /**
     * Returns a device context (DC) that allows you to render to a Microsoft DirectX Graphics Infrastructure (DXGI) surface using Windows Graphics Device Interface (GDI).
     * @remarks
     * This method is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
     *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
     * 
     * After you use the <b>GetDC</b> method to retrieve a DC, you can render to the DXGI surface by using GDI.  
     *       The <b>GetDC</b> method readies the surface for GDI rendering and allows inter-operation between DXGI and GDI technologies.  
     * 
     * Keep the following in mind when using this method:
     * 
     * <ul>
     * <li>You must create the surface by using the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/ne-d3d11-d3d11_resource_misc_flag">D3D11_RESOURCE_MISC_GDI_COMPATIBLE</a> flag for a surface or by using the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG_GDI_COMPATIBLE</a> flag for swap chains, 
     *         otherwise this method fails.</li>
     * <li>You must release the device and call the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgisurface1-releasedc">IDXGISurface1::ReleaseDC</a> method before you issue any new Direct3D commands.</li>
     * <li>This method fails if an outstanding DC has already been created by this method.</li>
     * <li>The format for the surface or swap chain must be <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM_SRGB</a> or <a href="https://docs.microsoft.com/windows/desktop/api/dxgiformat/ne-dxgiformat-dxgi_format">DXGI_FORMAT_B8G8R8A8_UNORM</a>.</li>
     * <li>On <b>GetDC</b>, the render target in the output merger of the Direct3D pipeline is unbound from the surface.  
     *         You must call the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11devicecontext-omsetrendertargets">ID3D11DeviceContext::OMSetRenderTargets</a> method on the device prior to Direct3D rendering after GDI rendering.</li>
     * <li>Prior to resizing buffers you must release all outstanding DCs.</li>
     * </ul>
     * You can also call <b>GetDC</b> on the back buffer at index 0 of a swap chain by obtaining an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface1">IDXGISurface1</a>  from the swap chain.  
     *       The following code illustrates the process.
     * 
     * 
     * ```
     * 
     * IDXGISwapChain* g_pSwapChain = NULL;
     * IDXGISurface1* g_pSurface1 = NULL;
     * ...
     * //Setup the device and and swapchain
     * g_pSwapChain->GetBuffer(0, __uuidof(IDXGISurface1), (void**) &g_pSurface1);
     * g_pSurface1->GetDC( FALSE, &g_hDC );
     * ...      
     * //Draw on the DC using GDI
     * ...
     * //When finish drawing release the DC
     * g_pSurface1->ReleaseDC( NULL );
     *       
     * ```
     * @param {BOOL} Discard Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">BOOL</a></b>
     * 
     * A Boolean value that specifies whether to preserve Direct3D contents in the GDI DC. <b>TRUE</b> directs the runtime not to preserve Direct3D contents in the GDI DC; that is, the runtime discards the Direct3D contents. <b>FALSE</b> guarantees that Direct3D contents are available in the GDI DC.
     * @returns {HDC} Type: <b><a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a>*</b>
     * 
     * A pointer to an <a href="https://docs.microsoft.com/windows/desktop/WinProg/windows-data-types">HDC</a> handle that represents the current device context for GDI rendering.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgisurface1-getdc
     */
    GetDC(Discard) {
        phdc := HDC()
        result := ComCall(11, this, "int", Discard, "ptr", phdc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return phdc
    }

    /**
     * Releases the GDI device context (DC) that is associated with the current surface and allows you to use Direct3D to render.
     * @remarks
     * This method is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
     *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/topic/application-compatibility-update-for-windows-vista-windows-server-2008-windows-7-and-windows-server-2008-r2-february-2010-3eb7848b-9a76-85fe-98d0-729e3827ea60">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
     * 
     * Use the <b>ReleaseDC</b> method to release the DC and indicate that your application finished all GDI rendering to this surface.  
     *       You must call the <b>ReleaseDC</b> method before you can use Direct3D to perform additional rendering.
     * 
     * Prior to resizing buffers you must release all outstanding DCs.
     * @param {Pointer<RECT>} pDirtyRect Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a>*</b>
     * 
     * A pointer to a <b>RECT</b> structure that identifies the dirty region of the surface.  
     *           A dirty region is any part of the surface that you used for GDI rendering and that you want to preserve. 
     *           This area is used as a performance hint to graphics subsystem in certain scenarios. 
     *           Do not use this parameter to restrict rendering to the specified rectangular region. 
     *           If you pass in <b>NULL</b>, <b>ReleaseDC</b> considers the whole surface as dirty. 
     *           Otherwise, <b>ReleaseDC</b> uses the area specified by the RECT as a performance hint to indicate what areas have been manipulated by GDI rendering.
     * 
     * You can pass a pointer to an empty <b>RECT</b> structure (a rectangle with no position or area) if you didn't change any content.
     * @returns {HRESULT} Type: <b><a href="https://docs.microsoft.com/windows/win32/com/structure-of-com-error-codes">HRESULT</a></b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/dxgi/nf-dxgi-idxgisurface1-releasedc
     */
    ReleaseDC(pDirtyRect) {
        result := ComCall(12, this, "ptr", pDirtyRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
