#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IFlightStick.ahk
#Include .\IGameController.ahk
#Include .\IGameControllerBatteryInfo.ahk
#Include .\IFlightStickStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Headset.ahk
#Include ..\..\System\UserChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a flight stick.
 * @remarks
 * **FlightStick** is targeted at simple, arcade-style flight games. It provides several basic inputs, which are derived from the lowest common denominator of inputs available across the majority of popular flight stick devices. These inputs include:
 * 
 * * Two buttons for firing primary and secondary weapons.
 * * A hat switch for camera view and/or target selection.
 * * Axis data for pitch, roll, yaw, and throttle position.
 * 
 * Instances of the **FlightStick** class cannot be created directly; instead, instances of the class are retrieved through the [FlightStick.FlightSticks](flightstick_flightsticks.md) property listing all connected flight sticks or through the [FlightStick.FlightStickAdded](flightstick_flightstickadded.md) event.
 * 
 * See [Flight stick](/windows/uwp/gaming/flight-stick) for more information about how to use the **FlightStick** class.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class FlightStick extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IFlightStick

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IFlightStick.IID

    /**
     * The list of all connected flight sticks.
     * @remarks
     * **FlightStick** objects are managed by the system, therefore you don't have to create or initialize them. Instead, you can access connected flight sticks through this property. Because you might only be interested in some of the connected flight sticks, we recommend that you maintain your own collection.
     * 
     * This list is initially empty and will not list flight sticks even if they are already connected. After a short period this will return a complete list of flight sticks.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick.flightsticks
     * @type {IVectorView<FlightStick>} 
     */
    static FlightSticks {
        get => FlightStick.get_FlightSticks()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {EventHandler<FlightStick>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_FlightStickAdded(value) {
        if (!FlightStick.HasProp("__IFlightStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.FlightStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlightStickStatics.IID)
            FlightStick.__IFlightStickStatics := IFlightStickStatics(factoryPtr)
        }

        return FlightStick.__IFlightStickStatics.add_FlightStickAdded(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_FlightStickAdded(token) {
        if (!FlightStick.HasProp("__IFlightStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.FlightStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlightStickStatics.IID)
            FlightStick.__IFlightStickStatics := IFlightStickStatics(factoryPtr)
        }

        return FlightStick.__IFlightStickStatics.remove_FlightStickAdded(token)
    }

    /**
     * 
     * @param {EventHandler<FlightStick>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_FlightStickRemoved(value) {
        if (!FlightStick.HasProp("__IFlightStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.FlightStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlightStickStatics.IID)
            FlightStick.__IFlightStickStatics := IFlightStickStatics(factoryPtr)
        }

        return FlightStick.__IFlightStickStatics.add_FlightStickRemoved(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_FlightStickRemoved(token) {
        if (!FlightStick.HasProp("__IFlightStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.FlightStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlightStickStatics.IID)
            FlightStick.__IFlightStickStatics := IFlightStickStatics(factoryPtr)
        }

        return FlightStick.__IFlightStickStatics.remove_FlightStickRemoved(token)
    }

    /**
     * 
     * @returns {IVectorView<FlightStick>} 
     */
    static get_FlightSticks() {
        if (!FlightStick.HasProp("__IFlightStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.FlightStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlightStickStatics.IID)
            FlightStick.__IFlightStickStatics := IFlightStickStatics(factoryPtr)
        }

        return FlightStick.__IFlightStickStatics.get_FlightSticks()
    }

    /**
     * Returns the given game controller as a flight stick.
     * @remarks
     * This method checks if the provided game controller has a flight stick implementation, and if so, it returns that implementation. You might use this method if you want to first get the controller as a [RawGameController](rawgamecontroller.md), and then see if it can be used as a **FlightStick**&mdash;if so, you can use a default control scheme for flight sticks, otherwise you can let the player do their own input mapping.
     * @param {IGameController} gameController The game controller to be returned as a flight stick.
     * @returns {FlightStick} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick.fromgamecontroller
     */
    static FromGameController(gameController) {
        if (!FlightStick.HasProp("__IFlightStickStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.FlightStick")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IFlightStickStatics.IID)
            FlightStick.__IFlightStickStatics := IFlightStickStatics(factoryPtr)
        }

        return FlightStick.__IFlightStickStatics.FromGameController(gameController)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The type of hat switch on the flight stick.
     * @remarks
     * A hat switch is a control often used for camera view and/or target selection. It can be two-way, four-way, or eight-way, and its current position can be described by a cardinal coordinate system. A hat switch can be in exactly one position at any given time.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick.hatswitchkind
     * @type {Integer} 
     */
    HatSwitchKind {
        get => this.get_HatSwitchKind()
    }

    /**
     * The audio headset attached to the flight stick.
     * @remarks
     * See [Headset](/windows/uwp/gaming/headset) for information about programming for headsets.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick.headset
     * @type {Headset} 
     */
    Headset {
        get => this.get_Headset()
    }

    /**
     * Gets a value that indicates the wireless state of the flight stick.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick.iswireless
     * @type {Boolean} 
     */
    IsWireless {
        get => this.get_IsWireless()
    }

    /**
     * The user associated with the flight stick.
     * @remarks
     * See [Tracking users and their devices](/windows/uwp/gaming/input-practices-for-games#tracking-users-and-their-devices) for information about how to keep track of users.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Signals when a headset is attached to the flight stick.
     * @remarks
     * For more information on detecting, tracking, and using headsets, see [Headset](/windows/uwp/gaming/headset).
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
     * Signals when a headset is disconnected from the flight stick.
     * @remarks
     * For more information on detecting, tracking, and using headsets, see [Headset](/windows/uwp/gaming/headset).
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
     * Signals when the user associated with the flight stick has changed.
     * @remarks
     * See [Tracking users and their devices](/windows/uwp/gaming/input-practices-for-games#tracking-users-and-their-devices) for more information about how to keep track of users.
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
     * @returns {Integer} 
     */
    get_HatSwitchKind() {
        if (!this.HasProp("__IFlightStick")) {
            if ((queryResult := this.QueryInterface(IFlightStick.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlightStick := IFlightStick(outPtr)
        }

        return this.__IFlightStick.get_HatSwitchKind()
    }

    /**
     * Retrieves the button label for the specified button.
     * @remarks
     * The following example gets the label on the **FirePrimary** button on the flight stick, and shows an icon based on the label.
     * 
     * ```cppwinrt
     * @param {Integer} button_ The button for which to retrieve the label.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick.getbuttonlabel
     */
    GetButtonLabel(button_) {
        if (!this.HasProp("__IFlightStick")) {
            if ((queryResult := this.QueryInterface(IFlightStick.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlightStick := IFlightStick(outPtr)
        }

        return this.__IFlightStick.GetButtonLabel(button_)
    }

    /**
     * Gets a snapshot of the flight stick state.
     * @remarks
     * To gather input from a flight stick, you must *poll* the flight stick using this method. The method returns a **FlightStickReading** that has information about which buttons are being pressed, the joystick's roll, pitch, and yaw, and so on. See [Reading the flight stick](/windows/uwp/gaming/flight-stick#reading-the-flight-stick) for more information about how to read input from a flight stick.
     * @returns {FlightStickReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IFlightStick")) {
            if ((queryResult := this.QueryInterface(IFlightStick.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IFlightStick := IFlightStick(outPtr)
        }

        return this.__IFlightStick.GetCurrentReading()
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
     * Gets information about the flight stick's current battery state.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.flightstick.trygetbatteryreport
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
