#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerControlAcquiredEventArgs.ahk
#Include .\IRadialControllerControlAcquiredEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [ControlAcquired](radialcontroller_controlacquired.md) event when a custom tool is selected from the [RadialController](radialcontroller.md) menu, or when an app associated with the [RadialController](radialcontroller.md) object is brought to the foreground (fired only while a custom [RadialController](radialcontroller.md) tool is active).
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollercontrolacquiredeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerControlAcquiredEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerControlAcquiredEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerControlAcquiredEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the location and bounding area of the wheel device on the digitizer surface, while a custom tool is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollercontrolacquiredeventargs.contact
     * @type {RadialControllerScreenContact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * Gets whether the wheel device is pressed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollercontrolacquiredeventargs.isbuttonpressed
     * @type {Boolean} 
     */
    IsButtonPressed {
        get => this.get_IsButtonPressed()
    }

    /**
     * Gets a reference to the [SimpleHapticsController](../windows.devices.haptics/simplehapticscontroller.md) object associated with the [RadialController](radialcontroller.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollercontrolacquiredeventargs.simplehapticscontroller
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
        if (!this.HasProp("__IRadialControllerControlAcquiredEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerControlAcquiredEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerControlAcquiredEventArgs := IRadialControllerControlAcquiredEventArgs(outPtr)
        }

        return this.__IRadialControllerControlAcquiredEventArgs.get_Contact()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsButtonPressed() {
        if (!this.HasProp("__IRadialControllerControlAcquiredEventArgs2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerControlAcquiredEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerControlAcquiredEventArgs2 := IRadialControllerControlAcquiredEventArgs2(outPtr)
        }

        return this.__IRadialControllerControlAcquiredEventArgs2.get_IsButtonPressed()
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        if (!this.HasProp("__IRadialControllerControlAcquiredEventArgs2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerControlAcquiredEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerControlAcquiredEventArgs2 := IRadialControllerControlAcquiredEventArgs2(outPtr)
        }

        return this.__IRadialControllerControlAcquiredEventArgs2.get_SimpleHapticsController()
    }

;@endregion Instance Methods
}
