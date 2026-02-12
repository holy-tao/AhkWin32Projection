#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerButtonHoldingEventArgs.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [ButtonHolding](radialcontroller_buttonholding.md) event (fired only when [IsMenuSuppressed](radialcontrollerconfiguration_ismenusuppressed.md) is **true**).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerbuttonholdingeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerButtonHoldingEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerButtonHoldingEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerButtonHoldingEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the location and bounding area of the wheel device on the digitizer surface, while a custom tool is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerbuttonholdingeventargs.contact
     * @type {RadialControllerScreenContact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * Gets a reference to the [SimpleHapticsController](../windows.devices.haptics/simplehapticscontroller.md) object associated with the [RadialController](radialcontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerbuttonholdingeventargs.simplehapticscontroller
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
        if (!this.HasProp("__IRadialControllerButtonHoldingEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerButtonHoldingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerButtonHoldingEventArgs := IRadialControllerButtonHoldingEventArgs(outPtr)
        }

        return this.__IRadialControllerButtonHoldingEventArgs.get_Contact()
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        if (!this.HasProp("__IRadialControllerButtonHoldingEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerButtonHoldingEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerButtonHoldingEventArgs := IRadialControllerButtonHoldingEventArgs(outPtr)
        }

        return this.__IRadialControllerButtonHoldingEventArgs.get_SimpleHapticsController()
    }

;@endregion Instance Methods
}
