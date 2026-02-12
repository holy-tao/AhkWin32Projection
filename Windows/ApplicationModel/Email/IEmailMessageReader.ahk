#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\EmailMessageBatch.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMessageReader extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMessageReader
     * @type {Guid}
     */
    static IID => Guid("{2f4abe9f-6213-4a85-a3b0-f92d1a839d19}")

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
     * @returns {IAsyncOperation<EmailMessageBatch>} 
     */
    ReadBatchAsync() {
        result := ComCall(6, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EmailMessageBatch, result_)
    }
}
