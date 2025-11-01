#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
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
     * 
     * @param {IDXGIDevice} device 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenative-setdevice
     */
    SetDevice(device) {
        result := ComCall(3, this, "ptr", device, "HRESULT")
        return result
    }

    /**
     * 
     * @param {RECT} updateRect 
     * @param {Pointer<IDXGISurface>} surface 
     * @param {Pointer<POINT>} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenative-begindraw
     */
    BeginDraw(updateRect, surface, offset) {
        result := ComCall(4, this, "ptr", updateRect, "ptr*", surface, "ptr", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenative-enddraw
     */
    EndDraw() {
        result := ComCall(5, this, "HRESULT")
        return result
    }
}
