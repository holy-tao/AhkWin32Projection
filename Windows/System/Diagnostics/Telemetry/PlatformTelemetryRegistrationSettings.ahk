#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPlatformTelemetryRegistrationSettings.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Describes the settings for registering an app with the Connected User Experience and Telemetry component.
 * @remarks
 * > [!IMPORTANT]
 * > Only first-party applications should use this class.
 * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.telemetry.platformtelemetryregistrationsettings
 * @namespace Windows.System.Diagnostics.Telemetry
 * @version WindowsRuntime 1.4
 */
class PlatformTelemetryRegistrationSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPlatformTelemetryRegistrationSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPlatformTelemetryRegistrationSettings.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the storage size of the client.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.telemetry.platformtelemetryregistrationsettings.storagesize
     * @type {Integer} 
     */
    StorageSize {
        get => this.get_StorageSize()
        set => this.put_StorageSize(value)
    }

    /**
     * Gets the upload quota size of the client.
     * @see https://learn.microsoft.com/uwp/api/windows.system.diagnostics.telemetry.platformtelemetryregistrationsettings.uploadquotasize
     * @type {Integer} 
     */
    UploadQuotaSize {
        get => this.get_UploadQuotaSize()
        set => this.put_UploadQuotaSize(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Settings for registering a client.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.System.Diagnostics.Telemetry.PlatformTelemetryRegistrationSettings")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_StorageSize() {
        if (!this.HasProp("__IPlatformTelemetryRegistrationSettings")) {
            if ((queryResult := this.QueryInterface(IPlatformTelemetryRegistrationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformTelemetryRegistrationSettings := IPlatformTelemetryRegistrationSettings(outPtr)
        }

        return this.__IPlatformTelemetryRegistrationSettings.get_StorageSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_StorageSize(value) {
        if (!this.HasProp("__IPlatformTelemetryRegistrationSettings")) {
            if ((queryResult := this.QueryInterface(IPlatformTelemetryRegistrationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformTelemetryRegistrationSettings := IPlatformTelemetryRegistrationSettings(outPtr)
        }

        return this.__IPlatformTelemetryRegistrationSettings.put_StorageSize(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UploadQuotaSize() {
        if (!this.HasProp("__IPlatformTelemetryRegistrationSettings")) {
            if ((queryResult := this.QueryInterface(IPlatformTelemetryRegistrationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformTelemetryRegistrationSettings := IPlatformTelemetryRegistrationSettings(outPtr)
        }

        return this.__IPlatformTelemetryRegistrationSettings.get_UploadQuotaSize()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UploadQuotaSize(value) {
        if (!this.HasProp("__IPlatformTelemetryRegistrationSettings")) {
            if ((queryResult := this.QueryInterface(IPlatformTelemetryRegistrationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPlatformTelemetryRegistrationSettings := IPlatformTelemetryRegistrationSettings(outPtr)
        }

        return this.__IPlatformTelemetryRegistrationSettings.put_UploadQuotaSize(value)
    }

;@endregion Instance Methods
}
