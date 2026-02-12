#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include .\CredentialCommand.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class ICredentialCommandFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialCommandFactory
     * @type {Guid}
     */
    static IID => Guid("{27e88c17-bc3e-4b80-9495-4ed720e48a91}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateCredentialCommand", "CreateCredentialCommandWithHandler"]

    /**
     * 
     * @param {PasswordCredential} passwordCredential_ 
     * @returns {CredentialCommand} 
     */
    CreateCredentialCommand(passwordCredential_) {
        result := ComCall(6, this, "ptr", passwordCredential_, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CredentialCommand(instance)
    }

    /**
     * 
     * @param {PasswordCredential} passwordCredential_ 
     * @param {CredentialCommandCredentialDeletedHandler} deleted 
     * @returns {CredentialCommand} 
     */
    CreateCredentialCommandWithHandler(passwordCredential_, deleted) {
        result := ComCall(7, this, "ptr", passwordCredential_, "ptr", deleted, "ptr*", &instance := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CredentialCommand(instance)
    }
}
