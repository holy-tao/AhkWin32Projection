#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include .\UssdReply.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IUssdSession extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUssdSession
     * @type {Guid}
     */
    static IID => Guid("{2f9acf82-2002-4d5d-bf81-2aba1b4be4a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendMessageAndGetReplyAsync", "Close"]

    /**
     * 
     * @param {UssdMessage} message 
     * @returns {IAsyncOperation<UssdReply>} 
     */
    SendMessageAndGetReplyAsync(message) {
        result := ComCall(6, this, "ptr", message, "ptr*", &asyncInfo := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(UssdReply, asyncInfo)
    }

    /**
     * MSSQLSERVER_4064
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/relational-databases/errors-events/mssqlserver-4064-database-engine-error
     */
    Close() {
        result := ComCall(7, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
