#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\DESKTOP_SLIDESHOW_DIRECTION.ahk" { DESKTOP_SLIDESHOW_DIRECTION }
#Import ".\DESKTOP_SLIDESHOW_STATE.ahk" { DESKTOP_SLIDESHOW_STATE }
#Import "..\..\Foundation\BOOL.ahk" { BOOL }
#Import ".\IShellItemArray.ahk" { IShellItemArray }
#Import ".\DESKTOP_WALLPAPER_POSITION.ahk" { DESKTOP_WALLPAPER_POSITION }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DESKTOP_SLIDESHOW_OPTIONS.ahk" { DESKTOP_SLIDESHOW_OPTIONS }
#Import "..\..\Foundation\COLORREF.ahk" { COLORREF }
#Import "..\..\Foundation\RECT.ahk" { RECT }

/**
 * . (IDesktopWallpaper)
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nn-shobjidl_core-idesktopwallpaper
 * @namespace Windows.Win32.UI.Shell
 */
export default struct IDesktopWallpaper extends IUnknown {
    /**
     * The interface identifier for IDesktopWallpaper
     * @type {Guid}
     */
    static IID := Guid("{b92b56a9-8b55-4e14-9a89-0199bbb6f93b}")

    /**
     * The class identifier for DesktopWallpaper
     * @type {Guid}
     */
    static CLSID := Guid("{c2cf3110-460e-4fc1-b9d0-8a1c0c9cc4bd}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDesktopWallpaper interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetWallpaper              : IntPtr
        GetWallpaper              : IntPtr
        GetMonitorDevicePathAt    : IntPtr
        GetMonitorDevicePathCount : IntPtr
        GetMonitorRECT            : IntPtr
        SetBackgroundColor        : IntPtr
        GetBackgroundColor        : IntPtr
        SetPosition               : IntPtr
        GetPosition               : IntPtr
        SetSlideshow              : IntPtr
        GetSlideshow              : IntPtr
        SetSlideshowOptions       : IntPtr
        GetSlideshowOptions       : IntPtr
        AdvanceSlideshow          : IntPtr
        GetStatus                 : IntPtr
        Enable                    : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDesktopWallpaper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Sets the desktop wallpaper.
     * @param {PWSTR} monitorID The ID of the monitor. This value can be obtained through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathat">GetMonitorDevicePathAt</a>. Set this value to NULL to set the wallpaper image on all monitors.
     * @param {PWSTR} wallpaper The full path of the wallpaper image file.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setwallpaper
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getwallpaper
     */
    GetWallpaper(monitorID) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        result := ComCall(4, this, "ptr", monitorID, PWSTR.Ptr, &wallpaper := 0, "HRESULT")
        return wallpaper
    }

    /**
     * Retrieves the unique ID of one of the system's monitors.
     * @remarks
     * This method can be called on monitors that are currently detached but that have an image assigned to them. Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitorrect">GetMonitorRECT</a> to distinguish between attached and detached monitors.
     * @param {Integer} monitorIndex The number of the monitor. Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathcount">GetMonitorDevicePathCount</a> to determine the total number of monitors.
     * @returns {PWSTR} A pointer to the address of a buffer that, when this method returns successfully, receives the monitor's ID.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathat
     */
    GetMonitorDevicePathAt(monitorIndex) {
        result := ComCall(5, this, "uint", monitorIndex, PWSTR.Ptr, &monitorID := 0, "HRESULT")
        return monitorID
    }

    /**
     * Retrieves the number of monitors that are associated with the system.
     * @remarks
     * The count retrieved through this method includes monitors that are currently detached but that have an image assigned to them. Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitorrect">GetMonitorRECT</a> to distinguish between attached and detached monitors.
     * @returns {Integer} A pointer to a value that, when this method returns successfully, receives the number of monitors.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathcount
     */
    GetMonitorDevicePathCount() {
        result := ComCall(6, this, "uint*", &count := 0, "HRESULT")
        return count
    }

    /**
     * Retrieves the display rectangle of the specified monitor.
     * @param {PWSTR} monitorID The ID of the monitor to query. You can get this value through <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitordevicepathat">GetMonitorDevicePathAt</a>.
     * @returns {RECT} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/windef/ns-windef-rect">RECT</a> structure that, when this method returns successfully, receives the display rectangle of the monitor specified by <i>monitorID</i>, in screen coordinates.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getmonitorrect
     */
    GetMonitorRECT(monitorID) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        displayRect := RECT()
        result := ComCall(7, this, "ptr", monitorID, RECT.Ptr, displayRect, "HRESULT")
        return displayRect
    }

    /**
     * Sets the color that is visible on the desktop when no image is displayed or when the desktop background has been disabled. This color is also used as a border when the desktop wallpaper does not fill the entire screen.
     * @param {COLORREF} _color A <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value that specifies the background RGB color value.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setbackgroundcolor
     */
    SetBackgroundColor(_color) {
        result := ComCall(8, this, COLORREF, _color, "HRESULT")
        return result
    }

    /**
     * Retrieves the color that is visible on the desktop when no image is displayed or when the desktop background has been disabled. This color is also used as a border when the desktop wallpaper does not fill the entire screen.
     * @returns {COLORREF} A pointer to a <a href="https://docs.microsoft.com/windows/desktop/gdi/colorref">COLORREF</a> value that, when this method returns successfully, receives the RGB color value. If this method fails, this value is set to 0.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getbackgroundcolor
     */
    GetBackgroundColor() {
        result := ComCall(9, this, COLORREF.Ptr, &_color := 0, "HRESULT")
        return _color
    }

    /**
     * Sets the display option for the desktop wallpaper image, determining whether the image should be centered, tiled, or stretched.
     * @param {DESKTOP_WALLPAPER_POSITION} position One of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-desktop_wallpaper_position">DESKTOP_WALLPAPER_POSITION</a> enumeration values that specify how the image will be displayed on the system's monitors.
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setposition
     */
    SetPosition(position) {
        result := ComCall(10, this, DESKTOP_WALLPAPER_POSITION, position, "HRESULT")
        return result
    }

    /**
     * Retrieves the current display value for the desktop background image.
     * @returns {DESKTOP_WALLPAPER_POSITION} A pointer to a value that, when this method returns successfully, receives one of the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/ne-shobjidl_core-desktop_wallpaper_position">DESKTOP_WALLPAPER_POSITION</a> enumeration values that specify how the image is being displayed on the system's monitors.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getposition
     */
    GetPosition() {
        result := ComCall(11, this, "int*", &position := 0, "HRESULT")
        return position
    }

    /**
     * Specifies the images to use for the desktop wallpaper slideshow.
     * @param {IShellItemArray} items A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a> that contains the slideshow images. This array can contain individual items stored in the same container (files stored in a folder), or it can contain a single item which is the container itself (a folder that contains images). Any other configuration of the array will cause this method to fail.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setslideshow
     */
    SetSlideshow(items) {
        result := ComCall(12, this, "ptr", items, "HRESULT")
        return result
    }

    /**
     * Gets the path to the directory where the slideshow images are stored.
     * @returns {IShellItemArray} The address of a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nn-shobjidl_core-ishellitemarray">IShellItemArray</a> object that, when this method returns successfully, receives the items that make up the slideshow. This array can contain individual items stored in the same container, or it can contain a single item which is the container itself.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getslideshow
     */
    GetSlideshow() {
        result := ComCall(13, this, "ptr*", &items := 0, "HRESULT")
        return IShellItemArray(items)
    }

    /**
     * Sets the desktop wallpaper slideshow settings for shuffle and timing.
     * @param {DESKTOP_SLIDESHOW_OPTIONS} options Set to either 0 to disable shuffle or the following value.
     * @param {Integer} slideshowTick The amount of time, in milliseconds, between image transitions.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setslideshowoptions
     */
    SetSlideshowOptions(options, slideshowTick) {
        result := ComCall(14, this, DESKTOP_SLIDESHOW_OPTIONS, options, "uint", slideshowTick, "HRESULT")
        return result
    }

    /**
     * Gets the current desktop wallpaper slideshow settings for shuffle and timing.
     * @param {Pointer<DESKTOP_SLIDESHOW_OPTIONS>} options Type: <b>DESKTOP_SLIDESHOW_OPTIONS*</b>
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
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getslideshowoptions
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
     * @param {DESKTOP_SLIDESHOW_DIRECTION} _direction The direction that the slideshow should advance. One of the following DESKTOP_SLIDESHOW_DIRECTION values:
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-advanceslideshow
     */
    AdvanceSlideshow(monitorID, _direction) {
        monitorID := monitorID is String ? StrPtr(monitorID) : monitorID

        result := ComCall(16, this, "ptr", monitorID, DESKTOP_SLIDESHOW_DIRECTION, _direction, "HRESULT")
        return result
    }

    /**
     * Gets the current status of the slideshow.
     * @returns {DESKTOP_SLIDESHOW_STATE} A pointer to a DESKTOP_SLIDESHOW_STATE value that, when this method returns successfully, receives one or more of the following flags.
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getstatus
     */
    GetStatus() {
        result := ComCall(17, this, "int*", &state := 0, "HRESULT")
        return state
    }

    /**
     * Enables or disables the desktop background.
     * @remarks
     * This method would normally be called to disable the desktop background for performance reasons.
     * 
     * When the desktop background is disabled, a solid color is shown in its place. To get or set the specific color, use the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-getbackgroundcolor">GetBackgroundColor</a> and <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setbackgroundcolor">SetBackgroundColor</a> methods.
     * 
     * <div class="alert"><b>Note</b>  A call to the <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setwallpaper">IDesktopWallpaper_SetWallpaper</a> or <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setslideshow">IDesktopWallpaper_SetSlideshow</a> methods will enable the desktop background even if it is currently disabled through this method.</div>
     * <div> </div>
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
     * The desktop wallpaper that would be used when the background is enabled is missing from its expected location. Call <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-setwallpaper">SetWallpaper</a> to specify a new wallpaper.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/nf-shobjidl_core-idesktopwallpaper-enable
     */
    Enable(enable) {
        result := ComCall(18, this, BOOL, enable, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDesktopWallpaper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetWallpaper := CallbackCreate(GetMethod(implObj, "SetWallpaper"), flags, 3)
        this.vtbl.GetWallpaper := CallbackCreate(GetMethod(implObj, "GetWallpaper"), flags, 3)
        this.vtbl.GetMonitorDevicePathAt := CallbackCreate(GetMethod(implObj, "GetMonitorDevicePathAt"), flags, 3)
        this.vtbl.GetMonitorDevicePathCount := CallbackCreate(GetMethod(implObj, "GetMonitorDevicePathCount"), flags, 2)
        this.vtbl.GetMonitorRECT := CallbackCreate(GetMethod(implObj, "GetMonitorRECT"), flags, 3)
        this.vtbl.SetBackgroundColor := CallbackCreate(GetMethod(implObj, "SetBackgroundColor"), flags, 2)
        this.vtbl.GetBackgroundColor := CallbackCreate(GetMethod(implObj, "GetBackgroundColor"), flags, 2)
        this.vtbl.SetPosition := CallbackCreate(GetMethod(implObj, "SetPosition"), flags, 2)
        this.vtbl.GetPosition := CallbackCreate(GetMethod(implObj, "GetPosition"), flags, 2)
        this.vtbl.SetSlideshow := CallbackCreate(GetMethod(implObj, "SetSlideshow"), flags, 2)
        this.vtbl.GetSlideshow := CallbackCreate(GetMethod(implObj, "GetSlideshow"), flags, 2)
        this.vtbl.SetSlideshowOptions := CallbackCreate(GetMethod(implObj, "SetSlideshowOptions"), flags, 3)
        this.vtbl.GetSlideshowOptions := CallbackCreate(GetMethod(implObj, "GetSlideshowOptions"), flags, 3)
        this.vtbl.AdvanceSlideshow := CallbackCreate(GetMethod(implObj, "AdvanceSlideshow"), flags, 3)
        this.vtbl.GetStatus := CallbackCreate(GetMethod(implObj, "GetStatus"), flags, 2)
        this.vtbl.Enable := CallbackCreate(GetMethod(implObj, "Enable"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetWallpaper)
        CallbackFree(this.vtbl.GetWallpaper)
        CallbackFree(this.vtbl.GetMonitorDevicePathAt)
        CallbackFree(this.vtbl.GetMonitorDevicePathCount)
        CallbackFree(this.vtbl.GetMonitorRECT)
        CallbackFree(this.vtbl.SetBackgroundColor)
        CallbackFree(this.vtbl.GetBackgroundColor)
        CallbackFree(this.vtbl.SetPosition)
        CallbackFree(this.vtbl.GetPosition)
        CallbackFree(this.vtbl.SetSlideshow)
        CallbackFree(this.vtbl.GetSlideshow)
        CallbackFree(this.vtbl.SetSlideshowOptions)
        CallbackFree(this.vtbl.GetSlideshowOptions)
        CallbackFree(this.vtbl.AdvanceSlideshow)
        CallbackFree(this.vtbl.GetStatus)
        CallbackFree(this.vtbl.Enable)
    }
}
