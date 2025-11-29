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
     * 
     * @param {IDXGIDevice} dxgiDevice 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-createdirect3d11devicefromdxgidevice
     */
    static CreateDirect3D11DeviceFromDXGIDevice(dxgiDevice) {
        result := DllCall("d3d11.dll\CreateDirect3D11DeviceFromDXGIDevice", "ptr", dxgiDevice, "ptr*", &graphicsDevice := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(graphicsDevice)
    }

    /**
     * 
     * @param {IDXGISurface} dgxiSurface 
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.graphics.directx.direct3d11.interop/nf-windows-graphics-directx-direct3d11-interop-createdirect3d11surfacefromdxgisurface
     */
    static CreateDirect3D11SurfaceFromDXGISurface(dgxiSurface) {
        result := DllCall("d3d11.dll\CreateDirect3D11SurfaceFromDXGISurface", "ptr", dgxiSurface, "ptr*", &graphicsSurface := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(graphicsSurface)
    }

;@endregion Methods
}
