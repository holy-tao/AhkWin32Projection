#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IRadialControllerScreenContact.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides contact details for the wheel device when placed on the digitizer surface, while a custom [RadialController](radialcontroller.md) tool is active.
  * 
  * In device-independent pixel (DIP), relative to the application window.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerscreencontact
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class RadialControllerScreenContact extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRadialControllerScreenContact

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRadialControllerScreenContact.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * The bounding rectangle of the wheel device when in contact with the digitizer surface, while a custom [RadialController](radialcontroller.md) tool is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerscreencontact.bounds
     * @type {RECT} 
     */
    Bounds {
        get => this.get_Bounds()
    }

    /**
     * The center point of the wheel device (relative to the application window) when in contact with the digitizer surface, and while a custom [RadialController](radialcontroller.md) tool is active.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.radialcontrollerscreencontact.position
     * @type {POINT} 
     */
    Position {
        get => this.get_Position()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {RECT} 
     */
    get_Bounds() {
        if (!this.HasProp("__IRadialControllerScreenContact")) {
            if ((queryResult := this.QueryInterface(IRadialControllerScreenContact.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerScreenContact := IRadialControllerScreenContact(outPtr)
        }

        return this.__IRadialControllerScreenContact.get_Bounds()
    }

    /**
     * 
     * @returns {POINT} 
     */
    get_Position() {
        if (!this.HasProp("__IRadialControllerScreenContact")) {
            if ((queryResult := this.QueryInterface(IRadialControllerScreenContact.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRadialControllerScreenContact := IRadialControllerScreenContact(outPtr)
        }

        return this.__IRadialControllerScreenContact.get_Position()
    }

;@endregion Instance Methods
}
