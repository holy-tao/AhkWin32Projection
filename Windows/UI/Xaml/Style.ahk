#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\IStyle.ahk
#Include .\IStyleFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Contains property setters that can be shared between instances of a type. A Style is usually declared in a resources collection so that it can be shared and used for applying control templates and other styles.
 * @remarks
 * A Style is basically a collection of property settings applied to one or more instances of a particular type that has such properties. A Style contains a collection of one or more [Setter](setter.md) objects. Each [Setter](setter.md) has a [Property](setter_property.md) and a [Value](setter_value.md). The [Property](setter_property.md) is the name of the property of the element the style is applied to. The [Value](setter_value.md) is the value that is applied to the property.
 * 
 * In order to apply a Style, the target object must be a [DependencyObject](dependencyobject.md). The property that each [Setter](setter.md) references as a [Property](setter_property.md) value must be a dependency property.
 * 
 * You must set the [TargetType](style_targettype.md) property when you create a Style. Otherwise an exception is thrown.
 * 
 * If you set a value for the same property in a Style and also on an element directly, the value set on the element directly takes precedence. For more info, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview), specifically the "Dependency property value precedence" section.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.style
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class Style extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IStyle

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IStyle.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [Style](style.md) class, with a specified initial [TargetType](style_targettype.md) and an empty [Setters](style_setters.md) collection.
     * @remarks
     * > [!IMPORTANT]
     * > 
     * 
     * If you are programming using a .NET language (C# or Visual Basic), the [TypeName](../windows.ui.xaml.interop/typename.md) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). This is not correctly indicated in the C# and Visual Basic syntaxes above; the *targetType* parameter should take a [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). When programming using C#, it is common to use the **typeof** operator to get references to the [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) of a type. In Visual Basic, use **GetType**.
     * @param {TypeName} targetType The [TargetType](style_targettype.md) to set for the [Style](style.md).
     * @returns {Style} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.style.#ctor
     */
    static CreateInstance(targetType) {
        if (!Style.HasProp("__IStyleFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Style")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IStyleFactory.IID)
            Style.__IStyleFactory := IStyleFactory(factoryPtr)
        }

        return Style.__IStyleFactory.CreateInstance(targetType)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets a value that indicates whether the style is read-only and cannot be changed.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.style.issealed
     * @type {Boolean} 
     */
    IsSealed {
        get => this.get_IsSealed()
    }

    /**
     * Gets a collection of [Setter](setter.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.style.setters
     * @type {SetterBaseCollection} 
     */
    Setters {
        get => this.get_Setters()
    }

    /**
     * Gets or sets the type for which the style is intended. TargetType can be used to declare an implicit style resource if there's no resource key specified.
     * @remarks
     * A TargetType value is required for all cases where you use or declare a [Style](style.md). There is no default value. Even a [Style](style.md) that is used as an inline value of the [FrameworkElement.Style](frameworkelement_style.md) property requires an explicit TargetType value.
     * 
     * The typical way to specify a TargetType value is through a XAML attribute on the [Style](style.md) element. When set in XAML, the meaning of TargetType and the values you provide take on some aspects of how types are represented in XAML.
     * 
     * For XAML, any prefixes that would be necessary to refer to a type through a XAML element usage should be included in the TargetType attribute value. For example, if a style targets a custom type, which is defined in a code namespace that's mapped to the "local:" prefix, then the TargetType attribute value for that type's style should include that same prefix preceding the type name. This behavior is enabled by built-in string-type conversion behavior in the Windows Runtime XAML parser.
     * 
     * When defining styles for custom types, once you've included a mapping prefix for a TargetType you don't include any prefix in the [Property](setter_property.md) value of any [Setter](setter.md) within that [Style](style.md).
     * 
     * The value you provide for TargetType modifies the lookup behavior for any [Setter.Property](setter_property.md) value you specify within the style. Specifically, the dependency properties that you reference by name for a [Setter.Property](setter_property.md) XAML attribute value are expected to exist on the TargetType type, or on any ancestor class. For example, if the TargetType you specify is [Button](../windows.ui.xaml.controls/button.md), and one of the [Setter.Property](setter_property.md) XAML attribute values in the [Style](style.md) is "Background", that resolves to the [Control.Background](../windows.ui.xaml.controls/control_background.md) property ([Control](../windows.ui.xaml.controls/control.md) is three levels above [Button](../windows.ui.xaml.controls/button.md) in its class inheritance, and [Button](../windows.ui.xaml.controls/button.md) inherits all properties of [Control](../windows.ui.xaml.controls/control.md)). It's typical to specify the TargetType value to be the same UI element names you'd use in typical UI markup, you wouldn't usually name an ancestor class (although that's technically allowed).
     * 
     * If the [Style](style.md) includes a [Setter](setter.md) that declares a control template (a value for the [Template](../windows.ui.xaml.controls/control_template.md) property), then the TargetType value of the parent [Style](style.md) should match the [TargetType](../windows.ui.xaml.controls/controltemplate_targettype.md) value of the contained [ControlTemplate](../windows.ui.xaml.controls/controltemplate.md) element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.style.targettype
     * @type {TypeName} 
     */
    TargetType {
        get => this.get_TargetType()
        set => this.put_TargetType(value)
    }

    /**
     * Gets or sets a defined style that is the basis of the current style.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.style.basedon
     * @type {Style} 
     */
    BasedOn {
        get => this.get_BasedOn()
        set => this.put_BasedOn(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [Style](style.md) class, with no initial [TargetType](style_targettype.md) and an empty [Setters](style_setters.md) collection.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Style")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsSealed() {
        if (!this.HasProp("__IStyle")) {
            if ((queryResult := this.QueryInterface(IStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStyle := IStyle(outPtr)
        }

        return this.__IStyle.get_IsSealed()
    }

    /**
     * 
     * @returns {SetterBaseCollection} 
     */
    get_Setters() {
        if (!this.HasProp("__IStyle")) {
            if ((queryResult := this.QueryInterface(IStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStyle := IStyle(outPtr)
        }

        return this.__IStyle.get_Setters()
    }

    /**
     * 
     * @returns {TypeName} 
     */
    get_TargetType() {
        if (!this.HasProp("__IStyle")) {
            if ((queryResult := this.QueryInterface(IStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStyle := IStyle(outPtr)
        }

        return this.__IStyle.get_TargetType()
    }

    /**
     * 
     * @param {TypeName} value 
     * @returns {HRESULT} 
     */
    put_TargetType(value) {
        if (!this.HasProp("__IStyle")) {
            if ((queryResult := this.QueryInterface(IStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStyle := IStyle(outPtr)
        }

        return this.__IStyle.put_TargetType(value)
    }

    /**
     * 
     * @returns {Style} 
     */
    get_BasedOn() {
        if (!this.HasProp("__IStyle")) {
            if ((queryResult := this.QueryInterface(IStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStyle := IStyle(outPtr)
        }

        return this.__IStyle.get_BasedOn()
    }

    /**
     * 
     * @param {Style} value 
     * @returns {HRESULT} 
     */
    put_BasedOn(value) {
        if (!this.HasProp("__IStyle")) {
            if ((queryResult := this.QueryInterface(IStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStyle := IStyle(outPtr)
        }

        return this.__IStyle.put_BasedOn(value)
    }

    /**
     * Locks the style so that the [TargetType](style_targettype.md) property or any [Setter](setter.md) in the [Setters](style_setters.md) collection cannot be changed.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.style.seal
     */
    Seal() {
        if (!this.HasProp("__IStyle")) {
            if ((queryResult := this.QueryInterface(IStyle.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IStyle := IStyle(outPtr)
        }

        return this.__IStyle.Seal()
    }

;@endregion Instance Methods
}
