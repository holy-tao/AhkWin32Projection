#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\ChatMessage.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageStore3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageStore3
     * @type {Guid}
     */
    static IID => Guid("{9adbbb09-4345-4ec1-8b74-b7338243719c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetMessageBySyncIdAsync"]

    /**
     * 
     * @param {HSTRING} syncId 
     * @returns {IAsyncOperation<ChatMessage>} 
     */
    GetMessageBySyncIdAsync(syncId) {
        if(syncId is String) {
            pin := HSTRING.Create(syncId)
            syncId := pin.Value
        }
        syncId := syncId is Win32Handle ? NumGet(syncId, "ptr") : syncId

        result := ComCall(6, this, "ptr", syncId, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(ChatMessage, result_)
    }
}
