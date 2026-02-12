#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data for the changed event of a map collection.
 * @remarks
 * IMapChangedEventArgs&lt;K&gt; is specifically used for the [MapChanged](iobservablemap_2_mapchanged.md) event of the [IObservableMap<K,V>](iobservablemap_2.md) interface, via the [MapChangedEventHandler<K,V>](mapchangedeventhandler_2.md) delegate. It's also used for [PropertySet.MapChanged](propertyset_mapchanged.md).
 * 
 * .NET developers can get instances of this interface via handling the [PropertySet.MapChanged](propertyset_mapchanged.md) event or the [MapChanged](iobservablemap_2_mapchanged.md) event from an [IObservableMap](iobservablemap_2.md) instance. Even though the remainder of the collection support for [IObservableMap](iobservablemap_2.md) or [PropertySet](propertyset.md) uses language projections that change [IMap<K,V>](imap_2.md) APIs to [IDictionary&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.idictionary-2?view=dotnet-uwp-10.0&preserve-view=true) APIs, the **MapChanged** event, its delegates and its event data aren't changed by the projection and so "Map" (as opposed to "Dictionary") remains in the API names.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.imapchangedeventargs-1
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IMapChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMapChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{9939f4df-050a-4c0f-aa60-77075f9c4777}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CollectionChange", "get_Key"]

    /**
     * @type {Integer} 
     */
    CollectionChange {
        get => this.get_CollectionChange()
    }

    /**
     * @type {Generic} 
     */
    Key {
        get => this.get_Key()
    }

    __New(K, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.K := K
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CollectionChange() {
        result := ComCall(6, this, "int*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * 
     * @returns {Generic} 
     */
    get_Key() {
        result := ComCall(7, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return this.K.Call(output_)
    }
}
