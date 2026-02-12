#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IManeuverWarning.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a potential issue along a route leg.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maneuverwarning
 * @namespace Windows.Services.Maps
 * @version WindowsRuntime 1.4
 */
class ManeuverWarning extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IManeuverWarning

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IManeuverWarning.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the type of potential issue along a route leg.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maneuverwarning.kind
     * @type {Integer} 
     */
    Kind {
        get => this.get_Kind()
    }

    /**
     * Gets the severity of a potential issue along a route leg.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.maneuverwarning.severity
     * @type {Integer} 
     */
    Severity {
        get => this.get_Severity()
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
    get_Kind() {
        if (!this.HasProp("__IManeuverWarning")) {
            if ((queryResult := this.QueryInterface(IManeuverWarning.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManeuverWarning := IManeuverWarning(outPtr)
        }

        return this.__IManeuverWarning.get_Kind()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Severity() {
        if (!this.HasProp("__IManeuverWarning")) {
            if ((queryResult := this.QueryInterface(IManeuverWarning.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IManeuverWarning := IManeuverWarning(outPtr)
        }

        return this.__IManeuverWarning.get_Severity()
    }

;@endregion Instance Methods
}
