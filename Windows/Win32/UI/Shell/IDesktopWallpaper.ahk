#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\RECT.ahk
#Include .\IShellItemArray.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idesktopwallpaper
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDesktopWallpaper extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDesktopWallpaper
     * @type {Guid}
     */
    static IID => Guid("{b92b56a9-8b55-4e14-9a89-0199bbb6f93b}")

    /**
     * The class identifier for DesktopWallpaper
     * @type {Guid}
     */
    static CLSID => Guid("{c2cf3110-460e-4fc1-b9d0-8a1c0c9cc4bd}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetWallpaper", "GetWallpaper", "GetMonitorDevicePathAt", "GetMonitorDevicePathCount", "GetMonitorRECT", "SetBackgroundColor", "GetBackgroundColor", "SetPosition", "GetPosition", "SetSlideshow", "GetSlideshow", "SetSlideshowOptions", "GetSlideshowOptions", "AdvanceSlideshow", "GetStatus", "Enable"]

    /**
     * 
     * @param {PWSTR} monitorID 
     * @param {PWSTR} wallpaper 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setwallpaper
     */
    SetWallpaper(monitorID, wallpaper) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID
        wallpaper := wallpaper is String ? StrPtr(wallpaper) : wallpaper

        result := ComCall(3, this, "ptr", monitorID, "ptr", wallpaper, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} monitorID 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getwallpaper
     */
    GetWallpaper(monitorID) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        result := ComCall(4, this, "ptr", monitorID, "ptr*", &wallpaper := 0, "HRESULT")
        return wallpaper
    }

    /**
     * 
     * @param {Integer} monitorIndex 
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathat
     */
    GetMonitorDevicePathAt(monitorIndex) {
        result := ComCall(5, this, "uint", monitorIndex, "ptr*", &monitorID := 0, "HRESULT")
        return monitorID
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathcount
     */
    GetMonitorDevicePathCount() {
        result := ComCall(6, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * 
     * @param {PWSTR} monitorID 
     * @returns {RECT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitorrect
     */
    GetMonitorRECT(monitorID) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        displayRect := RECT()
        result := ComCall(7, this, "ptr", monitorID, "ptr", displayRect, "HRESULT")
        return displayRect
    }

    /**
     * 
     * @param {COLORREF} color 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setbackgroundcolor
     */
    SetBackgroundColor(color) {
        result := ComCall(8, this, "uint", color, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {COLORREF} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getbackgroundcolor
     */
    GetBackgroundColor() {
        result := ComCall(9, this, "uint*", &color := 0, "HRESULT")
        return color
    }

    /**
     * 
     * @param {Integer} position 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setposition
     */
    SetPosition(position) {
        result := ComCall(10, this, "int", position, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getposition
     */
    GetPosition() {
        result := ComCall(11, this, "int*", &position := 0, "HRESULT")
        return position
    }

    /**
     * 
     * @param {IShellItemArray} items 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setslideshow
     */
    SetSlideshow(items) {
        result := ComCall(12, this, "ptr", items, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IShellItemArray} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getslideshow
     */
    GetSlideshow() {
        result := ComCall(13, this, "ptr*", &items := 0, "HRESULT")
        return IShellItemArray(items)
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Integer} slideshowTick 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setslideshowoptions
     */
    SetSlideshowOptions(options, slideshowTick) {
        result := ComCall(14, this, "int", options, "uint", slideshowTick, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} options 
     * @param {Pointer<Integer>} slideshowTick 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getslideshowoptions
     */
    GetSlideshowOptions(options, slideshowTick) {
        optionsMarshal := options is VarRef ? "int*" : "ptr"
        slideshowTickMarshal := slideshowTick is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, optionsMarshal, options, slideshowTickMarshal, slideshowTick, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} monitorID 
     * @param {Integer} direction 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-advanceslideshow
     */
    AdvanceSlideshow(monitorID, direction) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        result := ComCall(16, this, "ptr", monitorID, "int", direction, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getstatus
     */
    GetStatus() {
        result := ComCall(17, this, "int*", &state := 0, "HRESULT")
        return state
    }

    /**
     * 
     * @param {BOOL} enable 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-enable
     */
    Enable(enable) {
        result := ComCall(18, this, "int", enable, "HRESULT")
        return result
    }
}
