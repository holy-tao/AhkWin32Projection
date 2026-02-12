#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IElementFactoryGetArgs.ahk
#Include .\IElementFactoryGetArgsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the optional arguments to use when calling an implementation of the [IElementFactory](ielementfactory.md)'s [GetElement](ielementfactory_getelement_92222689.md) method.
 * @remarks
 * For more info, see the [GetElement](ielementfactory_getelement_92222689.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementfactorygetargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ElementFactoryGetArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IElementFactoryGetArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IElementFactoryGetArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ElementFactoryGetArgs} 
     */
    static CreateInstance() {
        if (!ElementFactoryGetArgs.HasProp("__IElementFactoryGetArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ElementFactoryGetArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementFactoryGetArgsFactory.IID)
            ElementFactoryGetArgs.__IElementFactoryGetArgsFactory := IElementFactoryGetArgsFactory(factoryPtr)
        }

        return ElementFactoryGetArgs.__IElementFactoryGetArgsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the data item for which an appropriate element tree should be realized when calling [GetElement](ielementfactory_getelement_92222689.md).
     * @remarks
     * The implementation on [DataTemplate](datatemplate.md) for [GetElement](ielementfactory_getelement_92222689.md) does not use the Data value.
     * 
     * However, [DataTemplateSelector](../windows.ui.xaml.controls/datatemplateselector.md)'s implementation does use the Data value as the *item* argument when it invokes the [SelectTemplate](../windows.ui.xaml.controls/datatemplateselector_selecttemplate_737484049.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementfactorygetargs.data
     * @type {IInspectable} 
     */
    Data {
        get => this.get_Data()
        set => this.put_Data(value)
    }

    /**
     * Gets or sets the [UIElement](uielement.md) that is expected to be the parent of the realized element from [GetElement](ielementfactory_getelement_92222689.md).
     * @remarks
     * This value is optional. When used it can enable a performance optimization for implementations of [GetElement](ielementfactory_getelement_92222689.md) that return recycled elements. For more info, see the remarks for the [DataTemplate.RecycleElement](datatemplate_recycleelement_1023702976.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementfactorygetargs.parent
     * @type {UIElement} 
     */
    Parent {
        get => this.get_Parent()
        set => this.put_Parent(value)
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
    get_Data() {
        if (!this.HasProp("__IElementFactoryGetArgs")) {
            if ((queryResult := this.QueryInterface(IElementFactoryGetArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactoryGetArgs := IElementFactoryGetArgs(outPtr)
        }

        return this.__IElementFactoryGetArgs.get_Data()
    }

    /**
     * 
     * @param {IInspectable} value 
     * @returns {HRESULT} 
     */
    put_Data(value) {
        if (!this.HasProp("__IElementFactoryGetArgs")) {
            if ((queryResult := this.QueryInterface(IElementFactoryGetArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactoryGetArgs := IElementFactoryGetArgs(outPtr)
        }

        return this.__IElementFactoryGetArgs.put_Data(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Parent() {
        if (!this.HasProp("__IElementFactoryGetArgs")) {
            if ((queryResult := this.QueryInterface(IElementFactoryGetArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactoryGetArgs := IElementFactoryGetArgs(outPtr)
        }

        return this.__IElementFactoryGetArgs.get_Parent()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Parent(value) {
        if (!this.HasProp("__IElementFactoryGetArgs")) {
            if ((queryResult := this.QueryInterface(IElementFactoryGetArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactoryGetArgs := IElementFactoryGetArgs(outPtr)
        }

        return this.__IElementFactoryGetArgs.put_Parent(value)
    }

;@endregion Instance Methods
}
