#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IClockIdentifiersStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Contains the clock identifiers for the supported clocks, as static properties.
 * @remarks
 * The identifiers returned by properties on this class are suitable for use anywhere a clock identifier is required.
 * @see https://learn.microsoft.com/uwp/api/windows.globalization.clockidentifiers
 * @namespace Windows.Globalization
 * @version WindowsRuntime 1.4
 */
class ClockIdentifiers extends IInspectable {
;@region Static Properties
    /**
     * Gets the identifier for a 12-hour clock.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.clockidentifiers.twelvehour
     * @type {HSTRING} 
     */
    static TwelveHour {
        get => ClockIdentifiers.get_TwelveHour()
    }

    /**
     * Gets the identifier for a 24-hour clock.
     * @see https://learn.microsoft.com/uwp/api/windows.globalization.clockidentifiers.twentyfourhour
     * @type {HSTRING} 
     */
    static TwentyFourHour {
        get => ClockIdentifiers.get_TwentyFourHour()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TwelveHour() {
        if (!ClockIdentifiers.HasProp("__IClockIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.ClockIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClockIdentifiersStatics.IID)
            ClockIdentifiers.__IClockIdentifiersStatics := IClockIdentifiersStatics(factoryPtr)
        }

        return ClockIdentifiers.__IClockIdentifiersStatics.get_TwelveHour()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    static get_TwentyFourHour() {
        if (!ClockIdentifiers.HasProp("__IClockIdentifiersStatics")) {
            activatableClassId := HSTRING.Create("Windows.Globalization.ClockIdentifiers")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IClockIdentifiersStatics.IID)
            ClockIdentifiers.__IClockIdentifiersStatics := IClockIdentifiersStatics(factoryPtr)
        }

        return ClockIdentifiers.__IClockIdentifiersStatics.get_TwentyFourHour()
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
