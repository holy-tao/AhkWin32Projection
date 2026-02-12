#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\DateTime.ahk
#Include .\EmailIrmTemplate.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailIrmInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailIrmInfo
     * @type {Guid}
     */
    static IID => Guid("{90f52193-b1a0-4ebd-a6b6-ddca55606e0e}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_CanEdit", "put_CanEdit", "get_CanExtractData", "put_CanExtractData", "get_CanForward", "put_CanForward", "get_CanModifyRecipientsOnResponse", "put_CanModifyRecipientsOnResponse", "get_CanPrintData", "put_CanPrintData", "get_CanRemoveIrmOnResponse", "put_CanRemoveIrmOnResponse", "get_CanReply", "put_CanReply", "get_CanReplyAll", "put_CanReplyAll", "get_ExpirationDate", "put_ExpirationDate", "get_IsIrmOriginator", "put_IsIrmOriginator", "get_IsProgramaticAccessAllowed", "put_IsProgramaticAccessAllowed", "get_Template", "put_Template"]

    /**
     * @type {Boolean} 
     */
    CanEdit {
        get => this.get_CanEdit()
        set => this.put_CanEdit(value)
    }

    /**
     * @type {Boolean} 
     */
    CanExtractData {
        get => this.get_CanExtractData()
        set => this.put_CanExtractData(value)
    }

    /**
     * @type {Boolean} 
     */
    CanForward {
        get => this.get_CanForward()
        set => this.put_CanForward(value)
    }

    /**
     * @type {Boolean} 
     */
    CanModifyRecipientsOnResponse {
        get => this.get_CanModifyRecipientsOnResponse()
        set => this.put_CanModifyRecipientsOnResponse(value)
    }

    /**
     * @type {Boolean} 
     */
    CanPrintData {
        get => this.get_CanPrintData()
        set => this.put_CanPrintData(value)
    }

    /**
     * @type {Boolean} 
     */
    CanRemoveIrmOnResponse {
        get => this.get_CanRemoveIrmOnResponse()
        set => this.put_CanRemoveIrmOnResponse(value)
    }

    /**
     * @type {Boolean} 
     */
    CanReply {
        get => this.get_CanReply()
        set => this.put_CanReply(value)
    }

    /**
     * @type {Boolean} 
     */
    CanReplyAll {
        get => this.get_CanReplyAll()
        set => this.put_CanReplyAll(value)
    }

    /**
     * @type {DateTime} 
     */
    ExpirationDate {
        get => this.get_ExpirationDate()
        set => this.put_ExpirationDate(value)
    }

    /**
     * @type {Boolean} 
     */
    IsIrmOriginator {
        get => this.get_IsIrmOriginator()
        set => this.put_IsIrmOriginator(value)
    }

    /**
     * @type {Boolean} 
     */
    IsProgramaticAccessAllowed {
        get => this.get_IsProgramaticAccessAllowed()
        set => this.put_IsProgramaticAccessAllowed(value)
    }

    /**
     * @type {EmailIrmTemplate} 
     */
    Template {
        get => this.get_Template()
        set => this.put_Template(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanEdit() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanEdit(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanExtractData() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanExtractData(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanForward() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanForward(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanModifyRecipientsOnResponse() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanModifyRecipientsOnResponse(value) {
        result := ComCall(13, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanPrintData() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanPrintData(value) {
        result := ComCall(15, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanRemoveIrmOnResponse() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanRemoveIrmOnResponse(value) {
        result := ComCall(17, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReply() {
        result := ComCall(18, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanReply(value) {
        result := ComCall(19, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_CanReplyAll() {
        result := ComCall(20, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_CanReplyAll(value) {
        result := ComCall(21, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {DateTime} 
     */
    get_ExpirationDate() {
        value := DateTime()
        result := ComCall(22, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {DateTime} value 
     * @returns {HRESULT} 
     */
    put_ExpirationDate(value) {
        result := ComCall(23, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsIrmOriginator() {
        result := ComCall(24, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsIrmOriginator(value) {
        result := ComCall(25, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsProgramaticAccessAllowed() {
        result := ComCall(26, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_IsProgramaticAccessAllowed(value) {
        result := ComCall(27, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {EmailIrmTemplate} 
     */
    get_Template() {
        result := ComCall(28, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailIrmTemplate(value)
    }

    /**
     * 
     * @param {EmailIrmTemplate} value 
     * @returns {HRESULT} 
     */
    put_Template(value) {
        result := ComCall(29, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
