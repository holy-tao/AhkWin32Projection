#Requires AutoHotkey v2.0 64-bit

#Include ..\..\..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\DependencyObject.ahk
#Include .\IIRawElementProviderSimple.ahk
#Include ..\..\..\..\..\Guid.ahk

/**
 * Provides methods and properties that expose basic information about a UI element. IRawElementProviderSimple is a Windows Runtime class, not an interface.
 * @remarks
 * This type is not an interface in this implementation. In fact, it is a [DependencyObject](../windows.ui.xaml/dependencyobject.md), and includes basic dependency property support. The main reason for the specific implementation of IRawElementProviderSimple in the Windows Runtime is to provide the input parameter and return value type for [FindItemByProperty](iitemcontainerprovider_finditembyproperty_1997743353.md).
 * 
 * Because it's a class, IRawElementProviderSimple can't be used for the COM scenario where providers add properties or control patterns on a UI element that already has a provider.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.automation.provider.irawelementprovidersimple
 * @namespace Windows.UI.Xaml.Automation.Provider
 * @version WindowsRuntime 1.4
 */
class IRawElementProviderSimple extends DependencyObject {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IIRawElementProviderSimple

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IIRawElementProviderSimple.IID

;@endregion Static Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

;@endregion Instance Methods
}
