#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatConversation2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatConversation2
     * @type {Guid}
     */
    static IID => Guid("{0a030cd1-983a-47aa-9a90-ee48ee997b59}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanModifyParticipants", "put_CanModifyParticipants"]

    /**
     * @type {Boolean} 
     */
    CanModifyParticipants {
        get => this.get_CanModifyParticipants()
        set => this.put_CanModifyParticipants(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanModifyParticipants() {
        result := ComCall(6, this, "int*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result_
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanModifyParticipants(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
