#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\Direct3DSurfaceDescription.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This represents an [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface) and can be used to interop between Windows Runtime components that need to exchange **IDXGISurface** references.
 * @remarks
 * To move back and forth between IDirect3DSurface and [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface), use the [CreateDirect3DSurface](/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-createdirect3dsurface) and [GetDXGIInterface(IDirect3DSurface^, DXGI_TYPE**)](/windows/win32/api/d3d11/nf-d3d11-d3d11createdevice) functions.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.direct3d11.idirect3dsurface
 * @namespace Windows.Graphics.DirectX.Direct3D11
 * @version WindowsRuntime 1.4
 */
class IDirect3DSurface extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DSurface
     * @type {Guid}
     */
    static IID => Guid("{0bf4a146-13c1-4694-bee3-7abf15eaf586}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Description"]

    /**
     * Gets a [Direct3DSurfaceDescription](direct3dsurfacedescription.md) describing the surface.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.direct3d11.idirect3dsurface.description
     * @type {Direct3DSurfaceDescription} 
     */
    Description {
        get => this.get_Description()
    }

    /**
     * 
     * @returns {Direct3DSurfaceDescription} 
     */
    get_Description() {
        value := Direct3DSurfaceDescription()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
