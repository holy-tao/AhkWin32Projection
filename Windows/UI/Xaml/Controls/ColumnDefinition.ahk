#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IColumnDefinition.ahk
#Include .\IColumnDefinitionStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines column-specific properties that apply to [Grid](grid.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.columndefinition
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class ColumnDefinition extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IColumnDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IColumnDefinition.IID

    /**
     * Identifies the [Width](columndefinition_width.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.columndefinition.widthproperty
     * @type {DependencyProperty} 
     */
    static WidthProperty {
        get => ColumnDefinition.get_WidthProperty()
    }

    /**
     * Identifies the [MaxWidth](columndefinition_maxwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.columndefinition.maxwidthproperty
     * @type {DependencyProperty} 
     */
    static MaxWidthProperty {
        get => ColumnDefinition.get_MaxWidthProperty()
    }

    /**
     * Identifies the [MinWidth](columndefinition_minwidth.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.columndefinition.minwidthproperty
     * @type {DependencyProperty} 
     */
    static MinWidthProperty {
        get => ColumnDefinition.get_MinWidthProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_WidthProperty() {
        if (!ColumnDefinition.HasProp("__IColumnDefinitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColumnDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColumnDefinitionStatics.IID)
            ColumnDefinition.__IColumnDefinitionStatics := IColumnDefinitionStatics(factoryPtr)
        }

        return ColumnDefinition.__IColumnDefinitionStatics.get_WidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxWidthProperty() {
        if (!ColumnDefinition.HasProp("__IColumnDefinitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColumnDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColumnDefinitionStatics.IID)
            ColumnDefinition.__IColumnDefinitionStatics := IColumnDefinitionStatics(factoryPtr)
        }

        return ColumnDefinition.__IColumnDefinitionStatics.get_MaxWidthProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinWidthProperty() {
        if (!ColumnDefinition.HasProp("__IColumnDefinitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColumnDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IColumnDefinitionStatics.IID)
            ColumnDefinition.__IColumnDefinitionStatics := IColumnDefinitionStatics(factoryPtr)
        }

        return ColumnDefinition.__IColumnDefinitionStatics.get_MinWidthProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the calculated width of a [ColumnDefinition](columndefinition.md) element, or sets the [GridLength](../windows.ui.xaml/gridlength.md) value of a column that is defined by the [ColumnDefinition](columndefinition.md).
     * @remarks
     * The default value of Width is a [GridLength](../windows.ui.xaml/gridlength.md) representing a "1\*" sizing. This structure value has a **Value** data value of 1.0, and a **GridUnitType** data value of **Star**. With this default, each new [ColumnDefinition](columndefinition.md) you define for a [Grid](grid.md) will have "1\*" sizing, and each will be allotted an equal number of pixels for width of its content in layout handling. It's not uncommon to define [ColumnDefinition](columndefinition.md) as an object element in XAML without any attributes set and to just use this default behavior. The same is true for [RowDefinition](rowdefinition.md).
     * 
     * The value you set for Width can be constrained if you also set a value for [MinWidth](columndefinition_minwidth.md) or [MaxWidth](columndefinition_maxwidth.md). Each of these properties can take only pixel measurements, not **Star** sizing. If a [ColumnDefinition](columndefinition.md) uses **Star** or **Auto** sizing but also has [MinWidth](columndefinition_minwidth.md) or [MaxWidth](columndefinition_maxwidth.md) constraints, the [MinWidth](columndefinition_minwidth.md) or [MaxWidth](columndefinition_maxwidth.md) must be honored by the [Grid](grid.md) layout behavior, even if that means giving or taking layout space from other **Star** sizing columns defined in the [Grid](grid.md) that don't have constraints.
     * 
     * It's more common to use **Star** sizing than absolute pixel values for a [Grid](grid.md) definition in a UWP app using C++, C#, or Visual Basic. **Star** sizing supports the dynamic layout concept, which helps your app look great on screens with different sizes, pixel densities and orientations. For more info, see [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.columndefinition.width
     * @type {GridLength} 
     */
    Width {
        get => this.get_Width()
        set => this.put_Width(value)
    }

    /**
     * Gets or sets a value that represents the maximum width of a [ColumnDefinition](columndefinition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.columndefinition.maxwidth
     * @type {Float} 
     */
    MaxWidth {
        get => this.get_MaxWidth()
        set => this.put_MaxWidth(value)
    }

    /**
     * Gets or sets a value that represents the minimum width of a [ColumnDefinition](columndefinition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.columndefinition.minwidth
     * @type {Float} 
     */
    MinWidth {
        get => this.get_MinWidth()
        set => this.put_MinWidth(value)
    }

    /**
     * Gets a value that represents the actual calculated width of a [ColumnDefinition](columndefinition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.columndefinition.actualwidth
     * @type {Float} 
     */
    ActualWidth {
        get => this.get_ActualWidth()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [ColumnDefinition](columndefinition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.ColumnDefinition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_Width() {
        if (!this.HasProp("__IColumnDefinition")) {
            if ((queryResult := this.QueryInterface(IColumnDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColumnDefinition := IColumnDefinition(outPtr)
        }

        return this.__IColumnDefinition.get_Width()
    }

    /**
     * 
     * @param {GridLength} value 
     * @returns {HRESULT} 
     */
    put_Width(value) {
        if (!this.HasProp("__IColumnDefinition")) {
            if ((queryResult := this.QueryInterface(IColumnDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColumnDefinition := IColumnDefinition(outPtr)
        }

        return this.__IColumnDefinition.put_Width(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxWidth() {
        if (!this.HasProp("__IColumnDefinition")) {
            if ((queryResult := this.QueryInterface(IColumnDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColumnDefinition := IColumnDefinition(outPtr)
        }

        return this.__IColumnDefinition.get_MaxWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxWidth(value) {
        if (!this.HasProp("__IColumnDefinition")) {
            if ((queryResult := this.QueryInterface(IColumnDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColumnDefinition := IColumnDefinition(outPtr)
        }

        return this.__IColumnDefinition.put_MaxWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinWidth() {
        if (!this.HasProp("__IColumnDefinition")) {
            if ((queryResult := this.QueryInterface(IColumnDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColumnDefinition := IColumnDefinition(outPtr)
        }

        return this.__IColumnDefinition.get_MinWidth()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinWidth(value) {
        if (!this.HasProp("__IColumnDefinition")) {
            if ((queryResult := this.QueryInterface(IColumnDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColumnDefinition := IColumnDefinition(outPtr)
        }

        return this.__IColumnDefinition.put_MinWidth(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ActualWidth() {
        if (!this.HasProp("__IColumnDefinition")) {
            if ((queryResult := this.QueryInterface(IColumnDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IColumnDefinition := IColumnDefinition(outPtr)
        }

        return this.__IColumnDefinition.get_ActualWidth()
    }

;@endregion Instance Methods
}
