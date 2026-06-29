#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\DEV_CONSOLE_MESSAGE_LEVEL.ahk" { DEV_CONSOLE_MESSAGE_LEVEL }

/**
 * @namespace Windows.Win32.Web.MsHtml
 */
export default struct IDeveloperConsoleMessageReceiver extends IUnknown {
    /**
     * The interface identifier for IDeveloperConsoleMessageReceiver
     * @type {Guid}
     */
    static IID := Guid("{30510808-98b5-11cf-bb82-00aa00bdce0b}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IDeveloperConsoleMessageReceiver interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        Write                     : IntPtr
        WriteWithUrl              : IntPtr
        WriteWithUrlAndLine       : IntPtr
        WriteWithUrlLineAndColumn : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IDeveloperConsoleMessageReceiver.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {PWSTR} source 
     * @param {DEV_CONSOLE_MESSAGE_LEVEL} level 
     * @param {Integer} messageId 
     * @param {PWSTR} messageText 
     * @returns {HRESULT} 
     */
    Write(source, level, messageId, messageText) {
        source := source is String ? StrPtr(source) : source
        messageText := messageText is String ? StrPtr(messageText) : messageText

        result := ComCall(3, this, "ptr", source, DEV_CONSOLE_MESSAGE_LEVEL, level, "int", messageId, "ptr", messageText, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} source 
     * @param {DEV_CONSOLE_MESSAGE_LEVEL} level 
     * @param {Integer} messageId 
     * @param {PWSTR} messageText 
     * @param {PWSTR} fileUrl 
     * @returns {HRESULT} 
     */
    WriteWithUrl(source, level, messageId, messageText, fileUrl) {
        source := source is String ? StrPtr(source) : source
        messageText := messageText is String ? StrPtr(messageText) : messageText
        fileUrl := fileUrl is String ? StrPtr(fileUrl) : fileUrl

        result := ComCall(4, this, "ptr", source, DEV_CONSOLE_MESSAGE_LEVEL, level, "int", messageId, "ptr", messageText, "ptr", fileUrl, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} source 
     * @param {DEV_CONSOLE_MESSAGE_LEVEL} level 
     * @param {Integer} messageId 
     * @param {PWSTR} messageText 
     * @param {PWSTR} fileUrl 
     * @param {Integer} line 
     * @returns {HRESULT} 
     */
    WriteWithUrlAndLine(source, level, messageId, messageText, fileUrl, line) {
        source := source is String ? StrPtr(source) : source
        messageText := messageText is String ? StrPtr(messageText) : messageText
        fileUrl := fileUrl is String ? StrPtr(fileUrl) : fileUrl

        result := ComCall(5, this, "ptr", source, DEV_CONSOLE_MESSAGE_LEVEL, level, "int", messageId, "ptr", messageText, "ptr", fileUrl, "uint", line, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} source 
     * @param {DEV_CONSOLE_MESSAGE_LEVEL} level 
     * @param {Integer} messageId 
     * @param {PWSTR} messageText 
     * @param {PWSTR} fileUrl 
     * @param {Integer} line 
     * @param {Integer} _column 
     * @returns {HRESULT} 
     */
    WriteWithUrlLineAndColumn(source, level, messageId, messageText, fileUrl, line, _column) {
        source := source is String ? StrPtr(source) : source
        messageText := messageText is String ? StrPtr(messageText) : messageText
        fileUrl := fileUrl is String ? StrPtr(fileUrl) : fileUrl

        result := ComCall(6, this, "ptr", source, DEV_CONSOLE_MESSAGE_LEVEL, level, "int", messageId, "ptr", messageText, "ptr", fileUrl, "uint", line, "uint", _column, "HRESULT")
        return result
    }

    Query(iid) {
        if (IDeveloperConsoleMessageReceiver.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Write := CallbackCreate(GetMethod(implObj, "Write"), flags, 5)
        this.vtbl.WriteWithUrl := CallbackCreate(GetMethod(implObj, "WriteWithUrl"), flags, 6)
        this.vtbl.WriteWithUrlAndLine := CallbackCreate(GetMethod(implObj, "WriteWithUrlAndLine"), flags, 7)
        this.vtbl.WriteWithUrlLineAndColumn := CallbackCreate(GetMethod(implObj, "WriteWithUrlLineAndColumn"), flags, 8)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Write)
        CallbackFree(this.vtbl.WriteWithUrl)
        CallbackFree(this.vtbl.WriteWithUrlAndLine)
        CallbackFree(this.vtbl.WriteWithUrlLineAndColumn)
    }
}
