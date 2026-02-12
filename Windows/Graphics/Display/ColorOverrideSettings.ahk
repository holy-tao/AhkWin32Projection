#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IColorOverrideSettings.ahk
#Include .\IColorOverrideSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains the settings to use when overriding the screen color settings with [DisplayEnhancementOverride](displayenhancementoverride.md) on a device.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.coloroverridesettings
 * @namespace Windows.Graphics.Display
 * @version WindowsRuntime 1.4
 */
class ColorOverrideSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColorOverrideSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColorOverrideSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a set of color override settings, based on the specified override scenario.
     * @param {Integer} overrideScenario The override scenario to use.
     * @returns {ColorOverrideSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.coloroverridesettings.createfromdisplaycoloroverridescenario
     */
    static CreateFromDisplayColorOverrideScenario(overrideScenario) {
        if (!ColorOverrideSettings.HasProp("__IColorOverrideSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.Graphics.Display.ColorOverrideSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColorOverrideSettingsStatics.IID)
            ColorOverrideSettings.__IColorOverrideSettingsStatics := IColorOverrideSettingsStatics(factoryPtr)
        }

        return ColorOverrideSettings.__IColorOverrideSettingsStatics.CreateFromDisplayColorOverrideScenario(overrideScenario)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Retrieves the desired color override scenario.
     * @see https://learn.microsoft.com/uwp/api/windows.graphics.display.coloroverridesettings.desireddisplaycoloroverridescenario
     * @type {Integer} 
     */
    DesiredDisplayColorOverrideScenario {
        get => this.get_DesiredDisplayColorOverrideScenario()
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
    get_DesiredDisplayColorOverrideScenario() {
        if (!this.HasProp("__IColorOverrideSettings")) {
            if ((queryResult := this.QueryInterface(IColorOverrideSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColorOverrideSettings := IColorOverrideSettings(outPtr)
        }

        return this.__IColorOverrideSettings.get_DesiredDisplayColorOverrideScenario()
    }

;@endregion Instance Methods
}
