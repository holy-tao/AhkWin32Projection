#Requires AutoHotkey v2.0 64-bit

#Include ..\Win32\System\WinRT\Apis.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDateTimeSettingsStatics.ahk
#Include ..\..\Guid.ahk

/**
 * Sets the system date and time.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.system.datetimesettings
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class DateTimeSettings extends IInspectable {
;@region Static Methods
    /**
     * Set the system date and time.
     * @remarks
     * Coordinated universal time does not observe daylight saving time.
     * @param {DateTime} utcDateTime The date and time value (in coordinated universal time (UTC)) to set the system clock to.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.datetimesettings.setsystemdatetime
     */
    static SetSystemDateTime(utcDateTime) {
        if (!DateTimeSettings.HasProp("__IDateTimeSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.DateTimeSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDateTimeSettingsStatics.IID)
            DateTimeSettings.__IDateTimeSettingsStatics := IDateTimeSettingsStatics(factoryPtr)
        }

        return DateTimeSettings.__IDateTimeSettingsStatics.SetSystemDateTime(utcDateTime)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
