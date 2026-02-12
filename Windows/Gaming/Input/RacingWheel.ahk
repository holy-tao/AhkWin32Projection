#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRacingWheel.ahk
#Include .\IGameController.ahk
#Include .\IGameControllerBatteryInfo.ahk
#Include .\IRacingWheelStatics2.ahk
#Include .\IRacingWheelStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Headset.ahk
#Include ..\..\System\UserChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a racing wheel.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class RacingWheel extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRacingWheel

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRacingWheel.IID

    /**
     * The list of all connected racing wheels.
     * @remarks
     * **RacingWheel** objects are managed by the system, therefore you don't have to create or initialize them. Instead, you can access connected racing wheels through this property. Because you might only be interested in some of the connected racing wheels, we recommend that you maintain your own collection.
     * 
     * This list is initially empty and will not list racing wheels even if they are already connected. After a short period this will return a complete list of racing wheels.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.racingwheels
     * @type {IVectorView<RacingWheel>} 
     */
    static RacingWheels {
        get => RacingWheel.get_RacingWheels()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * Returns the given game controller as a racing wheel.
     * @remarks
     * This method checks if the provided game controller has a racing wheel implementation, and if so, it returns that implementation. You might use this method if you want to first get the controller as a [RawGameController](rawgamecontroller.md), and then see if it can be used as a **RacingWheel**&mdash;if so, you can use a default control scheme for racing wheels, otherwise you can let the player do their own input mapping.
     * @param {IGameController} gameController The game controller to be returned as a racing wheel.
     * @returns {RacingWheel} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.fromgamecontroller
     */
    static FromGameController(gameController) {
        if (!RacingWheel.HasProp("__IRacingWheelStatics2")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RacingWheel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRacingWheelStatics2.IID)
            RacingWheel.__IRacingWheelStatics2 := IRacingWheelStatics2(factoryPtr)
        }

        return RacingWheel.__IRacingWheelStatics2.FromGameController(gameController)
    }

    /**
     * 
     * @param {EventHandler<RacingWheel>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_RacingWheelAdded(value) {
        if (!RacingWheel.HasProp("__IRacingWheelStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RacingWheel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRacingWheelStatics.IID)
            RacingWheel.__IRacingWheelStatics := IRacingWheelStatics(factoryPtr)
        }

        return RacingWheel.__IRacingWheelStatics.add_RacingWheelAdded(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RacingWheelAdded(token) {
        if (!RacingWheel.HasProp("__IRacingWheelStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RacingWheel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRacingWheelStatics.IID)
            RacingWheel.__IRacingWheelStatics := IRacingWheelStatics(factoryPtr)
        }

        return RacingWheel.__IRacingWheelStatics.remove_RacingWheelAdded(token)
    }

    /**
     * 
     * @param {EventHandler<RacingWheel>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_RacingWheelRemoved(value) {
        if (!RacingWheel.HasProp("__IRacingWheelStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RacingWheel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRacingWheelStatics.IID)
            RacingWheel.__IRacingWheelStatics := IRacingWheelStatics(factoryPtr)
        }

        return RacingWheel.__IRacingWheelStatics.add_RacingWheelRemoved(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RacingWheelRemoved(token) {
        if (!RacingWheel.HasProp("__IRacingWheelStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RacingWheel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRacingWheelStatics.IID)
            RacingWheel.__IRacingWheelStatics := IRacingWheelStatics(factoryPtr)
        }

        return RacingWheel.__IRacingWheelStatics.remove_RacingWheelRemoved(token)
    }

    /**
     * 
     * @returns {IVectorView<RacingWheel>} 
     */
    static get_RacingWheels() {
        if (!RacingWheel.HasProp("__IRacingWheelStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RacingWheel")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRacingWheelStatics.IID)
            RacingWheel.__IRacingWheelStatics := IRacingWheelStatics(factoryPtr)
        }

        return RacingWheel.__IRacingWheelStatics.get_RacingWheels()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Boolean indicating whether the racing wheel has a clutch.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.hasclutch
     * @type {Boolean} 
     */
    HasClutch {
        get => this.get_HasClutch()
    }

    /**
     * Boolean indicating whether the racing wheel has a handbrake.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.hashandbrake
     * @type {Boolean} 
     */
    HasHandbrake {
        get => this.get_HasHandbrake()
    }

    /**
     * Boolean indicating whether the racing wheel has a pattern shifter.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.haspatternshifter
     * @type {Boolean} 
     */
    HasPatternShifter {
        get => this.get_HasPatternShifter()
    }

    /**
     * The highest gear of the shifter.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.maxpatternshiftergear
     * @type {Integer} 
     */
    MaxPatternShifterGear {
        get => this.get_MaxPatternShifterGear()
    }

    /**
     * The maximum angle, in degrees, of the racing wheel.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.maxwheelangle
     * @type {Float} 
     */
    MaxWheelAngle {
        get => this.get_MaxWheelAngle()
    }

    /**
     * The force feedback motor for the racing wheel.
     * @remarks
     * Force feedback is only supported for selected HID (Human Interface Device) controllers.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.wheelmotor
     * @type {ForceFeedbackMotor} 
     */
    WheelMotor {
        get => this.get_WheelMotor()
    }

    /**
     * The audio headset attached to the racing wheel.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.headset
     * @type {Headset} 
     */
    Headset {
        get => this.get_Headset()
    }

    /**
     * Gets a value that indicates the wireless state of the racing wheel.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.iswireless
     * @type {Boolean} 
     */
    IsWireless {
        get => this.get_IsWireless()
    }

    /**
     * The user associated with the racing wheel.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * Signals when a headset is attached to the racing wheel.
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
     * Signals when a headset is disconnected from the racing wheel.
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
     * Signals when the user associated with the racing wheel has changed.
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
     * @returns {Boolean} 
     */
    get_HasClutch() {
        if (!this.HasProp("__IRacingWheel")) {
            if ((queryResult := this.QueryInterface(IRacingWheel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRacingWheel := IRacingWheel(outPtr)
        }

        return this.__IRacingWheel.get_HasClutch()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasHandbrake() {
        if (!this.HasProp("__IRacingWheel")) {
            if ((queryResult := this.QueryInterface(IRacingWheel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRacingWheel := IRacingWheel(outPtr)
        }

        return this.__IRacingWheel.get_HasHandbrake()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasPatternShifter() {
        if (!this.HasProp("__IRacingWheel")) {
            if ((queryResult := this.QueryInterface(IRacingWheel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRacingWheel := IRacingWheel(outPtr)
        }

        return this.__IRacingWheel.get_HasPatternShifter()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPatternShifterGear() {
        if (!this.HasProp("__IRacingWheel")) {
            if ((queryResult := this.QueryInterface(IRacingWheel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRacingWheel := IRacingWheel(outPtr)
        }

        return this.__IRacingWheel.get_MaxPatternShifterGear()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxWheelAngle() {
        if (!this.HasProp("__IRacingWheel")) {
            if ((queryResult := this.QueryInterface(IRacingWheel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRacingWheel := IRacingWheel(outPtr)
        }

        return this.__IRacingWheel.get_MaxWheelAngle()
    }

    /**
     * 
     * @returns {ForceFeedbackMotor} 
     */
    get_WheelMotor() {
        if (!this.HasProp("__IRacingWheel")) {
            if ((queryResult := this.QueryInterface(IRacingWheel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRacingWheel := IRacingWheel(outPtr)
        }

        return this.__IRacingWheel.get_WheelMotor()
    }

    /**
     * Retrieves the button label for the specified button.
     * @param {Integer} button_ The button for which to retrieve the label.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.getbuttonlabel
     */
    GetButtonLabel(button_) {
        if (!this.HasProp("__IRacingWheel")) {
            if ((queryResult := this.QueryInterface(IRacingWheel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRacingWheel := IRacingWheel(outPtr)
        }

        return this.__IRacingWheel.GetButtonLabel(button_)
    }

    /**
     * Gets a snapshot of the racing wheel's state.
     * @returns {RacingWheelReading} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.getcurrentreading
     */
    GetCurrentReading() {
        if (!this.HasProp("__IRacingWheel")) {
            if ((queryResult := this.QueryInterface(IRacingWheel.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRacingWheel := IRacingWheel(outPtr)
        }

        return this.__IRacingWheel.GetCurrentReading()
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
     * Gets information about the racing wheel's current battery state.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.racingwheel.trygetbatteryreport
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
