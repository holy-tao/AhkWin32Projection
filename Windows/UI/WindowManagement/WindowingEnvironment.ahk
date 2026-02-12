#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IWindowingEnvironment.ahk
#Include .\IWindowingEnvironmentStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\WindowingEnvironment.ahk
#Include .\WindowingEnvironmentChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides information about the system environments that are available to display the app.
 * @remarks
 * For an [AppWindow](appwindow.md), you can get the WindowingEnvironment from the [AppWindow.WindowingEnvironment](appwindow_windowingenvironment.md) property.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowingenvironment
 * @namespace Windows.UI.WindowManagement
 * @version WindowsRuntime 1.4
 */
class WindowingEnvironment extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IWindowingEnvironment

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IWindowingEnvironment.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a collection of all existing windowing environments in the system of the specified kind.
     * @returns {IVectorView<WindowingEnvironment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowingenvironment.findall
     */
    static FindAll() {
        if (!WindowingEnvironment.HasProp("__IWindowingEnvironmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WindowManagement.WindowingEnvironment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowingEnvironmentStatics.IID)
            WindowingEnvironment.__IWindowingEnvironmentStatics := IWindowingEnvironmentStatics(factoryPtr)
        }

        return WindowingEnvironment.__IWindowingEnvironmentStatics.FindAll()
    }

    /**
     * Retrieves a collection of all existing windowing environments in the system.
     * @param {Integer} kind 
     * @returns {IVectorView<WindowingEnvironment>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowingenvironment.findall
     */
    static FindAllWithKind(kind) {
        if (!WindowingEnvironment.HasProp("__IWindowingEnvironmentStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.WindowManagement.WindowingEnvironment")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IWindowingEnvironmentStatics.IID)
            WindowingEnvironment.__IWindowingEnvironmentStatics := IWindowingEnvironmentStatics(factoryPtr)
        }

        return WindowingEnvironment.__IWindowingEnvironmentStatics.FindAllWithKind(kind)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the current windowing environment is available to the app.
     * @remarks
     * This is of interest only if targeting a WindowingEnvironment other than the one where the view is currently visible. The current WindowingEnvironment is always enabled and available to the app.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowingenvironment.isenabled
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
    }

    /**
     * Gets a value that describes the current windowing environment.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowingenvironment.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Occurs when a property of the windowing environment has changed.
     * @type {TypedEventHandler<WindowingEnvironment, WindowingEnvironmentChangedEventArgs>}
    */
    OnChanged {
        get {
            if(!this.HasProp("__OnChanged")){
                this.__OnChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{3af2bd46-4225-5a93-85ed-73a01e91d0b5}"),
                    WindowingEnvironment,
                    WindowingEnvironmentChangedEventArgs
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
     * @returns {Boolean} 
     */
    get_IsEnabled() {
        if (!this.HasProp("__IWindowingEnvironment")) {
            if ((queryResult := this.QueryInterface(IWindowingEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowingEnvironment := IWindowingEnvironment(outPtr)
        }

        return this.__IWindowingEnvironment.get_IsEnabled()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Kind() {
        if (!this.HasProp("__IWindowingEnvironment")) {
            if ((queryResult := this.QueryInterface(IWindowingEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowingEnvironment := IWindowingEnvironment(outPtr)
        }

        return this.__IWindowingEnvironment.get_Kind()
    }

    /**
     * Retrieves the collection of display regions for this windowing environment.
     * @returns {IVectorView<DisplayRegion>} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.windowmanagement.windowingenvironment.getdisplayregions
     */
    GetDisplayRegions() {
        if (!this.HasProp("__IWindowingEnvironment")) {
            if ((queryResult := this.QueryInterface(IWindowingEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowingEnvironment := IWindowingEnvironment(outPtr)
        }

        return this.__IWindowingEnvironment.GetDisplayRegions()
    }

    /**
     * 
     * @param {TypedEventHandler<WindowingEnvironment, WindowingEnvironmentChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Changed(handler) {
        if (!this.HasProp("__IWindowingEnvironment")) {
            if ((queryResult := this.QueryInterface(IWindowingEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowingEnvironment := IWindowingEnvironment(outPtr)
        }

        return this.__IWindowingEnvironment.add_Changed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_Changed(token) {
        if (!this.HasProp("__IWindowingEnvironment")) {
            if ((queryResult := this.QueryInterface(IWindowingEnvironment.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IWindowingEnvironment := IWindowingEnvironment(outPtr)
        }

        return this.__IWindowingEnvironment.remove_Changed(token)
    }

;@endregion Instance Methods
}
