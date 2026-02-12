#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\WebAccount.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Credentials
 * @version WindowsRuntime 1.4
 */
class IWebAccountFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebAccountFactory
     * @type {Guid}
     */
    static IID => Guid("{ac9afb39-1de9-4e92-b78f-0581a87f6e5c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateWebAccount"]

    /**
     * 
     * @param {WebAccountProvider} webAccountProvider_ 
     * @param {HSTRING} userName 
     * @param {Integer} state 
     * @returns {WebAccount} 
     */
    CreateWebAccount(webAccountProvider_, userName, state) {
        if(userName is String) {
            pin := HSTRING.Create(userName)
            userName := pin.Value
        }
        userName := userName is Win32Handle ? NumGet(userName, "ptr") : userName

        result := ComCall(6, this, "ptr", webAccountProvider_, "ptr", userName, "int", state, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return WebAccount(instance)
    }
}
