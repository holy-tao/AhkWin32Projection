#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\EmailMailboxMoveFolderRequest.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email.DataProvider
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxMoveFolderRequestEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxMoveFolderRequestEventArgs
     * @type {Guid}
     */
    static IID => Guid("{38623020-14ba-4c88-8698-7239e3c8aaa7}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Request", "GetDeferral"]

    /**
     * @type {EmailMailboxMoveFolderRequest} 
     */
    Request {
        get => this.get_Request()
    }

    /**
     * 
     * @returns {EmailMailboxMoveFolderRequest} 
     */
    get_Request() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMailboxMoveFolderRequest(value)
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(value)
    }
}
