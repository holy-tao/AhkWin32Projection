#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include .\ISurfaceImageSourceNative.ahk

/**
 * 
 * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nn-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative
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
     * 
     * @param {RECT} updateRect 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-invalidate
     */
    Invalidate(updateRect) {
        result := ComCall(6, this, "ptr", updateRect, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getupdaterectcount
     */
    GetUpdateRectCount(count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(7, this, countMarshal, count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} updates 
     * @param {Integer} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getupdaterects
     */
    GetUpdateRects(updates, count) {
        result := ComCall(8, this, "ptr", updates, "uint", count, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} bounds 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-getvisiblebounds
     */
    GetVisibleBounds(bounds) {
        result := ComCall(9, this, "ptr", bounds, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IVirtualSurfaceUpdatesCallbackNative} callback 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-registerforupdatesneeded
     */
    RegisterForUpdatesNeeded(callback) {
        result := ComCall(10, this, "ptr", callback, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} newWidth 
     * @param {Integer} newHeight 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-ivirtualsurfaceimagesourcenative-resize
     */
    Resize(newWidth, newHeight) {
        result := ComCall(11, this, "int", newWidth, "int", newHeight, "HRESULT")
        return result
    }
}
