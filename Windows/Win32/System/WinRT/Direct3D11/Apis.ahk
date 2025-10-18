#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk

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
     * @param {Pointer<IDXGIDevice>} dxgiDevice 
     * @param {Pointer<IInspectable>} graphicsDevice 
     * @returns {HRESULT} 
     */
    static CreateDirect3D11DeviceFromDXGIDevice(dxgiDevice, graphicsDevice) {
        result := DllCall("d3d11.dll\CreateDirect3D11DeviceFromDXGIDevice", "ptr", dxgiDevice, "ptr", graphicsDevice, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IDXGISurface>} dgxiSurface 
     * @param {Pointer<IInspectable>} graphicsSurface 
     * @returns {HRESULT} 
     */
    static CreateDirect3D11SurfaceFromDXGISurface(dgxiSurface, graphicsSurface) {
        result := DllCall("d3d11.dll\CreateDirect3D11SurfaceFromDXGISurface", "ptr", dgxiSurface, "ptr", graphicsSurface, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

;@endregion Methods
}
