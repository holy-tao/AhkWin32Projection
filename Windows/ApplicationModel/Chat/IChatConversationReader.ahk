#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ChatConversation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatConversationReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatConversationReader
     * @type {Guid}
     */
    static IID => Guid("{055136d2-de32-4a47-a93a-b3dc0833852b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadBatchAsync", "ReadBatchWithCountAsync"]

    /**
     * 
     * @returns {IAsyncOperation<IVectorView<ChatConversation>>} 
     */
    ReadBatchAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ChatConversation), result_)
    }

    /**
     * 
     * @param {Integer} count 
     * @returns {IAsyncOperation<IVectorView<ChatConversation>>} 
     */
    ReadBatchWithCountAsync(count) {
        result := ComCall(7, this, "int", count, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ChatConversation), result_)
    }
}
