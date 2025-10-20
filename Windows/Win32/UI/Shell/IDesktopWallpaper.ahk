#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * .
 * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nn-shobjidl_core-idesktopwallpaper
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class IDesktopWallpaper extends IUnknown{
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
     * 
     * @param {PWSTR} monitorID 
     * @param {PWSTR} wallpaper 
     * @returns {HRESULT} 
     */
    SetWallpaper(monitorID, wallpaper) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID
        wallpaper := wallpaper is String ? StrPtr(wallpaper) : wallpaper

        result := ComCall(3, this, "ptr", monitorID, "ptr", wallpaper, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} monitorID 
     * @param {Pointer<PWSTR>} wallpaper 
     * @returns {HRESULT} 
     */
    GetWallpaper(monitorID, wallpaper) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        result := ComCall(4, this, "ptr", monitorID, "ptr", wallpaper, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} monitorIndex 
     * @param {Pointer<PWSTR>} monitorID 
     * @returns {HRESULT} 
     */
    GetMonitorDevicePathAt(monitorIndex, monitorID) {
        result := ComCall(5, this, "uint", monitorIndex, "ptr", monitorID, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetMonitorDevicePathCount(count) {
        result := ComCall(6, this, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} monitorID 
     * @param {Pointer<RECT>} displayRect 
     * @returns {HRESULT} 
     */
    GetMonitorRECT(monitorID, displayRect) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        result := ComCall(7, this, "ptr", monitorID, "ptr", displayRect, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {COLORREF} color 
     * @returns {HRESULT} 
     */
    SetBackgroundColor(color) {
        result := ComCall(8, this, "uint", color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<COLORREF>} color 
     * @returns {HRESULT} 
     */
    GetBackgroundColor(color) {
        result := ComCall(9, this, "ptr", color, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} position 
     * @returns {HRESULT} 
     */
    SetPosition(position) {
        result := ComCall(10, this, "int", position, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} position 
     * @returns {HRESULT} 
     */
    GetPosition(position) {
        result := ComCall(11, this, "int*", position, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} items 
     * @returns {HRESULT} 
     */
    SetSlideshow(items) {
        result := ComCall(12, this, "ptr", items, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IShellItemArray>} items 
     * @returns {HRESULT} 
     */
    GetSlideshow(items) {
        result := ComCall(13, this, "ptr", items, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} options 
     * @param {Integer} slideshowTick 
     * @returns {HRESULT} 
     */
    SetSlideshowOptions(options, slideshowTick) {
        result := ComCall(14, this, "int", options, "uint", slideshowTick, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} options 
     * @param {Pointer<UInt32>} slideshowTick 
     * @returns {HRESULT} 
     */
    GetSlideshowOptions(options, slideshowTick) {
        result := ComCall(15, this, "int*", options, "uint*", slideshowTick, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} monitorID 
     * @param {Integer} direction 
     * @returns {HRESULT} 
     */
    AdvanceSlideshow(monitorID, direction) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        result := ComCall(16, this, "ptr", monitorID, "int", direction, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} state 
     * @returns {HRESULT} 
     */
    GetStatus(state) {
        result := ComCall(17, this, "int*", state, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BOOL} enable 
     * @returns {HRESULT} 
     */
    Enable(enable) {
        result := ComCall(18, this, "int", enable, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
