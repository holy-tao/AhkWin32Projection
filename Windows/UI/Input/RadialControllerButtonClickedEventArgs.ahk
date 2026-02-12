#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerButtonClickedEventArgs.ahk
#Include .\IRadialControllerButtonClickedEventArgs2.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains event data for the [ButtonClicked](radialcontroller_buttonclicked.md) event (fired only while a custom [RadialController](radialcontroller.md) tool is active).
  * 
  * 
  * Your app does not receive this event when:
  * 
  * + The [RadialController](radialcontroller.md) menu is active
  * + A built-in tool is active
  * 
  * 
  * > [!NOTE]
  * > When a time threshold is crossed, click becomes a press and hold action. In this case, the integrated menu of contextual app commands associated with the wheel device is displayed, and subsequent rotate and click events are processed by the menu.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerbuttonclickedeventargs
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerButtonClickedEventArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerButtonClickedEventArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerButtonClickedEventArgs.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the location and bounding area of the wheel device on the digitizer surface, while a custom tool is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerbuttonclickedeventargs.contact
     * @type {RadialControllerScreenContact} 
     */
    Contact {
        get => this.get_Contact()
    }

    /**
     * Gets a single haptic input device that can be used to enumerate the haptic waveforms supported by the associated [RadialController](radialcontroller.md) and trigger a specific haptic response.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerbuttonclickedeventargs.simplehapticscontroller
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
        if (!this.HasProp("__IRadialControllerButtonClickedEventArgs")) {
            if ((queryResult := this.QueryInterface(IRadialControllerButtonClickedEventArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerButtonClickedEventArgs := IRadialControllerButtonClickedEventArgs(outPtr)
        }

        return this.__IRadialControllerButtonClickedEventArgs.get_Contact()
    }

    /**
     * 
     * @returns {SimpleHapticsController} 
     */
    get_SimpleHapticsController() {
        if (!this.HasProp("__IRadialControllerButtonClickedEventArgs2")) {
            if ((queryResult := this.QueryInterface(IRadialControllerButtonClickedEventArgs2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerButtonClickedEventArgs2 := IRadialControllerButtonClickedEventArgs2(outPtr)
        }

        return this.__IRadialControllerButtonClickedEventArgs2.get_SimpleHapticsController()
    }

;@endregion Instance Methods
}
