#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\EmailConversationBatch.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailConversationReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailConversationReader
     * @type {Guid}
     */
    static IID => Guid("{b4630f82-2875-44c8-9b8c-85beb3a3c653}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["ReadBatchAsync"]

    /**
     * 
     * @returns {IAsyncOperation<EmailConversationBatch>} 
     */
    ReadBatchAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailConversationBatch, result_)
    }
}
