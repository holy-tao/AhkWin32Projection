#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Supports simple iteration over a collection.
 * @remarks
 * The IIterator&lt;T&gt; interface isn't explicitly hidden by the language projection for .NET, but the [IIterable\<T\>](iiterable_1.md) interface is hidden. For most .NET scenarios that specifically require an API for the iterator object, you'll probably use [IEnumerator\<T\>](/dotnet/api/system.collections.generic.ienumerator-1) (perhaps with a specific type constraint) as obtained from calling [IEnumerable\<T\>.GetEnumerator](/dotnet/api/system.collections.generic.ienumerable-1.getenumerator).
 * 
 * If changes are made to the collection, such as adding, modifying, or deleting elements, the iterator is permitted to raise an exception for all operations.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterator-1
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IIterator extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIterator
     * @type {Guid}
     */
    static IID => Guid("{6a79e863-4300-459a-9966-cbb660963ee1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Current", "get_HasCurrent", "MoveNext", "GetMany"]

    /**
     * @type {Generic} 
     */
    Current {
        get => this.get_Current()
    }

    /**
     * @type {Boolean} 
     */
    HasCurrent {
        get => this.get_HasCurrent()
    }

    __New(T, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.T := T
    }

    /**
     * 
     * @returns {Generic} 
     */
    get_Current() {
        result := ComCall(6, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return this.T.Call(output_)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_HasCurrent() {
        result := ComCall(7, this, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Advances the iterator to the next item in the collection.
     * @remarks
     * If the iterator is already past the end of the collection,
     * the iterator may throw an exception.
     * 
     * > **.NET Framework**
     * > If the iterator is already past the end of the collection,
     * > the iterator may throw a `COMException` exception
     * > with an HResult of `0x8000000B` (`E_BOUNDS`).
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the iterator is already past the end of the collection,
     * > the iterator may throw a `hresult_out_of_bounds` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the iterator is already past the end of the collection,
     * > the iterator may throw a `OutOfBoundsException` exception.
     * 
     * If the underlying collection has changed,
     * the iterator may throw an exception.
     * 
     * > **.NET Framework**
     * > If the underlying collection has changed,
     * > the iterator may throw a `COMException` exception
     * > with an HResult of `0x8000000C` (`E_CHANGED_STATE`).
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the underlying collection has changed,
     * > the iterator may throw a `hresult_changed_state` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the underlying collection has changed,
     * > the iterator may throw a `ChangedStateException` exception.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterator-1.movenext
     */
    MoveNext() {
        result := ComCall(8, this, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Retrieves multiple items from the iterator.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > The correct syntax for the C++/WinRT language projection is `uint32_t GetMany(winrt::array_view<T> items);`.
     * @remarks
     * The iterator is advanced past the items that were retrieved.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > In addition to passing a **winrt::array_view\<T\>**, you can pass any object that's convertible to a **winrt::array_view\<T\>**, such as these examples.
     * > - C++ **std::array\<T, N\>**
     * > - C-style array of **T**
     * > - C++ **std::vector\<T\>**
     * > - { pointer, length }, where *pointer* is a pointer to a buffer of **T** objects, and *length* is the number of entries in the buffer
     * > - { first, last }, where *first* and *last* represent a range of **T** objects [first, last)
     * 
     * If the underlying collection has changed,
     * the iterator may throw an exception.
     * 
     * > **.NET Framework**
     * > If the underlying collection has changed,
     * > the iterator may throw a `COMException` exception
     * > with an HResult of `0x8000000C` (`E_CHANGED_STATE`).
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > If the underlying collection has changed,
     * > the iterator may throw a `hresult_changed_state` exception.
     * 
     * > [**C++/CX**](/cpp/cppcx/)
     * > If the underlying collection has changed,
     * > the iterator may throw a `ChangedStateException` exception.
     * @param {Pointer<Integer>} items_length 
     * @param {Pointer<Pointer<Generic>>} items An array that receives the items retrieved from the iterator.
     * 
     * > [**C++/WinRT**](/windows/uwp/cpp-and-winrt-apis/)
     * > A [winrt::array_view](/uwp/cpp-ref-for-winrt/array-view) that receives the items retrieved from the iterator.
     * @returns {Integer} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterator-1.getmany
     */
    GetMany(items_length, items) {
        items_lengthMarshal := items_length is VarRef ? "uint*" : "ptr"
        itemsMarshal := items is VarRef ? "ptr*" : "ptr"

        result := ComCall(9, this, items_lengthMarshal, items_length, itemsMarshal, items, "uint*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Allows the IIterator to be used as an AutoHotkey enumerator
     */
    Call(&item) {
        if(!this.HasCurrent)
            return false
    
        item := this.Current
        this.MoveNext()
    }
}
