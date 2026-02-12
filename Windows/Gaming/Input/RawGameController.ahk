#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRawGameController.ahk
#Include .\IGameController.ahk
#Include .\IGameControllerBatteryInfo.ahk
#Include .\IRawGameController2.ahk
#Include .\IRawGameControllerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\Headset.ahk
#Include ..\..\System\UserChangedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents any type of game controller.
 * @remarks
 * Instances of the **RawGameController** class cannot be created directly; instead, instances of the class are retrieved through the [RawGameController.RawGameControllers](rawgamecontroller_rawgamecontrollers.md) property listing all connected game controllers or through the [RawGameController.RawGameControllerAdded](rawgamecontroller_rawgamecontrolleradded.md) event.
 * 
 * All inputs available on a **RawGameController** are exposed as simple arrays of unnamed buttons, switches, and axes. Using this class, you can allow customers to create custom input mappings no matter what type of controller they're using.
 * 
 * You'll need to create these arrays yourself, and then populate them using [GetCurrentReading](rawgamecontroller_getcurrentreading_123740519.md) to determine the states of the buttons, switches, and axes. See that function's documentation for more information.
 * 
 * See [Raw game controller](/windows/uwp/gaming/raw-game-controller) for information about how to use the **RawGameController** class.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller
 * @namespace Windows.Gaming.Input
 * @version WindowsRuntime 1.4
 */
class RawGameController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRawGameController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRawGameController.IID

    /**
     * The list of all connected raw game controllers.
     * @remarks
     * **RawGameController** objects are managed by the system, therefore you don't have to create or initialize them. Instead, you can access connected raw game controllers through this property. Because you might only be interested in some of the connected raw game controllers, we recommend that you maintain your own collection.
     * 
     * This list is initially empty and will not list raw game controllers even if they are already connected. After a short period this will return a complete list of raw game controllers.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.rawgamecontrollers
     * @type {IVectorView<RawGameController>} 
     */
    static RawGameControllers {
        get => RawGameController.get_RawGameControllers()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {EventHandler<RawGameController>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_RawGameControllerAdded(value) {
        if (!RawGameController.HasProp("__IRawGameControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RawGameController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRawGameControllerStatics.IID)
            RawGameController.__IRawGameControllerStatics := IRawGameControllerStatics(factoryPtr)
        }

        return RawGameController.__IRawGameControllerStatics.add_RawGameControllerAdded(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RawGameControllerAdded(token) {
        if (!RawGameController.HasProp("__IRawGameControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RawGameController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRawGameControllerStatics.IID)
            RawGameController.__IRawGameControllerStatics := IRawGameControllerStatics(factoryPtr)
        }

        return RawGameController.__IRawGameControllerStatics.remove_RawGameControllerAdded(token)
    }

    /**
     * 
     * @param {EventHandler<RawGameController>} value 
     * @returns {EventRegistrationToken} 
     */
    static add_RawGameControllerRemoved(value) {
        if (!RawGameController.HasProp("__IRawGameControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RawGameController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRawGameControllerStatics.IID)
            RawGameController.__IRawGameControllerStatics := IRawGameControllerStatics(factoryPtr)
        }

        return RawGameController.__IRawGameControllerStatics.add_RawGameControllerRemoved(value)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    static remove_RawGameControllerRemoved(token) {
        if (!RawGameController.HasProp("__IRawGameControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RawGameController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRawGameControllerStatics.IID)
            RawGameController.__IRawGameControllerStatics := IRawGameControllerStatics(factoryPtr)
        }

        return RawGameController.__IRawGameControllerStatics.remove_RawGameControllerRemoved(token)
    }

    /**
     * 
     * @returns {IVectorView<RawGameController>} 
     */
    static get_RawGameControllers() {
        if (!RawGameController.HasProp("__IRawGameControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RawGameController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRawGameControllerStatics.IID)
            RawGameController.__IRawGameControllerStatics := IRawGameControllerStatics(factoryPtr)
        }

        return RawGameController.__IRawGameControllerStatics.get_RawGameControllers()
    }

    /**
     * Returns the given game controller as a raw game controller.
     * @remarks
     * This method checks if the provided game controller has a raw game controller implementation, and if so, it returns that implementation. You might use this method if you want to first get the controller as a [RawGameController](rawgamecontroller.md), and then see if it can be used as another type of controller, such as a [Gamepad](gamepad.md)&mdash;if so, you can use a default control scheme for that controller type, otherwise you can let the player do their own input mapping.
     * @param {IGameController} gameController The game controller to be returned as a raw game controller.
     * @returns {RawGameController} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.fromgamecontroller
     */
    static FromGameController(gameController) {
        if (!RawGameController.HasProp("__IRawGameControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.RawGameController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRawGameControllerStatics.IID)
            RawGameController.__IRawGameControllerStatics := IRawGameControllerStatics(factoryPtr)
        }

        return RawGameController.__IRawGameControllerStatics.FromGameController(gameController)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * The number of axes on the raw game controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.axiscount
     * @type {Integer} 
     */
    AxisCount {
        get => this.get_AxisCount()
    }

    /**
     * The number of buttons on the raw game controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.buttoncount
     * @type {Integer} 
     */
    ButtonCount {
        get => this.get_ButtonCount()
    }

    /**
     * The list of force feedback motors in the raw game controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.forcefeedbackmotors
     * @type {IVectorView<ForceFeedbackMotor>} 
     */
    ForceFeedbackMotors {
        get => this.get_ForceFeedbackMotors()
    }

    /**
     * The hardware product ID of the raw game controller.
     * @remarks
     * If you have a specific controller that you want to support, you can get this value and [RawGameController.HardwareVendorId](/uwp/api/windows.gaming.input.rawgamecontroller.HardwareVendorId) and check that they match the controller. The position of each input in each array that you get from [RawGameController.GetCurrentReading](/uwp/api/windows.gaming.input.rawgamecontroller#Windows_Gaming_Input_RawGameController_GetCurrentReading_System_Boolean___Windows_Gaming_Input_GameControllerSwitchPosition___System_Double___) is the same for every controller with the same **HardwareProductId** and **HardwareVendorId**, so you don't have to worry about your logic potentially being inconsistent among different controllers of the same type.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.hardwareproductid
     * @type {Integer} 
     */
    HardwareProductId {
        get => this.get_HardwareProductId()
    }

    /**
     * The hardware vendor ID of the raw game controller.
     * @remarks
     * See [RawGameController.HardwareProductId](rawgamecontroller_hardwareproductid.md) for information about how to use this value to support specific types of controllers.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.hardwarevendorid
     * @type {Integer} 
     */
    HardwareVendorId {
        get => this.get_HardwareVendorId()
    }

    /**
     * The number of switches on the raw game controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.switchcount
     * @type {Integer} 
     */
    SwitchCount {
        get => this.get_SwitchCount()
    }

    /**
     * The audio headset attached to the raw game controller.
     * @remarks
     * See [Headset](/windows/uwp/gaming/headset) for information about programming for headsets.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.headset
     * @type {Headset} 
     */
    Headset {
        get => this.get_Headset()
    }

    /**
     * Gets a value that indicates the wireless state of the raw game controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.iswireless
     * @type {Boolean} 
     */
    IsWireless {
        get => this.get_IsWireless()
    }

    /**
     * The user associated with the raw game controller.
     * @remarks
     * See [Tracking users and their devices](/windows/uwp/gaming/input-practices-for-games#tracking-users-and-their-devices) for information about how to keep track of users.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.user
     * @type {User} 
     */
    User {
        get => this.get_User()
    }

    /**
     * A collection of [SimpleHapticsController](../windows.devices.haptics/simplehapticscontroller.md) objects representing all available haptic feedback motors available on the device.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.simplehapticscontrollers
     * @type {IVectorView<SimpleHapticsController>} 
     */
    SimpleHapticsControllers {
        get => this.get_SimpleHapticsControllers()
    }

    /**
     * A unique ID that identifies the controller. As long as the controller is connected, the ID will never change.
     * @remarks
     * This ID has a longer lifetime than both the application and the controller's connection. It's guaranteed not to change for a given controller, even between reboots of the device it's connected to, as long as the controller remains plugged into the same USB port on the device. An example where this might be useful is for games like flight simulators, where the user might plug several of the same type of controller into their PC, like modules with instrument panels. When the user assigns functions to those controllers in the game, the game needs to be able to identify each controller uniquely (which it can't do from the product and vendor IDs alone) so it can make sure the right functions are assigned to the right controllers the next time it runs.
     * 
     * This ID is also unique to the application on that device. The same exact gamepad, plugged into the same PC, will have a different **NonRoamableId** in two different applications. Likewise, the same exact gamepad, running in the same application, but on different PCs, will have different **NonRoamableId**s.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.nonroamableid
     * @type {HSTRING} 
     */
    NonRoamableId {
        get => this.get_NonRoamableId()
    }

    /**
     * The name of the controller, provided by the hardware.
     * @remarks
     * This is meant to be a string that's suitable for display in an application's user interface&mdash;for example, showing the user a list of input devices from which to choose. However, this string isn't guaranteed to be localized. If you need to be sure that you get the correct name for each locale, you can keep your own string table for devices by [RawGameController.HardwareProductId](rawgamecontroller_hardwareproductid.md) and [RawGameController.HardwareVendorId](rawgamecontroller_hardwarevendorid.md).
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.displayname
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * Signals when a headset is attached to the raw game controller.
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
     * Signals when a headset is disconnected from the raw game controller.
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
     * Signals when the user associated with the raw game controller has changed.
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
    get_AxisCount() {
        if (!this.HasProp("__IRawGameController")) {
            if ((queryResult := this.QueryInterface(IRawGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController := IRawGameController(outPtr)
        }

        return this.__IRawGameController.get_AxisCount()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ButtonCount() {
        if (!this.HasProp("__IRawGameController")) {
            if ((queryResult := this.QueryInterface(IRawGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController := IRawGameController(outPtr)
        }

        return this.__IRawGameController.get_ButtonCount()
    }

    /**
     * 
     * @returns {IVectorView<ForceFeedbackMotor>} 
     */
    get_ForceFeedbackMotors() {
        if (!this.HasProp("__IRawGameController")) {
            if ((queryResult := this.QueryInterface(IRawGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController := IRawGameController(outPtr)
        }

        return this.__IRawGameController.get_ForceFeedbackMotors()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareProductId() {
        if (!this.HasProp("__IRawGameController")) {
            if ((queryResult := this.QueryInterface(IRawGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController := IRawGameController(outPtr)
        }

        return this.__IRawGameController.get_HardwareProductId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_HardwareVendorId() {
        if (!this.HasProp("__IRawGameController")) {
            if ((queryResult := this.QueryInterface(IRawGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController := IRawGameController(outPtr)
        }

        return this.__IRawGameController.get_HardwareVendorId()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_SwitchCount() {
        if (!this.HasProp("__IRawGameController")) {
            if ((queryResult := this.QueryInterface(IRawGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController := IRawGameController(outPtr)
        }

        return this.__IRawGameController.get_SwitchCount()
    }

    /**
     * Retrieves the button label for the specified button.
     * @remarks
     * Unlike the **GetButtonLabel** member functions of other classes, such as [ArcadeStick.GetButtonLabel](arcadestick_getbuttonlabel_1981773638.md), this function takes an integer, rather than an [ArcadeStickButtons](arcadestickbuttons.md) or other enumeration value. This integer is an index into the buttons array for the raw game controller.
     * 
     * You can create your own buttons array and then populate it with values representing each button's state using [RawGameController.GetCurrentReading](rawgamecontroller_getcurrentreading_123740519.md). See [Raw game controller](/windows/uwp/gaming/raw-game-controller) for more information.
     * @param {Integer} buttonIndex The button for which to retrieve the label.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.getbuttonlabel
     */
    GetButtonLabel(buttonIndex) {
        if (!this.HasProp("__IRawGameController")) {
            if ((queryResult := this.QueryInterface(IRawGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController := IRawGameController(outPtr)
        }

        return this.__IRawGameController.GetButtonLabel(buttonIndex)
    }

    /**
     * Gets a snapshot of the raw game controller's state.
     * @remarks
     * Unlike the **GetCurrentReading** member functions of other classes, such as [ArcadeStick.GetCurrentReading](arcadestick_getcurrentreading_1416488181.md), **RawGameController.GetCurrentReading** takes three parameters: the button, switch, and axis arrays of the raw game controller. You create these arrays yourself, with the sizes [RawGameController.ButtonCount](rawgamecontroller_buttoncount.md), [RawGameController.SwitchCount](rawgamecontroller_switchcount.md), and [RawGameController.AxisCount](rawgamecontroller_axiscount.md), respectively.
     * 
     * **RawGameController.GetCurrentReading** populates each of these arrays with the current states of each input. The button array is an array of Booleans, where **true** means the button is pressed and **false** means it is not. The switch array is an array of [GameControllerSwitchPosition](gamecontrollerswitchposition.md), where the value at each index represents that switch's current position. Finally, the axis array is an array of doubles, where the value at each index (between 0.0 and 1.0) represents the position of that axis.
     * 
     * See [Raw game controller](/windows/uwp/gaming/raw-game-controller) for more information about how to read input from a raw game controller.
     * @param {Pointer<Integer>} buttonArray_length 
     * @param {Pointer<Pointer<Boolean>>} buttonArray The button array for the raw game controller to be populated with the current state of each button.
     * @param {Pointer<Integer>} switchArray_length 
     * @param {Pointer<Pointer<Integer>>} switchArray The switch array for the raw game controller to be populated with the current state of each switch.
     * @param {Pointer<Integer>} axisArray_length 
     * @param {Pointer<Pointer<Float>>} axisArray The axis array for the raw game controller to be populated with the current state of each axis.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.getcurrentreading
     */
    GetCurrentReading(buttonArray_length, buttonArray, switchArray_length, switchArray, axisArray_length, axisArray) {
        if (!this.HasProp("__IRawGameController")) {
            if ((queryResult := this.QueryInterface(IRawGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController := IRawGameController(outPtr)
        }

        return this.__IRawGameController.GetCurrentReading(buttonArray_length, buttonArray, switchArray_length, switchArray, axisArray_length, axisArray)
    }

    /**
     * Gets the type of the specified switch on the raw game controller.
     * @remarks
     * This function takes an integer, which is the index in the raw game controller's switch array that points to the switch you want to query. You can create your own switch array and then populate it with values representing each switch's state using [RawGameController.GetCurrentReading](rawgamecontroller_getcurrentreading_123740519.md). See [Raw game controller](/windows/uwp/gaming/raw-game-controller) for more information.
     * @param {Integer} switchIndex The index in the raw game controller's switch array of the switch whose type you are querying.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.getswitchkind
     */
    GetSwitchKind(switchIndex) {
        if (!this.HasProp("__IRawGameController")) {
            if ((queryResult := this.QueryInterface(IRawGameController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController := IRawGameController(outPtr)
        }

        return this.__IRawGameController.GetSwitchKind(switchIndex)
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
     * Gets information about the raw game controller's current battery state.
     * @returns {BatteryReport} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.rawgamecontroller.trygetbatteryreport
     */
    TryGetBatteryReport() {
        if (!this.HasProp("__IGameControllerBatteryInfo")) {
            if ((queryResult := this.QueryInterface(IGameControllerBatteryInfo.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGameControllerBatteryInfo := IGameControllerBatteryInfo(outPtr)
        }

        return this.__IGameControllerBatteryInfo.TryGetBatteryReport()
    }

    /**
     * 
     * @returns {IVectorView<SimpleHapticsController>} 
     */
    get_SimpleHapticsControllers() {
        if (!this.HasProp("__IRawGameController2")) {
            if ((queryResult := this.QueryInterface(IRawGameController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController2 := IRawGameController2(outPtr)
        }

        return this.__IRawGameController2.get_SimpleHapticsControllers()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_NonRoamableId() {
        if (!this.HasProp("__IRawGameController2")) {
            if ((queryResult := this.QueryInterface(IRawGameController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController2 := IRawGameController2(outPtr)
        }

        return this.__IRawGameController2.get_NonRoamableId()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
        if (!this.HasProp("__IRawGameController2")) {
            if ((queryResult := this.QueryInterface(IRawGameController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRawGameController2 := IRawGameController2(outPtr)
        }

        return this.__IRawGameController2.get_DisplayName()
    }

;@endregion Instance Methods
}
