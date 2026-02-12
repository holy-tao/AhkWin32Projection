#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGamepad.ahk
#Include .\IGameController.ahk
#Include .\IGamepad2.ahk
#Include .\IGameControllerBatteryInfo.ahk
#Include .\IGamepadStatics.ahk
#Include .\IGamepadStatics2.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Headset.ahk
#Include ..\..\System\UserChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a gamepad.
 * @remarks
 * Instances of the **Gamepad** class cannot be created directly; instead, instances of the **Gamepad** class are retrieved through the [Gamepad.Gamepads](gamepad_gamepads.md) property listing all connected gamepads or through the [Gamepad.GamepadAdded](gamepad_gamepadadded.md) event.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class Gamepad extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGamepad

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGamepad.IID

    /**
     * The list of all connected gamepads.
     * @remarks
     * **Gamepad** objects are managed by the system, therefore you don't have to create or initialize them. Instead, you can access connected gamepads through this property. Because you might only be interested in some of the connected gamepads, we recommend that you maintain your own collection.
     * 
     * This list is initially empty and will not list gamepads even if they are already connected. After a short period this will return a complete list of gamepads.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad.gamepads
     * @type {IVectorView<Gamepad>} 
     */
    static Gamepads {
        get => Gamepad.get_Gamepads()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {EventHandler<Gamepad>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_GamepadAdded(value) {
        if (!Gamepad.HasProp("__IGamepadStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Gamepad")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGamepadStatics.IID)
            Gamepad.__IGamepadStatics := IGamepadStatics(factoryPtr)
        }

        return Gamepad.__IGamepadStatics.add_GamepadAdded(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_GamepadAdded(token) {
        if (!Gamepad.HasProp("__IGamepadStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Gamepad")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGamepadStatics.IID)
            Gamepad.__IGamepadStatics := IGamepadStatics(factoryPtr)
        }

        return Gamepad.__IGamepadStatics.remove_GamepadAdded(token)
    }

    /**
     * 
     * @param {EventHandler<Gamepad>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_GamepadRemoved(value) {
        if (!Gamepad.HasProp("__IGamepadStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Gamepad")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGamepadStatics.IID)
            Gamepad.__IGamepadStatics := IGamepadStatics(factoryPtr)
        }

        return Gamepad.__IGamepadStatics.add_GamepadRemoved(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_GamepadRemoved(token) {
        if (!Gamepad.HasProp("__IGamepadStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Gamepad")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGamepadStatics.IID)
            Gamepad.__IGamepadStatics := IGamepadStatics(factoryPtr)
        }

        return Gamepad.__IGamepadStatics.remove_GamepadRemoved(token)
    }

    /**
     * 
     * @returns {IVectorView<Gamepad>} 
     */
    static get_Gamepads() {
        if (!Gamepad.HasProp("__IGamepadStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Gamepad")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGamepadStatics.IID)
            Gamepad.__IGamepadStatics := IGamepadStatics(factoryPtr)
        }

        return Gamepad.__IGamepadStatics.get_Gamepads()
    }

    /**
     * Returns the given game controller as a gamepad.
     * @remarks
     * This method checks if the provided game controller has a gamepad implementation, and if so, it returns that implementation. You might use this method if you want to first get the controller as a [RawGameController](rawgamecontroller.md), and then see if it can be used as a **Gamepad**&mdash;if so, you can use a default control scheme for gamepads, otherwise you can let the player do their own input mapping.
     * @param {IGameController} gameController The game controller to be returned as a gamepad.
     * @returns {Gamepad} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad.fromgamecontroller
     */
    static FromGameController(gameController) {
        if (!Gamepad.HasProp("__IGamepadStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Gamepad")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGamepadStatics2.IID)
            Gamepad.__IGamepadStatics2 := IGamepadStatics2(factoryPtr)
        }

        return Gamepad.__IGamepadStatics2.FromGameController(gameController)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Describes the gamepad motor speed.
     * @remarks
     * When an application enters an [ApplicationExecutionState.Suspended](/uwp/api/Windows.ApplicationModel.Activation.ApplicationExecutionState) state, the gamepad motor cannot be activated. This applies even if an [ExtendedExecutionSession](/uwp/api/windows.applicationmodel.extendedexecution.extendedexecutionsession) is acquired.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad.vibration
     * @type {GamepadVibration} 
     */
    Vibration {
        get => this.get_Vibration()
        set => this.put_Vibration(value)
    }

    /**
     * The audio headset attached to the gamepad.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad.headset
     * @type {Headset} 
     */
    Headset {
        get => this.get_Headset()
    }

    /**
     * Gets a value that indicates the wireless state of the gamepad.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad.iswireless
     * @type {Boolean} 
     */
    IsWireless {
        get => this.get_IsWireless()
    }

    /**
     * The user associated with the gamepad.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Signals when a headset is attached to the gamepad.
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
     * Signals when a headset is disconnected from the gamepad.
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
     * Signals when the user associated with the gamepad has changed.
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
     * 
     * @returns {GamepadVibration} 
     */
    get_Vibration() {
        if (!this.HasProp("__IGamepad")) {
            if ((queryResult := this.QueryInterface(IGamepad.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGamepad := IGamepad(outPtr)
        }

        return this.__IGamepad.get_Vibration()
    }

    /**
     * 
     * @param {GamepadVibration} value 
     * @returns {HRESULT} 
     */
    put_Vibration(value) {
        if (!this.HasProp("__IGamepad")) {
            if ((queryResult := this.QueryInterface(IGamepad.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGamepad := IGamepad(outPtr)
        }

        return this.__IGamepad.put_Vibration(value)
    }

    /**
     * Gets a snapshot of the gamepad state.
     * @remarks
     * This method gets the state of the gamepad at the moment you call it. For example, if you press the A button, then release the A button, and then call **GetCurrentReading**, it will return that the A button is not currently pressed.
     * 
     * There is no need to "flush the state" because the state of the gamepad is updated automatically. This method just returns a snapshot of the current state.
     * @returns {GamepadReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IGamepad")) {
            if ((queryResult := this.QueryInterface(IGamepad.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGamepad := IGamepad(outPtr)
        }

        return this.__IGamepad.GetCurrentReading()
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
     * Retrieves the button label for the specified button.
     * @param {Integer} button_ The button for which to retrieve the label.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad.getbuttonlabel
     */
    GetButtonLabel(button_) {
        if (!this.HasProp("__IGamepad2")) {
            if ((queryResult := this.QueryInterface(IGamepad2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGamepad2 := IGamepad2(outPtr)
        }

        return this.__IGamepad2.GetButtonLabel(button_)
    }

    /**
     * Gets information about the gamepad's current battery state.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.gamepad.trygetbatteryreport
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
