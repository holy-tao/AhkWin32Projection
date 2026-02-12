#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\ChatMessageAttachment.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Chat
 * @version WindowsRuntime 1.4
 */
class IChatMessageAttachmentFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IChatMessageAttachmentFactory
     * @type {Guid}
     */
    static IID => Guid("{205852a2-a356-5b71-6ca9-66c985b7d0d5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateChatMessageAttachment"]

    /**
     * 
     * @param {HSTRING} mimeType 
     * @param {IRandomAccessStreamReference} dataStreamReference 
     * @returns {ChatMessageAttachment} 
     */
    CreateChatMessageAttachment(mimeType, dataStreamReference) {
        if(mimeType is String) {
            pin := HSTRING.Create(mimeType)
            mimeType := pin.Value
        }
        mimeType := mimeType is Win32Handle ? NumGet(mimeType, "ptr") : mimeType

        result := ComCall(6, this, "ptr", mimeType, "ptr", dataStreamReference, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return ChatMessageAttachment(value)
    }
}
