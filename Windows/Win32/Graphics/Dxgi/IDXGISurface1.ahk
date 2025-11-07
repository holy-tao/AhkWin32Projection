#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\Gdi\HDC.ahk
#Include .\IDXGISurface.ahk

/**
 * The IDXGISurface1 interface extends the IDXGISurface by adding support for using Windows Graphics Device Interface (GDI) to render to a Microsoft DirectX Graphics Infrastructure (DXGI) surface.
 * @remarks
 * 
  * This interface is not supported by DXGI 1.0, which shipped in Windows Vista and Windows Server 2008. DXGI 1.1 support is required, which is available on 
  *       Windows 7, Windows Server 2008 R2, and as an update to Windows Vista with Service Pack 2 (SP2) (<a href="https://support.microsoft.com/kb/971644">KB 971644</a>) and Windows Server 2008 (<a href="https://support.microsoft.com/kb/971512/">KB 971512</a>).
  * 
  * An image-data object is a 2D section of memory, commonly called a surface. To get the surface from an output, call <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nf-dxgi-idxgioutput-getdisplaysurfacedata">IDXGIOutput::GetDisplaySurfaceData</a>. Then, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> on the <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> object that <b>IDXGIOutput::GetDisplaySurfaceData</b> returns to retrieve the <b>IDXGISurface1</b> interface.
  * 
  * Any object that supports <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a> also supports <b>IDXGISurface1</b>.
  * 
  * The runtime automatically creates an <b>IDXGISurface1</b> interface when it creates a Direct3D resource object that represents a surface. For example, the runtime creates an <b>IDXGISurface1</b> interface when you call <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11device-createtexture2d">ID3D11Device::CreateTexture2D</a> or <a href="https://docs.microsoft.com/windows/desktop/api/d3d10/nf-d3d10-id3d10device-createtexture2d">ID3D10Device::CreateTexture2D</a> to create a 2D texture. To retrieve the <b>IDXGISurface1</b> interface that represents the 2D texture surface, call <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">ID3D11Texture2D::QueryInterface</a> or <b>ID3D10Texture2D::QueryInterface</b>. In this call, you must pass the identifier of <b>IDXGISurface1</b>. If the 2D texture has only a single MIP-map level and does not consist of an array of textures, <b>QueryInterface</b> succeeds and returns a pointer to the <b>IDXGISurface1</b> interface pointer. Otherwise, <b>QueryInterface</b> fails and does not return the pointer to <b>IDXGISurface1</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//dxgi/nn-dxgi-idxgisurface1
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
     * The GetDC function retrieves a handle to a device context (DC) for the client area of a specified window or for the entire screen.
     * @param {BOOL} Discard 
     * @returns {HDC} 
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-getdc
     */
    GetDC(Discard) {
        phdc := HDC()
        result := ComCall(11, this, "int", Discard, "ptr", phdc, "HRESULT")
        return phdc
    }

    /**
     * The ReleaseDC function releases a device context (DC), freeing it for use by other applications. The effect of the ReleaseDC function depends on the type of DC. It frees only common and window DCs. It has no effect on class or private DCs.
     * @param {Pointer<RECT>} pDirtyRect 
     * @returns {HRESULT} The return value indicates whether the DC was released. If the DC was released, the return value is 1.
     * 
     * If the DC was not released, the return value is zero.
     * @see https://docs.microsoft.com/windows/win32/api//winuser/nf-winuser-releasedc
     */
    ReleaseDC(pDirtyRect) {
        result := ComCall(12, this, "ptr", pDirtyRect, "HRESULT")
        return result
    }
}
