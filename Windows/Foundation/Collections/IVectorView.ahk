#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an immutable view into a vector.
  * 
  * > **.NET**
  * > This interface appears to .NET code as [System.Collections.Generic.IReadOnlyList&lt;T&gt;](/dotnet/api/system.collections.generic.ireadonlylist-1?view=dotnet-uwp-10.0&preserve-view=true) due to .NET language projection. In any case where a Windows Runtime type has implemented IVectorView&lt;T&gt;, .NET code can use the APIs of [IReadOnlyList&lt;T&gt;](/dotnet/api/system.collections.generic.ireadonlylist-1?view=dotnet-uwp-10.0&preserve-view=true) instead.
 * @remarks
 * For read-write collections, the IVectorView&lt;T&gt; interface is still relevant, because the [IVector.GetView](ivector_1_getview_37498667.md) method returns an IVectorView&lt;T&gt; instance.
 * 
 * If the underlying collection changes, methods and properties of the IVectorView&lt;T&gt; interface may throw an exception.
 * 
 * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
 * > If the underlying collection has changed,
 * > methods and properties may throw a `hresult_changed_state` exception.
 * 
 * > [**C++/CX**](/cpp/cppcx/)
 * > If the underlying collection has changed,
 * > methods and properties may throw a `ChangedStateException` exception.
 * 
 * When programming with .NET, this interface is hidden and developers should use the IReadOnlyList&lt;T&gt; interface if they want to implement a read-only vector/list type. In any case where a Windows Runtime type has implemented IVectorView&lt;T&gt;, .NET code can use the APIs of IReadOnlyList&lt;T&gt; instead. This includes all the existing Windows Runtime API and also scenarios such as using the APIs of Windows Runtime components originally implemented in Visual C++ component extensions (C++/CX) from a C# or Visual Basic app.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorview-1
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IVectorView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVectorView
     * @type {Guid}
     */
    static IID => Guid("{bbe1fa4c-b0e3-4583-baef-1f1b2e483e56}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetAt", "get_Size", "IndexOf", "GetMany"]

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
     * Returns the item at the specified index in the vector view.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the IReadOnlyList&lt;T&gt; interface.
     * 
     * If the index is out of range,
     * the view will throw an exception.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the index is out of range,
     * > the view will throw a `hresult_out_of_bounds` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the index is out of range,
     * > the view will throw a `OutOfBoundsException` exception.
     * 
     * If the underlying collection has changed,
     * the view may throw an exception.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the underlying collection has changed,
     * > the view may throw a `hresult_changed_state` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the underlying collection has changed,
     * > the view may throw a `ChangedStateException` exception.
     * @param {Integer} index The zero-based index of the item.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorview-1.getat
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
     * Retrieves the index of a specified item in the vector view.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the IReadOnlyList&lt;T&gt; interface.
     * 
     * If the underlying collection has changed,
     * the view may throw an exception.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the underlying collection has changed,
     * > the view may throw a `hresult_changed_state` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the underlying collection has changed,
     * > the view may throw a `ChangedStateException` exception.
     * @param {Generic} value The item to find in the vector view.
     * @param {Pointer<UInt32>} index If the item is found, this is the zero-based index of the item; otherwise, this parameter is 0.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorview-1.indexof
     */
    IndexOf(value, index) {
        result := ComCall(8, this, "ptr", value, "ptr", index, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Retrieves multiple items from the vector view beginning at the given index.
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
     * > If the start index is greater than or equal to the size of the collection,
     * > the view will throw a `hresult_out_of_bounds` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the start index is greater than or equal to the size of the collection,
     * > the view will throw a `OutOfBoundsException` exception.
     * 
     * If the underlying collection has changed,
     * the view may throw an exception.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the underlying collection has changed,
     * > the view may throw a `hresult_changed_state` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the underlying collection has changed,
     * > the view may throw a `ChangedStateException` exception.
     * @param {Integer} startIndex The zero-based index to start at.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array that receives the items copied from the vector view.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > A [winrt::array_view](/uwp/cpp-ref-for-winrt/array-view) that receives the items copied from the vector view.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorview-1.getmany
     */
    GetMany(startIndex, items_length, items) {
        items_lengthMarshal := items_length is VarRef ? "uint*" : "ptr"
        itemsMarshal := items is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, "uint", startIndex, items_lengthMarshal, items_length, itemsMarshal, items, "uint*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    __Item[index] {
        get => this.GetAt(index)
        set => this.SetAt(index, value) 
    }
}
