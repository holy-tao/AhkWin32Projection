#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides the implementation of a shared fixed-size surface for Direct2D drawing.
 * @remarks
 * This interface provides the native implementation of the <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.surfaceimagesource">SurfaceImageSource</a> Windows runtime type. To obtain a pointer to <b>ISurfaceImageSourceNative</b>, you must cast a <b>SurfaceImageSource</b> instance to <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> or <b>IUnknown</b>, and call <b>QueryInterface</b>.
 * 
 * 
 * ```cpp
 * 
 * Microsoft::WRL::ComPtr<ISurfaceImageSourceNative>	m_sisNative;
 * // ...
 * IInspectable* sisInspectable = (IInspectable*) reinterpret_cast<IInspectable*>(surfaceImageSource);
 * sisInspectable->QueryInterface(__uuidof(ISurfaceImageSourceNative), (void **)&m_sisNative)
 * 	
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenative
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISurfaceImageSourceNative extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISurfaceImageSourceNative
     * @type {Guid}
     */
    static IID => Guid("{f2e9edc1-d307-4525-9886-0fafaa44163c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDevice", "BeginDraw", "EndDraw"]

    /**
     * Sets the DXGI device, created with D3D11_CREATE_DEVICE_BGRA_SUPPORT, that will draw the surface.
     * @param {IDXGIDevice} device Pointer to the DXGI device interface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenative-setdevice
     */
    SetDevice(device) {
        result := ComCall(3, this, "ptr", device, "HRESULT")
        return result
    }

    /**
     * Opens the supplied DXGI surface for drawing.
     * @remarks
     * If the app window that contains the <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.surfaceimagesource">SurfaceImageSource</a> isn't active, like when it's suspended, calling the <b>BeginDraw</b> method returns an error.
     * @param {RECT} updateRect The region of the surface that will be drawn into.
     * @param {Pointer<IDXGISurface>} surface Receives a pointer to the surface for drawing.
     * @param {Pointer<POINT>} offset Receives the point (x,y) offset of the surface that will be drawn into.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenative-begindraw
     */
    BeginDraw(updateRect, surface, offset) {
        result := ComCall(4, this, "ptr", updateRect, "ptr*", surface, "ptr", offset, "HRESULT")
        return result
    }

    /**
     * The ISurfaceImageSourceNative::EndDraw method (windows.ui.xaml.media.dxinterop.h) closes the surface draw operation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenative-enddraw
     */
    EndDraw() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
