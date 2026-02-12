#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IIsolatedWindowsEnvironmentTelemetryParameters.ahk
#Include ..\..\..\Guid.ahk

/**
 * **Deprecated.** Runtime class which encapsulates the [correlationid](isolatedwindowsenvironmenttelemetryparameters_correlationid.md).
 * @remarks
 * > [!WARNING]
 * > This is a deprecated API.
 * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmenttelemetryparameters
 * @namespace Windows.Security.Isolation
 * @version WindowsRuntime 1.4
 */
class IsolatedWindowsEnvironmentTelemetryParameters extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIsolatedWindowsEnvironmentTelemetryParameters

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIsolatedWindowsEnvironmentTelemetryParameters.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * **Deprecated.** GUID used in Microsoft Telemetry to improve the quality of APIs.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
     * @see https://learn.microsoft.com/uwp/api/windows.security.isolation.isolatedwindowsenvironmenttelemetryparameters.correlationid
     * @type {Guid} 
     */
    CorrelationId {
        get => this.get_CorrelationId()
        set => this.put_CorrelationId(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * **Deprecated.** Parameters used in Microsoft Telemetry to improve the quality of the APIs.
     * @remarks
     * > [!WARNING]
     * > This is a deprecated API.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.Isolation.IsolatedWindowsEnvironmentTelemetryParameters")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Guid} 
     */
    get_CorrelationId() {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentTelemetryParameters")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentTelemetryParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentTelemetryParameters := IIsolatedWindowsEnvironmentTelemetryParameters(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentTelemetryParameters.get_CorrelationId()
    }

    /**
     * 
     * @param {Guid} value 
     * @returns {HRESULT} 
     */
    put_CorrelationId(value) {
        if (!this.HasProp("__IIsolatedWindowsEnvironmentTelemetryParameters")) {
            if ((queryResult := this.QueryInterface(IIsolatedWindowsEnvironmentTelemetryParameters.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IIsolatedWindowsEnvironmentTelemetryParameters := IIsolatedWindowsEnvironmentTelemetryParameters(outPtr)
        }

        return this.__IIsolatedWindowsEnvironmentTelemetryParameters.put_CorrelationId(value)
    }

;@endregion Instance Methods
}
