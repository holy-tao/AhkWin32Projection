#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxCapabilities2 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxCapabilities2
     * @type {Guid}
     */
    static IID => Guid("{69723ee4-2f21-4cbc-88ab-2e7602a4806b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanResolveRecipients", "get_CanValidateCertificates", "get_CanEmptyFolder", "get_CanCreateFolder", "get_CanDeleteFolder", "get_CanMoveFolder"]

    /**
     * @type {Boolean} 
     */
    CanResolveRecipients {
        get => this.get_CanResolveRecipients()
    }

    /**
     * @type {Boolean} 
     */
    CanValidateCertificates {
        get => this.get_CanValidateCertificates()
    }

    /**
     * @type {Boolean} 
     */
    CanEmptyFolder {
        get => this.get_CanEmptyFolder()
    }

    /**
     * @type {Boolean} 
     */
    CanCreateFolder {
        get => this.get_CanCreateFolder()
    }

    /**
     * @type {Boolean} 
     */
    CanDeleteFolder {
        get => this.get_CanDeleteFolder()
    }

    /**
     * @type {Boolean} 
     */
    CanMoveFolder {
        get => this.get_CanMoveFolder()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanResolveRecipients() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanValidateCertificates() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanEmptyFolder() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanCreateFolder() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanDeleteFolder() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanMoveFolder() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
