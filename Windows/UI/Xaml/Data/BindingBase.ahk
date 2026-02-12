#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\DependencyObject.ahk
#Include .\IBindingBase.ahk
#Include .\IBindingBaseFactory.ahk
#Include ..\..\..\..\Guid.ahk

/**
 * Provides a base class for the [Binding](binding.md) class.
 * @remarks
 * 
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.data.bindingbase
 * @namespace Windows.UI.Xaml.Data
 * @version WindowsRuntime 1.4
 */
class BindingBase extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IBindingBase

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IBindingBase.IID

;@endregion Static Properties

;@region Static Methods
    /**
     * 
     * @returns {BindingBase} 
     */
    static CreateInstance() {
        if (!BindingBase.HasProp("__IBindingBaseFactory")) {
            activatableClassId := HSTRING.Create("Windows.UI.Xaml.Data.BindingBase")
            factoryPtr := WinRT.RoGetActivationFactory(activatableClassId, IBindingBaseFactory.IID)
            BindingBase.__IBindingBaseFactory := IBindingBaseFactory(factoryPtr)
        }

        return BindingBase.__IBindingBaseFactory.CreateInstance(0, Buffer(A_PtrSize))
    }

;@endregion Static Methods

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
