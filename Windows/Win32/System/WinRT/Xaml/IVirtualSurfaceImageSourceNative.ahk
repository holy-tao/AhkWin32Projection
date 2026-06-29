#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IVirtualSurfaceUpdatesCallbackNative.ahk" { IVirtualSurfaceUpdatesCallbackNative }
#Import "..\..\..\Foundation\RECT.ahk" { RECT }
#Import ".\ISurfaceImageSourceNative.ahk" { ISurfaceImageSourceNative }

/**
 * Provides the implementation of a large (greater than the screen size) shared surface for DirectX drawing.
 * @remarks
 * This interface provides the native implementation of the <a href="https://docs.microsoft.com/uwp/api/windows.ui.xaml.media.imaging.virtualsurfaceimagesource">Windows::UI::Xaml::Media::Imaging::VirtualSurfaceImageSource</a> Windows runtime type. To obtain a pointer to <b>IVirtualSurfaceImageSourceNative</b>, you must cast a <b>VirtualSurfaceImageSource</b> instance to <a href="https://docs.microsoft.com/windows/desktop/api/inspectable/nn-inspectable-iinspectable">IInspectable</a> or <b>IUnknown</b>, and call <b>QueryInterface</b>.
 * 
 * 
 * ```cpp
 * 
 * Microsoft::WRL::ComPtr<IVirtualSurfaceImageSourceNative>	m_vsisNative;
 * // ...
 * IInspectable* vsisInspectable = (IInspectable*) reinterpret_cast<IInspectable*>(virtualSurfaceImageSource);
 * vsisInspectable->QueryInterface(__uuidof(IVirtualSurfaceImageSourceNative), (void **)&m_vsisNative)
 * 	
 * ```
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative
 * @namespace Windows.Win32.System.WinRT.Xaml
 */
export default struct IVirtualSurfaceImageSourceNative extends ISurfaceImageSourceNative {
    /**
     * The interface identifier for IVirtualSurfaceImageSourceNative
     * @type {Guid}
     */
    static IID := Guid("{e9550983-360b-4f53-b391-afd695078691}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IVirtualSurfaceImageSourceNative interfaces
    */
    struct Vtbl extends ISurfaceImageSourceNative.Vtbl {
        Invalidate               : IntPtr
        GetUpdateRectCount       : IntPtr
        GetUpdateRects           : IntPtr
        GetVisibleBounds         : IntPtr
        RegisterForUpdatesNeeded : IntPtr
        Resize                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IVirtualSurfaceImageSourceNative.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Invalidates a specific region of the shared surface for drawing.
     * @param {RECT} updateRect The region of the surface to invalidate.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-invalidate
     */
    Invalidate(updateRect) {
        result := ComCall(6, this, RECT, updateRect, "HRESULT")
        return result
    }

    /**
     * Gets the total number of regions of the surface that must be updated.
     * @returns {Integer} Receives the number of regions to update.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getupdaterectcount
     */
    GetUpdateRectCount() {
        result := ComCall(7, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Gets the set of regions that must be updated on the shared surface.
     * @param {Integer} count Receives a list of regions that must be updated.
     * @returns {RECT} The number of regions that must be updated. You obtain this by calling <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getupdaterectcount">GetUpdateRectCount</a>.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getupdaterects
     */
    GetUpdateRects(count) {
        updates := RECT()
        result := ComCall(8, this, RECT.Ptr, updates, "uint", count, "HRESULT")
        return updates
    }

    /**
     * Gets the boundaries of the visible region of the shared surface.
     * @returns {RECT} Receives a rectangle that specifies the visible region of the shared surface.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getvisiblebounds
     */
    GetVisibleBounds() {
        bounds := RECT()
        result := ComCall(9, this, RECT.Ptr, bounds, "HRESULT")
        return bounds
    }

    /**
     * Registers for the callback that will perform the drawing when an update to the shared surface is requested.
     * @param {IVirtualSurfaceUpdatesCallbackNative} callback Pointer to an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceupdatescallbacknative">IVirtualSurfaceUpdatesCallbackNative</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-registerforupdatesneeded
     */
    RegisterForUpdatesNeeded(callback) {
        result := ComCall(10, this, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * Resizes the surface.
     * @param {Integer} newWidth The updated width of the surface.
     * @param {Integer} newHeight The updated height of the surface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-resize
     */
    Resize(newWidth, newHeight) {
        result := ComCall(11, this, "int", newWidth, "int", newHeight, "HRESULT")
        return result
    }

    Query(iid) {
        if (IVirtualSurfaceImageSourceNative.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Invalidate := CallbackCreate(GetMethod(implObj, "Invalidate"), flags, 2)
        this.vtbl.GetUpdateRectCount := CallbackCreate(GetMethod(implObj, "GetUpdateRectCount"), flags, 2)
        this.vtbl.GetUpdateRects := CallbackCreate(GetMethod(implObj, "GetUpdateRects"), flags, 3)
        this.vtbl.GetVisibleBounds := CallbackCreate(GetMethod(implObj, "GetVisibleBounds"), flags, 2)
        this.vtbl.RegisterForUpdatesNeeded := CallbackCreate(GetMethod(implObj, "RegisterForUpdatesNeeded"), flags, 2)
        this.vtbl.Resize := CallbackCreate(GetMethod(implObj, "Resize"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Invalidate)
        CallbackFree(this.vtbl.GetUpdateRectCount)
        CallbackFree(this.vtbl.GetUpdateRects)
        CallbackFree(this.vtbl.GetVisibleBounds)
        CallbackFree(this.vtbl.RegisterForUpdatesNeeded)
        CallbackFree(this.vtbl.Resize)
    }
}
