#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDisplayRegion.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\DisplayRegion.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents the region in which a view is able to be shown to a user on a logical display.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.displayregion
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class DisplayRegion extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDisplayRegion

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDisplayRegion.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the device ID for the monitor associated with the display region.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.displayregion.displaymonitordeviceid
     * @type {HSTRING} 
     */
    DisplayMonitorDeviceId {
        get => this.get_DisplayMonitorDeviceId()
    }

    /**
     * Gets a value that indicates whether the display region can be seen.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.displayregion.isvisible
     * @type {Boolean} 
     */
    IsVisible {
        get => this.get_IsVisible()
    }

    /**
     * Gets the offset within the display coordinate space for this DisplayRegion.
     * @remarks
     * This is not in client-coordinates and does not correlate to the CoreWindow bounds of an application view being represented inside a DisplayRegion.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.displayregion.workareaoffset
     * @type {POINT} 
     */
    WorkAreaOffset {
        get => this.get_WorkAreaOffset()
    }

    /**
     * Gets the width and height of the display region.
     * @remarks
     * The Size of a DisplayRegion is not necessarily mapped 1:1 with the physical display that it is on. The Size is the area that the system allows the app to be present or resized within. The size can dynamically change over the span of the apps lifetime due to changes in the system configuration.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.displayregion.workareasize
     * @type {SIZE} 
     */
    WorkAreaSize {
        get => this.get_WorkAreaSize()
    }

    /**
     * Gets the windowing environment that this display region exists in.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.displayregion.windowingenvironment
     * @type {WindowingEnvironment} 
     */
    WindowingEnvironment {
        get => this.get_WindowingEnvironment()
    }

    /**
     * Occurs when a property of the display region has changed.
     * @type {TypedEventHandler<DisplayRegion, IInspectable>}
    */
    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{2c40d18b-7438-5eb4-9359-7897fce7e3fc}"),
                    DisplayRegion,
                    IInspectable
                )
                this.__OnChangedToken := this.add_Changed(this.__OnChanged.iface)
            }
            return this.__OnChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnChangedToken")) {
            this.remove_Changed(this.__OnChangedToken)
            this.__OnChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayMonitorDeviceId() {
        if (!this.HasProp("__IDisplayRegion")) {
            if ((queryResult := this.QueryInterface(IDisplayRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayRegion := IDisplayRegion(outPtr)
        }

        return this.__IDisplayRegion.get_DisplayMonitorDeviceId()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsVisible() {
        if (!this.HasProp("__IDisplayRegion")) {
            if ((queryResult := this.QueryInterface(IDisplayRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayRegion := IDisplayRegion(outPtr)
        }

        return this.__IDisplayRegion.get_IsVisible()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_WorkAreaOffset() {
        if (!this.HasProp("__IDisplayRegion")) {
            if ((queryResult := this.QueryInterface(IDisplayRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayRegion := IDisplayRegion(outPtr)
        }

        return this.__IDisplayRegion.get_WorkAreaOffset()
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_WorkAreaSize() {
        if (!this.HasProp("__IDisplayRegion")) {
            if ((queryResult := this.QueryInterface(IDisplayRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayRegion := IDisplayRegion(outPtr)
        }

        return this.__IDisplayRegion.get_WorkAreaSize()
    }

    /**
     * 
     * @returns {WindowingEnvironment} 
     */
    get_WindowingEnvironment() {
        if (!this.HasProp("__IDisplayRegion")) {
            if ((queryResult := this.QueryInterface(IDisplayRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayRegion := IDisplayRegion(outPtr)
        }

        return this.__IDisplayRegion.get_WindowingEnvironment()
    }

    /**
     * 
     * @param {TypedEventHandler<DisplayRegion, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IDisplayRegion")) {
            if ((queryResult := this.QueryInterface(IDisplayRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayRegion := IDisplayRegion(outPtr)
        }

        return this.__IDisplayRegion.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IDisplayRegion")) {
            if ((queryResult := this.QueryInterface(IDisplayRegion.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDisplayRegion := IDisplayRegion(outPtr)
        }

        return this.__IDisplayRegion.remove_Changed(token)
    }

;@endregion Instance Methods
}
