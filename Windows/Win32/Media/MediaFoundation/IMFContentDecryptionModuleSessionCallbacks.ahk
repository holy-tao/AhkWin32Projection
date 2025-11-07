#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides a callback mechanism for receiving key status change updates from an IMFContentDecryptionModuleSession.
 * @remarks
 * 
 * **IMFContentDecryptionModuleSessionCallbacks** is based on the Encrypted Media Extension specification's  [keystatuseschange event](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-evt-keystatuseschange).
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks
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
     * 
     * @param {Integer} messageType 
     * @param {Pointer<Integer>} message 
     * @param {Integer} messageSize 
     * @param {PWSTR} destinationURL 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks-keymessage
     */
    KeyMessage(messageType, message, messageSize, destinationURL) {
        destinationURL := destinationURL is String ? StrPtr(destinationURL) : destinationURL

        messageMarshal := message is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, "int", messageType, messageMarshal, message, "uint", messageSize, "ptr", destinationURL, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks-keystatuschanged
     */
    KeyStatusChanged() {
        result := ComCall(4, this, "HRESULT")
        return result
    }
}
