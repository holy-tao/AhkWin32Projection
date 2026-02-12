#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IViewModePreferences.ahk
#Include .\IViewModePreferencesStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the preferred settings to be applied to a view when it's changed to a new view mode.
 * @remarks
 * To get an instance of **ViewModePreferences**, call the [CreateDefault](viewmodepreferences_createdefault_1698970327.md) method.
 * 
 * These view mode preferences are requested values only. The system might override these values when your app is changed to the new view mode. Custom sizes that you specify are not guaranteed to be honored by Windows, so you should not write code that relies on never getting into a size that is smaller than the preferred minimum size or larger than the preferred maximum size. No error is returned when a preferred size is ignored.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.viewmodepreferences
 * @namespace Windows.UI.ViewManagement
 * @version WindowsRuntime 1.4
 */
class ViewModePreferences extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IViewModePreferences

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IViewModePreferences.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Creates a new instance of **ViewModePreferences** with default property values set for the specified view mode.
     * @param {Integer} mode_ The view mode to set default preferences for.
     * @returns {ViewModePreferences} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.viewmodepreferences.createdefault
     */
    static CreateDefault(mode_) {
        if (!ViewModePreferences.HasProp("__IViewModePreferencesStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.ViewManagement.ViewModePreferences")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IViewModePreferencesStatics.IID)
            ViewModePreferences.__IViewModePreferencesStatics := IViewModePreferencesStatics(factoryPtr)
        }

        return ViewModePreferences.__IViewModePreferencesStatics.CreateDefault(mode_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the preferred size of the app window.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.viewmodepreferences.viewsizepreference
     * @type {Integer} 
     */
    ViewSizePreference {
        get => this.get_ViewSizePreference()
        set => this.put_ViewSizePreference(value)
    }

    /**
     * Gets or sets a custom preferred size for the app window.
     * @remarks
     * If you set this property, you must also set the [ViewSizePreference](viewmodepreferences_viewsizepreference.md) property value to **ViewSizePreference.Custom**. Otherwise, the custom size value set here is ignored.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.viewmanagement.viewmodepreferences.customsize
     * @type {SIZE} 
     */
    CustomSize {
        get => this.get_CustomSize()
        set => this.put_CustomSize(value)
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
    get_ViewSizePreference() {
        if (!this.HasProp("__IViewModePreferences")) {
            if ((queryResult := this.QueryInterface(IViewModePreferences.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewModePreferences := IViewModePreferences(outPtr)
        }

        return this.__IViewModePreferences.get_ViewSizePreference()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ViewSizePreference(value) {
        if (!this.HasProp("__IViewModePreferences")) {
            if ((queryResult := this.QueryInterface(IViewModePreferences.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewModePreferences := IViewModePreferences(outPtr)
        }

        return this.__IViewModePreferences.put_ViewSizePreference(value)
    }

    /**
     * 
     * @returns {SIZE} 
     */
    get_CustomSize() {
        if (!this.HasProp("__IViewModePreferences")) {
            if ((queryResult := this.QueryInterface(IViewModePreferences.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewModePreferences := IViewModePreferences(outPtr)
        }

        return this.__IViewModePreferences.get_CustomSize()
    }

    /**
     * 
     * @param {SIZE} value 
     * @returns {HRESULT} 
     */
    put_CustomSize(value) {
        if (!this.HasProp("__IViewModePreferences")) {
            if ((queryResult := this.QueryInterface(IViewModePreferences.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IViewModePreferences := IViewModePreferences(outPtr)
        }

        return this.__IViewModePreferences.put_CustomSize(value)
    }

;@endregion Instance Methods
}
