#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialController.ahk
#Include .\IRadialController2.ahk
#Include .\IRadialControllerStatics.ahk
#Include ..\..\Foundation\TypedEventHandler.ahk
#Include .\RadialController.ahk
#Include .\RadialControllerScreenContactStartedEventArgs.ahk
#Include .\RadialControllerScreenContactContinuedEventArgs.ahk
#Include .\RadialControllerRotationChangedEventArgs.ahk
#Include .\RadialControllerButtonClickedEventArgs.ahk
#Include .\RadialControllerControlAcquiredEventArgs.ahk
#Include .\RadialControllerButtonPressedEventArgs.ahk
#Include .\RadialControllerButtonHoldingEventArgs.ahk
#Include .\RadialControllerButtonReleasedEventArgs.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\..\WinRTEventHandler.ahk

/**
 * Represents a wheel input device or accessory such as the Surface Dial.
  * 
  * :::image type="content" source="images/dial-pen-studio-600px.png" alt-text="Surface Dial with Surface Studio and Pen.":::
  * 
  * With a form factor based on a rotate action (or gesture), the Surface Dial is intended as a secondary, multi-modal input device that complements input from a primary device. In most cases, the device is manipulated by a user's non-dominant hand while performing a task with their dominant hand (such as inking with a pen). It is not designed for precision pointer input (like touch, pen, or mouse).
  * 
  * The Surface Dial also supports both a press and hold action and a click action. Press and hold has a single function: display a menu of commands. If the menu is active, the rotate and click input is processed by the menu. Otherwise, the input is passed to your app for processing.
  * 
  * The RadialController and related APIs (see end of topic) enable you to customize both the integrated command menu and the interaction experience supported by your app.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontroller
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialController extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialController

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialController.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Retrieves a value that indicates whether wheel devices are supported by the system.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontroller.issupported
     */
    static IsSupported() {
        if (!RadialController.HasProp("__IRadialControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerStatics.IID)
            RadialController.__IRadialControllerStatics := IRadialControllerStatics(factoryPtr)
        }

        return RadialController.__IRadialControllerStatics.IsSupported()
    }

    /**
     * Instantiates a [RadialController](radialcontroller.md) object for the wheel device and binds it to the active application.
     * @remarks
     * We recommend creating the [RadialController](radialcontroller.md) object in your app's OnPageLoaded event handler.
     * @returns {RadialController} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontroller.createforcurrentview
     */
    static CreateForCurrentView() {
        if (!RadialController.HasProp("__IRadialControllerStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.RadialController")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRadialControllerStatics.IID)
            RadialController.__IRadialControllerStatics := IRadialControllerStatics(factoryPtr)
        }

        return RadialController.__IRadialControllerStatics.CreateForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a reference to the menu associated with the [RadialController](radialcontroller.md) object.
     * @remarks
     * [RadialController](radialcontroller.md) menu operations, including [CreateFromKnownIcon](radialcontrollermenuitem_createfromknownicon_1665769620.md), [CreateFromIcon](radialcontrollermenuitem_createfromicon_2066467533.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_679326837.md), [CreateFromFontGlyph](radialcontrollermenuitem_createfromfontglyph_63723173.md), [ResetToDefaultMenuItems](radialcontrollerconfiguration_resettodefaultmenuitems_461236227.md), [SetDefaultMenuItems](radialcontrollerconfiguration_setdefaultmenuitems_1318008085.md), and [TrySelectDefaultMenuItem](radialcontrollerconfiguration_tryselectdefaultmenuitem_1342621095.md), should be performed on the UI thread. Doing so in a background worker thread can cause issues with event handlers on the UI thread.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontroller.menu
     * @type {RadialControllerMenu} 
     */
    Menu {
        get => this.get_Menu()
    }

    /**
     * Gets or sets the minimum rotational value required for the [RadialController](radialcontroller.md) object to fire a [RotationChanged](radialcontroller_rotationchanged.md) event.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontroller.rotationresolutionindegrees
     * @type {Float} 
     */
    RotationResolutionInDegrees {
        get => this.get_RotationResolutionInDegrees()
        set => this.put_RotationResolutionInDegrees(value)
    }

    /**
     * Gets or sets whether haptic feedback is enabled on the wheel device for each [RotationChanged](radialcontroller_rotationchanged.md) event fired by the [RadialController](radialcontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontroller.useautomatichapticfeedback
     * @type {Boolean} 
     */
    UseAutomaticHapticFeedback {
        get => this.get_UseAutomaticHapticFeedback()
        set => this.put_UseAutomaticHapticFeedback(value)
    }

    /**
     * Occurs when initial contact is detected between a wheel device and the digitizer surface, and a custom [RadialController](radialcontroller.md) tool is active.
     * 
     * 
     * Your app does not receive this event when:
     * 
     * + The [RadialController](radialcontroller.md) menu is active
     * + A built-in tool is active
     * 
     * 
     * > [!TIP]
     * > In addition to the default press and hold menu experience, the Surface Dial can also be placed directly on the screen of the Surface Studio. This enables a special "on-screen" menu.
     * 
     * By detecting both the contact location and bounds of the Surface Dial, the system can handle occlusion by the device and display a larger version of the menu that wraps around the outside of the Dial. This same info can also be used by your app to adapt the UI for both the presence of the device and its anticipated usage, such as the placement of the user's hand and arm.
     * @type {TypedEventHandler<RadialController, RadialControllerScreenContactStartedEventArgs>}
    */
    OnScreenContactStarted {
        get {
            if(!this.HasProp("__OnScreenContactStarted")){
                this.__OnScreenContactStarted := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{1f2d584e-3ad8-5049-b451-3a44a102fa82}"),
                    RadialController,
                    RadialControllerScreenContactStartedEventArgs
                )
                this.__OnScreenContactStartedToken := this.add_ScreenContactStarted(this.__OnScreenContactStarted.iface)
            }
            return this.__OnScreenContactStarted
        }
    }

    /**
     * Occurs when a wheel device that is in contact with the digitizer surface is removed (or is no longer detected), and a custom [RadialController](radialcontroller.md) tool is active.
     * 
     * 
     * Your app does not receive this event when:
     * 
     * + The [RadialController](radialcontroller.md) menu is active
     * + A built-in tool is active
     * 
     * 
     * > [!TIP]
     * > In addition to the default press and hold menu experience, the Surface Dial can also be placed directly on the screen of the Surface Studio. This enables a special "on-screen" menu.
     * 
     * By detecting both the contact location and bounds of the Surface Dial, the system can handle occlusion by the device and display a larger version of the menu that wraps around the outside of the Dial. This same info can also be used by your app to adapt the UI for both the presence of the device and its anticipated usage, such as the placement of the user's hand and arm.
     * 
     * This event occurs after [ScreenContactStarted](radialcontroller_screencontactstarted.md).
     * @type {TypedEventHandler<RadialController, IInspectable>}
    */
    OnScreenContactEnded {
        get {
            if(!this.HasProp("__OnScreenContactEnded")){
                this.__OnScreenContactEnded := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5e0f93b1-c2f2-5351-82aa-6cf5f4c2d068}"),
                    RadialController,
                    IInspectable
                )
                this.__OnScreenContactEndedToken := this.add_ScreenContactEnded(this.__OnScreenContactEnded.iface)
            }
            return this.__OnScreenContactEnded
        }
    }

    /**
     * Occurs only when the wheel device is moved while in contact with the digitizer surface, and a custom [RadialController](radialcontroller.md) tool is active.
     * 
     * 
     * Your app does not receive this event when:
     * 
     * + The [RadialController](radialcontroller.md) menu is active
     * + A built-in tool is active
     * 
     * 
     * > [!TIP]
     * > In addition to the default press and hold menu experience, the Surface Dial can also be placed directly on the screen of the Surface Studio. This enables a special "on-screen" menu.
     * 
     * By detecting both the contact location and bounds of the Surface Dial, the system can handle occlusion by the device and display a larger version of the menu that wraps around the outside of the Dial. This same info can also be used by your app to adapt the UI for both the presence of the device and its anticipated usage, such as the placement of the user's hand and arm.
     * 
     * This event occurs after [ScreenContactStarted](radialcontroller_screencontactstarted.md) and stops on [ScreenContactEnded](radialcontroller_screencontactended.md).
     * @type {TypedEventHandler<RadialController, RadialControllerScreenContactContinuedEventArgs>}
    */
    OnScreenContactContinued {
        get {
            if(!this.HasProp("__OnScreenContactContinued")){
                this.__OnScreenContactContinued := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{30579e67-fb4f-5d38-83b4-9cb610090def}"),
                    RadialController,
                    RadialControllerScreenContactContinuedEventArgs
                )
                this.__OnScreenContactContinuedToken := this.add_ScreenContactContinued(this.__OnScreenContactContinued.iface)
            }
            return this.__OnScreenContactContinued
        }
    }

    /**
     * Occurs while a custom [RadialController](radialcontroller.md) tool (defined by an app) is active, and either the app associated with the [RadialController](radialcontroller.md) object is sent to the background, or the user activates the [RadialController](radialcontroller.md) menu.
     * @type {TypedEventHandler<RadialController, IInspectable>}
    */
    OnControlLost {
        get {
            if(!this.HasProp("__OnControlLost")){
                this.__OnControlLost := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{5e0f93b1-c2f2-5351-82aa-6cf5f4c2d068}"),
                    RadialController,
                    IInspectable
                )
                this.__OnControlLostToken := this.add_ControlLost(this.__OnControlLost.iface)
            }
            return this.__OnControlLost
        }
    }

    /**
     * Occurs when the wheel device is rotated while a custom [RadialController](radialcontroller.md) tool is active.
     * 
     * Your app does not receive this event when:
     * 
     * + The [RadialController](radialcontroller.md) menu is active
     * + A built-in tool is active
     * @type {TypedEventHandler<RadialController, RadialControllerRotationChangedEventArgs>}
    */
    OnRotationChanged {
        get {
            if(!this.HasProp("__OnRotationChanged")){
                this.__OnRotationChanged := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{8fe73ac9-8a36-5152-815d-03310ee8bf85}"),
                    RadialController,
                    RadialControllerRotationChangedEventArgs
                )
                this.__OnRotationChangedToken := this.add_RotationChanged(this.__OnRotationChanged.iface)
            }
            return this.__OnRotationChanged
        }
    }

    /**
     * Occurs when the wheel device is pressed and then released while a custom [RadialController](radialcontroller.md) tool is active.
     * 
     * 
     * Your app does not receive this event when:
     * 
     * + The [RadialController](radialcontroller.md) menu is active
     * + A built-in tool is active
     * 
     * 
     * > [!NOTE]
     * > When a time threshold is crossed, click becomes a press and hold action. In this case, the integrated menu of contextual app commands associated with the [RadialController](radialcontroller.md) object is displayed, and subsequent rotate and click events are processed by the menu.
     * @type {TypedEventHandler<RadialController, RadialControllerButtonClickedEventArgs>}
    */
    OnButtonClicked {
        get {
            if(!this.HasProp("__OnButtonClicked")){
                this.__OnButtonClicked := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{d09d9fcc-edb8-56c0-856d-70e477a9ddf3}"),
                    RadialController,
                    RadialControllerButtonClickedEventArgs
                )
                this.__OnButtonClickedToken := this.add_ButtonClicked(this.__OnButtonClicked.iface)
            }
            return this.__OnButtonClicked
        }
    }

    /**
     * Occurs when a custom [RadialController](radialcontroller.md) tool (defined by an app) is selected from the menu, or when an app associated with the [RadialController](radialcontroller.md) object is brought to the foreground while a custom [RadialController](radialcontroller.md) tool is active.
     * @type {TypedEventHandler<RadialController, RadialControllerControlAcquiredEventArgs>}
    */
    OnControlAcquired {
        get {
            if(!this.HasProp("__OnControlAcquired")){
                this.__OnControlAcquired := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4ec5f3fd-b217-5452-a2bd-9725ce9f6675}"),
                    RadialController,
                    RadialControllerControlAcquiredEventArgs
                )
                this.__OnControlAcquiredToken := this.add_ControlAcquired(this.__OnControlAcquired.iface)
            }
            return this.__OnControlAcquired
        }
    }

    /**
     * Occurs when the wheel device is pressed.
     * @type {TypedEventHandler<RadialController, RadialControllerButtonPressedEventArgs>}
    */
    OnButtonPressed {
        get {
            if(!this.HasProp("__OnButtonPressed")){
                this.__OnButtonPressed := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{660bee4a-4fed-5a62-aa5d-8113b477bc69}"),
                    RadialController,
                    RadialControllerButtonPressedEventArgs
                )
                this.__OnButtonPressedToken := this.add_ButtonPressed(this.__OnButtonPressed.iface)
            }
            return this.__OnButtonPressed
        }
    }

    /**
     * Occurs when the user presses and holds down the wheel device.
     * @remarks
     * Your app does not receive this event when:
     * 
     * + The [IsMenuSuppressed](radialcontrollerconfiguration_ismenusuppressed.md) is **false**.
     * + The [ActiveControllerWhenMenuIsSuppressed](radialcontrollerconfiguration_activecontrollerwhenmenuissuppressed.md) is not set to the appropriate [RadialController](radialcontroller.md).
     * @type {TypedEventHandler<RadialController, RadialControllerButtonHoldingEventArgs>}
    */
    OnButtonHolding {
        get {
            if(!this.HasProp("__OnButtonHolding")){
                this.__OnButtonHolding := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{4c44f2ff-3a4a-51ba-a01f-9f2002471f59}"),
                    RadialController,
                    RadialControllerButtonHoldingEventArgs
                )
                this.__OnButtonHoldingToken := this.add_ButtonHolding(this.__OnButtonHolding.iface)
            }
            return this.__OnButtonHolding
        }
    }

    /**
     * Occurs when the wheel device is pressed and then released.
     * @type {TypedEventHandler<RadialController, RadialControllerButtonReleasedEventArgs>}
    */
    OnButtonReleased {
        get {
            if(!this.HasProp("__OnButtonReleased")){
                this.__OnButtonReleased := WinRTEventHandler(
                    TypedEventHandler,
                    Guid("{c22ff62c-c642-5d50-9340-fe163122720c}"),
                    RadialController,
                    RadialControllerButtonReleasedEventArgs
                )
                this.__OnButtonReleasedToken := this.add_ButtonReleased(this.__OnButtonReleased.iface)
            }
            return this.__OnButtonReleased
        }
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    __Delete() {
        if(this.HasProp("__OnScreenContactStartedToken")) {
            this.remove_ScreenContactStarted(this.__OnScreenContactStartedToken)
            this.__OnScreenContactStarted.iface.Dispose()
        }

        if(this.HasProp("__OnScreenContactEndedToken")) {
            this.remove_ScreenContactEnded(this.__OnScreenContactEndedToken)
            this.__OnScreenContactEnded.iface.Dispose()
        }

        if(this.HasProp("__OnScreenContactContinuedToken")) {
            this.remove_ScreenContactContinued(this.__OnScreenContactContinuedToken)
            this.__OnScreenContactContinued.iface.Dispose()
        }

        if(this.HasProp("__OnControlLostToken")) {
            this.remove_ControlLost(this.__OnControlLostToken)
            this.__OnControlLost.iface.Dispose()
        }

        if(this.HasProp("__OnRotationChangedToken")) {
            this.remove_RotationChanged(this.__OnRotationChangedToken)
            this.__OnRotationChanged.iface.Dispose()
        }

        if(this.HasProp("__OnButtonClickedToken")) {
            this.remove_ButtonClicked(this.__OnButtonClickedToken)
            this.__OnButtonClicked.iface.Dispose()
        }

        if(this.HasProp("__OnControlAcquiredToken")) {
            this.remove_ControlAcquired(this.__OnControlAcquiredToken)
            this.__OnControlAcquired.iface.Dispose()
        }

        if(this.HasProp("__OnButtonPressedToken")) {
            this.remove_ButtonPressed(this.__OnButtonPressedToken)
            this.__OnButtonPressed.iface.Dispose()
        }

        if(this.HasProp("__OnButtonHoldingToken")) {
            this.remove_ButtonHolding(this.__OnButtonHoldingToken)
            this.__OnButtonHolding.iface.Dispose()
        }

        if(this.HasProp("__OnButtonReleasedToken")) {
            this.remove_ButtonReleased(this.__OnButtonReleasedToken)
            this.__OnButtonReleased.iface.Dispose()
        }

        super.__Delete()
    }

    /**
     * 
     * @returns {RadialControllerMenu} 
     */
    get_Menu() {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.get_Menu()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RotationResolutionInDegrees() {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.get_RotationResolutionInDegrees()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_RotationResolutionInDegrees(value) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.put_RotationResolutionInDegrees(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_UseAutomaticHapticFeedback() {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.get_UseAutomaticHapticFeedback()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_UseAutomaticHapticFeedback(value) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.put_UseAutomaticHapticFeedback(value)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerScreenContactStartedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScreenContactStarted(handler) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.add_ScreenContactStarted(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ScreenContactStarted(cookie) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.remove_ScreenContactStarted(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScreenContactEnded(handler) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.add_ScreenContactEnded(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ScreenContactEnded(cookie) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.remove_ScreenContactEnded(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerScreenContactContinuedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ScreenContactContinued(handler) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.add_ScreenContactContinued(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ScreenContactContinued(cookie) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.remove_ScreenContactContinued(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ControlLost(handler) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.add_ControlLost(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ControlLost(cookie) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.remove_ControlLost(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerRotationChangedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_RotationChanged(handler) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.add_RotationChanged(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_RotationChanged(token) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.remove_RotationChanged(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerButtonClickedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ButtonClicked(handler) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.add_ButtonClicked(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ButtonClicked(token) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.remove_ButtonClicked(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerControlAcquiredEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ControlAcquired(handler) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.add_ControlAcquired(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_ControlAcquired(cookie) {
        if (!this.HasProp("__IRadialController")) {
            if ((queryResult := this.QueryInterface(IRadialController.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController := IRadialController(outPtr)
        }

        return this.__IRadialController.remove_ControlAcquired(cookie)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerButtonPressedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ButtonPressed(handler) {
        if (!this.HasProp("__IRadialController2")) {
            if ((queryResult := this.QueryInterface(IRadialController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController2 := IRadialController2(outPtr)
        }

        return this.__IRadialController2.add_ButtonPressed(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ButtonPressed(token) {
        if (!this.HasProp("__IRadialController2")) {
            if ((queryResult := this.QueryInterface(IRadialController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController2 := IRadialController2(outPtr)
        }

        return this.__IRadialController2.remove_ButtonPressed(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerButtonHoldingEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ButtonHolding(handler) {
        if (!this.HasProp("__IRadialController2")) {
            if ((queryResult := this.QueryInterface(IRadialController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController2 := IRadialController2(outPtr)
        }

        return this.__IRadialController2.add_ButtonHolding(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ButtonHolding(token) {
        if (!this.HasProp("__IRadialController2")) {
            if ((queryResult := this.QueryInterface(IRadialController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController2 := IRadialController2(outPtr)
        }

        return this.__IRadialController2.remove_ButtonHolding(token)
    }

    /**
     * 
     * @param {TypedEventHandler<RadialController, RadialControllerButtonReleasedEventArgs>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_ButtonReleased(handler) {
        if (!this.HasProp("__IRadialController2")) {
            if ((queryResult := this.QueryInterface(IRadialController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController2 := IRadialController2(outPtr)
        }

        return this.__IRadialController2.add_ButtonReleased(handler)
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_ButtonReleased(token) {
        if (!this.HasProp("__IRadialController2")) {
            if ((queryResult := this.QueryInterface(IRadialController2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialController2 := IRadialController2(outPtr)
        }

        return this.__IRadialController2.remove_ButtonReleased(token)
    }

;@endregion Instance Methods
}
