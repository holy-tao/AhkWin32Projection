#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\MF_MEDIAKEYSESSION_MESSAGETYPE.ahk" { MF_MEDIAKEYSESSION_MESSAGETYPE }
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a callback mechanism for receiving key status change updates from an IMFContentDecryptionModuleSession.
 * @remarks
 * **IMFContentDecryptionModuleSessionCallbacks** is based on the Encrypted Media Extension specification's  [keystatuseschange event](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-evt-keystatuseschange).
 * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFContentDecryptionModuleSessionCallbacks extends IUnknown {
    /**
     * The interface identifier for IMFContentDecryptionModuleSessionCallbacks
     * @type {Guid}
     */
    static IID := Guid("{3f96ee40-ad81-4096-8470-59a4b770f89a}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFContentDecryptionModuleSessionCallbacks interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KeyMessage       : IntPtr
        KeyStatusChanged : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFContentDecryptionModuleSessionCallbacks.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Called when the Content Decryption Module (CDM) has generated a message for the session.
     * @remarks
     * **KeyMessage** is based on the Encrypted Media Extension specification's [MediaKeyMessageEvent](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeymessageevent).
     * @param {MF_MEDIAKEYSESSION_MESSAGETYPE} messageType A value from the [MF_MEDIAKEYSESSION_MESSAGETYPE](../mfidl/ne-mfidl-mf_mediakeysession_messagetype.md) enumeration specifying the type of the message.
     * @param {Pointer<Integer>} message A pointer to a **BYTE** array containing the message contents. Messages are Key System-specific.
     * @param {Integer} messageSize The size of the array in the *message* parameter.
     * @param {PWSTR} destinationURL A optional parameter containing the destination URL.
     * @returns {HRESULT} Returns an HRESULT.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks-keymessage
     */
    KeyMessage(messageType, message, messageSize, destinationURL) {
        destinationURL := destinationURL is String ? StrPtr(destinationURL) : destinationURL

        messageMarshal := message is VarRef ? "char*" : "ptr"

        result := ComCall(3, this, MF_MEDIAKEYSESSION_MESSAGETYPE, messageType, messageMarshal, message, "uint", messageSize, "ptr", destinationURL, "HRESULT")
        return result
    }

    /**
     * The IMFContentDecryptionModuleSessionCallbacks::KeyStatusChanged function is called when there has been a change in the keys in the Content Decryption Module (CDM) session or their status.
     * @remarks
     * Get the current status of the CDM session keys by calling [IMFContentDecryptionModuleSession::GetKeyStatuses](nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getkeystatuses.md). 
     * 
     * **KeyStatusChanged** is based on the Encrypted Media Extension specification's [keystatuseschange](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-evt-keystatuseschange).
     * @returns {HRESULT} Returns S_OK.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks-keystatuschanged
     */
    KeyStatusChanged() {
        result := ComCall(4, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFContentDecryptionModuleSessionCallbacks.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KeyMessage := CallbackCreate(GetMethod(implObj, "KeyMessage"), flags, 5)
        this.vtbl.KeyStatusChanged := CallbackCreate(GetMethod(implObj, "KeyStatusChanged"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KeyMessage)
        CallbackFree(this.vtbl.KeyStatusChanged)
    }
}
