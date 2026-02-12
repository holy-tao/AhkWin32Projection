#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\RECT.ahk
#Include .\ISurfaceImageSourceNative.ahk

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
 * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative
 * @namespace Windows.Win32.System.WinRT.Xaml
 * @version v4.0.30319
 */
class IVirtualSurfaceImageSourceNative extends ISurfaceImageSourceNative{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVirtualSurfaceImageSourceNative
     * @type {Guid}
     */
    static IID => Guid("{e9550983-360b-4f53-b391-afd695078691}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invalidate", "GetUpdateRectCount", "GetUpdateRects", "GetVisibleBounds", "RegisterForUpdatesNeeded", "Resize"]

    /**
     * Invalidates a specific region of the shared surface for drawing.
     * @param {RECT} updateRect The region of the surface to invalidate.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-invalidate
     */
    Invalidate(updateRect) {
        result := ComCall(6, this, "ptr", updateRect, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Gets the total number of regions of the surface that must be updated.
     * @returns {Integer} Receives the number of regions to update.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getupdaterectcount
     */
    GetUpdateRectCount() {
        result := ComCall(7, this, "uint*", &count := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return count
    }

    /**
     * Gets the set of regions that must be updated on the shared surface.
     * @param {Integer} count Receives a list of regions that must be updated.
     * @returns {RECT} The number of regions that must be updated. You obtain this by calling <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getupdaterectcount">GetUpdateRectCount</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getupdaterects
     */
    GetUpdateRects(count) {
        updates := RECT()
        result := ComCall(8, this, "ptr", updates, "uint", count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return updates
    }

    /**
     * Gets the boundaries of the visible region of the shared surface.
     * @returns {RECT} Receives a rectangle that specifies the visible region of the shared surface.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getvisiblebounds
     */
    GetVisibleBounds() {
        bounds := RECT()
        result := ComCall(9, this, "ptr", bounds, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return bounds
    }

    /**
     * Registers for the callback that will perform the drawing when an update to the shared surface is requested.
     * @param {IVirtualSurfaceUpdatesCallbackNative} callback Pointer to an implementation of <a href="https://docs.microsoft.com/windows/desktop/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceupdatescallbacknative">IVirtualSurfaceUpdatesCallbackNative</a>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-registerforupdatesneeded
     */
    RegisterForUpdatesNeeded(callback) {
        result := ComCall(10, this, "ptr", callback, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Resizes the surface.
     * @param {Integer} newWidth The updated width of the surface.
     * @param {Integer} newHeight The updated height of the surface.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api//content/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-resize
     */
    Resize(newWidth, newHeight) {
        result := ComCall(11, this, "int", newWidth, "int", newHeight, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
