#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Foundation\Collections\IVectorView.ahk
#Include ..\Foundation\IPropertyValue.ahk
#Include .\MdmSession.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management
 * @version WindowsRuntime 1.4
 */
class IMdmSessionManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMdmSessionManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{cf4ad959-f745-4b79-9b5c-de0bf8efe44b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SessionIds", "TryCreateSession", "DeleteSessionById", "GetSessionById"]

    /**
     * @type {IVectorView<HSTRING>} 
     */
    SessionIds {
        get => this.get_SessionIds()
    }

    /**
     * 
     * @returns {IVectorView<HSTRING>} 
     */
    get_SessionIds() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => HSTRING({ Value: ptr }), value)
    }

    /**
     * 
     * @returns {MdmSession} 
     */
    TryCreateSession() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MdmSession(result_)
    }

    /**
     * 
     * @param {HSTRING} sessionId 
     * @returns {HRESULT} 
     */
    DeleteSessionById(sessionId) {
        if(sessionId is String) {
            pin := HSTRING.Create(sessionId)
            sessionId := pin.Value
        }
        sessionId := sessionId is Win32Handle ? NumGet(sessionId, "ptr") : sessionId

        result := ComCall(8, this, "ptr", sessionId, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {HSTRING} sessionId 
     * @returns {MdmSession} 
     */
    GetSessionById(sessionId) {
        if(sessionId is String) {
            pin := HSTRING.Create(sessionId)
            sessionId := pin.Value
        }
        sessionId := sessionId is Win32Handle ? NumGet(sessionId, "ptr") : sessionId

        result := ComCall(9, this, "ptr", sessionId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return MdmSession(result_)
    }
}
