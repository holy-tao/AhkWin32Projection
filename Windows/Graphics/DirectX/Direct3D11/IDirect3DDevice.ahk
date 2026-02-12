#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * This represents an [IDXGIDevice](/windows/desktop/api/dxgi/nn-dxgi-idxgidevice), and can be used to interop between Windows Runtime components that need to exchange **IDXGIDevice** references.
 * @remarks
 * If you're using C++/WinRT, then to move back and forth between **IDirect3DDevice** and [IDXGIDevice](/windows/desktop/api/dxgi/nn-dxgi-idxgidevice), use the [IDirect3DDxgiInterfaceAccess::GetInterface](/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-idirect3ddxgiinterfaceaccess-getinterface) and [CreateDirect3D11DeviceFromDXGIDevice](/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-createdirect3d11devicefromdxgidevice) functions. You can see another code example in [Composition native interoperation with DirectX and Direct2D](/windows/uwp/composition/composition-native-interop).
 * 
 * If you're using C++/CX, then to move back and forth between **IDirect3DDevice** and [IDXGIDevice](/windows/desktop/api/dxgi/nn-dxgi-idxgidevice), use the [CreateDirect3DDevice](/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-createdirect3ddevice) and [GetDXGIInterface(IDirect3DDevice^, DXGI_TYPE**)](/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-getdxgiinterface) functions.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.direct3d11.idirect3ddevice
 * @namespace Windows.Graphics.DirectX.Direct3D11
 * @version WindowsRuntime 1.4
 */
class IDirect3DDevice extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDirect3DDevice
     * @type {Guid}
     */
    static IID => Guid("{a37624ab-8d5f-4650-9d3e-9eae3d9bc670}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Trim"]

    /**
     * Trims any graphics memory allocated by the graphics device on the app's behalf.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.directx.direct3d11.idirect3ddevice.trim
     */
    Trim() {
        result := ComCall(6, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
