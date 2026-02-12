#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Security\Credentials\PasswordCredential.ahk
#Include .\CredentialCommandCredentialDeletedHandler.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.UI.ApplicationSettings
 * @version WindowsRuntime 1.4
 */
class ICredentialCommand extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ICredentialCommand
     * @type {Guid}
     */
    static IID => Guid("{a5f665e6-6143-4a7a-a971-b017ba978ce2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_PasswordCredential", "get_CredentialDeleted"]

    /**
     * @type {PasswordCredential} 
     */
    PasswordCredential {
        get => this.get_PasswordCredential()
    }

    /**
     * @type {CredentialCommandCredentialDeletedHandler} 
     */
    CredentialDeleted {
        get => this.get_CredentialDeleted()
    }

    /**
     * 
     * @returns {PasswordCredential} 
     */
    get_PasswordCredential() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return PasswordCredential(value)
    }

    /**
     * 
     * @returns {CredentialCommandCredentialDeletedHandler} 
     */
    get_CredentialDeleted() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return CredentialCommandCredentialDeletedHandler(value)
    }
}
