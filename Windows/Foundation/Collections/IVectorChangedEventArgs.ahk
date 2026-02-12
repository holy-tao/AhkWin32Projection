#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Provides data for the changed event of a vector.
 * @remarks
 * IVectorChangedEventArgs is specifically used for the [VectorChanged](iobservablevector_1_vectorchanged.md) event of the [IObservableVector&lt;T&gt;](iobservablevector_1.md) interface, via the [VectorChangedEventHandler](vectorchangedeventhandler_1.md) delegate.
 * 
 * .NET developers can get instances of this interface via handling the [VectorChanged](iobservablevector_1_vectorchanged.md) event from an [IObservableVector](iobservablevector_1.md) instance. Even though the remainder of the collection support for [IObservableVector](iobservablevector_1.md) uses language projections that change [IVector&lt;T&gt;](ivector_1.md) APIs to [IList&lt;T&gt;](/dotnet/api/system.collections.generic.ilist-1?view=dotnet-uwp-10.0&preserve-view=true) APIs, the [VectorChanged](iobservablevector_1_vectorchanged.md) event, its delegates and its event data aren't changed by the projection and so "Vector" (as opposed to "List") remains in the API names.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorchangedeventargs
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IVectorChangedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IVectorChangedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{575933df-34fe-4480-af15-07691f3d5d9b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CollectionChange", "get_Index"]

    /**
     * Gets the type of change that occurred in the vector.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorchangedeventargs.collectionchange
     * @type {Integer} 
     */
    CollectionChange {
        get => this.get_CollectionChange()
    }

    /**
     * Gets the position where the change occurred in the vector.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.ivectorchangedeventargs.index
     * @type {Integer} 
     */
    Index {
        get => this.get_Index()
    }

    /**
     * Describes the **IVectorChangedEventArgs::get_CollectionChange** method, and documents its syntax, parameters, return value, and requirements.
     * @returns {Integer} Type: **CollectionChange\***
     * 
     * A value from the [**CollectionChange**](/uwp/api/Windows.Foundation.Collections.CollectionChange) enumeration that describes the change.
     * @see https://learn.microsoft.com/windows/win32/ktop-src/WinRT/ivectorchangedeventargs-get-collectionchange
     */
    get_CollectionChange() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Index() {
        result := ComCall(7, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
