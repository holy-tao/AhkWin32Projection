#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\Com\IUnknown.ahk

/**
 * 
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
     * 
     * @param {IUnknown} device 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-setdevice
     */
    SetDevice(device) {
        result := ComCall(3, this, "ptr", device, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<RECT>} updateRect 
     * @param {Pointer<Guid>} iid 
     * @param {Pointer<Pointer<Void>>} updateObject 
     * @param {Pointer<POINT>} offset 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-begindraw
     */
    BeginDraw(updateRect, iid, updateObject, offset) {
        result := ComCall(4, this, "ptr", updateRect, "ptr", iid, "ptr*", updateObject, "ptr", offset, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-enddraw
     */
    EndDraw() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-suspenddraw
     */
    SuspendDraw() {
        result := ComCall(6, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/windows.ui.xaml.media.dxinterop/nf-windows-ui-xaml-media-dxinterop-isurfaceimagesourcenativewithd2d-resumedraw
     */
    ResumeDraw() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
