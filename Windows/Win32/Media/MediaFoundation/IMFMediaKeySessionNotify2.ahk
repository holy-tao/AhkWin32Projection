#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFMediaKeySessionNotify.ahk" { IMFMediaKeySessionNotify }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\MF_MEDIAKEYSESSION_MESSAGETYPE.ahk" { MF_MEDIAKEYSESSION_MESSAGETYPE }

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaKeySessionNotify2 extends IMFMediaKeySessionNotify {
    /**
     * The interface identifier for IMFMediaKeySessionNotify2
     * @type {Guid}
     */
    static IID := Guid("{c3a9e92a-da88-46b0-a110-6cf953026cb9}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaKeySessionNotify2 interfaces
    */
    struct Vtbl extends IMFMediaKeySessionNotify.Vtbl {
        KeyMessage2     : IntPtr
        KeyStatusChange : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaKeySessionNotify2.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * 
     * @param {MF_MEDIAKEYSESSION_MESSAGETYPE} eMessageType 
     * @param {BSTR} destinationURL 
     * @param {Integer} pbMessage 
     * @param {Integer} cbMessage 
     * @returns {String} Nothing - always returns an empty string
     */
    KeyMessage2(eMessageType, destinationURL, pbMessage, cbMessage) {
        destinationURL := destinationURL is String ? BSTR.Alloc(destinationURL).Value : destinationURL

        ComCall(6, this, MF_MEDIAKEYSESSION_MESSAGETYPE, eMessageType, BSTR, destinationURL, "ptr", pbMessage, "uint", cbMessage)
    }

    /**
     * 
     * @returns {String} Nothing - always returns an empty string
     */
    KeyStatusChange() {
        ComCall(7, this)
    }

    Query(iid) {
        if (IMFMediaKeySessionNotify2.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.KeyMessage2 := CallbackCreate(GetMethod(implObj, "KeyMessage2"), flags, 5)
        this.vtbl.KeyStatusChange := CallbackCreate(GetMethod(implObj, "KeyStatusChange"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.KeyMessage2)
        CallbackFree(this.vtbl.KeyStatusChange)
    }
}
