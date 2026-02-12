#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IUINavigationController.ahk
#Include .\IGameController.ahk
#Include .\IGameControllerBatteryInfo.ahk
#Include .\IUINavigationControllerStatics2.ahk
#Include .\IUINavigationControllerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Headset.ahk
#Include ..\..\System\UserChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a controller of any type that can be used for UI navigation. Most gamepads, arcade sticks, and racing wheels can also be accessed as a **UINavigationController**. It is recommended that games use the controller-specific class during gameplay and the **UINavigationController** class for UI menus.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class UINavigationController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IUINavigationController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IUINavigationController.IID

    /**
     * The list of all connected UI navigation controllers.
     * @remarks
     * **UINavigationController** objects are managed by the system, therefore you don't have to create or initialize them. Instead, you can access connected UI navigation controllers through this property. Because you might only be interested in some of the connected UI navigation controllers, we recommend that you maintain your own collection.
     * 
     * This list is initially empty and will not list UI navigation controllers even if they are already connected. After a short period this will return a complete list of UI navigation controllers.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller.uinavigationcontrollers
     * @type {IVectorView<UINavigationController>} 
     */
    static UINavigationControllers {
        get => UINavigationController.get_UINavigationControllers()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the given game controller as a UI navigation controller.
     * @remarks
     * This method checks if the provided game controller has a UI navigation controller implementation, and if so, it returns that implementation. You might use this method if you want to first get the controller as a [RawGameController](rawgamecontroller.md), and then see if it can be used as a **UINavigationController**&mdash;if so, you can use a default control scheme for UI navigation controllers, otherwise you can let the player do their own input mapping.
     * @param {IGameController} gameController The game controller to be returned as a UI navigation controller.
     * @returns {UINavigationController} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller.fromgamecontroller
     */
    static FromGameController(gameController) {
        if (!UINavigationController.HasProp("__IUINavigationControllerStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.UINavigationController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUINavigationControllerStatics2.IID)
            UINavigationController.__IUINavigationControllerStatics2 := IUINavigationControllerStatics2(factoryPtr)
        }

        return UINavigationController.__IUINavigationControllerStatics2.FromGameController(gameController)
    }

    /**
     * 
     * @param {EventHandler<UINavigationController>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_UINavigationControllerAdded(value) {
        if (!UINavigationController.HasProp("__IUINavigationControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.UINavigationController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUINavigationControllerStatics.IID)
            UINavigationController.__IUINavigationControllerStatics := IUINavigationControllerStatics(factoryPtr)
        }

        return UINavigationController.__IUINavigationControllerStatics.add_UINavigationControllerAdded(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_UINavigationControllerAdded(token) {
        if (!UINavigationController.HasProp("__IUINavigationControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.UINavigationController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUINavigationControllerStatics.IID)
            UINavigationController.__IUINavigationControllerStatics := IUINavigationControllerStatics(factoryPtr)
        }

        return UINavigationController.__IUINavigationControllerStatics.remove_UINavigationControllerAdded(token)
    }

    /**
     * 
     * @param {EventHandler<UINavigationController>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_UINavigationControllerRemoved(value) {
        if (!UINavigationController.HasProp("__IUINavigationControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.UINavigationController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUINavigationControllerStatics.IID)
            UINavigationController.__IUINavigationControllerStatics := IUINavigationControllerStatics(factoryPtr)
        }

        return UINavigationController.__IUINavigationControllerStatics.add_UINavigationControllerRemoved(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_UINavigationControllerRemoved(token) {
        if (!UINavigationController.HasProp("__IUINavigationControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.UINavigationController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUINavigationControllerStatics.IID)
            UINavigationController.__IUINavigationControllerStatics := IUINavigationControllerStatics(factoryPtr)
        }

        return UINavigationController.__IUINavigationControllerStatics.remove_UINavigationControllerRemoved(token)
    }

    /**
     * 
     * @returns {IVectorView<UINavigationController>} 
     */
    static get_UINavigationControllers() {
        if (!UINavigationController.HasProp("__IUINavigationControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.UINavigationController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IUINavigationControllerStatics.IID)
            UINavigationController.__IUINavigationControllerStatics := IUINavigationControllerStatics(factoryPtr)
        }

        return UINavigationController.__IUINavigationControllerStatics.get_UINavigationControllers()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The audio headset attached to the UI navigation controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller.headset
     * @type {Headset} 
     */
    Headset {
        get => this.get_Headset()
    }

    /**
     * Gets a value that indicates the wireless state of the UI navigation controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller.iswireless
     * @type {Boolean} 
     */
    IsWireless {
        get => this.get_IsWireless()
    }

    /**
     * The user associated with the UI navigation controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Signals when a headset is attached to the UI navigation controller.
     * @type {TypedEventHandler<IGameController, Headset>}
    */
    OnHeadsetConnected {
        get {
            if(!this.HasProp("__OnHeadsetConnected")){
                this.__OnHeadsetConnected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{07b2f2b7-8825-5c4e-a052-fcfedf3aeea1}"),
                    IGameController,
                    Headset
                )
                this.__OnHeadsetConnectedToken := this.add_HeadsetConnected(this.__OnHeadsetConnected.iface)
            }
            return this.__OnHeadsetConnected
        }
    }

    /**
     * Signals when a headset is disconnected from the UI navigation controller.
     * @type {TypedEventHandler<IGameController, Headset>}
    */
    OnHeadsetDisconnected {
        get {
            if(!this.HasProp("__OnHeadsetDisconnected")){
                this.__OnHeadsetDisconnected := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{07b2f2b7-8825-5c4e-a052-fcfedf3aeea1}"),
                    IGameController,
                    Headset
                )
                this.__OnHeadsetDisconnectedToken := this.add_HeadsetDisconnected(this.__OnHeadsetDisconnected.iface)
            }
            return this.__OnHeadsetDisconnected
        }
    }

    /**
     * Signals when the user associated with the UI navigation controller has changed.
     * @type {TypedEventHandler<IGameController, UserChangedEventArgs>}
    */
    OnUserChanged {
        get {
            if(!this.HasProp("__OnUserChanged")){
                this.__OnUserChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{cb753f2c-2f36-5a8f-adad-057beae73aa4}"),
                    IGameController,
                    UserChangedEventArgs
                )
                this.__OnUserChangedToken := this.add_UserChanged(this.__OnUserChanged.iface)
            }
            return this.__OnUserChanged
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnHeadsetConnectedToken")) {
            this.remove_HeadsetConnected(this.__OnHeadsetConnectedToken)
            this.__OnHeadsetConnected.iface.Dispose()
        }

        if(this.HasProp("__OnHeadsetDisconnectedToken")) {
            this.remove_HeadsetDisconnected(this.__OnHeadsetDisconnectedToken)
            this.__OnHeadsetDisconnected.iface.Dispose()
        }

        if(this.HasProp("__OnUserChangedToken")) {
            this.remove_UserChanged(this.__OnUserChangedToken)
            this.__OnUserChanged.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * Gets a snapshot of the UI navigation controller's state.
     * @returns {UINavigationReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IUINavigationController")) {
            if ((queryResult := this.QueryInterface(IUINavigationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUINavigationController := IUINavigationController(outPtr)
        }

        return this.__IUINavigationController.GetCurrentReading()
    }

    /**
     * Retrieves a label for an optional UI navigation button.
     * @param {Integer} button_ Enumeration indicating the UI navigation button whose label to retrieve.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller.getoptionalbuttonlabel
     */
    GetOptionalButtonLabel(button_) {
        if (!this.HasProp("__IUINavigationController")) {
            if ((queryResult := this.QueryInterface(IUINavigationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUINavigationController := IUINavigationController(outPtr)
        }

        return this.__IUINavigationController.GetOptionalButtonLabel(button_)
    }

    /**
     * Retrieves a label for a required UI navigation button.
     * @param {Integer} button_ Enumeration indicating the UI navigation button whose label to retrieve.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller.getrequiredbuttonlabel
     */
    GetRequiredButtonLabel(button_) {
        if (!this.HasProp("__IUINavigationController")) {
            if ((queryResult := this.QueryInterface(IUINavigationController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IUINavigationController := IUINavigationController(outPtr)
        }

        return this.__IUINavigationController.GetRequiredButtonLabel(button_)
    }

    /**
     * 
     * @param {TypedEventHandler<IGameController, Headset>} value 
     * @returns {EventRegistrationToken} 
     */
    add_HeadsetConnected(value) {
        if (!this.HasProp("__IGameController")) {
            if ((queryResult := this.QueryInterface(IGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameController := IGameController(outPtr)
        }

        return this.__IGameController.add_HeadsetConnected(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HeadsetConnected(token) {
        if (!this.HasProp("__IGameController")) {
            if ((queryResult := this.QueryInterface(IGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameController := IGameController(outPtr)
        }

        return this.__IGameController.remove_HeadsetConnected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IGameController, Headset>} value 
     * @returns {EventRegistrationToken} 
     */
    add_HeadsetDisconnected(value) {
        if (!this.HasProp("__IGameController")) {
            if ((queryResult := this.QueryInterface(IGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameController := IGameController(outPtr)
        }

        return this.__IGameController.add_HeadsetDisconnected(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_HeadsetDisconnected(token) {
        if (!this.HasProp("__IGameController")) {
            if ((queryResult := this.QueryInterface(IGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameController := IGameController(outPtr)
        }

        return this.__IGameController.remove_HeadsetDisconnected(token)
    }

    /**
     * 
     * @param {TypedEventHandler<IGameController, UserChangedEventArgs>} value 
     * @returns {EventRegistrationToken} 
     */
    add_UserChanged(value) {
        if (!this.HasProp("__IGameController")) {
            if ((queryResult := this.QueryInterface(IGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameController := IGameController(outPtr)
        }

        return this.__IGameController.add_UserChanged(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_UserChanged(token) {
        if (!this.HasProp("__IGameController")) {
            if ((queryResult := this.QueryInterface(IGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameController := IGameController(outPtr)
        }

        return this.__IGameController.remove_UserChanged(token)
    }

    /**
     * 
     * @returns {Headset} 
     */
    get_Headset() {
        if (!this.HasProp("__IGameController")) {
            if ((queryResult := this.QueryInterface(IGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameController := IGameController(outPtr)
        }

        return this.__IGameController.get_Headset()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsWireless() {
        if (!this.HasProp("__IGameController")) {
            if ((queryResult := this.QueryInterface(IGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameController := IGameController(outPtr)
        }

        return this.__IGameController.get_IsWireless()
    }

    /**
     * 
     * @returns {User} 
     */
    get_User() {
        if (!this.HasProp("__IGameController")) {
            if ((queryResult := this.QueryInterface(IGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameController := IGameController(outPtr)
        }

        return this.__IGameController.get_User()
    }

    /**
     * Gets information about the UI navigation controller's current battery state.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.uinavigationcontroller.trygetbatteryreport
     */
    TryGetBatteryReport() {
        if (!this.HasProp("__IGameControllerBatteryInfo")) {
            if ((queryResult := this.QueryInterface(IGameControllerBatteryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerBatteryInfo := IGameControllerBatteryInfo(outPtr)
        }

        return this.__IGameControllerBatteryInfo.TryGetBatteryReport()
    }

;@endregion Instance Methods
}
