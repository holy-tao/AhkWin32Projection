#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents an immutable view into a map.
  * 
  * > **.NET**
  * > This interface appears as [System.Collections.Generic.IReadOnlyDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) due to .NET language projection. In any case where a Windows Runtime type has implemented IMapView&lt;K,V&gt;, .NET code can use the APIs of [IReadOnlyDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) instead.
 * @remarks
 * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IReadOnlyDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface if they want to implement a read-only map/dictionary type. In any case where a Windows Runtime type has implemented IMapView&lt;K,V&gt;, .NET code can use the APIs of [IReadOnlyDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) instead. This includes all the existing Windows Runtime API and also scenarios such as using the APIs of Windows Runtime components originally implemented in C++ from a C# or Visual Basic app.
 * 
 * The IMapView&lt;K,V&gt; interface represents a collection of key-value pairs where a value can be accessed by its associated key. Properties and methods of IMapView&lt;K,V&gt; support dictionary-type functionality, such as getting the size of the collection, or lookups, but don't support adding or removing items because the map is read-only.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapview-2
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IMapView extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapView
     * @type {Guid}
     */
    static IID => Guid("{e480ce40-a338-4ada-adcf-272272e48cb9}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Lookup", "get_Size", "HasKey", "Split"]

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
     * Returns the item at the specified key in the map view.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IReadOnlyDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {Generic} key The key to locate in the map view.
     * @returns {Generic} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapview-2.lookup
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
     * Determines whether the map view contains the specified key.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IReadOnlyDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * @param {Generic} key The key to locate in the map view.
     * @returns {Boolean} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapview-2.haskey
     */
    HasKey(key) {
        result := ComCall(8, this, "ptr", key, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * Splits the map view into two views.
     * @remarks
     * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IReadOnlyDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.ireadonlydictionary-2?view=dotnet-uwp-10.0&preserve-view=true) interface.
     * 
     * The two views that result from the split operation may not contain the same number of items. The two views do not overlap.
     * 
     * If the [IMapView<K, V>](imapview_2.md) instance cannot be split, then both the first and second parameters are **null** when the method returns.
     * 
     * <!--How does this work? divide by two? what if 1 or 0 or any odd number?-->
     * @param {Pointer<IMapView>} first One half of the original map.
     * @param {Pointer<IMapView>} second The second half of the original map.
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapview-2.split
     */
    Split(first, second) {
        result := ComCall(9, this, "ptr", first, "ptr", second, "int")
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
