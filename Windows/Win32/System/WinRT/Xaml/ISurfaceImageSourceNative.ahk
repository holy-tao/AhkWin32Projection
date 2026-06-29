#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\POINT.ahk" { POINT }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Graphics\Dxgi\IDXGIDevice.ahk" { IDXGIDevice }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }
#Import "..\..\..\Graphics\Dxgi\IDXGISurface.ahk" { IDXGISurface }
#Import "..\..\Com\IUnknown.ahk" { IUnknown }

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
 */
export default struct ISurfaceImageSourceNative extends IUnknown {
    /**
     * The interface identifier for ISurfaceImageSourceNative
     * @type {Guid}
     */
    static IID := Guid("{f2e9edc1-d307-4525-9886-0fafaa44163c}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for ISurfaceImageSourceNative interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetDevice : IntPtr
        BeginDraw : IntPtr
        EndDraw   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := ISurfaceImageSourceNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

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
        result := ComCall(4, this, RECT, updateRect, IDXGISurface.Ptr, surface, POINT.Ptr, offset, "HRESULT")
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

    Query(iid) {
        if (ISurfaceImageSourceNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetDevice := CallbackCreate(GetMethod(implObj, "SetDevice"), flags, 2)
        this.vtbl.BeginDraw := CallbackCreate(GetMethod(implObj, "BeginDraw"), flags, 4)
        this.vtbl.EndDraw := CallbackCreate(GetMethod(implObj, "EndDraw"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetDevice)
        CallbackFree(this.vtbl.BeginDraw)
        CallbackFree(this.vtbl.EndDraw)
    }
}
