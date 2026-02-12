#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ICompositionDebugSettings.ahk
#Include .\ICompositionDebugSettingsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Hosts diagnostic and debugging features such as heatmaps.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.diagnostics.compositiondebugsettings
 * @namespace Windows.UI.Composition.Diagnostics
 * @version WindowsRuntime 1.4
 */
class CompositionDebugSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ICompositionDebugSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ICompositionDebugSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Attempts to get an instance of CompositionDebugSettings for the specified compositor.
     * @remarks
     * If [developer mode](/windows/apps/get-started/enable-your-device-for-development) is not enabled, a call to `TryGetSettings` returns `null`.
     * @param {Compositor} compositor_ The compositor to get debug settings for.
     * @returns {CompositionDebugSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.diagnostics.compositiondebugsettings.trygetsettings
     */
    static TryGetSettings(compositor_) {
        if (!CompositionDebugSettings.HasProp("__ICompositionDebugSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Composition.Diagnostics.CompositionDebugSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ICompositionDebugSettingsStatics.IID)
            CompositionDebugSettings.__ICompositionDebugSettingsStatics := ICompositionDebugSettingsStatics(factoryPtr)
        }

        return CompositionDebugSettings.__ICompositionDebugSettingsStatics.TryGetSettings(compositor_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the heatmaps for this debug settings instance.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.composition.diagnostics.compositiondebugsettings.heatmaps
     * @type {CompositionDebugHeatMaps} 
     */
    HeatMaps {
        get => this.get_HeatMaps()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {CompositionDebugHeatMaps} 
     */
    get_HeatMaps() {
        if (!this.HasProp("__ICompositionDebugSettings")) {
            if ((queryResult := this.QueryInterface(ICompositionDebugSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ICompositionDebugSettings := ICompositionDebugSettings(outPtr)
        }

        return this.__ICompositionDebugSettings.get_HeatMaps()
    }

;@endregion Instance Methods
}
