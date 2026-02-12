#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ChatMessageTransport.ahk
#Include .\ChatMessageStore.ahk
#Include ..\..\Foundation\IAsyncAction.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageManagerStatic extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageManagerStatic
     * @type {Guid}
     */
    static IID => Guid("{f15c60f7-d5e8-5e92-556d-e03b60253104}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetTransportsAsync", "RequestStoreAsync", "ShowComposeSmsMessageAsync", "ShowSmsSettings"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ChatMessageTransport>>} 
     */
    GetTransportsAsync() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ChatMessageTransport), value)
    }

    /**
     * 
     * @returns {IAsyncOperation<ChatMessageStore>} 
     */
    RequestStoreAsync() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatMessageStore, value)
    }

    /**
     * 
     * @param {ChatMessage} message 
     * @returns {IAsyncAction} 
     */
    ShowComposeSmsMessageAsync(message) {
        result := ComCall(8, this, "ptr", message, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncAction(value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ShowSmsSettings() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
