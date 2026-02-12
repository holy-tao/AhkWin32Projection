#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IMapView.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an associative collection, also known as a map or a dictionary.
  * 
  * > **.NET**
  * > This interface appears to .NET code as [System.Collections.Generic.IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) due to .NET language projection. In any case where a Windows Runtime type has implemented IMap&lt;K,V&gt;, .NET code can use the APIs of [IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) instead.
 * @remarks
 * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface if they want to implement a map/dictionary type. In any case where a Windows Runtime type has implemented IMap&lt;K,V&gt;, .NET code can use the APIs of [IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) instead. This includes all the existing Windows Runtime API and also scenarios such as using the APIs of Windows Runtime components originally implemented in Visual C++ component extensions (C++/CX) from a C# or Visual Basic app.
 * 
 * The IMap&lt;K,V&gt; interface represents a collection of key-value pairs where a value can be accessed by its associated key. Properties and methods of IMap&lt;K,V&gt; support dictionary-type functionality, such as getting the size of the collection, and adding and removing items at specified locations in the collection. Additionally, the [GetView](imap_2_getview_37498667.md) method provides a snapshot of the map whose observable state does not change. The snapshot is useful when you need a view of the collection to refer to in subsequent operations that involve IMap&lt;K,V&gt;.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IMap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMap
     * @type {Guid}
     */
    static IID => Guid("{3c2925fe-8519-45c1-aa79-197b6718c1c1}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lookup", "get_Size", "HasKey", "GetView", "Insert", "Remove", "Clear"]

    /**
     * @type {Integer} 
     */
    Size {
        get => this.get_Size()
    }

    __New(K, V, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.K := K
        this.V := V
    }

    /**
     * Returns the item at the specified key in the map.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * 
     * Use the [HasKey](imap_2_haskey_1926693983.md) method to determine whether the key exists in the map.
     * @param {Generic} key The key associated with the item to locate.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.lookup
     */
    Lookup(key) {
        result := ComCall(6, this, "ptr", key, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return this.V.Call(output_)
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
     * Determines whether the map contains the specified key.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {Generic} key The key associated with the item to locate.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.haskey
     */
    HasKey(key) {
        result := ComCall(8, this, "ptr", key, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Returns an immutable view of the map.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * 
     * If changes are made to the map, such as adding, modifying, or deleting elements,
     * the map view is permitted to raise an exception for all future operations.
     * @returns {IMapView<Generic, Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.getview
     */
    GetView() {
        result := ComCall(9, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMapView(this.K, this.V, output_)
    }

    /**
     * Inserts or replaces an item in the map.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {Generic} key The key associated with the item to insert.
     * @param {Generic} value The item to insert.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.insert
     */
    Insert(key, value) {
        result := ComCall(10, this, "ptr", key, "ptr", value, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Removes an item from the map.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {Generic} key The key associated with the item to remove.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.remove
     */
    Remove(key) {
        result := ComCall(11, this, "ptr", key, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Removes all items from the map.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imap-2.clear
     */
    Clear() {
        result := ComCall(12, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    __Item[key] {
        get => this.Lookup(key)
        set => this.Insert(key, value)
    }
}
