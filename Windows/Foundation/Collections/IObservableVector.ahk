#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\EventRegistrationToken.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * Notifies listeners of changes to the vector.
 * @remarks
 * The IObservableVector&lt;T&gt; interface enables clients to register for notification events for [IVector<T>](ivector_1.md) objects. For example, use notification events when you need to keep two data structures synchronized. In this scenario, you can use the IObservableVector&lt;T&gt; interface to receive notification of changes, so that the associated data structure can be updated.
 * 
 * Observable collections are mainly useful for XAML data binding scenarios. For more info, see [Data binding in depth](/windows/uwp/data-binding/data-binding-in-depth).
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.collections.iobservablevector-1
 * @namespace Windows.Foundation.Collections
 * @version WindowsRuntime 1.4
 */
class IObservableVector extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IObservableVector
     * @type {Guid}
     */
    static IID => Guid("{5917eb53-50b4-4a0d-b309-65862b3f1dbc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_VectorChanged", "remove_VectorChanged"]

    __New(T, ptr, callbackCreateFlags := "") {
        super.__New(ptr, callbackCreateFlags)

        ; Register generic parameter types
        this.T := T
    }

    /**
     * 
     * @param {VectorChangedEventHandler<Generic>} vhnd 
     * @returns {EventRegistrationToken} 
     */
    add_VectorChanged(vhnd) {
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
    remove_VectorChanged(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
