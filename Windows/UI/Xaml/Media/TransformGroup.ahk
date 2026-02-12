#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\Transform.ahk
#Include .\ITransformGroup.ahk
#Include .\ITransformGroupStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Represents a composite [Transform](transform.md) composed of other [Transform](transform.md) objects.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.transformgroup
 * @namespace Windows.UI.Xaml.Media
 * @version WindowsRuntime 1.4
 */
class TransformGroup extends Transform {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => ITransformGroup

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => ITransformGroup.IID

    /**
     * Identifies the [Children](transformgroup_children.md) dependency property.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.transformgroup.childrenproperty
     * @type {DependencyProperty} 
     */
    static ChildrenProperty {
        get => TransformGroup.get_ChildrenProperty()
    }

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {DependencyProperty} 
     */
    static get_ChildrenProperty() {
        if (!TransformGroup.HasProp("__ITransformGroupStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TransformGroup")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, ITransformGroupStatics.IID)
            TransformGroup.__ITransformGroupStatics := ITransformGroupStatics(factoryPtr)
        }

        return TransformGroup.__ITransformGroupStatics.get_ChildrenProperty()
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the collection of child [Transform](transform.md) objects.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.transformgroup.children
     * @type {TransformCollection} 
     */
    Children {
        get => this.get_Children()
        set => this.put_Children(value)
    }

    /**
     * Gets the [Matrix](matrix.md) structure that describes the transformation represented by this [TransformGroup](transformgroup.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.media.transformgroup.value
     * @type {Matrix} 
     */
    Value {
        get => this.get_Value()
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * Initializes a new instance of the [TransformGroup](transformgroup.md) class.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Media.TransformGroup")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {TransformCollection} 
     */
    get_Children() {
        if (!this.HasProp("__ITransformGroup")) {
            if ((queryResult := this.QueryInterface(ITransformGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformGroup := ITransformGroup(outPtr)
        }

        return this.__ITransformGroup.get_Children()
    }

    /**
     * 
     * @param {TransformCollection} value 
     * @returns {HRESULT} 
     */
    put_Children(value) {
        if (!this.HasProp("__ITransformGroup")) {
            if ((queryResult := this.QueryInterface(ITransformGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformGroup := ITransformGroup(outPtr)
        }

        return this.__ITransformGroup.put_Children(value)
    }

    /**
     * 
     * @returns {Matrix} 
     */
    get_Value() {
        if (!this.HasProp("__ITransformGroup")) {
            if ((queryResult := this.QueryInterface(ITransformGroup.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__ITransformGroup := ITransformGroup(outPtr)
        }

        return this.__ITransformGroup.get_Value()
    }

;@endregion Instance Methods
}
