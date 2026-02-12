#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include .\EventRegistrationToken.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * Represents a reference to an [IMemoryBuffer](imemorybuffer.md) object.
 * @remarks
 * The IMemoryBufferReference interface allows a client to retrieve the [Capacity](imemorybufferreference_capacity.md) of the memory buffer. The same object identity must also implement the COM interface [IMemoryBufferByteAccess](/previous-versions/mt297505(v=vs.85)). A client retrieves the [IMemoryBufferByteAccess](/previous-versions/mt297505(v=vs.85)) interface pointer via a **QueryInterface** from the IMemoryBufferReference object.
 * @see https://learn.microsoft.com/uwp/api/windows.foundation.imemorybufferreference
 * @namespace Windows.Foundation
 * @version WindowsRuntime 1.4
 */
class IMemoryBufferReference extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMemoryBufferReference
     * @type {Guid}
     */
    static IID => Guid("{fbc4dd29-245b-11e4-af98-689423260cf8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Capacity", "add_Closed", "remove_Closed"]

    /**
     * Gets the size of the memory buffer in bytes.
     * @see https://learn.microsoft.com/uwp/api/windows.foundation.imemorybufferreference.capacity
     * @type {Integer} 
     */
    Capacity {
        get => this.get_Capacity()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Capacity() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TypedEventHandler<IMemoryBufferReference, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_Closed(handler) {
        cookie := EventRegistrationToken()
        result := ComCall(7, this, "ptr", handler, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return cookie
    }

    /**
     * 
     * @param {EventRegistrationToken} cookie 
     * @returns {HRESULT} 
     */
    remove_Closed(cookie) {
        cookie := cookie is Win32Handle ? NumGet(cookie, "ptr") : cookie

        result := ComCall(8, this, "ptr", cookie, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
