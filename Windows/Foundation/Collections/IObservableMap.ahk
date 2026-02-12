#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Notifies listeners of dynamic changes to a map, such as when items are added or removed.
 * @remarks
 * The IObservableMap&lt;K,V&gt; interface enables clients to register for notification events to [IMap<K,V>](imap_2.md) collections. For example, you might use IObservableMap&lt;K,V&gt; when you need to keep two map structures synchronized. In this case, use the IObservableMap&lt;K,V&gt; interface to receive notification of changes, so that the associated data structure can be updated.
 * 
 * Observable collections are mainly useful for XAML data binding scenarios. For more info, see [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.iobservablemap-2
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IObservableMap extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObservableMap
     * @type {Guid}
     */
    static IID => Guid("{65df2bf5-bf39-41b5-aebc-5a9d865e472b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_MapChanged", "remove_MapChanged"]

    __New(K, V, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.K := K
        this.V := V
    }

    /**
     * 
     * @param {MapChangedEventHandler<Generic, Generic>} vhnd 
     * @returns {EventRegistrationToken} 
     */
    add_MapChanged(vhnd) {
        output_ := EventRegistrationToken()
        result := ComCall(6, this, "ptr", vhnd, "ptr", output_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return output_
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_MapChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
