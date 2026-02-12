#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IArcadeStick.ahk
#Include .\IGameController.ahk
#Include .\IGameControllerBatteryInfo.ahk
#Include .\IArcadeStickStatics2.ahk
#Include .\IArcadeStickStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Headset.ahk
#Include ..\..\System\UserChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents an arcade stick.
 * @remarks
 * Instances of the **ArcadeStick** class cannot be created directly; instead, instances of the class are retrieved through the [ArcadeStick.ArcadeSticks](arcadestick_arcadesticks.md) property listing all connected arcade sticks or through the [ArcadeStick.ArcadeStickAdded](arcadestick_arcadestickadded.md) event. See [Arcade stick](/windows/uwp/gaming/arcade-stick) for more information about how to use the **ArcadeStick** class.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestick
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class ArcadeStick extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IArcadeStick

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IArcadeStick.IID

    /**
     * The list of all connected arcade sticks.
     * @remarks
     * **ArcadeStick** objects are managed by the system, therefore you don't have to create or initialize them. Instead, you can access connected arcade sticks through this property. Because you might only be interested in some of the connected arcade sticks, we recommend that you maintain your own collection.
     * 
     * This list is initially empty and will not list arcade sticks even if they are already connected. After a short period this will return a complete list of arcade sticks.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestick.arcadesticks
     * @type {IVectorView<ArcadeStick>} 
     */
    static ArcadeSticks {
        get => ArcadeStick.get_ArcadeSticks()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the given game controller as an arcade stick.
     * @remarks
     * This method checks if the provided game controller has an arcade stick implementation, and if so, it returns that implementation. You might use this method if you want to first get the controller as a [RawGameController](rawgamecontroller.md), and then see if it can be used as an **ArcadeStick**&mdash;if so, you can use a default control scheme for arcade sticks, otherwise you can let the player do their own input mapping.
     * @param {IGameController} gameController The game controller to be returned as an arcade stick.
     * @returns {ArcadeStick} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestick.fromgamecontroller
     */
    static FromGameController(gameController) {
        if (!ArcadeStick.HasProp("__IArcadeStickStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.ArcadeStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcadeStickStatics2.IID)
            ArcadeStick.__IArcadeStickStatics2 := IArcadeStickStatics2(factoryPtr)
        }

        return ArcadeStick.__IArcadeStickStatics2.FromGameController(gameController)
    }

    /**
     * 
     * @param {EventHandler<ArcadeStick>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_ArcadeStickAdded(value) {
        if (!ArcadeStick.HasProp("__IArcadeStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.ArcadeStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcadeStickStatics.IID)
            ArcadeStick.__IArcadeStickStatics := IArcadeStickStatics(factoryPtr)
        }

        return ArcadeStick.__IArcadeStickStatics.add_ArcadeStickAdded(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ArcadeStickAdded(token) {
        if (!ArcadeStick.HasProp("__IArcadeStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.ArcadeStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcadeStickStatics.IID)
            ArcadeStick.__IArcadeStickStatics := IArcadeStickStatics(factoryPtr)
        }

        return ArcadeStick.__IArcadeStickStatics.remove_ArcadeStickAdded(token)
    }

    /**
     * 
     * @param {EventHandler<ArcadeStick>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_ArcadeStickRemoved(value) {
        if (!ArcadeStick.HasProp("__IArcadeStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.ArcadeStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcadeStickStatics.IID)
            ArcadeStick.__IArcadeStickStatics := IArcadeStickStatics(factoryPtr)
        }

        return ArcadeStick.__IArcadeStickStatics.add_ArcadeStickRemoved(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_ArcadeStickRemoved(token) {
        if (!ArcadeStick.HasProp("__IArcadeStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.ArcadeStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcadeStickStatics.IID)
            ArcadeStick.__IArcadeStickStatics := IArcadeStickStatics(factoryPtr)
        }

        return ArcadeStick.__IArcadeStickStatics.remove_ArcadeStickRemoved(token)
    }

    /**
     * 
     * @returns {IVectorView<ArcadeStick>} 
     */
    static get_ArcadeSticks() {
        if (!ArcadeStick.HasProp("__IArcadeStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.ArcadeStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IArcadeStickStatics.IID)
            ArcadeStick.__IArcadeStickStatics := IArcadeStickStatics(factoryPtr)
        }

        return ArcadeStick.__IArcadeStickStatics.get_ArcadeSticks()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The audio headset attached to the arcade stick.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestick.headset
     * @type {Headset} 
     */
    Headset {
        get => this.get_Headset()
    }

    /**
     * Gets a value that indicates the wireless state of the arcade stick.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestick.iswireless
     * @type {Boolean} 
     */
    IsWireless {
        get => this.get_IsWireless()
    }

    /**
     * The user associated with the arcade stick.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestick.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Signals when a headset is attached to the arcade stick.
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
     * Signals when a headset is disconnected from the arcade stick.
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
     * Signals when the user associated with the arcade stick has changed.
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
     * Retrieves the button label for the specified button.
     * @param {Integer} button_ The button for which to retrieve the label.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestick.getbuttonlabel
     */
    GetButtonLabel(button_) {
        if (!this.HasProp("__IArcadeStick")) {
            if ((queryResult := this.QueryInterface(IArcadeStick.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcadeStick := IArcadeStick(outPtr)
        }

        return this.__IArcadeStick.GetButtonLabel(button_)
    }

    /**
     * Gets a snapshot of the arcade stick state.
     * @returns {ArcadeStickReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestick.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IArcadeStick")) {
            if ((queryResult := this.QueryInterface(IArcadeStick.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IArcadeStick := IArcadeStick(outPtr)
        }

        return this.__IArcadeStick.GetCurrentReading()
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
     * Gets information about the arcade stick's current battery state.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.arcadestick.trygetbatteryreport
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
