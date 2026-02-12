#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ISpatialAudioFormatConfiguration.ahk
#Include .\ISpatialAudioFormatConfigurationStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides a way to configure Spatial Audio Formats.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatconfiguration
 * @namespace Windows.Media.Audio
 * @version WindowsRuntime 1.4
 */
class SpatialAudioFormatConfiguration extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISpatialAudioFormatConfiguration

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISpatialAudioFormatConfiguration.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets an instance of SpatialAudioFormatConfiguration.
     * @returns {SpatialAudioFormatConfiguration} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatconfiguration.getdefault
     */
    static GetDefault() {
        if (!SpatialAudioFormatConfiguration.HasProp("__ISpatialAudioFormatConfigurationStatics")) {
            activatableClassId := HSTRING.Create("Windows.Media.Audio.SpatialAudioFormatConfiguration")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISpatialAudioFormatConfigurationStatics.IID)
            SpatialAudioFormatConfiguration.__ISpatialAudioFormatConfigurationStatics := ISpatialAudioFormatConfigurationStatics(factoryPtr)
        }

        return SpatialAudioFormatConfiguration.__ISpatialAudioFormatConfigurationStatics.GetDefault()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Specifies which policy to use when picking a spatial audio format in mixed reality.
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatconfiguration.mixedrealityexclusivemodepolicy
     * @type {Integer} 
     */
    MixedRealityExclusiveModePolicy {
        get => this.get_MixedRealityExclusiveModePolicy()
        set => this.put_MixedRealityExclusiveModePolicy(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Allows a spatial audio format companion app to report that the license has changed for a specific format.
     * @param {HSTRING} subtype String of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the spatial audio format that's license has changed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatconfiguration.reportlicensechangedasync
     */
    ReportLicenseChangedAsync(subtype) {
        if (!this.HasProp("__ISpatialAudioFormatConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioFormatConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioFormatConfiguration := ISpatialAudioFormatConfiguration(outPtr)
        }

        return this.__ISpatialAudioFormatConfiguration.ReportLicenseChangedAsync(subtype)
    }

    /**
     * Allows a spatial audio format companion app to report that the configuration has changed for a specific format.
     * @param {HSTRING} subtype String of the [GUID](/windows/win32/api/guiddef/ns-guiddef-guid) for the spatial audio format that's configuration has changed.
     * @returns {IAsyncAction} 
     * @see https://learn.microsoft.com/uwp/api/windows.media.audio.spatialaudioformatconfiguration.reportconfigurationchangedasync
     */
    ReportConfigurationChangedAsync(subtype) {
        if (!this.HasProp("__ISpatialAudioFormatConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioFormatConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioFormatConfiguration := ISpatialAudioFormatConfiguration(outPtr)
        }

        return this.__ISpatialAudioFormatConfiguration.ReportConfigurationChangedAsync(subtype)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MixedRealityExclusiveModePolicy() {
        if (!this.HasProp("__ISpatialAudioFormatConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioFormatConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioFormatConfiguration := ISpatialAudioFormatConfiguration(outPtr)
        }

        return this.__ISpatialAudioFormatConfiguration.get_MixedRealityExclusiveModePolicy()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MixedRealityExclusiveModePolicy(value) {
        if (!this.HasProp("__ISpatialAudioFormatConfiguration")) {
            if ((queryResult := this.QueryInterface(ISpatialAudioFormatConfiguration.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISpatialAudioFormatConfiguration := ISpatialAudioFormatConfiguration(outPtr)
        }

        return this.__ISpatialAudioFormatConfiguration.put_MixedRealityExclusiveModePolicy(value)
    }

;@endregion Instance Methods
}
