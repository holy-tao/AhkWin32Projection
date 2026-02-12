#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IJumpListItemBackgroundConverter.ahk
#Include ..\..\Data\IValueConverter.ahk
#Include .\IJumpListItemBackgroundConverterStatics.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides the appropriate background Brush for elements in the item template of a jump list to bind to. The Brush reflects the current theme and accent color, and it's also used to shade empty-group jump list items. By default, the Brush matches built-in apps, but you can override that to suit your design needs using the [Enabled](jumplistitembackgroundconverter_enabled.md) and [Disabled](jumplistitembackgroundconverter_disabled.md) properties.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.jumplistitembackgroundconverter
 * @namespace Windows.UI.Xaml.Controls.Primitives
 * @version WindowsRuntime 1.4
 */
class JumpListItemBackgroundConverter extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IJumpListItemBackgroundConverter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IJumpListItemBackgroundConverter.IID

    /**
     * Identifies the [Enabled](jumplistitembackgroundconverter_enabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.jumplistitembackgroundconverter.enabledproperty
     * @type {DependencyProperty} 
     */
    static EnabledProperty {
        get => JumpListItemBackgroundConverter.get_EnabledProperty()
    }

    /**
     * Identifies the [Disabled](jumplistitembackgroundconverter_disabled.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.jumplistitembackgroundconverter.disabledproperty
     * @type {DependencyProperty} 
     */
    static DisabledProperty {
        get => JumpListItemBackgroundConverter.get_DisabledProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_EnabledProperty() {
        if (!JumpListItemBackgroundConverter.HasProp("__IJumpListItemBackgroundConverterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.JumpListItemBackgroundConverter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJumpListItemBackgroundConverterStatics.IID)
            JumpListItemBackgroundConverter.__IJumpListItemBackgroundConverterStatics := IJumpListItemBackgroundConverterStatics(factoryPtr)
        }

        return JumpListItemBackgroundConverter.__IJumpListItemBackgroundConverterStatics.get_EnabledProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_DisabledProperty() {
        if (!JumpListItemBackgroundConverter.HasProp("__IJumpListItemBackgroundConverterStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.JumpListItemBackgroundConverter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IJumpListItemBackgroundConverterStatics.IID)
            JumpListItemBackgroundConverter.__IJumpListItemBackgroundConverterStatics := IJumpListItemBackgroundConverterStatics(factoryPtr)
        }

        return JumpListItemBackgroundConverter.__IJumpListItemBackgroundConverterStatics.get_DisabledProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the brush to be used for the background when the group is not empty and the jump list item is enabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.jumplistitembackgroundconverter.enabled
     * @type {Brush} 
     */
    Enabled {
        get => this.get_Enabled()
        set => this.put_Enabled(value)
    }

    /**
     * Gets or sets the brush to be used for the background when the group is empty and the jump list item is disabled.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.jumplistitembackgroundconverter.disabled
     * @type {Brush} 
     */
    Disabled {
        get => this.get_Disabled()
        set => this.put_Disabled(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [JumpListItemBackgroundConverter](jumplistitembackgroundconverter.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.Primitives.JumpListItemBackgroundConverter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Enabled() {
        if (!this.HasProp("__IJumpListItemBackgroundConverter")) {
            if ((queryResult := this.QueryInterface(IJumpListItemBackgroundConverter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItemBackgroundConverter := IJumpListItemBackgroundConverter(outPtr)
        }

        return this.__IJumpListItemBackgroundConverter.get_Enabled()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Enabled(value) {
        if (!this.HasProp("__IJumpListItemBackgroundConverter")) {
            if ((queryResult := this.QueryInterface(IJumpListItemBackgroundConverter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItemBackgroundConverter := IJumpListItemBackgroundConverter(outPtr)
        }

        return this.__IJumpListItemBackgroundConverter.put_Enabled(value)
    }

    /**
     * 
     * @returns {Brush} 
     */
    get_Disabled() {
        if (!this.HasProp("__IJumpListItemBackgroundConverter")) {
            if ((queryResult := this.QueryInterface(IJumpListItemBackgroundConverter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItemBackgroundConverter := IJumpListItemBackgroundConverter(outPtr)
        }

        return this.__IJumpListItemBackgroundConverter.get_Disabled()
    }

    /**
     * 
     * @param {Brush} value 
     * @returns {HRESULT} 
     */
    put_Disabled(value) {
        if (!this.HasProp("__IJumpListItemBackgroundConverter")) {
            if ((queryResult := this.QueryInterface(IJumpListItemBackgroundConverter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IJumpListItemBackgroundConverter := IJumpListItemBackgroundConverter(outPtr)
        }

        return this.__IJumpListItemBackgroundConverter.put_Disabled(value)
    }

    /**
     * Returns the enabled brush if the item is not empty, otherwise returns the disabled brush.
     * @param {IInspectable} value The source data being passed to the target.
     * @param {TypeName} targetType The [Type](../windows.ui.xaml.interop/typename.md) of data expected by the target dependency property.
     * @param {IInspectable} parameter An optional parameter to be used in the converter logic.
     * @param {HSTRING} language_ The culture of the conversion.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.jumplistitembackgroundconverter.convert
     */
    Convert(value, targetType, parameter, language_) {
        if (!this.HasProp("__IValueConverter")) {
            if ((queryResult := this.QueryInterface(IValueConverter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueConverter := IValueConverter(outPtr)
        }

        return this.__IValueConverter.Convert(value, targetType, parameter, language_)
    }

    /**
     * Modifies the target data before passing it to the source object.
     * @param {IInspectable} value The target data being passed to the source.
     * @param {TypeName} targetType The [Type](../windows.ui.xaml.interop/typename.md) of data expected by the source object.
     * @param {IInspectable} parameter An optional parameter to be used in the converter logic.
     * @param {HSTRING} language_ The culture of the conversion.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.primitives.jumplistitembackgroundconverter.convertback
     */
    ConvertBack(value, targetType, parameter, language_) {
        if (!this.HasProp("__IValueConverter")) {
            if ((queryResult := this.QueryInterface(IValueConverter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IValueConverter := IValueConverter(outPtr)
        }

        return this.__IValueConverter.ConvertBack(value, targetType, parameter, language_)
    }

;@endregion Instance Methods
}
