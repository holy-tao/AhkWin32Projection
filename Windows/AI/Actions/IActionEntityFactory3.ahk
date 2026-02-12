#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\RemoteFileActionEntity.ahk
#Include .\TextActionEntity.ahk
#Include .\StreamingTextActionEntityWriter.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.AI.Actions
 * @version WindowsRuntime 1.4
 */
class IActionEntityFactory3 extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IActionEntityFactory3
     * @type {Guid}
     */
    static IID => Guid("{4910e689-00b5-56bb-9c65-0fcc76215283}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateRemoteFileEntity", "CreateTextEntityWithTextFormat", "CreateStreamingTextActionEntityWriter"]

    /**
     * 
     * @param {HSTRING} sourceId 
     * @param {Integer} fileKind 
     * @param {Uri} sourceUri 
     * @param {HSTRING} fileId 
     * @param {HSTRING} contentType 
     * @param {HSTRING} driveId 
     * @param {HSTRING} accountId 
     * @param {HSTRING} extension_ 
     * @returns {RemoteFileActionEntity} 
     */
    CreateRemoteFileEntity(sourceId, fileKind, sourceUri, fileId, contentType, driveId, accountId, extension_) {
        if(sourceId is String) {
            pin := HSTRING.Create(sourceId)
            sourceId := pin.Value
        }
        sourceId := sourceId is Win32Handle ? NumGet(sourceId, "ptr") : sourceId
        if(fileId is String) {
            pin := HSTRING.Create(fileId)
            fileId := pin.Value
        }
        fileId := fileId is Win32Handle ? NumGet(fileId, "ptr") : fileId
        if(contentType is String) {
            pin := HSTRING.Create(contentType)
            contentType := pin.Value
        }
        contentType := contentType is Win32Handle ? NumGet(contentType, "ptr") : contentType
        if(driveId is String) {
            pin := HSTRING.Create(driveId)
            driveId := pin.Value
        }
        driveId := driveId is Win32Handle ? NumGet(driveId, "ptr") : driveId
        if(accountId is String) {
            pin := HSTRING.Create(accountId)
            accountId := pin.Value
        }
        accountId := accountId is Win32Handle ? NumGet(accountId, "ptr") : accountId
        if(extension_ is String) {
            pin := HSTRING.Create(extension_)
            extension_ := pin.Value
        }
        extension_ := extension_ is Win32Handle ? NumGet(extension_, "ptr") : extension_

        result := ComCall(6, this, "ptr", sourceId, "int", fileKind, "ptr", sourceUri, "ptr", fileId, "ptr", contentType, "ptr", driveId, "ptr", accountId, "ptr", extension_, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return RemoteFileActionEntity(result_)
    }

    /**
     * 
     * @param {HSTRING} text 
     * @param {Integer} textFormat 
     * @returns {TextActionEntity} 
     */
    CreateTextEntityWithTextFormat(text, textFormat) {
        if(text is String) {
            pin := HSTRING.Create(text)
            text := pin.Value
        }
        text := text is Win32Handle ? NumGet(text, "ptr") : text

        result := ComCall(7, this, "ptr", text, "int", textFormat, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return TextActionEntity(result_)
    }

    /**
     * 
     * @param {Integer} textFormat 
     * @returns {StreamingTextActionEntityWriter} 
     */
    CreateStreamingTextActionEntityWriter(textFormat) {
        result := ComCall(8, this, "int", textFormat, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return StreamingTextActionEntityWriter(result_)
    }
}
