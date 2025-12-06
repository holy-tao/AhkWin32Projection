#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\IInspectable.ahk

/**
 * @namespace Windows.Win32.System.WinRT.Direct3D11
 * @version v4.0.30319
 */
class Direct3D11 {

;@region Constants
;@endregion Constants

;@region Methods
    /**
     * Creates an instance of IDirect3DDevice from an IDXGIDevice.
     * @remarks
     * While we recommend [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/index), if you're using C++/CX then you should call [CreateDirect3DDevice](/windows/desktop/api/d3d11/nf-d3d11-d3d11createdevice) instead of **CreateDirect3D11DeviceFromDXGIDevice**. If you're using WRL then **CreateDirect3D11DeviceFromDXGIDevice** can be used as shown in this code example.
     * 
     * ```cpp
     * using namespace Microsoft::WRL;
     * ComPtr<ABI::Windows::Graphics::DirectX::Direct3D11::IDirect3DDevice> device;
     * ComPtr<IInspectable> inspectableSurface;
     * If (SUCCEEDED(CreateDirect3D11DeviceFromDXGIDevice(dxgiDevice, &inspectableSurface))
     * {
     *     hr = inspectableSurface.As(&device);
     * }
     * ```
     * @param {IDXGIDevice} dxgiDevice Type: **[IDXGIDevice](/windows/desktop/api/dxgi/nn-dxgi-idxgidevice)\***
     * 
     * The [IDXGIDevice](/windows/desktop/api/dxgi/nn-dxgi-idxgidevice) to create the Direct3DDevice from.
     * @returns {Pointer<IInspectable>} Type: **[IInspectable](/windows/desktop/api/inspectable/nn-inspectable-iinspectable)\*\***
     * 
     * A Direct3DDevice instance that wraps the DXGIDevice.
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-createdirect3d11devicefromdxgidevice
     */
    static CreateDirect3D11DeviceFromDXGIDevice(dxgiDevice) {
        result := DllCall("d3d11.dll\CreateDirect3D11DeviceFromDXGIDevice", "ptr", dxgiDevice, "ptr*", &graphicsDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return graphicsDevice
    }

    /**
     * Creates an instance of IDirect3DSurface from an IDXGISurface.
     * @remarks
     * While we recommend [C++/WinRT](/windows/uwp/cpp-and-winrt-apis/index), if you're using C++/CX then you should call [CreateDirect3DSurface](./nf-windows-graphics-directx-direct3d11-interop-createdirect3dsurface.md) instead of **CreateDirect3D11DeviceFromDXGIDevice**. If you're using WRL then **CreateDirect3D11DeviceFromDXGIDevice** can be used as shown in this code example.
     * 
     * ```cpp
     * using namespace Microsoft::WRL;
     * ComPtr<ABI::Windows::Graphics::DirectX::Direct3D11::IDirect3DSurface> surface;
     * ComPtr<IInspectable> inspectableSurface;
     * If (SUCCEEDED(CreateDirect3D11SurfaceFromDXGISurface(dxgiSurface, &inspectableSurface))
     * {
     *     hr = inspectableSurface.As(&surface);
     * }
     * ```
     * @param {IDXGISurface} dgxiSurface 
     * @returns {Pointer<IInspectable>} Type: **[IInspectable](/windows/desktop/api/inspectable/nn-inspectable-iinspectable)\*\***
     * 
     * An [IDirect3DSurface](/uwp/api/windows.graphics.directx.direct3d11.idirect3dsurface) instance that wraps the [IDXGISurface](/windows/desktop/api/dxgi/nn-dxgi-idxgisurface).
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-createdirect3d11surfacefromdxgisurface
     */
    static CreateDirect3D11SurfaceFromDXGISurface(dgxiSurface) {
        result := DllCall("d3d11.dll\CreateDirect3D11SurfaceFromDXGISurface", "ptr", dgxiSurface, "ptr*", &graphicsSurface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return graphicsSurface
    }

;@endregion Methods
}
