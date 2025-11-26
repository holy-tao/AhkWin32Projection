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
     * Sets the desktop wallpaper.
     * @param {PWSTR} monitorID The ID of the monitor. This value can be obtained through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathat">GetMonitorDevicePathAt</a>. Set this value to NULL to set the wallpaper image on all monitors.
     * @param {PWSTR} wallpaper The full path of the wallpaper image file.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setwallpaper
     */
    SetWallpaper(monitorID, wallpaper) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID
        wallpaper := wallpaper is String ? StrPtr(wallpaper) : wallpaper

        result := ComCall(3, this, "ptr", monitorID, "ptr", wallpaper, "HRESULT")
        return result
    }

    /**
     * Gets the current desktop wallpaper.
     * @param {PWSTR} monitorID The ID of the monitor. This value can be obtained through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathat">GetMonitorDevicePathAt</a>.
     * 
     * This value can be set to <b>NULL</b>. In that case, if a single wallpaper image is displayed on all of the system's monitors, the method returns successfully. If this value is set to <b>NULL</b> and different monitors are displaying different wallpapers or a slideshow is running, the method returns S_FALSE and an empty string in the <i>wallpaper</i> parameter.
     * @returns {PWSTR} The address of a pointer to a buffer that, when this method returns successfully, receives the path to the wallpaper image file. Note that this image could be currently displayed on all of the system's monitors, not just the monitor specified in the <i>monitorID</i> parameter.
     * 
     * This string will be empty if no wallpaper image is being displayed or if a monitor is displaying a solid color. The string will also be empty if the method fails.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getwallpaper
     */
    GetWallpaper(monitorID) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        result := ComCall(4, this, "ptr", monitorID, "ptr*", &wallpaper := 0, "HRESULT")
        return wallpaper
    }

    /**
     * Retrieves the unique ID of one of the system's monitors.
     * @param {Integer} monitorIndex The number of the monitor. Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathcount">GetMonitorDevicePathCount</a> to determine the total number of monitors.
     * @returns {PWSTR} A pointer to the address of a buffer that, when this method returns successfully, receives the monitor's ID.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathat
     */
    GetMonitorDevicePathAt(monitorIndex) {
        result := ComCall(5, this, "uint", monitorIndex, "ptr*", &monitorID := 0, "HRESULT")
        return monitorID
    }

    /**
     * Retrieves the number of monitors that are associated with the system.
     * @returns {Integer} A pointer to a value that, when this method returns successfully, receives the number of monitors.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathcount
     */
    GetMonitorDevicePathCount() {
        result := ComCall(6, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Retrieves the display rectangle of the specified monitor.
     * @param {PWSTR} monitorID The ID of the monitor to query. You can get this value through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathat">GetMonitorDevicePathAt</a>.
     * @returns {RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that, when this method returns successfully, receives the display rectangle of the monitor specified by <i>monitorID</i>, in screen coordinates.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitorrect
     */
    GetMonitorRECT(monitorID) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        displayRect := RECT()
        result := ComCall(7, this, "ptr", monitorID, "ptr", displayRect, "HRESULT")
        return displayRect
    }

    /**
     * Sets the color that is visible on the desktop when no image is displayed or when the desktop background has been disabled. This color is also used as a border when the desktop wallpaper does not fill the entire screen.
     * @param {COLORREF} color A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value that specifies the background RGB color value.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setbackgroundcolor
     */
    SetBackgroundColor(color) {
        result := ComCall(8, this, "uint", color, "HRESULT")
        return result
    }

    /**
     * Retrieves the color that is visible on the desktop when no image is displayed or when the desktop background has been disabled. This color is also used as a border when the desktop wallpaper does not fill the entire screen.
     * @returns {COLORREF} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value that, when this method returns successfully, receives the RGB color value. If this method fails, this value is set to 0.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getbackgroundcolor
     */
    GetBackgroundColor() {
        result := ComCall(9, this, "uint*", &color := 0, "HRESULT")
        return color
    }

    /**
     * Sets the display option for the desktop wallpaper image, determining whether the image should be centered, tiled, or stretched.
     * @param {Integer} position One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-desktop_wallpaper_position">DESKTOP_WALLPAPER_POSITION</a> enumeration values that specify how the image will be displayed on the system's monitors.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code, including the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The desktop wallpaper is already displayed as asked for in <i>position</i>.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setposition
     */
    SetPosition(position) {
        result := ComCall(10, this, "int", position, "HRESULT")
        return result
    }

    /**
     * Retrieves the current display value for the desktop background image.
     * @returns {Integer} A pointer to a value that, when this method returns successfully, receives one of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-desktop_wallpaper_position">DESKTOP_WALLPAPER_POSITION</a> enumeration values that specify how the image is being displayed on the system's monitors.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getposition
     */
    GetPosition() {
        result := ComCall(11, this, "int*", &position := 0, "HRESULT")
        return position
    }

    /**
     * Specifies the images to use for the desktop wallpaper slideshow.
     * @param {IShellItemArray} items A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a> that contains the slideshow images. This array can contain individual items stored in the same container (files stored in a folder), or it can contain a single item which is the container itself (a folder that contains images). Any other configuration of the array will cause this method to fail.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setslideshow
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
     * Sets the desktop wallpaper slideshow settings for shuffle and timing.
     * @param {Integer} options Set to either 0 to disable shuffle or the following value.
     * @param {Integer} slideshowTick The amount of time, in milliseconds, between image transitions.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setslideshowoptions
     */
    SetSlideshowOptions(options, slideshowTick) {
        result := ComCall(14, this, "int", options, "uint", slideshowTick, "HRESULT")
        return result
    }

    /**
     * Gets the current desktop wallpaper slideshow settings for shuffle and timing.
     * @param {Pointer<Integer>} options Type: <b>DESKTOP_SLIDESHOW_OPTIONS*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives either 0 to indicate that shuffle is disabled or the following value.
     * @param {Pointer<Integer>} slideshowTick Type: <b>UINT*</b>
     * 
     * A pointer to a value that, when this method returns successfully, receives the interval between image transitions, in milliseconds.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code, including the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_POINTER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A <b>NULL</b> pointer was provided in one of the parameters.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getslideshowoptions
     */
    GetSlideshowOptions(options, slideshowTick) {
        optionsMarshal := options is VarRef ? "int*" : "ptr"
        slideshowTickMarshal := slideshowTick is VarRef ? "uint*" : "ptr"

        result := ComCall(15, this, optionsMarshal, options, slideshowTickMarshal, slideshowTick, "HRESULT")
        return result
    }

    /**
     * Switches the wallpaper on a specified monitor to the next image in the slideshow.
     * @param {PWSTR} monitorID The ID of the monitor on which to change the wallpaper image. This ID can be obtained through the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathat">GetMonitorDevicePathAt</a> method. If this parameter is set to <b>NULL</b>, the monitor scheduled to change next is used.
     * @param {Integer} direction The direction that the slideshow should advance. One of the following DESKTOP_SLIDESHOW_DIRECTION values:
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-advanceslideshow
     */
    AdvanceSlideshow(monitorID, direction) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        result := ComCall(16, this, "ptr", monitorID, "int", direction, "HRESULT")
        return result
    }

    /**
     * Gets the current status of the slideshow.
     * @returns {Integer} A pointer to a DESKTOP_SLIDESHOW_STATE value that, when this method returns successfully, receives one or more of the following flags.
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getstatus
     */
    GetStatus() {
        result := ComCall(17, this, "int*", &state := 0, "HRESULT")
        return state
    }

    /**
     * Enables or disables the desktop background.
     * @param {BOOL} enable <b>TRUE</b> to enable the desktop background, <b>FALSE</b> to disable it.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code, including the following.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>S_FALSE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The desktop wallpaper is already in the state you're asking for through this call.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>E_FILE_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The desktop wallpaper that would be used when the background is enabled is missing from its expected location. Call <a href="/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setwallpaper">SetWallpaper</a> to specify a new wallpaper.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//shobjidl_core/nf-shobjidl_core-idesktopwallpaper-enable
     */
    Enable(enable) {
        result := ComCall(18, this, "int", enable, "HRESULT")
        return result
    }
}
