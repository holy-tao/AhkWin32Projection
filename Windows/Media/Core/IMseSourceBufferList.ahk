#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\EventRegistrationToken.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\MseSourceBuffer.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Media.Core
 * @version WindowsRuntime 1.4
 */
class IMseSourceBufferList extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMseSourceBufferList
     * @type {Guid}
     */
    static IID => Guid("{95fae8e7-a8e7-4ebf-8927-145e940ba511}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["add_SourceBufferAdded", "remove_SourceBufferAdded", "add_SourceBufferRemoved", "remove_SourceBufferRemoved", "get_Buffers"]

    /**
     * @type {IVectorView<MseSourceBuffer>} 
     */
    Buffers {
        get => this.get_Buffers()
    }

    /**
     * 
     * @param {TypedEventHandler<MseSourceBufferList, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceBufferAdded(handler) {
        token := EventRegistrationToken()
        result := ComCall(6, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceBufferAdded(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(7, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {TypedEventHandler<MseSourceBufferList, IInspectable>} handler 
     * @returns {EventRegistrationToken} 
     */
    add_SourceBufferRemoved(handler) {
        token := EventRegistrationToken()
        result := ComCall(8, this, "ptr", handler, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return token
    }

    /**
     * 
     * @param {EventRegistrationToken} token 
     * @returns {HRESULT} 
     */
    remove_SourceBufferRemoved(token) {
        token := token is Win32Handle ? NumGet(token, "ptr") : token

        result := ComCall(9, this, "ptr", token, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVectorView<MseSourceBuffer>} 
     */
    get_Buffers() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(MseSourceBuffer, value)
    }
}
