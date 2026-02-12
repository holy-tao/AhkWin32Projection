#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerRotationChangedEventArgs.ahk
#Include .\IRadialControllerRotationChangedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [RotationChanged](radialcontroller_rotationchanged.md) event (fired only while a custom [RadialController](radialcontroller.md) tool is active).
  * 
  * 
  * Your app does not receive this event when:
  * 
  * + The [RadialController](radialcontroller.md) menu is active
  * + A built-in tool is active
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerrotationchangedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerRotationChangedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerRotationChangedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerRotationChangedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The rotational change of the wheel device, while a custom [RadialController](radialcontroller.md) tool is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerrotationchangedeventargs.rotationdeltaindegrees
     * @type {Float} 
     */
    RotationDeltaInDegrees {
        get => this.get_RotationDeltaInDegrees()
    }

    /**
     * Gets the location and bounding area of the wheel device on the digitizer surface, while a custom [RadialController](radialcontroller.md) tool is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerrotationchangedeventargs.contact
     * @type {RadialControllerScreenContact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * Gets whether the wheel device is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerrotationchangedeventargs.isbuttonpressed
     * @type {Boolean} 
     */
    IsButtonPressed {
        get => this.get_IsButtonPressed()
    }

    /**
     * Gets a reference to the [SimpleHapticsController](../windows.devices.haptics/simplehapticscontroller.md) object associated with the [RadialController](radialcontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerrotationchangedeventargs.simplehapticscontroller
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
     * @returns {Float} 
     */
    get_RotationDeltaInDegrees() {
        if (!this.HasProp("__IRadialControllerRotationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerRotationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerRotationChangedEventArgs := IRadialControllerRotationChangedEventArgs(outPtr)
        }

        return this.__IRadialControllerRotationChangedEventArgs.get_RotationDeltaInDegrees()
    }

    /**
     * 
     * @returns {RadialControllerScreenContact} 
     */
    get_Contact() {
        if (!this.HasProp("__IRadialControllerRotationChangedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerRotationChangedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerRotationChangedEventArgs := IRadialControllerRotationChangedEventArgs(outPtr)
        }

        return this.__IRadialControllerRotationChangedEventArgs.get_Contact()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsButtonPressed() {
        if (!this.HasProp("__IRadialControllerRotationChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerRotationChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerRotationChangedEventArgs2 := IRadialControllerRotationChangedEventArgs2(outPtr)
        }

        return this.__IRadialControllerRotationChangedEventArgs2.get_IsButtonPressed()
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        if (!this.HasProp("__IRadialControllerRotationChangedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerRotationChangedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerRotationChangedEventArgs2 := IRadialControllerRotationChangedEventArgs2(outPtr)
        }

        return this.__IRadialControllerRotationChangedEventArgs2.get_SimpleHapticsController()
    }

;@endregion Instance Methods
}
