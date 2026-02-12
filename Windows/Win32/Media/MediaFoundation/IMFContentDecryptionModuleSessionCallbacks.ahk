#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a callback mechanism for receiving key status change updates from an IMFContentDecryptionModuleSession.
 * @remarks
 * **IMFContentDecryptionModuleSessionCallbacks** is based on the Encrypted Media Extension specification's  [keystatuseschange event](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-evt-keystatuseschange).
 * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentDecryptionModuleSessionCallbacks extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFContentDecryptionModuleSessionCallbacks
     * @type {Guid}
     */
    static IID => Guid("{3f96ee40-ad81-4096-8470-59a4b770f89a}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["KeyMessage", "KeyStatusChanged"]

    /**
     * Called when the Content Decryption Module (CDM) has generated a message for the session.
     * @remarks
     * **KeyMessage** is based on the Encrypted Media Extension specification's [MediaKeyMessageEvent](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeymessageevent).
     * @param {Integer} messageType A value from the [MF_MEDIAKEYSESSION_MESSAGETYPE](../mfidl/ne-mfidl-mf_mediakeysession_messagetype.md) enumeration specifying the type of the message.
     * @param {Pointer<Integer>} message A pointer to a **BYTE** array containing the message contents. Messages are Key System-specific.
     * @param {Integer} messageSize The size of the array in the *message* parameter.
     * @param {PWSTR} destinationURL A optional parameter containing the destination URL.
     * @returns {HRESULT} Returns an HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks-keymessage
     */
    KeyMessage(messageType, message, messageSize, destinationURL) {
        destinationURL := destinationURL is String ? StrPtr(destinationURL) : destinationURL

        messageMarshal := message is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", messageType, messageMarshal, message, "uint", messageSize, "ptr", destinationURL, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IMFContentDecryptionModuleSessionCallbacks::KeyStatusChanged function is called when there has been a change in the keys in the Content Decryption Module (CDM) session or their status.
     * @remarks
     * Get the current status of the CDM session keys by calling [IMFContentDecryptionModuleSession::GetKeyStatuses](nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getkeystatuses.md). 
     * 
     * **KeyStatusChanged** is based on the Encrypted Media Extension specification's [keystatuseschange](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-evt-keystatuseschange).
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks-keystatuschanged
     */
    KeyStatusChanged() {
        result := ComCall(4, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
