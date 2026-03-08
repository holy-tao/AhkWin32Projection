#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * Provides the implementation of a shared Microsoft DirectX surface which is displayed in a SurfaceImageSource or VirtualSurfaceImageSource.
 * @remarks
 * The <b>ISurfaceImageSourceNativeWithD2D</b> interface provides the native implementation of the <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.surfaceimagesource">SurfaceImageSource</a> class. To get a pointer to the  <b>ISurfaceImageSourceNativeWithD2D</b> interface, you must cast a <b>SurfaceImageSource</b> instance to <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> or <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nn-unknwn-iunknown">IUnknown</a>, and call the <a href="https://docs.microsoft.com/windows/desktop/api/unknwn/nf-unknwn-iunknown-queryinterface(q)">QueryInterface</a> method.
 * 
 * 
 * ```cpp
 * 
 * Microsoft::WRL::ComPtr<ISurfaceImageSourceNativeWithD2D>	m_sisD2DNative;
 * // ...
 * IInspectable* sisInspectable = (IInspectable*) reinterpret_cast<IInspectable*>(surfaceImageSource);
 * sisInspectable->QueryInterface(__uuidof(ISurfaceImageSourceNative), (void **)&m_sisD2DNative)
 * 	
 * ```
 * 
 * 
 * The <b>ISurfaceImageSourceNativeWithD2D</b> interface provides high-performance batched Direct2D drawing, which enables drawing to multiple different <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.surfaceimagesource">SurfaceImageSource</a> or <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.virtualsurfaceimagesource">VirtualSurfaceImageSource</a> objects in the same batch, as long as they share the same Direct2D device.  Batching can improve performance when updating multiple surfaces at the same time.
 *  
 *  
 * 
 * The <b>ISurfaceImageSourceNativeWithD2D</b> interface enables drawing to a <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.surfaceimagesource">SurfaceImageSource</a> or <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.virtualsurfaceimagesource">VirtualSurfaceImageSource</a> from one or more background threads, which allows high-performance DirectX rendering off the UI thread.
 * 
 * Only call the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-setdevice">SetDevice</a>, <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-begindraw">BeginDraw</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-enddraw">EndDraw</a> methods on <b>ISurfaceImageSourceNativeWithD2D</b> interface, not on the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenative">ISurfaceImageSourceNative</a> or <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative">IVirtualSurfaceImageSourceNative</a> interfaces.  
 * 
 * 
 * 
 * In order to support batching updates to multiple surfaces to improve performance, you can pass an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> to the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-setdevice">SetDevice</a> method, instead of an <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11device">ID3D11Device</a>.  The <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-begindraw">BeginDraw</a> method can then optionally return a shared <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a>, which the app uses to draw all content for that update.
 * 
 * To draw to the surface from a background thread, you must set any DirectX resources, including the Microsoft Direct3D device, Direct3D device context, Direct2D device, and Direct2D device context, to enable multithreading support.  
 * 
 * 
 * 
 * You can call the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-begindraw">BeginDraw</a>, <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-suspenddraw">SuspendDraw</a>, and <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-resumedraw">ResumeDraw</a> methods from any background thread to enable high-performance multithreaded drawing.
 * 
 * Always call the <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-enddraw">EndDraw</a> method on the UI thread in order to synchronize updating the DirectX content with the current XAML UI thread frame.  You can call <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-begindraw">BeginDraw</a> on a background thread, call <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-suspenddraw">SuspendDraw</a> when you're done drawing on the background thread, and call <b>EndDraw</b> on the UI thread.
 * 
 * Use <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-suspenddraw">SuspendDraw</a> and <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-resumedraw">ResumeDraw</a> to suspend and resume drawing on any background or UI thread.
 * 
 * 
 * 
 * Handle the <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.compositiontarget.surfacecontentslost">SurfaceContentsLost</a> event to determine when you need to recreate content which may be lost if the system resets the GPU.
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class ISurfaceImageSourceNativeWithD2D extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ISurfaceImageSourceNativeWithD2D
     * @type {Guid}
     */
    static IID => Guid("{54298223-41e1-4a41-9c08-02e8256864a1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetDevice", "BeginDraw", "EndDraw", "SuspendDraw", "ResumeDraw"]

    /**
     * Sets the Microsoft DirectX Graphics Infrastructure (DXGI) or Direct2D device, created with D3D11_CREATE_DEVICE_BGRA_SUPPORT, that will draw the surface.
     * @param {IUnknown} device Pointer to the DXGI device interface. You can pass an <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1device">ID2D1Device</a> to signal that this surface participates in Direct2D batching to improve performance when updating Direct2D content across multiple surfaces.  The device must have multithreading supported enabled if the app draws to the surface from a background thread.
     * @returns {HRESULT} This method fails when the SurfaceImageSource is larger than the maximum texture size supported by the Direct3D device. Apps should use VirtualSurfaceImageSource for surfaces larger than the maximum texture size supported by the Direct3D device.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-setdevice
     */
    SetDevice(device) {
        result := ComCall(3, this, "ptr", device, "HRESULT")
        return result
    }

    /**
     * Initiates an update to the associated SurfaceImageSource or VirtualSurfaceImageSource.
     * @param {Pointer<RECT>} updateRect The region of the surface that will be drawn into.
     * @param {Pointer<Guid>} iid IID used to lookup the object for drawing.
     * @param {Pointer<Pointer<Void>>} updateObject Receives a COM pointer to the drawing object. Based on <i>iid</i>, this may be either an <a href="https://docs.microsoft.com/windows/desktop/api/dxgi/nn-dxgi-idxgisurface">IDXGISurface</a>, when not using batched drawing, or a shared <a href="https://docs.microsoft.com/windows/desktop/api/d2d1_1/nn-d2d1_1-id2d1devicecontext">ID2D1DeviceContext</a>, when using batched Direct2D drawing to improve performance when updating Direct2D content across multiple surfaces.
     * @param {Pointer<POINT>} offset Receives the point (x,y) offset of the surface that will be drawn into.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-begindraw
     */
    BeginDraw(updateRect, iid, updateObject, offset) {
        updateObjectMarshal := updateObject is VarRef ? "ptr*" : "ptr"

        result := ComCall(4, this, "ptr", updateRect, "ptr", iid, updateObjectMarshal, updateObject, "ptr", offset, "HRESULT")
        return result
    }

    /**
     * The ISurfaceImageSourceNativeWithD2D::EndDraw method (windows.ui.xaml.media.dxinterop.h) closes the surface draw operation.
     * @remarks
     * Always call the <b>EndDraw</b> method on the UI thread in order to synchronize updating the Microsoft DirectX content with the current XAML UI thread frame.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-enddraw
     */
    EndDraw() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Suspends the drawing operation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-suspenddraw
     */
    SuspendDraw() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * Resume the drawing operation.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-resumedraw
     */
    ResumeDraw() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
