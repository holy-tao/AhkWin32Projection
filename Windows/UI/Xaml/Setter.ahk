#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\SetterBase.ahk
#Include .\ISetter.ahk
#Include .\ISetter2.ahk
#Include .\ISetterFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Applies a value to a property in a [Style](style.md) or a [VisualState](visualstate.md).
 * @remarks
 * Use Setter statements to set a property value within a [Style](style.md) or a [VisualState](visualstate.md).
 * 
 * The [Setter.Target](setter_target.md) property can be used in either a [Style](style.md) or a [VisualState](visualstate.md), but in different ways. When used in a [Style](style.md), the property that needs to be modified can be specified directly. When used in [VisualState](visualstate.md), the Target property must be given a [TargetPropertyPath](targetpropertypath.md) (dotted syntax with a target element and property explicitly specified).
 * 
 * The [Setter.Property](setter_property.md) property can be used only in a [Style](style.md) and not in a [VisualState](visualstate.md). Starting in Windows 10, you can use [Setter.Target](setter_target.md) everywhere instead of [Setter.Property](setter_property.md).
 * 
 * You must specify both the [Value](setter_value.md), and the [Target](setter_target.md) or [Property](setter_property.md), on a Setter. Otherwise, an exception is thrown (either a parse exception or runtime error, depending on whether the Setter is created in XAML or modified in code).
 * 
 * If you're accessing a Setter instance using code, you cannot change the value of any property of a Setter instance if the value of the [IsSealed](style_issealed.md) property on a parent [Style](style.md) is **true**. This is also reported by the [IsSealed](setterbase_issealed.md) property on an individual Setter. The system sets these properties to **true** when the runtime applies styles to UI elements and displays them in the UI. Attempting to change a sealed Setter throws a runtime error.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setter
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class Setter extends SetterBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ISetter

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ISetter.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [Setter](setter.md) class with initial [Property](setter_property.md) and [Value](setter_value.md) information.
     * @param {DependencyProperty} targetProperty The dependency property identifier for the property that is being styled.
     * @param {IInspectable} value The value to assign to the value when the [Setter](setter.md) applies.
     * @returns {Setter} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setter.#ctor
     */
    static CreateInstance(targetProperty, value) {
        if (!Setter.HasProp("__ISetterFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Setter")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ISetterFactory.IID)
            Setter.__ISetterFactory := ISetterFactory(factoryPtr)
        }

        return Setter.__ISetterFactory.CreateInstance(targetProperty, value)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the property to apply the [Value](setter_value.md) to.
     * @remarks
     * You must specify both the Property and [Value](setter_value.md) properties on a [Setter](setter.md). Otherwise an exception is thrown (either a parse exception or runtime error, depending on whether the [Setter](setter.md) is created in XAML or modified in code).
     * 
     * If you're accessing a [Setter](setter.md) instance using code, you cannot change the value of any property of a [Setter](setter.md) instance if the value of the [IsSealed](style_issealed.md) property on a parent [Style](style.md) is **true**. This is also reported by the [IsSealed](setterbase_issealed.md) property on an individual [Setter](setter.md). The system sets these properties to **true** when the runtime applies styles to UI elements and displays them in the UI. Attempting to change a sealed [Setter](setter.md) throws a runtime error.
     * 
     * You can use a [Setter](setter.md) to style an attached property. In this case the dependency property name is a qualified name in XAML that also names the attached property's defining type. For example, `<Setter Property="AutomationProperties.LiveSetting" Value="Polite" />` could be used to set the [AutomationProperties.LiveSetting](/uwp/api/windows.ui.xaml.automation.automationproperties.livesetting) attached property value within the style for any control or UI element.
     * 
     * > [!NOTE]
     * > The XAML parser also accepts dependency property names that include a qualifying class. For example the parser interprets either "Button.Background" or "Control.Background" as being a reference to the [Background](../windows.ui.xaml.controls/control_background.md) property in a style for a [Button](../windows.ui.xaml.controls/button.md). Qualifying by class isn't necessary though and results in potentially confusing markup. You might encounter or use qualified property-name usages if you're migrating XAML from other platforms.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setter.property
     * @type {DependencyProperty} 
     */
    Property {
        get => this.get_Property()
        set => this.put_Property(value)
    }

    /**
     * Gets or sets the value to apply to the property that is specified by the [Setter](setter.md).
     * @remarks
     * As you can see from the XAML syntax, there are a variety of ways to specify the Value for a [Setter](setter.md) in XAML:
     * + As an attribute, using a string value. Such a string value can be implicitly converted to a property-specific type for simple cases such as setting numeric values, named values from an enumeration, or a Uniform Resource Identifier (URI).
     * + As a complete new object that's declared in XAML object element syntax, and the object element is nested within a property element usage.
     * + As an attribute that has a [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension) usage within the quotes.
     * Typically the value type of the property dictates which syntax is appropriate. For more info on XAML usages, see [XAML overview](/windows/uwp/xaml-platform/xaml-overview) or [XAML syntax guide](/windows/uwp/xaml-platform/xaml-syntax-guide). You can use attribute syntax for most XAML UI properties, and UI properties that specifically require a property element usage or a resource reference are less common. A [{StaticResource} markup extension](/windows/uwp/xaml-platform/staticresource-markup-extension) usage can be appropriate even for strings or numeric values if those values are shared by more than one style or property.
     * 
     * You must specify both the [Property](setter_property.md) and Value properties on a [Setter](setter.md). Otherwise an exception is thrown (either a parse exception or runtime error, depending on whether the [Setter](setter.md) is created in XAML or modified in code).
     * 
     * If you're accessing a [Setter](setter.md) instance using code, you cannot change the value of any property of a [Setter](setter.md) instance if the value of the [IsSealed](style_issealed.md) property on a parent [Style](style.md) is **true**. This is also reported by the [IsSealed](setterbase_issealed.md) property on an individual [Setter](setter.md). The system sets these properties to **true** when the runtime applies styles to UI elements and displays them in the UI. Attempting to change a sealed [Setter](setter.md) throws a runtime error.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setter.value
     * @type {IInspectable} 
     */
    Value {
        get => this.get_Value()
        set => this.put_Value(value)
    }

    /**
     * Gets or sets the path of a property on a target element to apply the [Value](setter_value.md) to.
     * @remarks
     * The [Setter.Target](setter_target.md) property can be used in either a [Style](style.md) or a [VisualState](visualstate.md), but in different ways. 
     * 
     * - When used in a [Style](style.md), the property that needs to be modified can be specified directly.
     * - When used in [VisualState](visualstate.md), the Target property must be given a [TargetPropertyPath](targetpropertypath.md) (dotted syntax with a target element and property explicitly specified).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.setter.target
     * @type {TargetPropertyPath} 
     */
    Target {
        get => this.get_Target()
        set => this.put_Target(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Setter](setter.md) class with no initial [Property](setter_property.md) or [Value](setter_value.md).
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Setter")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {DependencyProperty} 
     */
    get_Property() {
        if (!this.HasProp("__ISetter")) {
            if ((queryResult := this.QueryInterface(ISetter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetter := ISetter(outPtr)
        }

        return this.__ISetter.get_Property()
    }

    /**
     * 
     * @param {DependencyProperty} value 
     * @returns {HRESULT} 
     */
    put_Property(value) {
        if (!this.HasProp("__ISetter")) {
            if ((queryResult := this.QueryInterface(ISetter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetter := ISetter(outPtr)
        }

        return this.__ISetter.put_Property(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Value() {
        if (!this.HasProp("__ISetter")) {
            if ((queryResult := this.QueryInterface(ISetter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetter := ISetter(outPtr)
        }

        return this.__ISetter.get_Value()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Value(value) {
        if (!this.HasProp("__ISetter")) {
            if ((queryResult := this.QueryInterface(ISetter.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetter := ISetter(outPtr)
        }

        return this.__ISetter.put_Value(value)
    }

    /**
     * 
     * @returns {TargetPropertyPath} 
     */
    get_Target() {
        if (!this.HasProp("__ISetter2")) {
            if ((queryResult := this.QueryInterface(ISetter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetter2 := ISetter2(outPtr)
        }

        return this.__ISetter2.get_Target()
    }

    /**
     * 
     * @param {TargetPropertyPath} value 
     * @returns {HRESULT} 
     */
    put_Target(value) {
        if (!this.HasProp("__ISetter2")) {
            if ((queryResult := this.QueryInterface(ISetter2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ISetter2 := ISetter2(outPtr)
        }

        return this.__ISetter2.put_Target(value)
    }

;@endregion Instance Methods
}
