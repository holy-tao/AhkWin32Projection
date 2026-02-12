#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ILegacyGipGameControllerProvider.ahk
#Include .\ILegacyGipGameControllerProviderStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Exposes a set of properties and functionality for administering gaming accessories, such as gamepads and headsets, that use the GIP (Gaming Input Protocol) protocol.
  * 
  * > [!IMPORTANT]
  * > Access to this class requires declaring the xboxAccessoryManagement capability
  * 
  * > [!CAUTION]
  * > These APIs affect all games on a system and may cause problems on an accessory if misused. Microsoft recommends only using these APIs for administering hardware you have developed.
 * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider
 * @namespace Windows.Gaming.Input.Preview
 * @version WindowsRuntime 1.4
 */
class LegacyGipGameControllerProvider extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ILegacyGipGameControllerProvider

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ILegacyGipGameControllerProvider.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Constructs a [LegacyGipGameControllerProvider](legacygipgamecontrollerprovider.md) for the given controller.
     * @param {IGameController} controller Controller to construct a LegacyGipGameControllerProvider for.
     * @returns {LegacyGipGameControllerProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.fromgamecontroller
     */
    static FromGameController(controller) {
        if (!LegacyGipGameControllerProvider.HasProp("__ILegacyGipGameControllerProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Preview.LegacyGipGameControllerProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILegacyGipGameControllerProviderStatics.IID)
            LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics := ILegacyGipGameControllerProviderStatics(factoryPtr)
        }

        return LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics.FromGameController(controller)
    }

    /**
     * Constructs a [LegacyGipGameControllerProvider](legacygipgamecontrollerprovider.md) for the given controller provider.
     * @param {IGameControllerProvider} provider Controller provider to construct a LegacyGipGameControllerProvider for.
     * @returns {LegacyGipGameControllerProvider} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.fromgamecontrollerprovider
     */
    static FromGameControllerProvider(provider) {
        if (!LegacyGipGameControllerProvider.HasProp("__ILegacyGipGameControllerProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Preview.LegacyGipGameControllerProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILegacyGipGameControllerProviderStatics.IID)
            LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics := ILegacyGipGameControllerProviderStatics(factoryPtr)
        }

        return LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics.FromGameControllerProvider(provider)
    }

    /**
     * Pairs the given pilot and copilot controllers for the given user.
     * @remarks
     * Once a pilot and copilot controller are paired, all physical inputs from either controller will appear through all input APIs as though they came from the pilot controller.
     * 
     * > [!CAUTION]
     * > Copilot pairing is system-wide and persistent for the given user. This should only be done at the user's direction.
     * @param {User} user_ User to create a copilot pairing for.
     * @param {HSTRING} pilotControllerProviderId Provider id for the pilot controller.
     * @param {HSTRING} copilotControllerProviderId Provider id for the copilot controller.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.pairpilottocopilot
     */
    static PairPilotToCopilot(user_, pilotControllerProviderId, copilotControllerProviderId) {
        if (!LegacyGipGameControllerProvider.HasProp("__ILegacyGipGameControllerProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Preview.LegacyGipGameControllerProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILegacyGipGameControllerProviderStatics.IID)
            LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics := ILegacyGipGameControllerProviderStatics(factoryPtr)
        }

        return LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics.PairPilotToCopilot(user_, pilotControllerProviderId, copilotControllerProviderId)
    }

    /**
     * Removes any copilot pairings for controllerId for the given user.
     * @remarks
     * Removes the given controller from any pairings where it is either a pilot or copilot for the given user. The controller does not need to be connected to be unpaired. Removing one controller from a pairing removes the pairing entirely &mdash; that is, if a controller is paired as a copilot to another controller, removing the copilot controller will also remove the pairing for the pilot controller and vice versa.
     * 
     * > [!CAUTION]
     * > Copilot pairing is system-wide and persistent for the given user. This should only be done at the user's direction.
     * @param {User} user_ User to clear the pairing for.
     * @param {HSTRING} controllerProviderId Provider id for the controller to remove from parings.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.clearpairing
     */
    static ClearPairing(user_, controllerProviderId) {
        if (!LegacyGipGameControllerProvider.HasProp("__ILegacyGipGameControllerProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Preview.LegacyGipGameControllerProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILegacyGipGameControllerProviderStatics.IID)
            LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics := ILegacyGipGameControllerProviderStatics(factoryPtr)
        }

        return LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics.ClearPairing(user_, controllerProviderId)
    }

    /**
     * Retrieves the ID of the copilot controller if this controller is a pilot.
     * @param {User} user_ User to check the pairing for.
     * @param {HSTRING} controllerProviderId Provider id for the controller to check for pairings.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.ispilot
     */
    static IsPilot(user_, controllerProviderId) {
        if (!LegacyGipGameControllerProvider.HasProp("__ILegacyGipGameControllerProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Preview.LegacyGipGameControllerProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILegacyGipGameControllerProviderStatics.IID)
            LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics := ILegacyGipGameControllerProviderStatics(factoryPtr)
        }

        return LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics.IsPilot(user_, controllerProviderId)
    }

    /**
     * Retrieves the ID of the pilot controller if this controller is a copilot.
     * @param {User} user_ User to check the pairing for.
     * @param {HSTRING} controllerProviderId Provider id for the controller to check for pairings.
     * @returns {HSTRING} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.iscopilot
     */
    static IsCopilot(user_, controllerProviderId) {
        if (!LegacyGipGameControllerProvider.HasProp("__ILegacyGipGameControllerProviderStatics")) {
            activatableClassId := HSTRING.Create("Windows.Gaming.Input.Preview.LegacyGipGameControllerProvider")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ILegacyGipGameControllerProviderStatics.IID)
            LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics := ILegacyGipGameControllerProviderStatics(factoryPtr)
        }

        return LegacyGipGameControllerProvider.__ILegacyGipGameControllerProviderStatics.IsCopilot(user_, controllerProviderId)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the battery charging state of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.batterychargingstate
     * @type {Integer} 
     */
    BatteryChargingState {
        get => this.get_BatteryChargingState()
    }

    /**
     * Gets the controller's battery kind.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.batterykind
     * @type {Integer} 
     */
    BatteryKind {
        get => this.get_BatteryKind()
    }

    /**
     * Gets the battery charge level of the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.batterylevel
     * @type {Integer} 
     */
    BatteryLevel {
        get => this.get_BatteryLevel()
    }

    /**
     * Returns whether the controller firmware is corrupted.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.isfirmwarecorrupted
     * @type {Boolean} 
     */
    IsFirmwareCorrupted {
        get => this.get_IsFirmwareCorrupted()
    }

    /**
     * Returns whether the controller is a synthetic or physical device.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.issyntheticdevice
     * @type {Boolean} 
     */
    IsSyntheticDevice {
        get => this.get_IsSyntheticDevice()
    }

    /**
     * Gets the set of GIP (Gaming Input Protocol) types reported by the controller.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.preferredtypes
     * @type {IVectorView<HSTRING>} 
     */
    PreferredTypes {
        get => this.get_PreferredTypes()
    }

    /**
     * Gets the app compat version reported by the GIP (Gaming Input Protocol) driver.
     * @remarks
     * The app compat version may be used to determine whether the GIP driver is new enough to support a given feature.
     * 
     * Features supported as of each version:
     * 
     * |Version  |Features  |
     * |---------|---------|
     * |2     |Initial release         |
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.appcompatversion
     * @type {Integer} 
     */
    AppCompatVersion {
        get => this.get_AppCompatVersion()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BatteryChargingState() {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.get_BatteryChargingState()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BatteryKind() {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.get_BatteryKind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_BatteryLevel() {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.get_BatteryLevel()
    }

    /**
     * Retrieves the state of whether the device's firmware is corrupted and if so, in what way.
     * @remarks
     * This should be used rather than [**IsFirmwareCorrupted**](legacygipgamecontrollerprovider_isfirmwarecorrupted.md) for most devices as it is supported by most devices. **IsFirmwareCorrupted** is only supported by older devices and should only be used if [**GetDeviceFirmwareCorruptionState**](legacygipgamecontrollerprovider_getdevicefirmwarecorruptionstate_2021274220.md) is not supported.
     * 
     * > [!CAUTION]
     * > To avoid damaging devices, the firmware corruption and update APIs should only be used with hardware you have developed.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.getdevicefirmwarecorruptionstate
     */
    GetDeviceFirmwareCorruptionState() {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.GetDeviceFirmwareCorruptionState()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsFirmwareCorrupted() {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.get_IsFirmwareCorrupted()
    }

    /**
     * Queries whether the given GIP (Gaming Input Protocol) interface guid is supported by the controller.
     * @param {Guid} interfaceId The interface guid to check for.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.isinterfacesupported
     */
    IsInterfaceSupported(interfaceId) {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.IsInterfaceSupported(interfaceId)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSyntheticDevice() {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.get_IsSyntheticDevice()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_PreferredTypes() {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.get_PreferredTypes()
    }

    /**
     * Executes a command on a legacy GIP (Gaming Input Protocol) headset.
     * @remarks
     * > [!CAUTION]
     * > To avoid damaging devices, the headset control APIs should only be used with hardware you have developed.
     * @param {Integer} command The command to execute.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.executecommand
     */
    ExecuteCommand(command) {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.ExecuteCommand(command)
    }

    /**
     * Sets the brightness of the LED in the home button of the controller.
     * @param {Integer} intensity The brightness of the LED, from 0 to 100, inclusive.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.sethomeledintensity
     */
    SetHomeLedIntensity(intensity) {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.SetHomeLedIntensity(intensity)
    }

    /**
     * Retrieves identification information for the device.
     * @param {Pointer<Pointer>} buffer_ 
     * @returns {HRESULT} An array of GIP (Gaming Input Protocol) device information provided by the device.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.getextendeddeviceinfo
     */
    GetExtendedDeviceInfo(buffer_) {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.GetExtendedDeviceInfo(buffer_)
    }

    /**
     * Sets a headset operation.
     * @remarks
     * > [!CAUTION]
     * > To avoid damaging devices, the headset control APIs should only be used with hardware you have developed.
     * @param {Integer} operation The setting to change.
     * @param {Integer} buffer_length 
     * @param {Pointer<Integer>} buffer Buffer with the appropriate format for `operation`. See [HeadsetOperation](HeadsetOperation.md) for the respective formats.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.setheadsetoperation
     */
    SetHeadsetOperation(operation, buffer_length, buffer) {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.SetHeadsetOperation(operation, buffer_length, buffer)
    }

    /**
     * Retrieves a headset setting based on ``operation``.
     * @remarks
     * > [!CAUTION]
     * > To avoid damaging devices, the headset control APIs should only be used with hardware you have developed.
     * @param {Integer} operation The setting to read.
     * @param {Pointer<Pointer>} buffer_ 
     * @returns {HRESULT} A buffer with the appropriate format for `operation`.
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.getheadsetoperation
     */
    GetHeadsetOperation(operation, buffer_) {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.GetHeadsetOperation(operation, buffer_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_AppCompatVersion() {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.get_AppCompatVersion()
    }

    /**
     * Changes the button and axis mapping of a standard gamepad for a user.
     * @remarks
     * The order of the buttons for ButtonSettings from most significant to least significant is: Right Thumbstick, Left Thumbstick, Right Shoulder, Left Shoulder, DPad Right, DPad Left, DPad Down, DPad Up, Y, X, B, A, View, Menu, Guide, and Bind.
     * 
     * Typically, the *previous* parameter should be `false`, which will apply the remapping. It can also be used to save a mapping for later (for example, to save the default mapping before applying a custom mapping, so that the default mapping can be restored later).
     * 
     * > [!CAUTION]
     * > Controller mapping is system-wide and persistent for the given user. This should only be done at the user's direction.
     * @param {User} user_ The user to remap the controller for.
     * @param {Boolean} previous `True` if the mapping should be stored in the inactive Previous store; `false` if the mapping should be applied.
     * @param {IMapView<Integer, IInspectable>} remapping A dictionary matching each [RemappingButtonCategory](remappingbuttoncategory.md) to data that specifies the remapping. The data type is specific to the category as follows:
     * 
     * |RemappingButtonCategory  |Data Description  |
     * |---------|---------|
     * |ButtonsSettings     |A uint64 composed of 16 nibbles. Each nibble represents a button's assignment. The standard assignment is 0xfedcba9876543210         |
     * |AnalogSettings     |A uint32 with the following effects: 0x1 : Swaps triggers / 0x2 : Swaps thumbsticks / 0x4 : Inverts the left thumbstick / 0x8 : Inverts the right thumbstick. The standard assignment is 0.         |
     * |VibrationSettings  |A uint32 with the following effects: 0x01 : Disables vibration. The standard assignment is 0. |
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.setstandardcontrollerbuttonremapping
     */
    SetStandardControllerButtonRemapping(user_, previous, remapping) {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.SetStandardControllerButtonRemapping(user_, previous, remapping)
    }

    /**
     * Retrieves the button and axis mapping of a standard gamepad for a user.
     * @remarks
     * The order of the buttons for ButtonSettings from most significant to least significant is: Right Thumbstick, Left Thumbstick, Right Shoulder, Left Shoulder, DPad Right, DPad Left, DPad Down, DPad Up, Y, X, B, A, View, Menu, Guide, and Bind.
     * 
     * Typically, the *previous* parameter should be `false`, which will read the current controller mapping. It can also be used to read a mapping that was saved for later (for example, to read a saved mapping to restore a previous state).
     * 
     * > [!CAUTION]
     * > Controller mapping is system-wide and persistent for the given user. This should only be done at the user's direction.
     * @param {User} user_ The user to get controller mappings for.
     * @param {Boolean} previous `True` if the mapping should be read from the inactive Previous store; ```false``` if the active mapping should be read.
     * @returns {IMapView<Integer, IInspectable>} 
     * @see https://learn.microsoft.com/uwp/api/windows.gaming.input.preview.legacygipgamecontrollerprovider.getstandardcontrollerbuttonremapping
     */
    GetStandardControllerButtonRemapping(user_, previous) {
        if (!this.HasProp("__ILegacyGipGameControllerProvider")) {
            if ((queryResult := this.QueryInterface(ILegacyGipGameControllerProvider.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ILegacyGipGameControllerProvider := ILegacyGipGameControllerProvider(outPtr)
        }

        return this.__ILegacyGipGameControllerProvider.GetStandardControllerButtonRemapping(user_, previous)
    }

;@endregion Instance Methods
}
