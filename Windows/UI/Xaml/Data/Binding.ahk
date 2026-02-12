#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\BindingBase.ahk
#Include .\IBinding.ahk
#Include .\IBinding2.ahk
#Include .\IBindingFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Defines a binding that connects the properties of binding targets and data sources.
 * @remarks
 * The [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension) enables you to specify a Binding value as a single attribute string in XAML, including setting Binding properties such as [Path](binding_path.md) and [Source](binding_source.md). For more info about data binding concepts, see [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth).
 * 
 * The Binding class might be considered the code-behind exposure of the [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension). If a binding is already applied to a target (which happens when the XAML is loaded), you can't set the read-write properties of a Binding object to change how a binding behaves at run-time. Any XAML-defined binding should be considered immutable. But you can create a new Binding object, set its properties, and establish a new binding on a specific UI element target using [FrameworkElement.SetBinding](../windows.ui.xaml/frameworkelement_setbinding_28713777.md). For more info, see [Creating bindings in code](/windows/uwp/data-binding/data-binding-in-depth).
 * 
 * A Binding object connects a dependency property of a [FrameworkElement](../windows.ui.xaml/frameworkelement.md) directly to a data object so that updates to the data object are automatically propagated to the property that uses data binding. The Binding class defines the properties of a binding. Each binding must have a target element, target property, and data source, although some values are provided by default if you don't specify them.
 * 
 * To bind to a property or a sub-property on a data object, set the [Path](binding_path.md) property of the Binding object. For more info on how to set [Path](binding_path.md) in code or in XAML, see [Property-path syntax](/windows/uwp/xaml-platform/property-path-syntax) or [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension).
 * 
 * You can apply an instance of a Binding class to multiple targets. However, you cannot modify the property values of a Binding object after you attach it to a target element.
 * 
 * > [!NOTE]
 * > Calling the [FrameworkElement.SetBinding](../windows.ui.xaml/frameworkelement_setbinding_28713777.md) method and passing in a new Binding object won't necessarily remove an existing binding. Instead, you should use the [DependencyObject.ClearValue](../windows.ui.xaml/dependencyobject_clearvalue_1095854009.md) method.
 * 
 * For more info on XAML attribute usage for properties that can take a Binding, or that can otherwise be set to a data-bound value, see [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension).
 * 
 * The property that is the target of a data binding must be a dependency property. For more info, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class Binding extends BindingBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBinding

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBinding.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {Binding} 
     */
    static CreateInstance() {
        if (!Binding.HasProp("__IBindingFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.Binding")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBindingFactory.IID)
            Binding.__IBindingFactory := IBindingFactory(factoryPtr)
        }

        return Binding.__IBindingFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the path to the binding source property.
     * @remarks
     * The path can be a direct property of the source object, or sub-properties of that object that you traverse to using the property path syntax. For Microsoft .NET data sources, paths can also use an indexer syntax to reference specific items in a collection. For details on the property path format, see [Property-path syntax](/windows/uwp/xaml-platform/property-path-syntax).
     * 
     * To set the data source to be the [Source](binding_source.md) object, the path should be defined with an empty string ("").
     * 
     * When using the [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension), the Path value can be set using the argument immediately following the `{Binding` part of the extension usage, you don't need to explicitly include `Path=`. For example, `{Binding Albums}` sets the Path value of that binding to be a [PropertyPath](../windows.ui.xaml/propertypath.md) constructed from the string "Albums" (no other [Binding](binding.md) properties are set).
     * 
     * Most usages of Path involve setting its value. For scenarios where you are getting the value to examine the properties of an existing binding, the [PropertyPath.Path](../windows.ui.xaml/propertypath_path.md) value contains the string that represents the path.
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.path
     * @type {PropertyPath} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * Gets or sets a value that indicates the direction of the data flow in the binding.
     * @remarks
     * For **OneWay** and **TwoWay** bindings, dynamic changes to the source don't automatically propagate to the target without providing some support from the source. You must implement the **INotifyPropertyChanged** interface on the source object so that the source can report changes through events that the binding engine listens for. For C# or Microsoft Visual Basic, implement [System.ComponentModel.INotifyPropertyChanged](/dotnet/api/system.componentmodel.inotifypropertychanged?view=dotnet-uwp-10.0&preserve-view=true). For Visual C++ component extensions (C++/CX), implement [Windows::UI::Xaml::Data::INotifyPropertyChanged](inotifypropertychanged.md).
     * 
     * For **TwoWay** bindings, changes to the target automatically propagate to the source, except if the binding target is the [TextBox.Text](../windows.ui.xaml.controls/textbox_text.md) property. In that case, the update happens only when the [TextBox](../windows.ui.xaml.controls/textbox.md) loses focus. Also, it's possible to set [UpdateSourceTrigger](binding_updatesourcetrigger.md) on **TwoWay** bindings to **Explicit**, in which case you control the updates to the source explicitly by calling [UpdateSource](bindingexpression_updatesource_190615267.md).
     * 
     * For **OneTime** and **OneWay** bindings, calls to [DependencyObject.SetValue](../windows.ui.xaml/dependencyobject_setvalue_52578133.md) automatically change the target value and delete the binding.
     * 
     * 
     * <!--For two way, what? Updates source, or deletes binding and therefore source no longer connected?-->
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.mode
     * @type {Integer} 
     */
    Mode {
        get => this.get_Mode()
        set => this.put_Mode(value)
    }

    /**
     * Gets or sets the data source for the binding.
     * @remarks
     * The Source property is optional on a [Binding](binding.md) object. If the Source property is set on a [Binding](binding.md) object, the data source applies only to the target properties that use that [Binding](binding.md) object.
     * 
     * To create a data source that is inherited by all the child elements in the tree, instead set the [DataContext](../windows.ui.xaml/frameworkelement_datacontext.md) property on the parent element. Then the parent element and all its children look to the [DataContext](../windows.ui.xaml/frameworkelement_datacontext.md) as the source of their bindings. If the Source is set for a child element, it will override the [DataContext](../windows.ui.xaml/frameworkelement_datacontext.md) inheritance in that instance.
     * 
     * The target can bind directly to the Source object if the path is empty or to a property of the Source object as defined by the path. The path is set either in XAML with the binding syntax or when the [Binding](binding.md) object is created.
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.source
     * @type {IInspectable} 
     */
    Source {
        get => this.get_Source()
        set => this.put_Source(value)
    }

    /**
     * Gets or sets the binding source by specifying its location relative to the position of the binding target. This is most often used in bindings within XAML control templates.
     * @remarks
     * [Source](binding_source.md), RelativeSource, and [ElementName](binding_elementname.md) are mutually exclusive in a binding. If you have set one of these attributes, then setting either of the other two in a binding (through XAML or through code) will cause an exception. Setting RelativeSource in XAML always requires the use of the [{RelativeSource} markup extension](/windows/uwp/xaml-platform/relativesource-markup-extension). This is also true if you are creating the entire binding as a [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension), in which case the [{RelativeSource} markup extension](/windows/uwp/xaml-platform/relativesource-markup-extension) is nested within the RelativeSource component of the expression.
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.relativesource
     * @type {RelativeSource} 
     */
    RelativeSource {
        get => this.get_RelativeSource()
        set => this.put_RelativeSource(value)
    }

    /**
     * Gets or sets the name of the element to use as the binding source for the [Binding](binding.md).
     * @remarks
     * When you set this property, the specified value must refer to an element in one of the following locations: 
     * + The current XAML namescope.
     * + The XAML namescope of the templated parent if the binding target is in a data template or control template.
     *  Because of this restriction, you cannot use the ElementName property to bind to elements that are not created by using XAML. To bind to elements created programmatically, use the [Source](binding_source.md) property instead. [Source](binding_source.md), [RelativeSource](binding_relativesource.md), and ElementName are mutually exclusive in a binding. If you have set one of these attributes, then setting either of the other two in a binding (through XAML or through code) will cause an exception.
     * 
     * Bindings that use an ElementName value almost always include a simple [Path](binding_path.md) that names a property that exists on the object being referenced. It's common that the source property from the named element and the destination property on the target have the same name and use the same value type, this is a scenario you see fairly often in control template definitions that composite control parts but surface properties from the parts. If the source and destination properties use different types, specify a [Converter](binding_converter.md) value that can resolve the type difference and return an appropriate value for the destination.
     * 
     * For more info about XAML namescopes and how they influence bindings and other programmatic access to objects created from XAML, see [XAML namescopes](/windows/uwp/xaml-platform/xaml-namescopes).
     * 
     * The value of ElementName can technically be any string, but the values of [Name](../windows.ui.xaml/frameworkelement_name.md) and [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) are enforced to be valid in the *XamlName grammar*, so you're typically bound by that grammar for an ElementName value too. For more info on what's valid for an element name, see the "XamlName grammar" section in the [x:Name attribute](/windows/uwp/xaml-platform/x-name-attribute) reference.
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.elementname
     * @type {HSTRING} 
     */
    ElementName {
        get => this.get_ElementName()
        set => this.put_ElementName(value)
    }

    /**
     * Gets or sets the converter object that is called by the binding engine to modify the data as it is passed between the source and target, or vice versa.
     * @remarks
     * Create a converter by implementing the [IValueConverter](ivalueconverter.md) interface and implementing the [Convert](ivalueconverter_convert_101701969.md) method. That method should return an object that is of the same type as the dependency property that the binding targets, or at least a type that can be implicitly coerced or converted to the target type.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.converter
     * @type {IValueConverter} 
     */
    Converter {
        get => this.get_Converter()
        set => this.put_Converter(value)
    }

    /**
     * Gets or sets a parameter that can be used in the [Converter](binding_converter.md) logic.
     * @remarks
     * Passing parameters to a converter is a relatively advanced and uncommon scenarios. Most converters used for data binding simply type-convert a source object to a desired target type based solely on the characteristics of the source object, and knowing what the intended destination type is for a particular binding scenario.
     * 
     * If a value for ConverterParameter is specified, this value is used for the *parameter* value when invoking the converter logic. Specifically, this provides the value of the *parameter* parameter of the [Convert](ivalueconverter_convert_101701969.md) or [ConvertBack](ivalueconverter_convertback_2106225504.md) methods of the specific converter that is requested with the [Converter](binding_converter.md) property.
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.converterparameter
     * @type {IInspectable} 
     */
    ConverterParameter {
        get => this.get_ConverterParameter()
        set => this.put_ConverterParameter(value)
    }

    /**
     * Gets or sets a value that names the language to pass to any converter specified by the [Converter](binding_converter.md) property.
     * @remarks
     * If a value for ConverterLanguage is specified, this value is used for the *language* value when invoking the converter logic. Specifically, this provides the value of the *language* parameter of the [Convert](ivalueconverter_convert_101701969.md) or [ConvertBack](ivalueconverter_convertback_2106225504.md) methods of the specific converter that is requested with the [Converter](binding_converter.md) property. By default and in the absence of ConverterLanguage being set, the value passed for *language* is an empty string. 
     * <!--TBW flesh out this scenario better.-->
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.converterlanguage
     * @type {HSTRING} 
     */
    ConverterLanguage {
        get => this.get_ConverterLanguage()
        set => this.put_ConverterLanguage(value)
    }

    /**
     * Gets or sets the value to use when the binding is unable to return a value.
     * @remarks
     * Usually you specify FallbackValue for bindings that display strings in UI. For this case the FallbackValue is also a string. You might want to use a resource so that it's easier to localize this string.
     * 
     * If you do specify a literal string for FallbackValue, you must use alternate quotes for the FallbackValue value within the [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension) usage if your string contains spaces, because the [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension) usage for an attribute is already within quotes. For example, `<object property="{Binding FallbackValue='A literal string'}" />`.
     * 
     * If used within a [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension) usage, the value for FallbackValue can use any implicit string conversions that are already available to XAML, such as treating 0 as a string for a string binding, or converting enum values. For example, `<object property="{Binding Path=Visibility, FallbackValue=Collapsed}" />` is valid because the parser can evaluate the string "Collapsed" and return [Visibility.Collapsed](../windows.ui.xaml/visibility.md) as the fallback for a [Visibility](../windows.ui.xaml/uielement_visibility.md) value.
     * 
     * [TargetNullValue](binding_targetnullvalue.md) is a similar property with similar scenarios. The difference is that a binding uses FallbackValue for cases where the [Path](binding_path.md) doesn't evaluate on the data source at all, or if attempting to set it on the source with a two-way binding throws an exception that's caught by the data binding engine. FallbackValue is also used if the source value is the dependency property sentinel value [DependencyProperty.UnsetValue](../windows.ui.xaml/dependencyproperty_unsetvalue.md). A binding uses [TargetNullValue](binding_targetnullvalue.md) if the [Path](binding_path.md) and [Source](binding_source.md) do evaluate, but the value found there is **null**.
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.fallbackvalue
     * @type {IInspectable} 
     */
    FallbackValue {
        get => this.get_FallbackValue()
        set => this.put_FallbackValue(value)
    }

    /**
     * Gets or sets the value that is used in the target when the value of the source is **null**.
     * @remarks
     * TargetNullValue might be used for bindings that bind a collection and the source data uses **null** for missing info only in some of the items. It might also be used for general cases where the data is coming from a database that uses **null** values as source info to signify something, such as a record that needs more info from the user and isn't complete in the source.
     * 
     * There are two recommended patterns for using TargetNullValue behavior in a [Binding](binding.md):
     * + The binding source provides a separate value that is accessed by a different path, which acts as the singleton value that can substitute for any **null** value coming from a specific data item in the source. For example:
     * 
     * ```xaml
     * <Button Content="{Binding Path=NextItem, Mode=OneWay, TargetNullValue={Binding Path=NullValue}}"/>
     * ```
     * 
     *  Here, `NullValue` is the path to the substitute value, and is referenced by another [Binding](binding.md).
     * + Use resources to provide a value that's specific to your app in cases where the data source provided **null** and has no suitable property in another path to use as the substitution value. For example:
     * 
     * ```xaml
     * <Button Content="{Binding Path=NextItem, Mode=OneWay, TargetNullValue={StaticResource AppStringForNullInAStringABinding}}"/>
     * ```
     * 
     *  Here, `AppStringForNullInAStringABinding` is a resource string something like "(value not available)" that lets the user know that there should be data there in most of the data but this particular item didn't have that data from its source. Use resources so that the value can be localized.
     * 
     * 
     * [FallbackValue](binding_fallbackvalue.md) is a similar property with similar scenarios. The difference is that a binding uses [FallbackValue](binding_fallbackvalue.md) for cases where the [Path](binding_path.md) and [Source](binding_source.md) doesn't evaluate on the data source at all, or if attempting to set it on the source with a two-way binding throws an exception. It uses TargetNullValue if the [Path](binding_path.md) does evaluate, but the value found there is **null**.
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.targetnullvalue
     * @type {IInspectable} 
     */
    TargetNullValue {
        get => this.get_TargetNullValue()
        set => this.put_TargetNullValue(value)
    }

    /**
     * Gets or sets a value that determines the timing of binding source updates for two-way bindings.
     * @remarks
     * The default behavior for most dependency properties is `PropertyChanged`. However, the default behavior for the [TextBox.Text](../windows.ui.xaml.controls/textbox_text.md) property is `LostFocus`. For a [Binding](binding.md) to `TextBox.Text`, you can change the `UpdateSourceTrigger` like this:
     * 
     * ```xaml
     * <TextBox Text="{x:Bind MyProperty, Mode=TwoWay, UpdateSourceTrigger=PropertyChanged}" />
     * ```
     * 
     * However, it won’t have any effect on a `TextBox` in the control template of another control, such as [NumberBox](/windows/winui/api/microsoft.ui.xaml.controls.numberbox). For example, this `UpdateSourceTrigger` setting has no effect.
     * 
     * ```xaml
     * <!-- This UpdateSourceTrigger setting has no effect. -->
     * <muxc:NumberBox Text="{x:Bind MyProperty, Mode=TwoWay, UpdateSourceTrigger=PropertyChanged}"/>
     * ```
     * 
     * Your other choice for an [UpdateSourceTrigger](updatesourcetrigger.md) behavior is to set the value to be `Explicit`. When a two-way binding has its [UpdateSourceTrigger](updatesourcetrigger.md) value as `Explicit`, you must explicitly call [UpdateSource](bindingexpression_updatesource_190615267.md) on the relevant [BindingExpression](bindingexpression.md) to cause the changed target values to update the data source. Use [GetBindingExpression](../windows.ui.xaml/frameworkelement_getbindingexpression_1210399878.md) to get a [BindingExpression](bindingexpression.md) from an object where a [Binding](binding.md) to a dependency property exists and that binding is a two-way binding with `UpdateSourceTrigger="Explicit"`.
     * 
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.binding.updatesourcetrigger
     * @type {Integer} 
     */
    UpdateSourceTrigger {
        get => this.get_UpdateSourceTrigger()
        set => this.put_UpdateSourceTrigger(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {PropertyPath} 
     */
    get_Path() {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.get_Path()
    }

    /**
     * 
     * @param {PropertyPath} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.put_Path(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Mode() {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.get_Mode()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_Mode(value) {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.put_Mode(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Source() {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.get_Source()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Source(value) {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.put_Source(value)
    }

    /**
     * 
     * @returns {RelativeSource} 
     */
    get_RelativeSource() {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.get_RelativeSource()
    }

    /**
     * 
     * @param {RelativeSource} value 
     * @returns {HRESULT} 
     */
    put_RelativeSource(value) {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.put_RelativeSource(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ElementName() {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.get_ElementName()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ElementName(value) {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.put_ElementName(value)
    }

    /**
     * 
     * @returns {IValueConverter} 
     */
    get_Converter() {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.get_Converter()
    }

    /**
     * 
     * @param {IValueConverter} value 
     * @returns {HRESULT} 
     */
    put_Converter(value) {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.put_Converter(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_ConverterParameter() {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.get_ConverterParameter()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_ConverterParameter(value) {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.put_ConverterParameter(value)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_ConverterLanguage() {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.get_ConverterLanguage()
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_ConverterLanguage(value) {
        if (!this.HasProp("__IBinding")) {
            if ((queryResult := this.QueryInterface(IBinding.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding := IBinding(outPtr)
        }

        return this.__IBinding.put_ConverterLanguage(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_FallbackValue() {
        if (!this.HasProp("__IBinding2")) {
            if ((queryResult := this.QueryInterface(IBinding2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding2 := IBinding2(outPtr)
        }

        return this.__IBinding2.get_FallbackValue()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_FallbackValue(value) {
        if (!this.HasProp("__IBinding2")) {
            if ((queryResult := this.QueryInterface(IBinding2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding2 := IBinding2(outPtr)
        }

        return this.__IBinding2.put_FallbackValue(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_TargetNullValue() {
        if (!this.HasProp("__IBinding2")) {
            if ((queryResult := this.QueryInterface(IBinding2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding2 := IBinding2(outPtr)
        }

        return this.__IBinding2.get_TargetNullValue()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_TargetNullValue(value) {
        if (!this.HasProp("__IBinding2")) {
            if ((queryResult := this.QueryInterface(IBinding2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding2 := IBinding2(outPtr)
        }

        return this.__IBinding2.put_TargetNullValue(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_UpdateSourceTrigger() {
        if (!this.HasProp("__IBinding2")) {
            if ((queryResult := this.QueryInterface(IBinding2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding2 := IBinding2(outPtr)
        }

        return this.__IBinding2.get_UpdateSourceTrigger()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_UpdateSourceTrigger(value) {
        if (!this.HasProp("__IBinding2")) {
            if ((queryResult := this.QueryInterface(IBinding2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBinding2 := IBinding2(outPtr)
        }

        return this.__IBinding2.put_UpdateSourceTrigger(value)
    }

;@endregion Instance Methods
}
