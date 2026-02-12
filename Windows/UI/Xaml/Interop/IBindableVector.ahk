#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IBindableVectorView.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a writeable vector collection of objects that is bindable.
  * 
  * 
  * 
  * > **.NET**
  * > This interface appears as [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true).
 * @remarks
 * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
 * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector
 * @namespace Windows.UI.Xaml.Interop
 * @version WindowsRuntime 1.4
 */
class IBindableVector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IBindableVector
     * @type {Guid}
     */
    static IID => Guid("{393de7de-6fd0-4c0d-bb71-47244a113e93}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAt", "get_Size", "GetView", "IndexOf", "SetAt", "InsertAt", "RemoveAt", "Append", "RemoveAtEnd", "Clear"]

    /**
     * Gets the number of items in the vector.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.size
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    /**
     * Returns the item at the specified index in the vector.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {Integer} index The zero-based index of the item in the vector to return.
     * @returns {IInspectable} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.getat
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
     * Returns an immutable view of the vector.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @returns {IBindableVectorView} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.getview
     */
    GetView() {
        result := ComCall(8, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IBindableVectorView(result_)
    }

    /**
     * Returns the index of a specified item in the vector.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {IInspectable} value The item to find in the vector.
     * @param {Pointer<UInt32>} index The zero-based index of the item if found. 0 is returned if the item is not found, so be sure to check the return value.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.indexof
     */
    IndexOf(value, index) {
        result := ComCall(9, this, "ptr", value, "ptr", index, "int*", &returnValue := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return returnValue
    }

    /**
     * Sets the item value at the specified index of the vector.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {Integer} index The zero-based index of the vector, at which to set the value.
     * @param {IInspectable} value The item value to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.setat
     */
    SetAt(index, value) {
        result := ComCall(10, this, "uint", index, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Inserts an item into a vector at a specified index.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {Integer} index The index at which to insert.
     * @param {IInspectable} value The item to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.insertat
     */
    InsertAt(index, value) {
        result := ComCall(11, this, "uint", index, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the item at the specified index in the vector.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {Integer} index The zero-based index of the vector, at which to remove the item.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.removeat
     */
    RemoveAt(index) {
        result := ComCall(12, this, "uint", index, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Appends an item to the end of the vector.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {IInspectable} value The item to append to the vector.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.append
     */
    Append(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the last item in the vector.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.removeatend
     */
    RemoveAtEnd() {
        result := ComCall(14, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all items from the vector.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.IList](/dotnet/api/system.collections.ilist?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.ui.xaml.interop.ibindablevector.clear
     */
    Clear() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
