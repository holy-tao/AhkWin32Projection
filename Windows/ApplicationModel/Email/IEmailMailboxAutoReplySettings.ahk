#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include .\EmailMailboxAutoReply.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Email
 * @version WindowsRuntime 1.4
 */
class IEmailMailboxAutoReplySettings extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEmailMailboxAutoReplySettings
     * @type {Guid}
     */
    static IID => Guid("{a87a9fa8-0ac6-4b77-ba77-a6b99e9a27b8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_IsEnabled", "put_IsEnabled", "get_ResponseKind", "put_ResponseKind", "get_StartTime", "put_StartTime", "get_EndTime", "put_EndTime", "get_InternalReply", "get_KnownExternalReply", "get_UnknownExternalReply"]

    /**
     * @type {Boolean} 
     */
    IsEnabled {
        get => this.get_IsEnabled()
        set => this.put_IsEnabled(value)
    }

    /**
     * @type {Integer} 
     */
    ResponseKind {
        get => this.get_ResponseKind()
        set => this.put_ResponseKind(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    StartTime {
        get => this.get_StartTime()
        set => this.put_StartTime(value)
    }

    /**
     * @type {IReference<DateTime>} 
     */
    EndTime {
        get => this.get_EndTime()
        set => this.put_EndTime(value)
    }

    /**
     * @type {EmailMailboxAutoReply} 
     */
    InternalReply {
        get => this.get_InternalReply()
    }

    /**
     * @type {EmailMailboxAutoReply} 
     */
    KnownExternalReply {
        get => this.get_KnownExternalReply()
    }

    /**
     * @type {EmailMailboxAutoReply} 
     */
    UnknownExternalReply {
        get => this.get_UnknownExternalReply()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_IsEnabled() {
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
    put_IsEnabled(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ResponseKind() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_ResponseKind(value) {
        result := ComCall(9, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_StartTime() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_StartTime(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<DateTime>} 
     */
    get_EndTime() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetDateTime(), value)
    }

    /**
     * 
     * @param {IReference<DateTime>} value 
     * @returns {HRESULT} 
     */
    put_EndTime(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {EmailMailboxAutoReply} 
     */
    get_InternalReply() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMailboxAutoReply(value)
    }

    /**
     * 
     * @returns {EmailMailboxAutoReply} 
     */
    get_KnownExternalReply() {
        result := ComCall(15, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMailboxAutoReply(value)
    }

    /**
     * 
     * @returns {EmailMailboxAutoReply} 
     */
    get_UnknownExternalReply() {
        result := ComCall(16, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EmailMailboxAutoReply(value)
    }
}
