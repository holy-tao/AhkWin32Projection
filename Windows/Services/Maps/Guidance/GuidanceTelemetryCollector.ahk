#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IGuidanceTelemetryCollector.ahk
#Include .\IGuidanceTelemetryCollectorStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Collects location data to report traffic conditions.
  * 
  * > [!NOTE]
  * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancetelemetrycollector
 * @namespace Windows.Services.Maps.Guidance
 * @version WindowsRuntime 1.4
 */
class GuidanceTelemetryCollector extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IGuidanceTelemetryCollector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IGuidanceTelemetryCollector.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [GuidanceTelemetryCollector](guidancetelemetrycollector.md) object for the current telemetry collector.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @returns {GuidanceTelemetryCollector} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancetelemetrycollector.getcurrent
     */
    static GetCurrent() {
        if (!GuidanceTelemetryCollector.HasProp("__IGuidanceTelemetryCollectorStatics")) {
            activatableClassId := HSTRING.Create("Windows.Services.Maps.Guidance.GuidanceTelemetryCollector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IGuidanceTelemetryCollectorStatics.IID)
            GuidanceTelemetryCollector.__IGuidanceTelemetryCollectorStatics := IGuidanceTelemetryCollectorStatics(factoryPtr)
        }

        return GuidanceTelemetryCollector.__IGuidanceTelemetryCollectorStatics.GetCurrent()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates if location data is collected for traffic reporting.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancetelemetrycollector.enabled
     * @type {Boolean} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Gets or sets the speed at which data collection begins, in meters per second.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancetelemetrycollector.speedtrigger
     * @type {Float} 
     */
    SpeedTrigger {
        get => this.get_SpeedTrigger()
        set => this.put_SpeedTrigger(value)
    }

    /**
     * Gets or sets the frequency in which traffic is reported, in seconds.
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancetelemetrycollector.uploadfrequency
     * @type {Integer} 
     */
    UploadFrequency {
        get => this.get_UploadFrequency()
        set => this.put_UploadFrequency(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Enabled() {
        if (!this.HasProp("__IGuidanceTelemetryCollector")) {
            if ((queryResult := this.QueryInterface(IGuidanceTelemetryCollector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceTelemetryCollector := IGuidanceTelemetryCollector(outPtr)
        }

        return this.__IGuidanceTelemetryCollector.get_Enabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__IGuidanceTelemetryCollector")) {
            if ((queryResult := this.QueryInterface(IGuidanceTelemetryCollector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceTelemetryCollector := IGuidanceTelemetryCollector(outPtr)
        }

        return this.__IGuidanceTelemetryCollector.put_Enabled(value)
    }

    /**
     * Clears location data that's been stored locally by the [GuidanceTelemetryCollector](guidancetelemetrycollector.md).
     * 
     * > [!NOTE]
     * > This API is not available to all Windows apps. Unless your developer account is specially provisioned by Microsoft, calls to this API will fail at runtime. For more information about the [Windows.Services.Maps.Guidance](windows_services_maps_guidance.md) namespace, please work with your Microsoft Account Team representative.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.services.maps.guidance.guidancetelemetrycollector.clearlocaldata
     */
    ClearLocalData() {
        if (!this.HasProp("__IGuidanceTelemetryCollector")) {
            if ((queryResult := this.QueryInterface(IGuidanceTelemetryCollector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceTelemetryCollector := IGuidanceTelemetryCollector(outPtr)
        }

        return this.__IGuidanceTelemetryCollector.ClearLocalData()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_SpeedTrigger() {
        if (!this.HasProp("__IGuidanceTelemetryCollector")) {
            if ((queryResult := this.QueryInterface(IGuidanceTelemetryCollector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceTelemetryCollector := IGuidanceTelemetryCollector(outPtr)
        }

        return this.__IGuidanceTelemetryCollector.get_SpeedTrigger()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_SpeedTrigger(value) {
        if (!this.HasProp("__IGuidanceTelemetryCollector")) {
            if ((queryResult := this.QueryInterface(IGuidanceTelemetryCollector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceTelemetryCollector := IGuidanceTelemetryCollector(outPtr)
        }

        return this.__IGuidanceTelemetryCollector.put_SpeedTrigger(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UploadFrequency() {
        if (!this.HasProp("__IGuidanceTelemetryCollector")) {
            if ((queryResult := this.QueryInterface(IGuidanceTelemetryCollector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceTelemetryCollector := IGuidanceTelemetryCollector(outPtr)
        }

        return this.__IGuidanceTelemetryCollector.get_UploadFrequency()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UploadFrequency(value) {
        if (!this.HasProp("__IGuidanceTelemetryCollector")) {
            if ((queryResult := this.QueryInterface(IGuidanceTelemetryCollector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IGuidanceTelemetryCollector := IGuidanceTelemetryCollector(outPtr)
        }

        return this.__IGuidanceTelemetryCollector.put_UploadFrequency(value)
    }

;@endregion Instance Methods
}
