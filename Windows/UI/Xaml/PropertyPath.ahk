#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\DependencyObject.ahk
#Include .\IPropertyPath.ahk
#Include .\IPropertyPathFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Implements a data structure for describing a property as a path below another property, or below an owning type. Property paths are used in data binding to objects.
 * @remarks
 * The main reason you might work with a PropertyPath object is to clone existing binding properties and use them somewhere else:
 * 
 * + Get the [Path](propertypath_path.md) from an existing binding ([Binding.Path](../windows.ui.xaml.data/binding_path.md)).
 * + Use that string value to construct a new PropertyPath.
 * + Create a new [Binding](../windows.ui.xaml.data/binding.md). Use the new PropertyPath for its [Binding.Path](../windows.ui.xaml.data/binding_path.md) (and probably adjust some other properties too).
 * + Apply the new [Binding](../windows.ui.xaml.data/binding.md) to a different object-property combination, using [SetBinding](frameworkelement_setbinding_28713777.md).
 * 
 * Animation targeting also uses a property path concept, as documented in the [Property-path syntax](/windows/uwp/xaml-platform/property-path-syntax) topic. However, animation targeting doesn't use PropertyPath as the underlying type, it expresses the paths as strings and uses strings for all related API calls.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertypath
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class PropertyPath extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IPropertyPath

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IPropertyPath.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [PropertyPath](propertypath.md) class based on a path string.
     * @param {HSTRING} path_ The path string to construct with.
     * @returns {PropertyPath} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertypath.#ctor
     */
    static CreateInstance(path_) {
        if (!PropertyPath.HasProp("__IPropertyPathFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.PropertyPath")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IPropertyPathFactory.IID)
            PropertyPath.__IPropertyPathFactory := IPropertyPathFactory(factoryPtr)
        }

        return PropertyPath.__IPropertyPathFactory.CreateInstance(path_)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets the path value held by this [PropertyPath](propertypath.md).
     * @remarks
     * To establish a value for [Path](propertypath_path.md), create a new [PropertyPath](propertypath.md) using the [PropertyPath(String)](propertypath_propertypath_290278668.md) constructor.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.propertypath.path
     * @type {HSTRING} 
     */
    Path {
        get => this.get_Path()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Path() {
        if (!this.HasProp("__IPropertyPath")) {
            if ((queryResult := this.QueryInterface(IPropertyPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IPropertyPath := IPropertyPath(outPtr)
        }

        return this.__IPropertyPath.get_Path()
    }

;@endregion Instance Methods
}
