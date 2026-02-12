#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IPropertyMetadata.ahk
#Include .\IPropertyMetadataFactory.ahk
#Include .\IPropertyMetadataStatics.ahk
#Include ..\..\..\Guid.ahk

/**
 * Defines behavior aspects of a dependency property, including conditions it was registered with. For more info on how PropertyMetadata is used for dependency properties, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
 * @remarks
 * Defining a PropertyMetadata instance is part of the scenario for defining a custom dependency property. For info and examples, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
 * 
 * A PropertyMetadata value represents two aspects of dependency property behavior:
 * + Provides a default value, which is used as the value of the property unless the owner type specifically initializes the value, or the value is set by user code or other mechanisms.
 * + References a callback that is invoked if the dependency property system detects that the dependency property has changed.
 *  Typically, a dependency property only needs a PropertyMetadata value if one or both of these behaviors is desired. Otherwise, a value of **null** can be passed for the *propertyMetadata* parameter when a dependency property is registered with the dependency property system. For more info, see [DependencyProperty.Register](dependencyproperty_register_1826645607.md).
 * 
 * If your PropertyMetadata includes a property-changed callback reference, that method must be a static method of the class that exposes the [DependencyProperty](dependencyproperty.md) identifier where that PropertyMetadata is applied. How to write this method is described in [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties) and also the reference topic for the [PropertyChangedCallback](propertychangedcallback.md) delegate. 
 * 
 * > [!NOTE]
 * > Once created, a PropertyMetadata instance doesn't have a property that can be used to find the callback or even to determine the callback's method name. That information is considered an implementation detail of a dependency property and only the dependency property system itself needs to be able to invoke that method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertymetadata
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class PropertyMetadata extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPropertyMetadata

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPropertyMetadata.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @param {IInspectable} defaultValue 
     * @returns {PropertyMetadata} 
     */
    static CreateInstanceWithDefaultValue(defaultValue) {
        if (!PropertyMetadata.HasProp("__IPropertyMetadataFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.PropertyMetadata")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyMetadataFactory.IID)
            PropertyMetadata.__IPropertyMetadataFactory := IPropertyMetadataFactory(factoryPtr)
        }

        return PropertyMetadata.__IPropertyMetadataFactory.CreateInstanceWithDefaultValue(defaultValue, 0, Buffer(A_PtrSize))
    }

    /**
     * 
     * @param {IInspectable} defaultValue 
     * @param {PropertyChangedCallback} propertyChangedCallback_ 
     * @returns {PropertyMetadata} 
     */
    static CreateInstanceWithDefaultValueAndCallback(defaultValue, propertyChangedCallback_) {
        if (!PropertyMetadata.HasProp("__IPropertyMetadataFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.PropertyMetadata")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyMetadataFactory.IID)
            PropertyMetadata.__IPropertyMetadataFactory := IPropertyMetadataFactory(factoryPtr)
        }

        return PropertyMetadata.__IPropertyMetadataFactory.CreateInstanceWithDefaultValueAndCallback(defaultValue, propertyChangedCallback_, 0, Buffer(A_PtrSize))
    }

    /**
     * Creates a [PropertyMetadata](propertymetadata.md) value, specifying a fixed default value for a dependency property, and a property-changed callback.
     * @param {IInspectable} defaultValue The dependency property default value to apply.
     * @returns {PropertyMetadata} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertymetadata.create
     */
    static CreateWithDefaultValue(defaultValue) {
        if (!PropertyMetadata.HasProp("__IPropertyMetadataStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.PropertyMetadata")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyMetadataStatics.IID)
            PropertyMetadata.__IPropertyMetadataStatics := IPropertyMetadataStatics(factoryPtr)
        }

        return PropertyMetadata.__IPropertyMetadataStatics.CreateWithDefaultValue(defaultValue)
    }

    /**
     * Creates a [PropertyMetadata](propertymetadata.md) value, specifying a callback that establishes a default value for a dependency property.
     * @remarks
     * Use a [CreateDefaultValueCallback](createdefaultvaluecallback.md) instead of a fixed constant default value in any case where the default value of a dependency property might be thread-bound. The [CreateDefaultValueCallback](createdefaultvaluecallback.md) becomes a factory for default values whenever there is a need to get default values of properties on threads other than the main UI thread.
     * 
     * In order to establish a [CreateDefaultValueCallback](createdefaultvaluecallback.md) pattern for a dependency property, use one of the static [Create](propertymetadata_create_1554665429.md) methods instead of using the [PropertyMetadata](propertymetadata_propertymetadata_1183178341.md) constructor when you define the metadata for the property. That metadata is submitted to the [Register](dependencyproperty_register_1826645607.md) call. For more info, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties). As with a property-changed callback, the [CreateDefaultValueCallback](createdefaultvaluecallback.md) method should be a static method of the type that registers the dependency property. The method does not have to be public.
     * @param {IInspectable} defaultValue 
     * @param {PropertyChangedCallback} propertyChangedCallback_ 
     * @returns {PropertyMetadata} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertymetadata.create
     */
    static CreateWithDefaultValueAndCallback(defaultValue, propertyChangedCallback_) {
        if (!PropertyMetadata.HasProp("__IPropertyMetadataStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.PropertyMetadata")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyMetadataStatics.IID)
            PropertyMetadata.__IPropertyMetadataStatics := IPropertyMetadataStatics(factoryPtr)
        }

        return PropertyMetadata.__IPropertyMetadataStatics.CreateWithDefaultValueAndCallback(defaultValue, propertyChangedCallback_)
    }

    /**
     * Creates a [PropertyMetadata](propertymetadata.md) value, specifying a fixed default value for a dependency property, and a property-changed callback.
     * @param {CreateDefaultValueCallback} createDefaultValueCallback_ 
     * @returns {PropertyMetadata} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertymetadata.create
     */
    static CreateWithFactory(createDefaultValueCallback_) {
        if (!PropertyMetadata.HasProp("__IPropertyMetadataStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.PropertyMetadata")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyMetadataStatics.IID)
            PropertyMetadata.__IPropertyMetadataStatics := IPropertyMetadataStatics(factoryPtr)
        }

        return PropertyMetadata.__IPropertyMetadataStatics.CreateWithFactory(createDefaultValueCallback_)
    }

    /**
     * Creates a [PropertyMetadata](propertymetadata.md) value, specifying a callback that establishes a default value for a dependency property.
     * @remarks
     * Use a [CreateDefaultValueCallback](createdefaultvaluecallback.md) instead of a fixed constant default value in any case where the default value of a dependency property might be thread-bound. The [CreateDefaultValueCallback](createdefaultvaluecallback.md) becomes a factory for default values whenever there is a need to get default values of properties on threads other than the main UI thread.
     * 
     * In order to establish a [CreateDefaultValueCallback](createdefaultvaluecallback.md) pattern for a dependency property, use one of the static [Create](propertymetadata_create_1554665429.md) methods instead of using the [PropertyMetadata](propertymetadata_propertymetadata_1183178341.md) constructor when you define the metadata for the property. That metadata is submitted to the [Register](dependencyproperty_register_1826645607.md) call. For more info, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties). As with a property-changed callback, the [CreateDefaultValueCallback](createdefaultvaluecallback.md) method should be a static method of the type that registers the dependency property. The method does not have to be public.
     * @param {CreateDefaultValueCallback} createDefaultValueCallback_ A reference to the callback method that provides a default property value.
     * @param {PropertyChangedCallback} propertyChangedCallback_ 
     * @returns {PropertyMetadata} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertymetadata.create
     */
    static CreateWithFactoryAndCallback(createDefaultValueCallback_, propertyChangedCallback_) {
        if (!PropertyMetadata.HasProp("__IPropertyMetadataStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.PropertyMetadata")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyMetadataStatics.IID)
            PropertyMetadata.__IPropertyMetadataStatics := IPropertyMetadataStatics(factoryPtr)
        }

        return PropertyMetadata.__IPropertyMetadataStatics.CreateWithFactoryAndCallback(createDefaultValueCallback_, propertyChangedCallback_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the default value for the dependency property.
     * @remarks
     * Defining the [DefaultValue](createdefaultvaluecallback.md) property for a [PropertyMetadata](propertymetadata.md) instance is part of the scenario for defining a custom dependency property. For info and examples, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties).
     * 
     * The default value for a dependency property is often not the apparent value at run time, even if the property is not explicitly set. For more info, see [Dependency properties overview](/windows/uwp/xaml-platform/dependency-properties-overview).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertymetadata.defaultvalue
     * @type {IInspectable} 
     */
    DefaultValue {
        get => this.get_DefaultValue()
    }

    /**
     * Gets a reference to the callback method that provides a default property value.
     * @remarks
     * Use a [CreateDefaultValueCallback](createdefaultvaluecallback.md) instead of a fixed constant default value in any case where the default value of a dependency property might be thread-bound. The [CreateDefaultValueCallback](createdefaultvaluecallback.md) becomes a factory for default values whenever there is a need to get default values of properties on threads other than the main UI thread.
     * 
     * In order to establish a [CreateDefaultValueCallback](createdefaultvaluecallback.md) pattern for a dependency property, use one of the static [Create](propertymetadata_create_1554665429.md) methods instead of using the [PropertyMetadata](propertymetadata_propertymetadata_1183178341.md) constructor when you define the metadata for the property. That metadata is submitted to the [Register](dependencyproperty_register_1826645607.md) call. For more info, see [Custom dependency properties](/windows/uwp/xaml-platform/custom-dependency-properties). As with a property-changed callback, the [CreateDefaultValueCallback](createdefaultvaluecallback.md) method should be a static method of the type that registers the dependency property. The method does not have to be public.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertymetadata.createdefaultvaluecallback
     * @type {CreateDefaultValueCallback} 
     */
    CreateDefaultValueCallback {
        get => this.get_CreateDefaultValueCallback()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_DefaultValue() {
        if (!this.HasProp("__IPropertyMetadata")) {
            if ((queryResult := this.QueryInterface(IPropertyMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPropertyMetadata := IPropertyMetadata(outPtr)
        }

        return this.__IPropertyMetadata.get_DefaultValue()
    }

    /**
     * 
     * @returns {CreateDefaultValueCallback} 
     */
    get_CreateDefaultValueCallback() {
        if (!this.HasProp("__IPropertyMetadata")) {
            if ((queryResult := this.QueryInterface(IPropertyMetadata.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPropertyMetadata := IPropertyMetadata(outPtr)
        }

        return this.__IPropertyMetadata.get_CreateDefaultValueCallback()
    }

;@endregion Instance Methods
}
