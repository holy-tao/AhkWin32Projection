#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayInformation.ahk
#Include .\IDisplayInformation2.ahk
#Include .\IDisplayInformation3.ahk
#Include .\IDisplayInformation4.ahk
#Include .\IDisplayInformation5.ahk
#Include .\IDisplayInformationStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DisplayInformation.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Monitors and controls display-related information for an application view. The class provides events to allow clients to monitor for changes in the application view affecting which display(s) the view resides on, as well as changes in displays that can affect the application view.
 * @remarks
 * A DisplayInformation instance does not map to a specific display, but instead tracks display-related information for wherever the application view is placed. Calling [GetForCurrentView](displayinformation_getforcurrentview_1363600702.md) will always return the single instance for the current thread's [CoreApplicationView](../windows.applicationmodel.core/coreapplicationview.md). An instance of DisplayInformation can only be used from the thread on which it was created.
 * 
 * To handle DisplayInformation events, use an event handler for the specific event. For example, for [DisplayInformation.DpiChanged](displayinformation_dpichanged.md), use "TypedEventHandler&lt;DisplayInformation, Object&gt; DpiChanged."
 * 
 * Any property change event of DisplayInformation might trigger if your app is moved from one monitor to another monitor. [ColorProfileChanged](displayinformation_colorprofilechanged.md) is triggered when the display’s color profile changes. [DpiChanged](displayinformation_dpichanged.md) is triggered when the [LogicalDpi](displayinformation_logicaldpi.md), [ResolutionScale](displayinformation_resolutionscale.md), and [RawPixelsPerViewPixel](displayinformation_rawpixelsperviewpixel.md) properties change because a user selected a different zoom level or changed the screen resolution. [OrientationChanged](displayinformation_orientationchanged.md) is triggered if a user changes the screen orientation.
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class DisplayInformation extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayInformation

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayInformation.IID

    /**
     * Gets and sets the preferred orientation of the app.
     * @remarks
     * This property is static.
     * 
     * The operating system is not obligated to honor the app's auto-rotation preferences.
     * In particular, the preferences are not respected in overlapped windowing mode.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.autorotationpreferences
     * @type {Integer} 
     */
    static AutoRotationPreferences {
        get => DisplayInformation.get_AutoRotationPreferences()
        set => DisplayInformation.put_AutoRotationPreferences(value)
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets the  DisplayInformation instance associated with the current thread's [CoreApplicationView](../windows.applicationmodel.core/coreapplicationview.md). This DisplayInformation instance is tied to the view and cannot be used from other threads.
     * @remarks
     * This method is static. This method can fail if the current thread is not the UI thread for an application view.
     * @returns {DisplayInformation} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.getforcurrentview
     */
    static GetForCurrentView() {
        if (!DisplayInformation.HasProp("__IDisplayInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayInformationStatics.IID)
            DisplayInformation.__IDisplayInformationStatics := IDisplayInformationStatics(factoryPtr)
        }

        return DisplayInformation.__IDisplayInformationStatics.GetForCurrentView()
    }

    /**
     * 
     * @returns {Integer} 
     */
    static get_AutoRotationPreferences() {
        if (!DisplayInformation.HasProp("__IDisplayInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayInformationStatics.IID)
            DisplayInformation.__IDisplayInformationStatics := IDisplayInformationStatics(factoryPtr)
        }

        return DisplayInformation.__IDisplayInformationStatics.get_AutoRotationPreferences()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    static put_AutoRotationPreferences(value) {
        if (!DisplayInformation.HasProp("__IDisplayInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayInformationStatics.IID)
            DisplayInformation.__IDisplayInformationStatics := IDisplayInformationStatics(factoryPtr)
        }

        return DisplayInformation.__IDisplayInformationStatics.put_AutoRotationPreferences(value)
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    static add_DisplayContentsInvalidated(handler) {
        if (!DisplayInformation.HasProp("__IDisplayInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayInformationStatics.IID)
            DisplayInformation.__IDisplayInformationStatics := IDisplayInformationStatics(factoryPtr)
        }

        return DisplayInformation.__IDisplayInformationStatics.add_DisplayContentsInvalidated(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_DisplayContentsInvalidated(token) {
        if (!DisplayInformation.HasProp("__IDisplayInformationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.DisplayInformation")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDisplayInformationStatics.IID)
            DisplayInformation.__IDisplayInformationStatics := IDisplayInformationStatics(factoryPtr)
        }

        return DisplayInformation.__IDisplayInformationStatics.remove_DisplayContentsInvalidated(token)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the current orientation of a rectangular monitor.
     * @remarks
     * The value of the DisplayInformation.CurrentOrientation property corresponds to the orientation of the display or monitor and not necessarily to the orientation of your app. To determine the orientation of your app for layout purposes, use the [ApplicationView.Value](../windows.ui.viewmanagement/applicationview_value.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.currentorientation
     * @type {Integer} 
     */
    CurrentOrientation {
        get => this.get_CurrentOrientation()
    }

    /**
     * Gets the native orientation of the display monitor, which is typically the orientation where the buttons on the device match the orientation of the monitor.
     * @remarks
     * NativeOrientation returns only the **Landscape** or **Portrait** value. NativeOrientation never returns the **LandscapeFlipped** or **PortraitFlipped** value.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.nativeorientation
     * @type {Integer} 
     */
    NativeOrientation {
        get => this.get_NativeOrientation()
    }

    /**
     * Gets the scale factor of the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.resolutionscale
     * @type {Integer} 
     */
    ResolutionScale {
        get => this.get_ResolutionScale()
    }

    /**
     * Gets the pixels per logical inch of the current environment.
     * @remarks
     * The logical dots per inch (DPI) can change based on scaling. For info about the meaning of logical DPI, see [DPI and Device-Independent Pixels](/windows/desktop/LearnWin32/dpi-and-device-independent-pixels).
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.logicaldpi
     * @type {Float} 
     */
    LogicalDpi {
        get => this.get_LogicalDpi()
    }

    /**
     * Gets the raw dots per inch (DPI) along the x axis of the display monitor.
     * @remarks
     * This property can return 0 when the monitor doesn't provide physical dimensions and when the user is in a clone or duplicate multiple-monitor setup.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.rawdpix
     * @type {Float} 
     */
    RawDpiX {
        get => this.get_RawDpiX()
    }

    /**
     * Gets the raw dots per inch (DPI) along the y axis of the display monitor.
     * @remarks
     * This property can return 0 when the monitor doesn't provide physical dimensions and when the user is in a clone or duplicate multiple-monitor setup.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.rawdpiy
     * @type {Float} 
     */
    RawDpiY {
        get => this.get_RawDpiY()
    }

    /**
     * Gets a value that indicates whether the device supports stereoscopic 3D.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.stereoenabled
     * @type {Boolean} 
     */
    StereoEnabled {
        get => this.get_StereoEnabled()
    }

    /**
     * Gets a value representing the number of raw (physical) pixels for each view (layout) pixel.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.rawpixelsperviewpixel
     * @type {Float} 
     */
    RawPixelsPerViewPixel {
        get => this.get_RawPixelsPerViewPixel()
    }

    /**
     * Diagonal size of the display in inches.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.diagonalsizeininches
     * @type {IReference<Float>} 
     */
    DiagonalSizeInInches {
        get => this.get_DiagonalSizeInInches()
    }

    /**
     * Returns the current width resolution of the logical monitor.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.screenwidthinrawpixels
     * @type {Integer} 
     */
    ScreenWidthInRawPixels {
        get => this.get_ScreenWidthInRawPixels()
    }

    /**
     * Returns the current height resolution of the logical monitor.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.screenheightinrawpixels
     * @type {Integer} 
     */
    ScreenHeightInRawPixels {
        get => this.get_ScreenHeightInRawPixels()
    }

    /**
     * Occurs when either the [CurrentOrientation](displayinformation_currentorientation.md) or [NativeOrientation](displayinformation_nativeorientation.md) property changes because of a mode change or a monitor change.
     * @remarks
     * The OrientationChanged event occurs only when orientation of the display or monitor changes and not necessarily when the orientation of your app changes. To determine the orientation of your app for layout purposes, use the [ApplicationView.Value](../windows.ui.viewmanagement/applicationview_value.md) property.
     * @type {TypedEventHandler<DisplayInformation, IInspectable>}
    */
    OnOrientationChanged {
        get {
            if(!this.HasProp("__OnOrientationChanged")){
                this.__OnOrientationChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{86c4f619-67b6-51c7-b30d-d8cf13625327}"),
                    DisplayInformation,
                    IInspectable
                )
                this.__OnOrientationChangedToken := this.add_OrientationChanged(this.__OnOrientationChanged.iface)
            }
            return this.__OnOrientationChanged
        }
    }

    /**
     * Occurs when the [LogicalDpi](displayinformation_logicaldpi.md) property changes because the pixels per inch (PPI) of the display changes.
     * @type {TypedEventHandler<DisplayInformation, IInspectable>}
    */
    OnDpiChanged {
        get {
            if(!this.HasProp("__OnDpiChanged")){
                this.__OnDpiChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{86c4f619-67b6-51c7-b30d-d8cf13625327}"),
                    DisplayInformation,
                    IInspectable
                )
                this.__OnDpiChangedToken := this.add_DpiChanged(this.__OnDpiChanged.iface)
            }
            return this.__OnDpiChanged
        }
    }

    /**
     * Occurs when the [StereoEnabled](displayinformation_stereoenabled.md) property changes because support for stereoscopic 3D changes.
     * @type {TypedEventHandler<DisplayInformation, IInspectable>}
    */
    OnStereoEnabledChanged {
        get {
            if(!this.HasProp("__OnStereoEnabledChanged")){
                this.__OnStereoEnabledChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{86c4f619-67b6-51c7-b30d-d8cf13625327}"),
                    DisplayInformation,
                    IInspectable
                )
                this.__OnStereoEnabledChangedToken := this.add_StereoEnabledChanged(this.__OnStereoEnabledChanged.iface)
            }
            return this.__OnStereoEnabledChanged
        }
    }

    /**
     * Occurs when the physical display's color profile changes.
     * @remarks
     * The ColorProfileChanged event is only triggered when the display’s color profile changes. You must then call the [DisplayInformation.GetColorProfileAsync](displayinformation_getcolorprofileasync_1815252224.md) method to asynchronously retrieve the new color profile.
     * @type {TypedEventHandler<DisplayInformation, IInspectable>}
    */
    OnColorProfileChanged {
        get {
            if(!this.HasProp("__OnColorProfileChanged")){
                this.__OnColorProfileChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{86c4f619-67b6-51c7-b30d-d8cf13625327}"),
                    DisplayInformation,
                    IInspectable
                )
                this.__OnColorProfileChangedToken := this.add_ColorProfileChanged(this.__OnColorProfileChanged.iface)
            }
            return this.__OnColorProfileChanged
        }
    }

    /**
     * Raised when the advanced color information is changed.
     * @remarks
     * This is an event registration API which will register an event notification for the UWP apps so that they can be notified whenever there is any change in the Advanced Color info on the monitor corresponding to their CoreWindow. The app can then call the GetAdvancedColorInfo API to know the latest capabilities and state. The app needs to track which values are changed and respond accordingly if needed, event API will not indicate which values changed. 
     * Note that this event will remove any existing notification which the app previously registered for changes in Advanced Color info.
     * @type {TypedEventHandler<DisplayInformation, IInspectable>}
    */
    OnAdvancedColorInfoChanged {
        get {
            if(!this.HasProp("__OnAdvancedColorInfoChanged")){
                this.__OnAdvancedColorInfoChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{86c4f619-67b6-51c7-b30d-d8cf13625327}"),
                    DisplayInformation,
                    IInspectable
                )
                this.__OnAdvancedColorInfoChangedToken := this.add_AdvancedColorInfoChanged(this.__OnAdvancedColorInfoChanged.iface)
            }
            return this.__OnAdvancedColorInfoChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnOrientationChangedToken")) {
            this.remove_OrientationChanged(this.__OnOrientationChangedToken)
            this.__OnOrientationChanged.iface.Dispose()
        }

        if(this.HasProp("__OnDpiChangedToken")) {
            this.remove_DpiChanged(this.__OnDpiChangedToken)
            this.__OnDpiChanged.iface.Dispose()
        }

        if(this.HasProp("__OnStereoEnabledChangedToken")) {
            this.remove_StereoEnabledChanged(this.__OnStereoEnabledChangedToken)
            this.__OnStereoEnabledChanged.iface.Dispose()
        }

        if(this.HasProp("__OnColorProfileChangedToken")) {
            this.remove_ColorProfileChanged(this.__OnColorProfileChangedToken)
            this.__OnColorProfileChanged.iface.Dispose()
        }

        if(this.HasProp("__OnAdvancedColorInfoChangedToken")) {
            this.remove_AdvancedColorInfoChanged(this.__OnAdvancedColorInfoChangedToken)
            this.__OnAdvancedColorInfoChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CurrentOrientation() {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.get_CurrentOrientation()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_NativeOrientation() {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.get_NativeOrientation()
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_OrientationChanged(handler) {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.add_OrientationChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_OrientationChanged(token) {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.remove_OrientationChanged(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResolutionScale() {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.get_ResolutionScale()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_LogicalDpi() {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.get_LogicalDpi()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawDpiX() {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.get_RawDpiX()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawDpiY() {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.get_RawDpiY()
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_DpiChanged(handler) {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.add_DpiChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_DpiChanged(token) {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.remove_DpiChanged(token)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_StereoEnabled() {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.get_StereoEnabled()
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_StereoEnabledChanged(handler) {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.add_StereoEnabledChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_StereoEnabledChanged(token) {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.remove_StereoEnabledChanged(token)
    }

    /**
     * Asynchronously gets the default International Color Consortium (ICC) color profile that is associated with the physical display.
     * @remarks
     * The asynchronous operation fails if no physical display is attached to the computer on which the app is running (for example, if the app is running over Remote Desktop Connection), if no color profile is associated with the display, or if the profile doesn't match the signature of an ICC color profile. Additionally, not all device families support returning the display's color profile; currently only the Desktop device family implements this API.
     * 
     * Applications should catch any exceptions thrown by this API. In these cases, there is no valid ICC color profile associated with the display, and the app should handle this by assuming a default color space such as sRGB.
     * @returns {IAsyncOperation<IRandomAccessStream>} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.getcolorprofileasync
     */
    GetColorProfileAsync() {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.GetColorProfileAsync()
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ColorProfileChanged(handler) {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.add_ColorProfileChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ColorProfileChanged(token) {
        if (!this.HasProp("__IDisplayInformation")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation := IDisplayInformation(outPtr)
        }

        return this.__IDisplayInformation.remove_ColorProfileChanged(token)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RawPixelsPerViewPixel() {
        if (!this.HasProp("__IDisplayInformation2")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation2 := IDisplayInformation2(outPtr)
        }

        return this.__IDisplayInformation2.get_RawPixelsPerViewPixel()
    }

    /**
     * 
     * @returns {IReference<Float>} 
     */
    get_DiagonalSizeInInches() {
        if (!this.HasProp("__IDisplayInformation3")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation3 := IDisplayInformation3(outPtr)
        }

        return this.__IDisplayInformation3.get_DiagonalSizeInInches()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScreenWidthInRawPixels() {
        if (!this.HasProp("__IDisplayInformation4")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation4 := IDisplayInformation4(outPtr)
        }

        return this.__IDisplayInformation4.get_ScreenWidthInRawPixels()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ScreenHeightInRawPixels() {
        if (!this.HasProp("__IDisplayInformation4")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation4.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation4 := IDisplayInformation4(outPtr)
        }

        return this.__IDisplayInformation4.get_ScreenHeightInRawPixels()
    }

    /**
     * Retrieves the Advanced Color information.
     * @returns {AdvancedColorInfo} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.displayinformation.getadvancedcolorinfo
     */
    GetAdvancedColorInfo() {
        if (!this.HasProp("__IDisplayInformation5")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation5 := IDisplayInformation5(outPtr)
        }

        return this.__IDisplayInformation5.GetAdvancedColorInfo()
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayInformation, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_AdvancedColorInfoChanged(handler) {
        if (!this.HasProp("__IDisplayInformation5")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation5 := IDisplayInformation5(outPtr)
        }

        return this.__IDisplayInformation5.add_AdvancedColorInfoChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_AdvancedColorInfoChanged(token) {
        if (!this.HasProp("__IDisplayInformation5")) {
            if ((queryResult := this.QueryInterface(IDisplayInformation5.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayInformation5 := IDisplayInformation5(outPtr)
        }

        return this.__IDisplayInformation5.remove_AdvancedColorInfoChanged(token)
    }

;@endregion Instance Methods
}
