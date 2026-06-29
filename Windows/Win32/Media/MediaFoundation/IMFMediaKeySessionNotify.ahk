#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Provides a mechanism for notifying the app about information regarding the media key session.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediakeysessionnotify
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaKeySessionNotify extends IUnknown {
    /**
     * The interface identifier for IMFMediaKeySessionNotify
     * @type {Guid}
     */
    static IID := Guid("{6a0083f9-8947-4c1d-9ce0-cdee22b23135}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaKeySessionNotify interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        KeyMessage : IntPtr
        KeyAdded   : IntPtr
        KeyError   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaKeySessionNotify.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Passes information to the application so it can initiate a key acquisition.
     * @param {BSTR} destinationURL The URL to send the message to.
     * @param {Integer} message The message to send to the application.
     * @param {Integer} cb The length in bytes of <i>message</i>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysessionnotify-keymessage
     */
    KeyMessage(destinationURL, message, cb) {
        destinationURL := destinationURL is String ? BSTR.Alloc(destinationURL).Value : destinationURL

        ComCall(3, this, BSTR, destinationURL, "ptr", message, "uint", cb)
    }

    /**
     * Notifies the application that the key has been added.
     * @remarks
     * <b>KeyAdded</b> can also be called if the keys requested for the session have already been acquired.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysessionnotify-keyadded
     */
    KeyAdded() {
        ComCall(4, this)
    }

    /**
     * Notifies the application that an error occurred while processing the key.
     * @param {Integer} code 
     * @param {Integer} systemCode 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysessionnotify-keyerror
     */
    KeyError(code, systemCode) {
        ComCall(5, this, "ushort", code, "uint", systemCode)
    }

    Query(iid) {
        if (IMFMediaKeySessionNotify.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KeyMessage := CallbackCreate(GetMethod(implObj, "KeyMessage"), flags, 4)
        this.vtbl.KeyAdded := CallbackCreate(GetMethod(implObj, "KeyAdded"), flags, 1)
        this.vtbl.KeyError := CallbackCreate(GetMethod(implObj, "KeyError"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KeyMessage)
        CallbackFree(this.vtbl.KeyAdded)
        CallbackFree(this.vtbl.KeyError)
    }
}
