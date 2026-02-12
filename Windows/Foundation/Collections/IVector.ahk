#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IVectorView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a random-access collection of elements.
  * 
  * > **.NET**
  * > This interface appears to .NET code as [System.Collections.Generic.IList&lt;T&gt;](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true) due to .NET language projection. In any case where a Windows Runtime type has implemented IVector&lt;T&gt;, .NET code can use the APIs of [IList&lt;T&gt;](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true) instead.
 * @remarks
 * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IList&lt;T&gt;](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true) interface if they want to implement a vector/list type. In any case where a Windows Runtime type has implemented IVector&lt;T&gt;, .NET code can use the APIs of [IList&lt;T&gt;](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true) instead. This includes all the existing Windows Runtime API and also scenarios such as using the APIs of Windows Runtime components originally implemented in Visual C++ component extensions (C++/CX) from a C# or Visual Basic app.
 * 
 * The IVector&lt;T&gt; interface represents a collection of objects of a specified type that can be individually accessed by index. Properties and methods of IVector&lt;T&gt; support list-type functionality, such as getting the size of the collection, and adding and removing items at specified locations in the collection. Additionally, the [GetView](ivector_1_getview_37498667.md) method provides a snapshot of the vector whose observable state does not change. The snapshot is useful when you need a view of the collection to refer to in subsequent operations that involve IVector&lt;T&gt;.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IVector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVector
     * @type {Guid}
     */
    static IID => Guid("{913337e9-11a1-4345-a3a2-4e7f956e222d}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAt", "get_Size", "GetView", "IndexOf", "SetAt", "InsertAt", "RemoveAt", "Append", "RemoveAtEnd", "Clear", "GetMany", "ReplaceAll"]

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __New(T, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.T := T
    }

    /**
     * Returns the item at the specified index in the vector.
     * @remarks
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * 
     * If the index is out of range,
     * the view will throw an exception.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the index is out of range,
     * > the vector will throw a `hresult_out_of_bounds` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the index is out of range,
     * > the vector will throw a `OutOfBoundsException` exception.
     * @param {Integer} index The zero-based index of the item.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.getat
     */
    GetAt(index) {
        result := ComCall(6, this, "uint", index, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return this.T.Call(output_)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Size() {
        result := ComCall(7, this, "uint*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Returns an immutable view of the vector.
     * @remarks
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * 
     * If changes are made to the vector, such as adding, modifying, or deleting elements, then the vector view is permitted to raise an exception for all future operations.
     * @returns {IVectorView<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.getview
     */
    GetView() {
        result := ComCall(8, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(this.T, output_)
    }

    /**
     * Retrieves the index of a specified item in the vector.
     * @remarks
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * 
     * If the *index* parameter is 0, it indicates that the item is the first item in the array or that the item was not found. To determine whether the item found is the first item, check the return value of this method before you check the *index* parameter. If the return value is **true** and *index* is 0, then the item is the first item in the array. If the return value is **false**, then the item was not found and *index* is 0.
     * @param {Generic} value The item to find in the vector.
     * @param {Pointer<UInt32>} index If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.indexof
     */
    IndexOf(value, index) {
        result := ComCall(9, this, "ptr", value, "ptr", index, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Sets the value at the specified index in the vector.
     * @remarks
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * 
     * If the index is out of range,
     * the view will throw an exception.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the index is out of range,
     * > the vector will throw a `hresult_out_of_bounds` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the index is out of range,
     * > the vector will throw a `OutOfBoundsException` exception.
     * @param {Integer} index The zero-based index at which to set the value.
     * @param {Generic} value The item to set.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.setat
     */
    SetAt(index, value) {
        result := ComCall(10, this, "uint", index, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Inserts an item at a specified index in the vector.
     * @remarks
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * 
     * If the index is out of range,
     * the view will throw an exception.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the index is out of range,
     * > the vector will throw a `hresult_out_of_bounds` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the index is out of range,
     * > the vector will throw a `OutOfBoundsException` exception.
     * @param {Integer} index The zero-based index.
     * @param {Generic} value The item to insert.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.insertat
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
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * 
     * If the index is out of range,
     * the view will throw an exception.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the index is out of range,
     * > the vector will throw a `hresult_out_of_bounds` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the index is out of range,
     * > the vector will throw a `OutOfBoundsException` exception.
     * @param {Integer} index The zero-based index of the vector item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.removeat
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
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * @param {Generic} value The item to append to the vector.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.append
     */
    Append(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes the last item from the vector.
     * @remarks
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.removeatend
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
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.clear
     */
    Clear() {
        result := ComCall(15, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves multiple items from the the vector beginning at the given index.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > The correct syntax for the C++/WinRT language projection is `uint32_t GetMany(uint32_t startIndex, winrt::array_view<T> items);`.
     * @remarks
     * When programming with .NET, this interface is hidden. Use the IList interface instead. 
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > In addition to passing a **winrt::array_view\<T\>**, you can pass any object that's convertible to a **winrt::array_view\<T\>**, such as these examples.
     * > - C++ **std::array\<T, N\>**
     * > - C-style array of **T**
     * > - C++ **std::vector\<T\>**
     * > - { pointer, length }, where *pointer* is a pointer to a buffer of **T** objects, and *length* is the number of entries in the buffer
     * > - { first, last }, where *first* and *last* represent a range of **T** objects [first, last)
     * 
     * If the start index is greater than the size of the collection,
     * the view will throw an exception.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the start index is greater than the size of the collection,
     * > the view will throw a `hresult_out_of_bounds` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the start index is greater than the size of the collection,
     * > the view will throw a `OutOfBoundsException` exception.
     * @param {Integer} startIndex The zero-based index to start at.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array that receives the items copied from the vector.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > A [winrt::array_view](/uwp/cpp-ref-for-winrt/array-view) that receives the items copied from the vector.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.getmany
     */
    GetMany(startIndex, items_length, items) {
        items_lengthMarshal := items_length is VarRef ? "uint*" : "ptr"
        itemsMarshal := items is VarRef ? "ptr*" : "ptr"

        result := ComCall(16, this, "uint", startIndex, items_lengthMarshal, items_length, itemsMarshal, items, "uint*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Replaces all the items in the vector with the specified items.
     * @remarks
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IList\<T\>](/dotnet/api/system.collections.generic.ilist-1) interface.
     * @param {Integer} items_length 
     * @param {Pointer<Generic>} items The collection of items to add to the vector.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivector-1.replaceall
     */
    ReplaceAll(items_length, items) {
        result := ComCall(17, this, "uint", items_length, "ptr*", items, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }
}
