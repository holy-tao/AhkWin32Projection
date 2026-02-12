#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include .\UssdMessage.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Networking.NetworkOperators
 * @version WindowsRuntime 1.4
 */
class IUssdMessageFactory extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IUssdMessageFactory
     * @type {Guid}
     */
    static IID => Guid("{2f9acf82-1003-4d5d-bf81-2aba1b4be4a8}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["CreateMessage"]

    /**
     * 
     * @param {HSTRING} messageText 
     * @returns {UssdMessage} 
     */
    CreateMessage(messageText) {
        if(messageText is String) {
            pin := HSTRING.Create(messageText)
            messageText := pin.Value
        }
        messageText := messageText is Win32Handle ? NumGet(messageText, "ptr") : messageText

        result := ComCall(6, this, "ptr", messageText, "ptr*", &ussdMessage_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return UssdMessage(ussdMessage_)
    }
}
