#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerScreenContactEndedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [ScreenContactEnded](radialcontroller_screencontactended.md) event (fired only while a custom [RadialController](radialcontroller.md) tool is active).
  * 
  * 
  * Your app does not receive this event when:
  * 
  * + The [RadialController](radialcontroller.md) menu is active
  * + A built-in tool is active
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerscreencontactendedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerScreenContactEndedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerScreenContactEndedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerScreenContactEndedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets whether the wheel device is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerscreencontactendedeventargs.isbuttonpressed
     * @type {Boolean} 
     */
    IsButtonPressed {
        get => this.get_IsButtonPressed()
    }

    /**
     * Gets a reference to the [SimpleHapticsController](../windows.devices.haptics/simplehapticscontroller.md) object associated with the [RadialController](radialcontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerscreencontactendedeventargs.simplehapticscontroller
     * @type {SimpleHapticsController} 
     */
    SimpleHapticsController {
        get => this.get_SimpleHapticsController()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsButtonPressed() {
        if (!this.HasProp("__IRadialControllerScreenContactEndedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerScreenContactEndedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerScreenContactEndedEventArgs := IRadialControllerScreenContactEndedEventArgs(outPtr)
        }

        return this.__IRadialControllerScreenContactEndedEventArgs.get_IsButtonPressed()
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        if (!this.HasProp("__IRadialControllerScreenContactEndedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerScreenContactEndedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerScreenContactEndedEventArgs := IRadialControllerScreenContactEndedEventArgs(outPtr)
        }

        return this.__IRadialControllerScreenContactEndedEventArgs.get_SimpleHapticsController()
    }

;@endregion Instance Methods
}
