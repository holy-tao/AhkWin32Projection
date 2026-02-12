#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBrightnessOverrideSettings.ahk
#Include .\IBrightnessOverrideSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the settings to use when overriding the screen brightness with [DisplayEnhancementOverride](displayenhancementoverride.md) on a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverridesettings
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class BrightnessOverrideSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBrightnessOverrideSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBrightnessOverrideSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a [BrightnessOverrideSettings](brightnessoverridesettings.md) object with the specified brightness level.
     * @param {Float} level The brightness level to use to create the override settings. The brightness level is a value ranging from [0.0, 1.0], where 0.0 corresponds to 0%
     * brightness and 1.0 corresponds to 100% brightness.
     * @returns {BrightnessOverrideSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverridesettings.createfromlevel
     */
    static CreateFromLevel(level) {
        if (!BrightnessOverrideSettings.HasProp("__IBrightnessOverrideSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.BrightnessOverrideSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrightnessOverrideSettingsStatics.IID)
            BrightnessOverrideSettings.__IBrightnessOverrideSettingsStatics := IBrightnessOverrideSettingsStatics(factoryPtr)
        }

        return BrightnessOverrideSettings.__IBrightnessOverrideSettingsStatics.CreateFromLevel(level)
    }

    /**
     * Creates a [BrightnessOverrideSettings](brightnessoverridesettings.md) object with the specified brightness in nits.
     * @remarks
     * The supported nit values can be queried with [GetSupportedNitRanges](displayenhancementoverridecapabilities_getsupportednitranges_2119123994.md). If the view does not support the given nit value, then the nearest supported nit value will be set. If no
     * nit values are supported, this will be set to 0.
     * @param {Float} nits The brightness in nits to use to create the override settings.
     * @returns {BrightnessOverrideSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverridesettings.createfromnits
     */
    static CreateFromNits(nits) {
        if (!BrightnessOverrideSettings.HasProp("__IBrightnessOverrideSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.BrightnessOverrideSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrightnessOverrideSettingsStatics.IID)
            BrightnessOverrideSettings.__IBrightnessOverrideSettingsStatics := IBrightnessOverrideSettingsStatics(factoryPtr)
        }

        return BrightnessOverrideSettings.__IBrightnessOverrideSettingsStatics.CreateFromNits(nits)
    }

    /**
     * Creates a [BrightnessOverrideSettings](brightnessoverridesettings.md) object with a brightness level corresponding to the specified brightness scenario.
     * @param {Integer} overrideScenario The override scenario on which to base the settings.
     * @returns {BrightnessOverrideSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverridesettings.createfromdisplaybrightnessoverridescenario
     */
    static CreateFromDisplayBrightnessOverrideScenario(overrideScenario) {
        if (!BrightnessOverrideSettings.HasProp("__IBrightnessOverrideSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.BrightnessOverrideSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBrightnessOverrideSettingsStatics.IID)
            BrightnessOverrideSettings.__IBrightnessOverrideSettingsStatics := IBrightnessOverrideSettingsStatics(factoryPtr)
        }

        return BrightnessOverrideSettings.__IBrightnessOverrideSettingsStatics.CreateFromDisplayBrightnessOverrideScenario(overrideScenario)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the desired brightness level.
     * @remarks
     * If the [BrightnessOverrideSettings](brightnessoverridesettings.md) object was created using [CreateFromNits](brightnessoverridesettings_createfromnits_1019006596.md), this value will map to the perceivable brightness level equal to the specified nits.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverridesettings.desiredlevel
     * @type {Float} 
     */
    DesiredLevel {
        get => this.get_DesiredLevel()
    }

    /**
     * Gets the desired Nits level.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.brightnessoverridesettings.desirednits
     * @type {Float} 
     */
    DesiredNits {
        get => this.get_DesiredNits()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredLevel() {
        if (!this.HasProp("__IBrightnessOverrideSettings")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverrideSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverrideSettings := IBrightnessOverrideSettings(outPtr)
        }

        return this.__IBrightnessOverrideSettings.get_DesiredLevel()
    }

    /**
     * 
     * @returns {Float} 
     */
    get_DesiredNits() {
        if (!this.HasProp("__IBrightnessOverrideSettings")) {
            if ((queryResult := this.QueryInterface(IBrightnessOverrideSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBrightnessOverrideSettings := IBrightnessOverrideSettings(outPtr)
        }

        return this.__IBrightnessOverrideSettings.get_DesiredNits()
    }

;@endregion Instance Methods
}
