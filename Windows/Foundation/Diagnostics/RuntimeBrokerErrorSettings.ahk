#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IErrorReportingSettings.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents diagnostic error reporting settings.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.runtimebrokererrorsettings
 * @namespace Windows.Foundation.Diagnostics
 * @version WindowsRuntime 1.4
 */
class RuntimeBrokerErrorSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IErrorReportingSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IErrorReportingSettings.IID

;@endregion Static Properties

;@region Instance Methods
    /**
     * Creates and initializes a new instance of the [RuntimeBrokerErrorSettings](runtimebrokererrorsettings.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Foundation.Diagnostics.RuntimeBrokerErrorSettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * Sets the type of error reporting for the error object.
     * @param {Integer} value One of the enumeration values.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.runtimebrokererrorsettings.seterroroptions
     */
    SetErrorOptions(value) {
        if (!this.HasProp("__IErrorReportingSettings")) {
            if ((queryResult := this.QueryInterface(IErrorReportingSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IErrorReportingSettings := IErrorReportingSettings(outPtr)
        }

        return this.__IErrorReportingSettings.SetErrorOptions(value)
    }

    /**
     * Gets the type of error reporting for the error object.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.diagnostics.runtimebrokererrorsettings.geterroroptions
     */
    GetErrorOptions() {
        if (!this.HasProp("__IErrorReportingSettings")) {
            if ((queryResult := this.QueryInterface(IErrorReportingSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IErrorReportingSettings := IErrorReportingSettings(outPtr)
        }

        return this.__IErrorReportingSettings.GetErrorOptions()
    }

;@endregion Instance Methods
}
