#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\ITargetPropertyPath.ahk
#Include .\ITargetPropertyPathFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the path to a property on a target element.
 * @remarks
 * TargetPropertyPath is used to create the simplified dotted [Setter.Target](setter_target.md) syntax in XAML.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.targetpropertypath
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class TargetPropertyPath extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITargetPropertyPath

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITargetPropertyPath.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Initializes a new instance of the [TargetPropertyPath](targetpropertypath.md) class with the specified target property.
     * @param {DependencyProperty} targetProperty The target property.
     * @returns {TargetPropertyPath} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.targetpropertypath.#ctor
     */
    static CreateInstance(targetProperty) {
        if (!TargetPropertyPath.HasProp("__ITargetPropertyPathFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.TargetPropertyPath")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITargetPropertyPathFactory.IID)
            TargetPropertyPath.__ITargetPropertyPathFactory := ITargetPropertyPathFactory(factoryPtr)
        }

        return TargetPropertyPath.__ITargetPropertyPathFactory.CreateInstance(targetProperty)
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the path to the property on the target element.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.targetpropertypath.path
     * @type {PropertyPath} 
     */
    Path {
        get => this.get_Path()
        set => this.put_Path(value)
    }

    /**
     * Gets or sets the object that contains the property described by [Path](targetpropertypath_path.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.targetpropertypath.target
     * @type {IInspectable} 
     */
    Target {
        get => this.get_Target()
        set => this.put_Target(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TargetPropertyPath](targetpropertypath.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.TargetPropertyPath")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {PropertyPath} 
     */
    get_Path() {
        if (!this.HasProp("__ITargetPropertyPath")) {
            if ((queryResult := this.QueryInterface(ITargetPropertyPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetPropertyPath := ITargetPropertyPath(outPtr)
        }

        return this.__ITargetPropertyPath.get_Path()
    }

    /**
     * 
     * @param {PropertyPath} value 
     * @returns {HRESULT} 
     */
    put_Path(value) {
        if (!this.HasProp("__ITargetPropertyPath")) {
            if ((queryResult := this.QueryInterface(ITargetPropertyPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetPropertyPath := ITargetPropertyPath(outPtr)
        }

        return this.__ITargetPropertyPath.put_Path(value)
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Target() {
        if (!this.HasProp("__ITargetPropertyPath")) {
            if ((queryResult := this.QueryInterface(ITargetPropertyPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetPropertyPath := ITargetPropertyPath(outPtr)
        }

        return this.__ITargetPropertyPath.get_Target()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Target(value) {
        if (!this.HasProp("__ITargetPropertyPath")) {
            if ((queryResult := this.QueryInterface(ITargetPropertyPath.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITargetPropertyPath := ITargetPropertyPath(outPtr)
        }

        return this.__ITargetPropertyPath.put_Target(value)
    }

;@endregion Instance Methods
}
