#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\RcsEndUserMessageManager.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\RcsTransport.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IRcsManagerStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IRcsManagerStatics
     * @type {Guid}
     */
    static IID => Guid("{7d270ac5-0abd-4f31-9b99-a59e71a7b731}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetEndUserMessageManager", "GetTransportsAsync", "GetTransportAsync", "LeaveConversationAsync"]

    /**
     * 
     * @returns {RcsEndUserMessageManager} 
     */
    GetEndUserMessageManager() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RcsEndUserMessageManager(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<RcsTransport>>} 
     */
    GetTransportsAsync() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, RcsTransport), value)
    }

    /**
     * 
     * @param {HSTRING} transportId 
     * @returns {IAsyncOperation<RcsTransport>} 
     */
    GetTransportAsync(transportId) {
        if(transportId is String) {
            pin := HSTRING.Create(transportId)
            transportId := pin.Value
        }
        transportId := transportId is Win32Handle ? NumGet(transportId, "ptr") : transportId

        result := ComCall(8, this, "ptr", transportId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(RcsTransport, result_)
    }

    /**
     * 
     * @param {ChatConversation} conversation 
     * @returns {IAsyncAction} 
     */
    LeaveConversationAsync(conversation) {
        result := ComCall(9, this, "ptr", conversation, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }
}
