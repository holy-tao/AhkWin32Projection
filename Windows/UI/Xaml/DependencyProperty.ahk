#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IDependencyProperty.ahk
#Include .\IDependencyPropertyStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents a dependency property that is registered with the dependency property system. Dependency properties provide support for value expressions, data binding, animation, and property change notification. For more info on how DependencyProperty values serve as identifiers for dependency properties, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
 * @remarks
 * Dependency property concepts are covered in detail in the topic [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
 * 
 * Instances of DependencyProperty are often referenced in the documentation as dependency property identifiers. The identifiers provide a way to refer to a dependency property that was registered to a particular [DependencyObject](dependencyobject.md) owner type. When the owner type registers the property, the owner type exposes the DependencyProperty instance as the identifier, which is a static member of the owner class.
 * 
 * The owner [DependencyObject](dependencyobject.md) provides the property store for the dependency property. When working with a dependency property in code, you might use a DependencyProperty identifiers as input for calls to property system methods such as [SetValue](dependencyobject_setvalue_52578133.md). However, in most cases, getting or setting a dependency property is simpler by getting or setting the *wrapper*; this concept is explained in [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
 * 
 * DependencyProperty supports a native conversion for XAML attribute syntax for filling values, which is used when a [Setter](setter.md) specifies its [Property](setter_property.md) value. This conversion uses an *ownerTypeName***.***propertyName* form for the input string.
 * 
 * > [!NOTE]
 * > A related syntax that can also be used to specify a property by name and is required by certain data and animation API is the *property path syntax*. A property path can be used to reference the structure of a class that has properties and the value of that property. For more info, see [Property-path syntax](/windows/uwp/xaml-platform/property-path-syntax).
 * 
 * 
 * 
 * > [!TIP]
 * > If you are programming using a Microsoft .NET language (C# or Microsoft Visual Basic), the [TypeName](../windows.ui.xaml.interop/typename.md) type projects as [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true). When programming using C#, it is common to use the **typeof** operator to get references to the [System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) of a type. In Microsoft Visual Basic, use **GetType**. If you're using Visual C++ component extensions (C++/CX)), where you'll need to create a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct, you can use the [typeid component extension](/cpp/windows/typeid-cpp-component-extensions).
 * 
 * The Windows Runtime implements the XAML attached property language feature with DependencyProperty identifiers and property storage on a [DependencyObject](dependencyobject.md). For more info, see [Attached properties overview](/windows/uwp/xaml-platform/attached-properties-overview).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyproperty
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class DependencyProperty extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IDependencyProperty

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IDependencyProperty.IID

    /**
     * Specifies a static value that is used by the property system rather than **null** to indicate that the property exists, but does not have its value set by the property system or by any app code.
     * @remarks
     * UnsetValue is a sentinel value that is used for scenarios where the dependency property system is unable to determine a requested dependency property value. UnsetValue is used rather than **null**, because **null** is a valid property value for most reference-type values, and is a frequently used [DefaultValue](propertymetadata_defaultvalue.md) in metadata for a dependency property.
     * 
     * UnsetValue is never returned out of a [DependencyObject.GetValue](dependencyobject_getvalue_1188551207.md) call. When you call [DependencyObject.GetValue](dependencyobject_getvalue_1188551207.md) for a dependency property, one of these conditions is always true:
     * + A dependency property has a default value established in metadata and that value is returned. This value might come from the property metadata's [DefaultValue](propertymetadata_defaultvalue.md). This might be **null**.
     * + Some other value was established through value precedence (for example a style was applied, or a [Binding](../windows.ui.xaml.data/binding.md) was evaluated), and the default value is no longer relevant. Even though specifically set, this still might be **null**. For more info on value precedence, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * 
     * 
     * [DependencyObject.ReadLocalValue](dependencyobject_readlocalvalue_275037327.md) returns UnsetValue when the requested property has not been locally set.
     * 
     * 
     * 
     * > [!NOTE]
     * > Do not register a dependency property with the default value of UnsetValue. This will be confusing for property consumers and will have unintended consequences within the property system.
     * 
     * 
     * <!--<rem  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance">Comment out don't think this applies. UnsetValue has a special meaning when used as the return value of a property changed callback.</rem>-->
     * UnsetValue should be returned from an [IValueConverter](../windows.ui.xaml.data/ivalueconverter.md) implementation that provides conversion in a data binding to a dependency property, in any case where the converter is unable to convert a source value. Converters shouldn't throw exceptions for that case in [IValueConverter.Convert](../windows.ui.xaml.data/ivalueconverter_convert_101701969.md), these will surface as run-time exceptions that you'd need to add handling for in [UnhandledException](application_unhandledexception.md) or worse yet appear to users as actual run-time exceptions. Converter implementations should follow the general binding pattern that any failed binding does nothing and does not provide a value, and UnsetValue rather than **null** is the sentinel value for that case that the binding engine understands. For more info, see [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyproperty.unsetvalue
     * @type {IInspectable} 
     */
    static UnsetValue {
        get => DependencyProperty.get_UnsetValue()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {IInspectable} 
     */
    static get_UnsetValue() {
        if (!DependencyProperty.HasProp("__IDependencyPropertyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DependencyProperty")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDependencyPropertyStatics.IID)
            DependencyProperty.__IDependencyPropertyStatics := IDependencyPropertyStatics(factoryPtr)
        }

        return DependencyProperty.__IDependencyPropertyStatics.get_UnsetValue()
    }

    /**
     * Registers a dependency property with the specified property name, property type, owner type, and property metadata for the property. Use this method when defining or initializing a [DependencyObject](dependencyobject.md) derived class that will own the registered dependency property.
     * @remarks
     * How to register a custom dependency property is described in detail (with examples) in the topic [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
     * 
     * Registering a dependency property is typically something that you only do when an app first starts or [DependencyObject](dependencyobject.md) derived classes defined by your app code are first used. You need to register the dependency properties early in the app lifetime to assure that other code and XAML in your app don't try to use the dependency properties before they are registered and available. Exactly how and when to register varies, based on the programming language. For C# or Microsoft Visual Basic it's common to register dependency properties during the static class initialization of the class that owns the dependency property. That way any code or XAML that initializes the instance will invoke that static construction and register the dependency property. For Visual C++ component extensions (C++/CX)), static class initialization isn't an available technique, so you typically must define an app-wide helper method that registers all the custom dependency properties that your app intends to use, as part of the [Application](application.md) object initialization. For examples of how and when to register custom dependency properties, including some special techniques that are needed for Visual C++ component extensions (C++/CX), see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
     * @param {HSTRING} name The name of the dependency property to register.
     * @param {TypeName} propertyType_ The type of the property, as a type reference ([System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @param {TypeName} ownerType The owner type that is registering the dependency property, as a type reference ([System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @param {PropertyMetadata} typeMetadata A property metadata instance. This can contain a default value and a [PropertyChangedCallback](propertychangedcallback.md) implementation reference. Passing `null` for this parameter is equivalent to passing a new PropertyMetadata instance created by calling [PropertyMetadata.Create](propertymetadata_create_581724777.md) with `null` as the default value parameter.
     * @returns {DependencyProperty} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyproperty.register
     */
    static Register(name, propertyType_, ownerType, typeMetadata) {
        if (!DependencyProperty.HasProp("__IDependencyPropertyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DependencyProperty")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDependencyPropertyStatics.IID)
            DependencyProperty.__IDependencyPropertyStatics := IDependencyPropertyStatics(factoryPtr)
        }

        return DependencyProperty.__IDependencyPropertyStatics.Register(name, propertyType_, ownerType, typeMetadata)
    }

    /**
     * Registers an attached dependency property with the specified property name, property type, owner type, and property metadata for the property.
     * @param {HSTRING} name The name of the dependency property to register.
     * @param {TypeName} propertyType_ The type of the property, as a type reference ([System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @param {TypeName} ownerType The owner type that is registering the dependency property, as a type reference ([System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @param {PropertyMetadata} defaultMetadata A property metadata instance. This can contain a [PropertyChangedCallback](propertychangedcallback.md) implementation reference.
     * @returns {DependencyProperty} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyproperty.registerattached
     */
    static RegisterAttached(name, propertyType_, ownerType, defaultMetadata) {
        if (!DependencyProperty.HasProp("__IDependencyPropertyStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.DependencyProperty")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IDependencyPropertyStatics.IID)
            DependencyProperty.__IDependencyPropertyStatics := IDependencyPropertyStatics(factoryPtr)
        }

        return DependencyProperty.__IDependencyPropertyStatics.RegisterAttached(name, propertyType_, ownerType, defaultMetadata)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * Retrieves the property metadata value for the dependency property as registered to a type. You specify the type you want info from as a type reference.
     * @param {TypeName} forType The name of the specific type from which to retrieve the dependency property metadata, as a type reference ([System.Type](/dotnet/api/system.type?view=dotnet-uwp-10.0&preserve-view=true) for Microsoft .NET, a [TypeName](../windows.ui.xaml.interop/typename.md) helper struct for Visual C++ component extensions (C++/CX)).
     * @returns {PropertyMetadata} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.dependencyproperty.getmetadata
     */
    GetMetadata(forType) {
        if (!this.HasProp("__IDependencyProperty")) {
            if ((queryResult := this.QueryInterface(IDependencyProperty.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IDependencyProperty := IDependencyProperty(outPtr)
        }

        return this.__IDependencyProperty.GetMetadata(forType)
    }

;@endregion Instance Methods
}
