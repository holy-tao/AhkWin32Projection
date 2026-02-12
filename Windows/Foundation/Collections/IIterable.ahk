#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\IIterator.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Exposes an iterator that supports simple iteration over a collection of a specified type.
  * 
  * > **.NET**
  * > This interface appears as [System.Collections.Generic.IEnumerable&lt;T&gt;](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true). In any case where a Windows Runtime type has implemented IIterable&lt;T&gt;, .NET code can use the APIs of [IEnumerable&lt;T&gt;](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) instead. C# code can use **foreach**, Visual Basic code can use **For Each...Next**. All the .NET extension methods that are based on [IEnumerable&lt;T&gt;](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) and included in .NET for UWP apps are accessible (including the **System.Linq** extensions, so long as you've included the namespace).
 * @remarks
 * When programming with .NET, this interface is hidden and developers should use the [System.Collections.Generic.IEnumerable&lt;T&gt;](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) interface. Because of how the projections were done, the [GetEnumerator](/dotnet/api/system.collections.ienumerable.getenumerator?view=dotnet-uwp-10.0&preserve-view=true) method isn't always available as a direct callable method on the types that project [IEnumerable&lt;T&gt;](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true) as implemented, but enumerating the collection with the standard enumeration syntax (**foreach**) is still supported. The compiler does the type-casting for you and you won't need to cast to `IEnumerable` explicitly. If you do need to cast explicitly, for example if you want to call [GetEnumerator](/dotnet/api/system.collections.ienumerable.getenumerator?view=dotnet-uwp-10.0&preserve-view=true) from a class, cast to [IEnumerab&lt;T&gt;](/dotnet/api/system.collections.generic.ienumerable-1?view=dotnet-uwp-10.0&preserve-view=true), using a constraint in the cast that matches the item type of the collection.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterable-1
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IIterable extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IIterable
     * @type {Guid}
     */
    static IID => Guid("{faa585ea-6214-4217-afda-7f46de5869b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["First"]

    __New(T, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.T := T
    }

    /**
     * Returns an iterator for the items in the collection.
     * @remarks
     * When programming with .NET, this interface is hidden, and you should use the [System.Collections.Generic.IEnumerable\<T\>](/dotnet/api/system.collections.generic.ienumerable-1.getenumerator) method.
     * 
     * If changes are made to the collection, such as adding, modifying, or deleting elements,
     * the iterator is permitted to raise an exception for all future operations.
     * @returns {IIterator<Generic>} 
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.iiterable-1.first
     */
    First() {
        result := ComCall(6, this, "ptr*", &output_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IIterator(this.T, output_)
    }

    __Enum(numVars) {
        if(numVars != 1)
            throw ValueError(this.GetRuntimeClassName().ToString() " only supports iteration with 1 variable", -1, numVars)
    
        return this.First()
    }
}
