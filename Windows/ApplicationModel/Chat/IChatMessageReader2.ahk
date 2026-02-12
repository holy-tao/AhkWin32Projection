#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Foundation\Collections\IVectorView.ahk
#Include .\ChatMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageReader2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageReader2
     * @type {Guid}
     */
    static IID => Guid("{89643683-64bb-470d-9df4-0de8be1a05bf}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadBatchWithCountAsync"]

    /**
     * 
     * @param {Integer} count 
     * @returns {IAsyncOperation<IVectorView<ChatMessage>>} 
     */
    ReadBatchWithCountAsync(count) {
        result := ComCall(6, this, "int", count, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(IVectorView.Call.Bind(IVectorView, ChatMessage), result_)
    }
}
