#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a key-value pair. This is typically used as a constraint type when you need to encapsulate two type parameters into one to satisfy the constraints of another generic interface.
  * 
  * > [!NOTE]
  * > In .NET, this interface appears as [System.Collections.Generic.KeyValuePair&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.keyvaluepair-2?view=dotnet-uwp-10.0&preserve-view=true) (a structure, not an interface). In any case where a Windows Runtime type has implemented IKeyValuePair&lt;K,V&gt;, .NET code can use the APIs of [KeyValuePair](/dotnet/api/system.collections.generic.keyvaluepair-2?view=dotnet-uwp-10.0&preserve-view=true) instead.
 * @remarks
 * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.KeyValuePair&lt;TKey,TValue&gt;](/dotnet/api/system.collections.generic.keyvaluepair-2?view=dotnet-uwp-10.0&preserve-view=true) structure. In any case where a Windows Runtime type has implemented IKeyValuePair&lt;K,V&gt;, including when interfaces have inherited IKeyValuePair&lt;K,V&gt; or used it as an inner constraint, .NET code can treat it as a .NET [KeyValuePair](/dotnet/api/system.collections.generic.keyvaluepair-2?view=dotnet-uwp-10.0&preserve-view=true).
 * 
 * Key-value pairs are used in the [IMap&lt;K,V&gt;](imap_2.md) interface, when it inherits [IIterable&lt;T&gt;](iiterable_1.md). Practical implementations of [IMap&lt;K,V&gt;](imap_2.md) are iterable, and iterating or calling [First](iiterable_1_first_1920739956.md)/[Current](iiterator_1_current.md) explicitly will return instances of IKeyValuePair&lt;K,V&gt; using the same constraints as does the [IMap&lt;K,V&gt;](imap_2.md) implementation.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ikeyvaluepair-2
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IKeyValuePair extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKeyValuePair
     * @type {Guid}
     */
    static IID => Guid("{02b51929-c1c4-4a7e-8940-0312b5c18500}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Key", "get_Value"]

    /**
     * @type {Generic} 
     */
    Key {
        get => this.get_Key()
    }

    /**
     * @type {Generic} 
     */
    Value {
        get => this.get_Value()
    }

    __New(K, V, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.K := K
        this.V := V
    }

    /**
     * 
     * @returns {Generic} 
     */
    get_Key() {
        result := ComCall(6, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return this.K.Call(output_)
    }

    /**
     * 
     * @returns {Generic} 
     */
    get_Value() {
        result := ComCall(7, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return this.V.Call(output_)
    }
}
