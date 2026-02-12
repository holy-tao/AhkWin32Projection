#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ConversationalAgentSession.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.ConversationalAgent
 * @version WindowsRuntime 1.4
 */
class IConversationalAgentSessionStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IConversationalAgentSessionStatics
     * @type {Guid}
     */
    static IID => Guid("{a005166e-e954-576e-be04-11b8ed10f37b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetCurrentSessionAsync", "GetCurrentSessionSync"]

    /**
     * 
     * @returns {IAsyncOperation<ConversationalAgentSession>} 
     */
    GetCurrentSessionAsync() {
        result := ComCall(6, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ConversationalAgentSession, operation)
    }

    /**
     * 
     * @returns {ConversationalAgentSession} 
     */
    GetCurrentSessionSync() {
        result := ComCall(7, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ConversationalAgentSession(result_)
    }
}
