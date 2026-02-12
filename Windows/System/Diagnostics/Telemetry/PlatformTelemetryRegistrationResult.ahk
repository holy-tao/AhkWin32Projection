#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlatformTelemetryRegistrationResult.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * The result of registering a client with or without registration settings.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.telemetry.platformtelemetryregistrationresult
 * @namespace Windows.System.Diagnostics.Telemetry
 * @version WindowsRuntime 1.4
 */
class PlatformTelemetryRegistrationResult extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlatformTelemetryRegistrationResult

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlatformTelemetryRegistrationResult.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the status of the client registration result.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.telemetry.platformtelemetryregistrationresult.status
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
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
    get_Status() {
        if (!this.HasProp("__IPlatformTelemetryRegistrationResult")) {
            if ((queryResult := this.QueryInterface(IPlatformTelemetryRegistrationResult.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformTelemetryRegistrationResult := IPlatformTelemetryRegistrationResult(outPtr)
        }

        return this.__IPlatformTelemetryRegistrationResult.get_Status()
    }

;@endregion Instance Methods
}
