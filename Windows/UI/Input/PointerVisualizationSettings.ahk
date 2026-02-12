#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPointerVisualizationSettings.ahk
#Include .\IPointerVisualizationSettingsStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Provides access to the visual feedback settings for pointer input.
  * 
  * > [!IMPORTANT]
  * > Pointer visualizations are supported by the Desktop device family only.
 * @remarks
 * Call [GetForCurrentView](pointervisualizationsettings_getforcurrentview_1363600702.md) to get a PointerVisualizationSettings object associated with the active app. This object is used to set the visual feedback preferences for the app.
 * 
 * This
 * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointervisualizationsettings
 * @namespace Windows.UI.Input
 * @version WindowsRuntime 1.4
 */
class PointerVisualizationSettings extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPointerVisualizationSettings

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPointerVisualizationSettings.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Gets a [PointerVisualizationSettings](pointervisualizationsettings.md) object associated with the current app.
     * 
     * > [!IMPORTANT]
     * > Pointer visualizations are supported by the Desktop device family only.
     * @remarks
     * Each app has a [PointerVisualizationSettings](pointervisualizationsettings.md) object associated with it. When setting the visual feedback preferences, you use the GetForCurrentView method to get the [PointerVisualizationSettings](pointervisualizationsettings.md) object that is associated with the active app. After you have the appropriate [PointerVisualizationSettings](pointervisualizationsettings.md) object, you can set the visual feedback preferences.
     * @returns {PointerVisualizationSettings} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointervisualizationsettings.getforcurrentview
     */
    static GetForCurrentView() {
        if (!PointerVisualizationSettings.HasProp("__IPointerVisualizationSettingsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Input.PointerVisualizationSettings")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPointerVisualizationSettingsStatics.IID)
            PointerVisualizationSettings.__IPointerVisualizationSettingsStatics := IPointerVisualizationSettingsStatics(factoryPtr)
        }

        return PointerVisualizationSettings.__IPointerVisualizationSettingsStatics.GetForCurrentView()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets a value that indicates whether visual feedback is enabled when a pointer contact is detected.
     * 
     * > [!IMPORTANT]
     * > Pointer visualizations are supported by the Desktop device family only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointervisualizationsettings.iscontactfeedbackenabled
     * @type {Boolean} 
     */
    IsContactFeedbackEnabled {
        get => this.get_IsContactFeedbackEnabled()
        set => this.put_IsContactFeedbackEnabled(value)
    }

    /**
     * Gets or sets a value that indicates whether visual feedback is enabled for pen/stylus input when the barrel button is pressed.
     * 
     * > [!IMPORTANT]
     * > Pointer visualizations are supported by the Desktop device family only.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.input.pointervisualizationsettings.isbarrelbuttonfeedbackenabled
     * @type {Boolean} 
     */
    IsBarrelButtonFeedbackEnabled {
        get => this.get_IsBarrelButtonFeedbackEnabled()
        set => this.put_IsBarrelButtonFeedbackEnabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsContactFeedbackEnabled(value) {
        if (!this.HasProp("__IPointerVisualizationSettings")) {
            if ((queryResult := this.QueryInterface(IPointerVisualizationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerVisualizationSettings := IPointerVisualizationSettings(outPtr)
        }

        return this.__IPointerVisualizationSettings.put_IsContactFeedbackEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsContactFeedbackEnabled() {
        if (!this.HasProp("__IPointerVisualizationSettings")) {
            if ((queryResult := this.QueryInterface(IPointerVisualizationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerVisualizationSettings := IPointerVisualizationSettings(outPtr)
        }

        return this.__IPointerVisualizationSettings.get_IsContactFeedbackEnabled()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsBarrelButtonFeedbackEnabled(value) {
        if (!this.HasProp("__IPointerVisualizationSettings")) {
            if ((queryResult := this.QueryInterface(IPointerVisualizationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerVisualizationSettings := IPointerVisualizationSettings(outPtr)
        }

        return this.__IPointerVisualizationSettings.put_IsBarrelButtonFeedbackEnabled(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsBarrelButtonFeedbackEnabled() {
        if (!this.HasProp("__IPointerVisualizationSettings")) {
            if ((queryResult := this.QueryInterface(IPointerVisualizationSettings.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPointerVisualizationSettings := IPointerVisualizationSettings(outPtr)
        }

        return this.__IPointerVisualizationSettings.get_IsBarrelButtonFeedbackEnabled()
    }

;@endregion Instance Methods
}
