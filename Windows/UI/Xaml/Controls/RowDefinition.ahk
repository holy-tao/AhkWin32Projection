#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IRowDefinition.ahk
#Include .\IRowDefinitionStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines row-specific properties that apply to [Grid](grid.md) elements.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinition
 * @namespace Windows.UI.Xaml.Controls
 * @version WindowsRuntime 1.4
 */
class RowDefinition extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IRowDefinition

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IRowDefinition.IID

    /**
     * Identifies the [Height](rowdefinition_height.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinition.heightproperty
     * @type {DependencyProperty} 
     */
    static HeightProperty {
        get => RowDefinition.get_HeightProperty()
    }

    /**
     * Identifies the [MaxHeight](rowdefinition_maxheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinition.maxheightproperty
     * @type {DependencyProperty} 
     */
    static MaxHeightProperty {
        get => RowDefinition.get_MaxHeightProperty()
    }

    /**
     * Identifies the [MinHeight](rowdefinition_minheight.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinition.minheightproperty
     * @type {DependencyProperty} 
     */
    static MinHeightProperty {
        get => RowDefinition.get_MinHeightProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_HeightProperty() {
        if (!RowDefinition.HasProp("__IRowDefinitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RowDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRowDefinitionStatics.IID)
            RowDefinition.__IRowDefinitionStatics := IRowDefinitionStatics(factoryPtr)
        }

        return RowDefinition.__IRowDefinitionStatics.get_HeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MaxHeightProperty() {
        if (!RowDefinition.HasProp("__IRowDefinitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RowDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRowDefinitionStatics.IID)
            RowDefinition.__IRowDefinitionStatics := IRowDefinitionStatics(factoryPtr)
        }

        return RowDefinition.__IRowDefinitionStatics.get_MaxHeightProperty()
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_MinHeightProperty() {
        if (!RowDefinition.HasProp("__IRowDefinitionStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RowDefinition")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IRowDefinitionStatics.IID)
            RowDefinition.__IRowDefinitionStatics := IRowDefinitionStatics(factoryPtr)
        }

        return RowDefinition.__IRowDefinitionStatics.get_MinHeightProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the calculated height of a [RowDefinition](rowdefinition.md) element, or sets the [GridLength](../windows.ui.xaml/gridlength.md) value of a row that is defined by the [RowDefinition](rowdefinition.md).
     * @remarks
     * The default value of [Width](columndefinition_width.md) is a [GridLength](../windows.ui.xaml/gridlength.md) representing a "1\*" sizing. This structure value has a **Value** data value of 1.0, and a **GridUnitType** data value of **Star**. With this default, each new [RowDefinition](rowdefinition.md) you define for a [Grid](grid.md) will have "1\*" sizing, and each will be allotted an equal number of pixels for height of its content in layout handling. It's not uncommon to define [RowDefinition](rowdefinition.md) as an object element in XAML without any attributes set and to just use this default behavior. The same is true for [ColumnDefinition](columndefinition.md).
     * 
     * The value you set for Height can be constrained if you also set a value for [MinHeight](rowdefinition_minheight.md) or [MaxHeight](rowdefinition_maxheight.md). Each of these properties can take only pixel measurements, not **Star** sizing. If a [RowDefinition](rowdefinition.md) uses **Star** or **Auto** sizing but also has [MinHeight](rowdefinition_minheight.md) or [MaxHeight](rowdefinition_maxheight.md) constraints, the [MinHeight](rowdefinition_minheight.md) or [MaxHeight](rowdefinition_maxheight.md) must be honored by the [Grid](grid.md) layout behavior, even if that means giving or taking layout space from other **Star** sizing rows defined in the [Grid](grid.md) that don't have constraints.
     * 
     * It's more common to use **Star** sizing than absolute pixel values for a [Grid](grid.md) definition in a UWP app using C++, C#, or Visual Basic. **Star** sizing supports the dynamic layout concept, which helps your app look great on screens with different sizes, pixel densities and orientations. For more info, see [Define layouts with XAML](/windows/uwp/layout/layouts-with-xaml).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinition.height
     * @type {GridLength} 
     */
    Height {
        get => this.get_Height()
        set => this.put_Height(value)
    }

    /**
     * Gets or sets a value that represents the maximum height of a [RowDefinition](rowdefinition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinition.maxheight
     * @type {Float} 
     */
    MaxHeight {
        get => this.get_MaxHeight()
        set => this.put_MaxHeight(value)
    }

    /**
     * Gets or sets a value that represents the minimum allowed height of a [RowDefinition](rowdefinition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinition.minheight
     * @type {Float} 
     */
    MinHeight {
        get => this.get_MinHeight()
        set => this.put_MinHeight(value)
    }

    /**
     * Gets a value that represents the calculated height of the [RowDefinition](rowdefinition.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.controls.rowdefinition.actualheight
     * @type {Float} 
     */
    ActualHeight {
        get => this.get_ActualHeight()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [RowDefinition](rowdefinition.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Controls.RowDefinition")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {GridLength} 
     */
    get_Height() {
        if (!this.HasProp("__IRowDefinition")) {
            if ((queryResult := this.QueryInterface(IRowDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRowDefinition := IRowDefinition(outPtr)
        }

        return this.__IRowDefinition.get_Height()
    }

    /**
     * 
     * @param {GridLength} value 
     * @returns {HRESULT} 
     */
    put_Height(value) {
        if (!this.HasProp("__IRowDefinition")) {
            if ((queryResult := this.QueryInterface(IRowDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRowDefinition := IRowDefinition(outPtr)
        }

        return this.__IRowDefinition.put_Height(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MaxHeight() {
        if (!this.HasProp("__IRowDefinition")) {
            if ((queryResult := this.QueryInterface(IRowDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRowDefinition := IRowDefinition(outPtr)
        }

        return this.__IRowDefinition.get_MaxHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MaxHeight(value) {
        if (!this.HasProp("__IRowDefinition")) {
            if ((queryResult := this.QueryInterface(IRowDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRowDefinition := IRowDefinition(outPtr)
        }

        return this.__IRowDefinition.put_MaxHeight(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_MinHeight() {
        if (!this.HasProp("__IRowDefinition")) {
            if ((queryResult := this.QueryInterface(IRowDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRowDefinition := IRowDefinition(outPtr)
        }

        return this.__IRowDefinition.get_MinHeight()
    }

    /**
     * 
     * @param {Float} value 
     * @returns {HRESULT} 
     */
    put_MinHeight(value) {
        if (!this.HasProp("__IRowDefinition")) {
            if ((queryResult := this.QueryInterface(IRowDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRowDefinition := IRowDefinition(outPtr)
        }

        return this.__IRowDefinition.put_MinHeight(value)
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ActualHeight() {
        if (!this.HasProp("__IRowDefinition")) {
            if ((queryResult := this.QueryInterface(IRowDefinition.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IRowDefinition := IRowDefinition(outPtr)
        }

        return this.__IRowDefinition.get_ActualHeight()
    }

;@endregion Instance Methods
}
