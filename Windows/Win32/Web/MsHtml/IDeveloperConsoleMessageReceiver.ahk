#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Web.MsHtml
 * @version v4.0.30319
 */
class IDeveloperConsoleMessageReceiver extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IDeveloperConsoleMessageReceiver
     * @type {Guid}
     */
    static IID => Guid("{30510808-98b5-11cf-bb82-00aa00bdce0b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Write", "WriteWithUrl", "WriteWithUrlAndLine", "WriteWithUrlLineAndColumn"]

    /**
     * This article helps you to configure the Script Task.
     * @param {PWSTR} source 
     * @param {Integer} level 
     * @param {Integer} messageId 
     * @param {PWSTR} messageText 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/sql/ocs/docs/integration-services/extending-packages-scripting-task-examples/write-event-log-script-task
     */
    Write(source, level, messageId, messageText) {
        source := source is String ? StrPtr(source) : source
        messageText := messageText is String ? StrPtr(messageText) : messageText

        result := ComCall(3, this, "ptr", source, "int", level, "int", messageId, "ptr", messageText, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} source 
     * @param {Integer} level 
     * @param {Integer} messageId 
     * @param {PWSTR} messageText 
     * @param {PWSTR} fileUrl 
     * @returns {HRESULT} 
     */
    WriteWithUrl(source, level, messageId, messageText, fileUrl) {
        source := source is String ? StrPtr(source) : source
        messageText := messageText is String ? StrPtr(messageText) : messageText
        fileUrl := fileUrl is String ? StrPtr(fileUrl) : fileUrl

        result := ComCall(4, this, "ptr", source, "int", level, "int", messageId, "ptr", messageText, "ptr", fileUrl, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} source 
     * @param {Integer} level 
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

        result := ComCall(5, this, "ptr", source, "int", level, "int", messageId, "ptr", messageText, "ptr", fileUrl, "uint", line, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {PWSTR} source 
     * @param {Integer} level 
     * @param {Integer} messageId 
     * @param {PWSTR} messageText 
     * @param {PWSTR} fileUrl 
     * @param {Integer} line 
     * @param {Integer} column_ 
     * @returns {HRESULT} 
     */
    WriteWithUrlLineAndColumn(source, level, messageId, messageText, fileUrl, line, column_) {
        source := source is String ? StrPtr(source) : source
        messageText := messageText is String ? StrPtr(messageText) : messageText
        fileUrl := fileUrl is String ? StrPtr(fileUrl) : fileUrl

        result := ComCall(6, this, "ptr", source, "int", level, "int", messageId, "ptr", messageText, "ptr", fileUrl, "uint", line, "uint", column_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
