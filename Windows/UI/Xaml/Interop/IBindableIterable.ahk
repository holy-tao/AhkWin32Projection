#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBindableIterator.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Extends [IIterable](../windows.foundation.collections/iiterable_1.md) to enable data-binding infrastructure requirements.
  * 
  * > **.NET**
  * > This interface appears as [System.Collections.IEnumerable](/dotnet/api/system.collections.ienumerable?view=dotnet-uwp-10.0&preserve-view=true).
 * @remarks
 * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IEnumerable](/dotnet/api/system.collections.ienumerable?view=dotnet-uwp-10.0&preserve-view=true) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindableiterable
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class IBindableIterable extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindableIterable
     * @type {Guid}
     */
    static IID => Guid("{036d2c08-df29-41af-8aa2-d774be62ba6f}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["First"]

    /**
     * Returns a bindable iterator that iterates over the items in the collection.
     * @remarks
     * This interface supports the creation of data bindable collections in C++. When programming with .NET, this interface is hidden and developers should use the [System.Collections.IEnumerable](/dotnet/api/system.collections.ienumerable?view=dotnet-uwp-10.0&preserve-view=true) interface instead.
     * @returns {IBindableIterator} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindableiterable.first
     */
    First() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBindableIterator(result_)
    }
}
