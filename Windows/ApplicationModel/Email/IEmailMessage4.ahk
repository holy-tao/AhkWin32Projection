#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Collections\IVector.ahk
#Include .\EmailRecipient.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMessage4 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMessage4
     * @type {Guid}
     */
    static IID => Guid("{317cf181-3e7f-4a05-8394-3e10336dd435}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_ReplyTo", "get_SentRepresenting", "put_SentRepresenting"]

    /**
     * @type {IVector<EmailRecipient>} 
     */
    ReplyTo {
        get => this.get_ReplyTo()
    }

    /**
     * @type {EmailRecipient} 
     */
    SentRepresenting {
        get => this.get_SentRepresenting()
        set => this.put_SentRepresenting(value)
    }

    /**
     * 
     * @returns {IVector<EmailRecipient>} 
     */
    get_ReplyTo() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVector(EmailRecipient, value)
    }

    /**
     * 
     * @returns {EmailRecipient} 
     */
    get_SentRepresenting() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailRecipient(value)
    }

    /**
     * 
     * @param {EmailRecipient} value 
     * @returns {HRESULT} 
     */
    put_SentRepresenting(value) {
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
