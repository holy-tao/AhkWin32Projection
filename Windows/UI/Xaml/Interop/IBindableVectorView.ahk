#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a read-only vector collection of objects that is bindable.
 * @remarks
 * This interface supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true). For more info, see [Binding to collections](/windows/uwp/data-binding/data-binding-quickstart).
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevectorview
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class IBindableVectorView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindableVectorView
     * @type {Guid}
     */
    static IID => Guid("{346dd6e7-976e-4bc3-815d-ece243bc0f33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAt", "get_Size", "IndexOf"]

    /**
     * Gets the number of items in the vector.
     * @remarks
     * This interface supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true).
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevectorview.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * Returns the item at the specified index in the vector.
     * @remarks
     * This interface supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true).
     * @param {Integer} index The zero-based index of the item in the vector to return.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevectorview.getat
     */
    GetAt(index) {
        result := ComCall(6, this, "uint", index, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IInspectable(result_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Returns the index of a specified item in the vector.
     * @remarks
     * This interface supports the creation of data bindable collections in C++. When programming with .NET, you should use [ObservableCollection(Of T)](/dotnet/api/system.collections.objectmodel.observablecollection-1?view=dotnet-uwp-10.0&preserve-view=true) or implement [IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) and [INotifyCollectionChanged](/dotnet/api/system.collections.specialized.inotifycollectionchanged?view=dotnet-uwp-10.0&preserve-view=true).
     * @param {IInspectable} value The item to find in the vector.
     * @param {Pointer<UInt32>} index The zero-based index of the item if found. 0 is returned if the item is not found, so be sure to check the return value.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevectorview.indexof
     */
    IndexOf(value, index) {
        result := ComCall(8, this, "ptr", value, "ptr", index, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }
}
