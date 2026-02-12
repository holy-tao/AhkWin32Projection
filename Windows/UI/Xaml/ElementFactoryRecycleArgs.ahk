#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IElementFactoryRecycleArgs.ahk
#Include .\IElementFactoryRecycleArgsFactory.ahk
#Include ..\..\..\Guid.ahk

/**
 * Represents the optional arguments to use when calling an implementation of the [IElementFactory](ielementfactory.md)'s [RecycleElement](ielementfactory_recycleelement_1023702976.md) method.
 * @remarks
 * For more info, see the [RecycleElement](ielementfactory_recycleelement_1023702976.md) method.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementfactoryrecycleargs
 * @namespace Windows.UI.Xaml
 * @version WindowsRuntime 1.4
 */
class ElementFactoryRecycleArgs extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IElementFactoryRecycleArgs

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IElementFactoryRecycleArgs.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {ElementFactoryRecycleArgs} 
     */
    static CreateInstance() {
        if (!ElementFactoryRecycleArgs.HasProp("__IElementFactoryRecycleArgsFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.ElementFactoryRecycleArgs")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IElementFactoryRecycleArgsFactory.IID)
            ElementFactoryRecycleArgs.__IElementFactoryRecycleArgsFactory := IElementFactoryRecycleArgsFactory(factoryPtr)
        }

        return ElementFactoryRecycleArgs.__IElementFactoryRecycleArgsFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Properties
    /**
     * Gets or sets the [UIElement](uielement.md) object to recycle when calling [RecycleElement](ielementfactory_recycleelement_1023702976.md).
     * @remarks
     * See the remarks for the [DataTemplate](datatemplate.md)'s [RecycleElement](datatemplate_recycleelement_1023702976.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementfactoryrecycleargs.element
     * @type {UIElement} 
     */
    Element {
        get => this.get_Element()
        set => this.put_Element(value)
    }

    /**
     * Gets or sets a reference to the current parent [UIElement](uielement.md) of the element being recycled.
     * @remarks
     * This value is optional. When provided it can enable a performance optimization for implementations of [GetElement](ielementfactory_getelement_92222689.md) that return recycled elements.  For more info, see the remarks for the [DataTemplate.RecycleElement](datatemplate_recycleelement_1023702976.md) method.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.elementfactoryrecycleargs.parent
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
     * @returns {UIElement} 
     */
    get_Element() {
        if (!this.HasProp("__IElementFactoryRecycleArgs")) {
            if ((queryResult := this.QueryInterface(IElementFactoryRecycleArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactoryRecycleArgs := IElementFactoryRecycleArgs(outPtr)
        }

        return this.__IElementFactoryRecycleArgs.get_Element()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Element(value) {
        if (!this.HasProp("__IElementFactoryRecycleArgs")) {
            if ((queryResult := this.QueryInterface(IElementFactoryRecycleArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactoryRecycleArgs := IElementFactoryRecycleArgs(outPtr)
        }

        return this.__IElementFactoryRecycleArgs.put_Element(value)
    }

    /**
     * 
     * @returns {UIElement} 
     */
    get_Parent() {
        if (!this.HasProp("__IElementFactoryRecycleArgs")) {
            if ((queryResult := this.QueryInterface(IElementFactoryRecycleArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactoryRecycleArgs := IElementFactoryRecycleArgs(outPtr)
        }

        return this.__IElementFactoryRecycleArgs.get_Parent()
    }

    /**
     * 
     * @param {UIElement} value 
     * @returns {HRESULT} 
     */
    put_Parent(value) {
        if (!this.HasProp("__IElementFactoryRecycleArgs")) {
            if ((queryResult := this.QueryInterface(IElementFactoryRecycleArgs.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IElementFactoryRecycleArgs := IElementFactoryRecycleArgs(outPtr)
        }

        return this.__IElementFactoryRecycleArgs.put_Parent(value)
    }

;@endregion Instance Methods
}
