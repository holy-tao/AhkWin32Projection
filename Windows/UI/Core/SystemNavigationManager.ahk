#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISystemNavigationManager.ahk
#Include .\ISystemNavigationManager2.ahk
#Include .\ISystemNavigationManagerStatics.ahk
#Include ..\..\Foundation\EventHandler.ahk
#Include .\BackRequestedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Provides a way for an app to respond to system provided back-navigation events.
 * @remarks
 * The SystemNavigationManager lets you respond to user presses of the system provided back button such as a hardware button, or gestures and voice commands that activate the same event.
 * 
 * To enable your app to respond to the system back-navigation event, call [GetForCurrentView](systemnavigationmanager_getforcurrentview_1363600702.md) to get the SystemNavigationManager object associated with the current view, then register an event handler for the [BackRequested](systemnavigationmanager_backrequested.md) event. Your app will receive the event only of it's the foreground app. If you handle the [BackRequested](systemnavigationmanager_backrequested.md) event, set the [BackRequestedEventArgs.Handled](backrequestedeventargs_handled.md) property to **true** to mark the event as handled. If you don't mark the event as handled, the system decides whether to navigate away from the app (on the Mobile device family) or ignore the event (on the Desktop device family).
 * 
 * If the device doesn't provide any back-navigation button, gesture, or command, the event is not raised.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.core.systemnavigationmanager
 * @namespace Windows.UI.Core
 * @version WindowsRuntime 1.4
 */
class SystemNavigationManager extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISystemNavigationManager

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISystemNavigationManager.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the [SystemNavigationManager](systemnavigationmanager.md) object associated with the current window.
     * @returns {SystemNavigationManager} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.systemnavigationmanager.getforcurrentview
     */
    static GetForCurrentView() {
        if (!SystemNavigationManager.HasProp("__ISystemNavigationManagerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Core.SystemNavigationManager")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISystemNavigationManagerStatics.IID)
            SystemNavigationManager.__ISystemNavigationManagerStatics := ISystemNavigationManagerStatics(factoryPtr)
        }

        return SystemNavigationManager.__ISystemNavigationManagerStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether a back button is shown in the system UI.
     * @remarks
     * If your app relies on a system provided back button, like the back button on a phone, you can opt-in to showing a system back button on device platforms that don't have a system back button by default, such as a desktop device.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.core.systemnavigationmanager.appviewbackbuttonvisibility
     * @type {Integer} 
     */
    AppViewBackButtonVisibility {
        get => this.get_AppViewBackButtonVisibility()
        set => this.put_AppViewBackButtonVisibility(value)
    }

    /**
     * Occurs when the user invokes the system provided button, gesture, or voice command for back-navigation.
     * @type {EventHandler<BackRequestedEventArgs>}
    */
    OnBackRequested {
        get {
            if(!this.HasProp("__OnBackRequested")){
                this.__OnBackRequested := WinRTEventHandler(
                    EventHandler,
                    Guid("{1373d28e-ca72-53d3-a45a-aac9da76ae65}"),
                    IInspectable,
                    BackRequestedEventArgs
                )
                this.__OnBackRequestedToken := this.add_BackRequested(this.__OnBackRequested.iface)
            }
            return this.__OnBackRequested
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnBackRequestedToken")) {
            this.remove_BackRequested(this.__OnBackRequestedToken)
            this.__OnBackRequested.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @param {EventHandler<BackRequestedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_BackRequested(handler) {
        if (!this.HasProp("__ISystemNavigationManager")) {
            if ((queryResult := this.QueryInterface(ISystemNavigationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemNavigationManager := ISystemNavigationManager(outPtr)
        }

        return this.__ISystemNavigationManager.add_BackRequested(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_BackRequested(token) {
        if (!this.HasProp("__ISystemNavigationManager")) {
            if ((queryResult := this.QueryInterface(ISystemNavigationManager.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemNavigationManager := ISystemNavigationManager(outPtr)
        }

        return this.__ISystemNavigationManager.remove_BackRequested(token)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppViewBackButtonVisibility() {
        if (!this.HasProp("__ISystemNavigationManager2")) {
            if ((queryResult := this.QueryInterface(ISystemNavigationManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemNavigationManager2 := ISystemNavigationManager2(outPtr)
        }

        return this.__ISystemNavigationManager2.get_AppViewBackButtonVisibility()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_AppViewBackButtonVisibility(value) {
        if (!this.HasProp("__ISystemNavigationManager2")) {
            if ((queryResult := this.QueryInterface(ISystemNavigationManager2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISystemNavigationManager2 := ISystemNavigationManager2(outPtr)
        }

        return this.__ISystemNavigationManager2.put_AppViewBackButtonVisibility(value)
    }

;@endregion Instance Methods
}
