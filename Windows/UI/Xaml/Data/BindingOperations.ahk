#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IBindingOperations.ahk
#Include .\IBindingOperationsStatics.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides the static [SetBinding](bindingoperations_setbinding_746099660.md) method.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.bindingoperations
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class BindingOperations extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBindingOperations

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBindingOperations.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * Associates a [Binding](binding.md) with a target property on a target object. This method is the code equivalent to using a [{Binding} markup extension](/windows/uwp/xaml-platform/binding-markup-extension) in XAML markup.
     * @remarks
     * You can bind to custom dependency properties or custom attached properties, the identifier you pass as the *dp* parameter doesn't have to be a Windows Runtime defined property.
     * 
     * BindingOperations.SetBinding is a static utility method, and does basically the same thing as [FrameworkElement.SetBinding](../windows.ui.xaml/frameworkelement_setbinding_28713777.md). It's more common to use [FrameworkElement.SetBinding](../windows.ui.xaml/frameworkelement_setbinding_28713777.md) because it's an instance method. One important difference though is that BindingOperations.SetBinding can use a *target* value of any [DependencyObject](../windows.ui.xaml/dependencyobject.md), whereas [FrameworkElement.SetBinding](../windows.ui.xaml/frameworkelement_setbinding_28713777.md) can by definition only be used for a [FrameworkElement](../windows.ui.xaml/frameworkelement.md) target. This doesn't usually matter for most Windows Runtime classes used for XAML UI, because these are mostly [FrameworkElement](../windows.ui.xaml/frameworkelement.md) subclasses anyways. But the distinction might matter if you are targeting bindings on your own custom classes that derive from [DependencyObject](../windows.ui.xaml/dependencyobject.md) or [UIElement](../windows.ui.xaml/uielement.md).
     * 
     * <!--Other frameworks provide an expression object as the return value, which can be used to manipulate properties of the binding after it is established but without requiring the binding to be remade. Not clear if anything like that functionality exists.-->
     * 
     * > [!NOTE]
     * > Calling the SetBinding method and passing in a new [Binding](binding.md) object won't necessarily remove an existing binding. Instead, you should first call the [DependencyObject.ClearValue](../windows.ui.xaml/dependencyobject_clearvalue_1095854009.md) method, then call SetBinding.
     * @param {DependencyObject} target The object that should be the target of the evaluated binding.
     * @param {DependencyProperty} dp The property on the target to bind, specified by its identifier. These identifiers are usually available as static read-only properties on the type that defines the *target* object, or one of its base types. You can also bind to attached properties, but see Remarks.
     * @param {BindingBase} binding_ The binding to assign to the target property. This [Binding](binding.md) should be initialized: important [Binding](binding.md) properties such as [Path](binding_path.md) should already be set before passing it as the parameter.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.bindingoperations.setbinding
     */
    static SetBinding(target, dp, binding_) {
        if (!BindingOperations.HasProp("__IBindingOperationsStatics")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.BindingOperations")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBindingOperationsStatics.IID)
            BindingOperations.__IBindingOperationsStatics := IBindingOperationsStatics(factoryPtr)
        }

        return BindingOperations.__IBindingOperationsStatics.SetBinding(target, dp, binding_)
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
