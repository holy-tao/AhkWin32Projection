#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlatformTelemetryClientStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides functionality to register a client with the Connected User Experience and Telemetry component.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.telemetry.platformtelemetryclient
 * @namespace Windows.System.Diagnostics.Telemetry
 * @version WindowsRuntime 1.4
 */
class PlatformTelemetryClient extends IInspectable {
;@region Static Methods
    /**
     * Registers a client with the Connected User Experience and Telemetry component.
     * @param {HSTRING} id Unique string value that identifies the client.
     * @returns {PlatformTelemetryRegistrationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.telemetry.platformtelemetryclient.register
     */
    static Register(id) {
        if (!PlatformTelemetryClient.HasProp("__IPlatformTelemetryClientStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.Telemetry.PlatformTelemetryClient")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformTelemetryClientStatics.IID)
            PlatformTelemetryClient.__IPlatformTelemetryClientStatics := IPlatformTelemetryClientStatics(factoryPtr)
        }

        return PlatformTelemetryClient.__IPlatformTelemetryClientStatics.Register(id)
    }

    /**
     * Registers a client with the Connected User Experience and Telemetry component.
     * @param {HSTRING} id Unique string value that identifies the client.
     * @param {PlatformTelemetryRegistrationSettings} settings 
     * @returns {PlatformTelemetryRegistrationResult} 
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.telemetry.platformtelemetryclient.register
     */
    static RegisterWithSettings(id, settings) {
        if (!PlatformTelemetryClient.HasProp("__IPlatformTelemetryClientStatics")) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.Telemetry.PlatformTelemetryClient")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPlatformTelemetryClientStatics.IID)
            PlatformTelemetryClient.__IPlatformTelemetryClientStatics := IPlatformTelemetryClientStatics(factoryPtr)
        }

        return PlatformTelemetryClient.__IPlatformTelemetryClientStatics.RegisterWithSettings(id, settings)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
