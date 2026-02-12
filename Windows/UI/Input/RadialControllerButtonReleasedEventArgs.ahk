#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerButtonReleasedEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [ButtonReleased](radialcontroller_buttonreleased.md) event.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerbuttonreleasedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerButtonReleasedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerButtonReleasedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerButtonReleasedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the location and bounding area of the wheel device on the digitizer surface, while a custom tool is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerbuttonreleasedeventargs.contact
     * @type {RadialControllerScreenContact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * Gets a reference to the [SimpleHapticsController](../windows.devices.haptics/simplehapticscontroller.md) object associated with the [RadialController](radialcontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerbuttonreleasedeventargs.simplehapticscontroller
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
     * @returns {RadialControllerScreenContact} 
     */
    get_Contact() {
        if (!this.HasProp("__IRadialControllerButtonReleasedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerButtonReleasedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerButtonReleasedEventArgs := IRadialControllerButtonReleasedEventArgs(outPtr)
        }

        return this.__IRadialControllerButtonReleasedEventArgs.get_Contact()
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        if (!this.HasProp("__IRadialControllerButtonReleasedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerButtonReleasedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerButtonReleasedEventArgs := IRadialControllerButtonReleasedEventArgs(outPtr)
        }

        return this.__IRadialControllerButtonReleasedEventArgs.get_SimpleHapticsController()
    }

;@endregion Instance Methods
}
