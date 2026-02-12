#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\EmailMailboxAction.ahk
#Include .\EmailMessage.ahk
#Include .\EmailFolder.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxChange extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxChange
     * @type {Guid}
     */
    static IID => Guid("{61edf54b-11ef-400c-adde-8cde65c85e66}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ChangeType", "get_MailboxActions", "get_Message", "get_Folder"]

    /**
     * @type {Integer} 
     */
    ChangeType {
        get => this.get_ChangeType()
    }

    /**
     * @type {IVector<EmailMailboxAction>} 
     */
    MailboxActions {
        get => this.get_MailboxActions()
    }

    /**
     * @type {EmailMessage} 
     */
    Message {
        get => this.get_Message()
    }

    /**
     * @type {EmailFolder} 
     */
    Folder {
        get => this.get_Folder()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ChangeType() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVector<EmailMailboxAction>} 
     */
    get_MailboxActions() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(EmailMailboxAction, value)
    }

    /**
     * 
     * @returns {EmailMessage} 
     */
    get_Message() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMessage(value)
    }

    /**
     * 
     * @returns {EmailFolder} 
     */
    get_Folder() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailFolder(value)
    }
}
