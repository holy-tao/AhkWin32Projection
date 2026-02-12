#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\BindingExpressionBase.ahk
#Include .\IBindingExpression.ahk
#Include .\IBindingExpressionFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Contains information about a single instance of a [Binding](binding.md).
 * @remarks
 * The [Binding](binding.md) class is the high-level class for the declaration of a binding. The BindingExpression class is the underlying object that maintains the connection between the binding source and the binding target. A [Binding](binding.md) contains all the information that can be shared across several BindingExpression objects. A BindingExpression is an instance expression that cannot be shared and that contains all the instance information about the [Binding](binding.md).
 * 
 * You can obtain a BindingExpression object by calling the [GetBindingExpression](../windows.ui.xaml/frameworkelement_getbindingexpression_1210399878.md) method on an object, specifying the dependency property that has the binding.
 * 
 * <!--Worth mentioning that because GetBindingExpression is on FE, you can't use the Explicit update technique on custom elements that derive from DO rather than FE?, because you can't get the BindingExpression? BindingOperations.SetBinding in WPF used to return the BindingExpression and perhaps that was the reason.-->
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.bindingexpression
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class BindingExpression extends BindingExpressionBase {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBindingExpression

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBindingExpression.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * Gets the binding source object that this [BindingExpression](bindingexpression.md) uses.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.bindingexpression.dataitem
     * @type {IInspectable} 
     */
    DataItem {
        get => this.get_DataItem()
    }

    /**
     * Gets the [Binding](binding.md) object of this [BindingExpression](bindingexpression.md).
     * @remarks
     * You can't set the property values of a [Binding](binding.md) object after that binding has been attached to a target element and target property. If you attempt this you'll get a run-time exception. Any [Binding](binding.md) value you get back from ParentBinding is by definition a binding that's already been applied to a target, because you obtained the [BindingExpression](bindingexpression.md) by calling [FrameworkElement.GetBindingExpression](../windows.ui.xaml/frameworkelement_getbindingexpression_1210399878.md).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.bindingexpression.parentbinding
     * @type {Binding} 
     */
    ParentBinding {
        get => this.get_ParentBinding()
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
    get_DataItem() {
        if (!this.HasProp("__IBindingExpression")) {
            if ((queryResult := this.QueryInterface(IBindingExpression.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBindingExpression := IBindingExpression(outPtr)
        }

        return this.__IBindingExpression.get_DataItem()
    }

    /**
     * 
     * @returns {Binding} 
     */
    get_ParentBinding() {
        if (!this.HasProp("__IBindingExpression")) {
            if ((queryResult := this.QueryInterface(IBindingExpression.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBindingExpression := IBindingExpression(outPtr)
        }

        return this.__IBindingExpression.get_ParentBinding()
    }

    /**
     * Sends the current binding target value to the binding source property in **TwoWay** bindings.
     * @remarks
     * If the [UpdateSourceTrigger](binding_updatesourcetrigger.md) value of a two-way binding is set to **Explicit**, you must call the UpdateSource method or the changes will not propagate back to the source.
     * 
     * Calling this method does nothing if the [Mode](binding_mode.md) value of the binding is not **TwoWay**.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.bindingexpression.updatesource
     */
    UpdateSource() {
        if (!this.HasProp("__IBindingExpression")) {
            if ((queryResult := this.QueryInterface(IBindingExpression.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IBindingExpression := IBindingExpression(outPtr)
        }

        return this.__IBindingExpression.UpdateSource()
    }

;@endregion Instance Methods
}
