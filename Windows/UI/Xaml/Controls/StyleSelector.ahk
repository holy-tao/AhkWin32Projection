#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IStyleSelector.ahk
#Include .\IStyleSelectorOverrides.ahk
#Include .\IStyleSelectorFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Enables custom item style selection logic as a function of the content data and its specific item container.
 * @remarks
 * The base StyleSelector class is not used as an object element in XAML. However, it is a common scenario to derive a custom StyleSelector, map a xmlns prefix for the custom class and its namespace/assembly, and then refer to an instance of the custom class as defined in a [Resources](../windows.ui.xaml/frameworkelement_resources.md) block in XAML. This makes it possible to refer to the custom template selector class by **x:Key**, and use that reference to set the value of properties such as [ItemContainerStyleSelector](itemscontrol_itemcontainerstyleselector.md) in XAML templates and particular visual states.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.styleselector
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class StyleSelector extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStyleSelector

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStyleSelector.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {StyleSelector} 
     */
    static CreateInstance() {
        if (!StyleSelector.HasProp("__IStyleSelectorFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.StyleSelector")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStyleSelectorFactory.IID)
            StyleSelector.__IStyleSelectorFactory := IStyleSelectorFactory(factoryPtr)
        }

        return StyleSelector.__IStyleSelectorFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Returns a specific [Style](../windows.ui.xaml/style.md) based on custom logic.
     * @remarks
     * To provide a specific style in a derived class, override the [SelectStyleCore](styleselector_selectstylecore_1376419096.md) method.
     * @param {IInspectable} item The content.
     * @param {DependencyObject} container The element to which the style is applied.
     * @returns {Style} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.styleselector.selectstyle
     */
    SelectStyle(item, container) {
        if (!this.HasProp("__IStyleSelector")) {
            if ((queryResult := this.QueryInterface(IStyleSelector.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStyleSelector := IStyleSelector(outPtr)
        }

        return this.__IStyleSelector.SelectStyle(item, container)
    }

    /**
     * When implemented by a derived class, returns a specific [Style](../windows.ui.xaml/style.md) based on custom logic.
     * @param {IInspectable} item The content.
     * @param {DependencyObject} container The element to which the style is applied.
     * @returns {Style} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.styleselector.selectstylecore
     */
    SelectStyleCore(item, container) {
        if (!this.HasProp("__IStyleSelectorOverrides")) {
            if ((queryResult := this.QueryInterface(IStyleSelectorOverrides.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStyleSelectorOverrides := IStyleSelectorOverrides(outPtr)
        }

        return this.__IStyleSelectorOverrides.SelectStyleCore(item, container)
    }

;@endregion Instance Methods
}
