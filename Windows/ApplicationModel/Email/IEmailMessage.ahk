#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\EmailRecipient.ahk
#Include .\EmailAttachment.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMessage extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMessage
     * @type {Guid}
     */
    static IID => Guid("{6c6d948d-80b5-48f8-b0b1-e04e430f44e5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Subject", "put_Subject", "get_Body", "put_Body", "get_To", "get_CC", "get_Bcc", "get_Attachments"]

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
        set => this.put_Subject(value)
    }

    /**
     * @type {HSTRING} 
     */
    Body {
        get => this.get_Body()
        set => this.put_Body(value)
    }

    /**
     * @type {IVector<EmailRecipient>} 
     */
    To {
        get => this.get_To()
    }

    /**
     * @type {IVector<EmailRecipient>} 
     */
    CC {
        get => this.get_CC()
    }

    /**
     * @type {IVector<EmailRecipient>} 
     */
    Bcc {
        get => this.get_Bcc()
    }

    /**
     * @type {IVector<EmailAttachment>} 
     */
    Attachments {
        get => this.get_Attachments()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Subject(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Body() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {HSTRING} value 
     * @returns {HRESULT} 
     */
    put_Body(value) {
        if(value is String) {
            pin := HSTRING.Create(value)
            value := pin.Value
        }
        value := value is Win32Handle ? NumGet(value, "ptr") : value

        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IVector<EmailRecipient>} 
     */
    get_To() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(EmailRecipient, value)
    }

    /**
     * 
     * @returns {IVector<EmailRecipient>} 
     */
    get_CC() {
        result := ComCall(11, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(EmailRecipient, value)
    }

    /**
     * 
     * @returns {IVector<EmailRecipient>} 
     */
    get_Bcc() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(EmailRecipient, value)
    }

    /**
     * 
     * @returns {IVector<EmailAttachment>} 
     */
    get_Attachments() {
        result := ComCall(13, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(EmailAttachment, value)
    }
}
