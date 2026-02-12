#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\RoutedEventArgs.ahk
#Include .\IKeyRoutedEventArgs.ahk
#Include .\IKeyRoutedEventArgs2.ahk
#Include .\IKeyRoutedEventArgs3.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides event data for the [KeyUp](../windows.ui.xaml/uielement_keyup.md) and [KeyDown](../windows.ui.xaml/uielement_keydown.md) routed events.
 * @remarks
 * Button input is mapped to different key values for various devices.
 * 
 * This table provides the mapping detail for game pad and remote devices.
 * 
 * | Button | [Key](keyroutedeventargs_key.md) value | [OriginalKey](keyroutedeventargs_originalkey.md) value |
 * |--------|----------------------------------------|--------------------------------------------------------|
 * | ![GamepadA button](images/GamePadA.png) | Space | GamepadA or NavigationAccept |
 * | ![GamepadB button](images/GamePadB.png) | Escape | GamepadB or NavigationCancel |
 * | ![GamepadX button](images/GamePadX.png) | GamepadX | GamepadX |
 * | ![GamepadY button](images/GamePadY.png) | GamepadY | GamepadY |
 * | ![GamepadDPad button](images/GamePadDPad.png) | Left/Right/Up/Down | GamepadDPadUp/Down/Left/Right |
 * | ![GamePad Joystick/Thumbstick](images/GamePadRightLeftStick.png) | GamepadLeftThumbstickButton/Up/Down/Left/Right or GamepadRightThumbstickButton/Up/Down/Left/Right | GamepadLeftThumbstickButton/Up/Down/Left/Right or GamepadRightThumbstickButton/Up/Down/Left/Right or NavigationUp/Down/Left/Right |
 * | ![Gamepad Trigger](images/GamePadBumperTrigger.png) | GamePadRightTrigger/LeftTrigger | GamePadRightTrigger/LeftTrigger |
 * | ![Gamepad Bumper/Shoulder](images/GamePadBumperTrigger.png) | GamePadRightShoulder/LeftShoulder | GamePadRightShoulder/LeftShoulder |
 * | ![Gamepad Menu button](images/GamePadMenu.png) | GamepadMenu | GamepadMenu or NavigationMenu |
 * | ![Gamepad View button](images/GamePadView.png) | GamepadView | GamepadView or NavigationView |
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyroutedeventargs
 * @namespace Windows.UI.Xaml.Input
 * @version WindowsRuntime 1.4
 */
class KeyRoutedEventArgs extends RoutedEventArgs {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IKeyRoutedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IKeyRoutedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the [virtual key](../windows.system/virtualkey.md) associated with the event.
     * 
     * Depending on the input device, this can be a mapped value. For raw, unmapped event data, see the [OriginalKey](keyroutedeventargs_originalkey.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyroutedeventargs.key
     * @type {Integer} 
     */
    Key {
        get => this.get_Key()
    }

    /**
     * Gets a structure value that reports various system-detected characteristics of the key press, including repeat count and menu status.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyroutedeventargs.keystatus
     * @type {CorePhysicalKeyStatus} 
     */
    KeyStatus {
        get => this.get_KeyStatus()
    }

    /**
     * Gets or sets a value that marks the routed event as handled. A **true** value for **Handled** prevents most handlers along the event route from handling the same event again.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyroutedeventargs.handled
     * @type {Boolean} 
     */
    Handled {
        get => this.get_Handled()
        set => this.put_Handled(value)
    }

    /**
     * Gets the original, unmapped [virtual key](../windows.system/virtualkey.md) associated with the event.
     * 
     * Depending on the input device, the input button might be mapped to a different key value. For the mapped event value, see the [Key](keyroutedeventargs_key.md) property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyroutedeventargs.originalkey
     * @type {Integer} 
     */
    OriginalKey {
        get => this.get_OriginalKey()
    }

    /**
     * Gets a unique ID for the input device that generated this key event.
     * 
     * Use DeviceId to differentiate between all connected devices that can generate key events, such as multiple game controllers.
     * 
     * > DeviceId is not supported for all input devices.
     * @remarks
     * Some devices, such as Xbox, permit multiple users to sign in for a single interactive session. This DeviceId property is useful for retrieving info for a specific user account associated with the input device.
     * 
     * > In Windows 10 and later, Universal Windows Platform (UWP) app do not have access to user information without explicit user consent (unlike Windows 8, where permission is granted by default).
     * 
     * Universal Windows Platform (UWP) app that access user information must declare the [userAccountInformation capability](/uwp/schemas/appxpackage/uapmanifestschema/element-uap-capability) ([Windows.System.UserDeviceAssociation.FindUserFromDeviceId](../windows.system/userdeviceassociation_finduserfromdeviceid_1383143459.md), [Windows.System.User.FindAllAsync](../windows.system/user_findallasync_1333355945.md) and [User.GetPropertiesAsync](../windows.system/user_getpropertiesasync_1952817514.md) can be used to get the data).
     * 
     * When this capability is declared, users installing the app are prompted to allow access to their information. If the user permits the app to access the information, the app appears listed in the **Privacy** page of Windows Settings (**Settings &gt; Privacy &gt; Account info**).
     * 
     * ```csharp
     * private async void OnKeyDown(object sender, KeyRoutedEventArgs e)
     * {
     *   User user = 
     *     Windows.System.UserDeviceAssociation.FindUserFromDeviceId(e.DeviceId);
     *   string displayName = 
     *     (string)await user.GetPropertyAsync(KnownUserProperties.DisplayName);
     *   System.Diagnostics.Debug.WriteLine(displayName);
     * }
     * ```
     * 
     * Sometimes, an [OnKeyDown](../windows.ui.xaml.controls/control_onkeydown_1048103922.md) event might not fire because the event was already handled by a control. In this case, call the [GetCurrentKeyEventDeviceId](../windows.ui.core/corewindow_getcurrentkeyeventdeviceid_498768106.md) method from the [KeyDown](../windows.ui.core/corewindow_keydown.md) handler of [CoreWindow](../windows.ui.core/corewindow.md), as shown here.
     * 
     * ```csharp
     * public MainPage()
     * {
     *   this.InitializeComponent();
     *   Windows.UI.Core.CoreWindow.GetForCurrentThread().KeyDown += OnKeyDown;
     * }
     * 
     * private async void OnKeyDown(Windows.UI.Core.CoreWindow sender, Windows.UI.Core.KeyEventArgs args)
     * {
     *   string device = Windows.UI.Core.CoreWindow.GetForCurrentThread().GetCurrentKeyEventDeviceId();
     *   User user = Windows.System.UserDeviceAssociation.FindUserFromDeviceId(device);
     *   string displayName = (string)await user.GetPropertyAsync(KnownUserProperties.DisplayName);
     *   System.Diagnostics.Debug.WriteLine("OnKeydown:" + displayName);
     * }
     * 
     * ```
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.input.keyroutedeventargs.deviceid
     * @type {HSTRING} 
     */
    DeviceId {
        get => this.get_DeviceId()
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
    get_Key() {
        if (!this.HasProp("__IKeyRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyRoutedEventArgs := IKeyRoutedEventArgs(outPtr)
        }

        return this.__IKeyRoutedEventArgs.get_Key()
    }

    /**
     * 
     * @returns {CorePhysicalKeyStatus} 
     */
    get_KeyStatus() {
        if (!this.HasProp("__IKeyRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyRoutedEventArgs := IKeyRoutedEventArgs(outPtr)
        }

        return this.__IKeyRoutedEventArgs.get_KeyStatus()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Handled() {
        if (!this.HasProp("__IKeyRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyRoutedEventArgs := IKeyRoutedEventArgs(outPtr)
        }

        return this.__IKeyRoutedEventArgs.get_Handled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Handled(value) {
        if (!this.HasProp("__IKeyRoutedEventArgs")) {
            if ((queryResult := this.QueryInterface(IKeyRoutedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyRoutedEventArgs := IKeyRoutedEventArgs(outPtr)
        }

        return this.__IKeyRoutedEventArgs.put_Handled(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_OriginalKey() {
        if (!this.HasProp("__IKeyRoutedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IKeyRoutedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyRoutedEventArgs2 := IKeyRoutedEventArgs2(outPtr)
        }

        return this.__IKeyRoutedEventArgs2.get_OriginalKey()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DeviceId() {
        if (!this.HasProp("__IKeyRoutedEventArgs3")) {
            if ((queryResult := this.QueryInterface(IKeyRoutedEventArgs3.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IKeyRoutedEventArgs3 := IKeyRoutedEventArgs3(outPtr)
        }

        return this.__IKeyRoutedEventArgs3.get_DeviceId()
    }

;@endregion Instance Methods
}
