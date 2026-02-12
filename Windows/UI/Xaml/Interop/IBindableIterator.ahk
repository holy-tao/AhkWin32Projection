#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Supports bindable iteration over a collection.
 * @remarks
 * This interface supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true). For more info, see [Binding to collections](/windows/uwp/data-binding/data-binding-quickstart).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindableiterator
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class IBindableIterator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindableIterator
     * @type {Guid}
     */
    static IID => Guid("{6a1d6c07-076d-49f2-8314-f52c9c9a8331}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "get_HasCurrent", "MoveNext"]

    /**
     * Gets the current item in the collection.
     * @remarks
     * This interface supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindableiterator.current
     * @type {IInspectable} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * Gets a value that indicates whether there is a current item or the iterator is at the end of the collection.
     * @remarks
     * This interface supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindableiterator.hascurrent
     * @type {Boolean} 
     */
    HasCurrent {
        get => this.get_HasCurrent()
    }

    /**
     * 
     * @returns {IInspectable} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasCurrent() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Moves the iterator forward to the next item and returns [HasCurrent](ibindableiterator_hascurrent.md).
     * @remarks
     * This interface supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true).
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindableiterator.movenext
     */
    MoveNext() {
        result := ComCall(8, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }
}
