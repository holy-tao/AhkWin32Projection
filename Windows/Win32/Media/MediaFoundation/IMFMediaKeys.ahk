#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFCdmSuspendNotify.ahk" { IMFCdmSuspendNotify }
#Import ".\IMFMediaKeySessionNotify.ahk" { IMFMediaKeySessionNotify }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IMFMediaKeySession.ahk" { IMFMediaKeySession }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a media keys used for decrypting media data using a Digital Rights Management (DRM) key system.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediakeys
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaKeys extends IUnknown {
    /**
     * The interface identifier for IMFMediaKeys
     * @type {Guid}
     */
    static IID := Guid("{5cb31c05-61ff-418f-afda-caaf41421a38}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaKeys interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        CreateSession    : IntPtr
        get_KeySystem    : IntPtr
        Shutdown         : IntPtr
        GetSuspendNotify : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaKeys.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {BSTR} 
     */
    KeySystem {
        get => this.get_KeySystem()
    }

    /**
     * Creates a media key session object using the specified initialization data and custom data. .
     * @param {BSTR} mimeType The MIME type of the media container used for the content.
     * @param {Integer} initData The initialization data for the key system.
     * @param {Integer} cb The count in bytes of <i>initData</i>.
     * @param {Integer} customData Custom data sent to the key system.
     * @param {Integer} cbCustomData The count in bytes of <i>cbCustomData</i>.
     * @param {IMFMediaKeySessionNotify} notify notify
     * @returns {IMFMediaKeySession} The media key session.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeys-createsession
     */
    CreateSession(mimeType, initData, cb, customData, cbCustomData, notify) {
        mimeType := mimeType is String ? BSTR.Alloc(mimeType).Value : mimeType

        result := ComCall(3, this, BSTR, mimeType, "ptr", initData, "uint", cb, "ptr", customData, "uint", cbCustomData, "ptr", notify, "ptr*", &ppSession := 0, "HRESULT")
        return IMFMediaKeySession(ppSession)
    }

    /**
     * Gets the key system string the IMFMediaKeys object was created with.
     * @returns {BSTR} The string name of the key system.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeys-get_keysystem
     */
    get_KeySystem() {
        keySystem := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, keySystem, "HRESULT")
        return keySystem
    }

    /**
     * The IMFMediaKeys::Shutdown (mfmediaengine.h) method shuts down the associated Content Decryption Module (CDM).
     * @remarks
     * <b>Shutdown</b> should be called by the application before final release.  The Content Decryption Module (CDM) reference and any other resources is released at this point.  However, related sessions are not freed or closed.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeys-shutdown
     */
    Shutdown() {
        result := ComCall(5, this, "HRESULT")
        return result
    }

    /**
     * Gets the suspend notify interface of the Content Decryption Module (CDM).
     * @returns {IMFCdmSuspendNotify} The suspend notify interface of the Content Decryption Module (CDM).
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeys-getsuspendnotify
     */
    GetSuspendNotify() {
        result := ComCall(6, this, "ptr*", &notify := 0, "HRESULT")
        return IMFCdmSuspendNotify(notify)
    }

    Query(iid) {
        if (IMFMediaKeys.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.CreateSession := CallbackCreate(GetMethod(implObj, "CreateSession"), flags, 8)
        this.vtbl.get_KeySystem := CallbackCreate(GetMethod(implObj, "get_KeySystem"), flags, 2)
        this.vtbl.Shutdown := CallbackCreate(GetMethod(implObj, "Shutdown"), flags, 1)
        this.vtbl.GetSuspendNotify := CallbackCreate(GetMethod(implObj, "GetSuspendNotify"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.CreateSession)
        CallbackFree(this.vtbl.get_KeySystem)
        CallbackFree(this.vtbl.Shutdown)
        CallbackFree(this.vtbl.GetSuspendNotify)
    }
}
