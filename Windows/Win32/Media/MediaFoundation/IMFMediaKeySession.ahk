#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\Foundation\BSTR.ahk" { BSTR }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }

/**
 * Represents a session with the Digital Rights Management (DRM) key system.
 * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nn-mfmediaengine-imfmediakeysession
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFMediaKeySession extends IUnknown {
    /**
     * The interface identifier for IMFMediaKeySession
     * @type {Guid}
     */
    static IID := Guid("{24fa67d5-d1d0-4dc5-995c-c0efdc191fb5}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFMediaKeySession interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        GetError      : IntPtr
        get_KeySystem : IntPtr
        get_SessionId : IntPtr
        Update        : IntPtr
        Close         : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFMediaKeySession.Vtbl()
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
     * @type {BSTR} 
     */
    SessionId {
        get => this.get_SessionId()
    }

    /**
     * Gets the error state associated with the media key session.
     * @param {Pointer<Integer>} code The error code.
     * @param {Pointer<Integer>} systemCode Platform specific error information.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-geterror
     */
    GetError(code, systemCode) {
        codeMarshal := code is VarRef ? "ushort*" : "ptr"
        systemCodeMarshal := systemCode is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, codeMarshal, code, systemCodeMarshal, systemCode, "HRESULT")
        return result
    }

    /**
     * Gets the name of the key system name the media keys object was created with.
     * @returns {BSTR} The name of the key system.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-get_keysystem
     */
    get_KeySystem() {
        keySystem := BSTR.Owned()
        result := ComCall(4, this, BSTR.Ptr, keySystem, "HRESULT")
        return keySystem
    }

    /**
     * Gets a unique session id created for this session.
     * @returns {BSTR} The media key session id.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-get_sessionid
     */
    get_SessionId() {
        sessionId := BSTR.Owned()
        result := ComCall(5, this, BSTR.Ptr, sessionId, "HRESULT")
        return sessionId
    }

    /**
     * Passes in a key value with any associated data required by the Content Decryption Module for the given key system.
     * @param {Integer} key 
     * @param {Integer} cb The count in bytes of <i>key</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-update
     */
    Update(key, cb) {
        result := ComCall(6, this, "ptr", key, "uint", cb, "HRESULT")
        return result
    }

    /**
     * Closes the media key session and must be called before the key session is released.
     * @returns {HRESULT} If this method succeeds, it returns <b>S_OK</b>. Otherwise, it returns an <b>HRESULT</b> error code.
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-close
     */
    Close() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFMediaKeySession.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.GetError := CallbackCreate(GetMethod(implObj, "GetError"), flags, 3)
        this.vtbl.get_KeySystem := CallbackCreate(GetMethod(implObj, "get_KeySystem"), flags, 2)
        this.vtbl.get_SessionId := CallbackCreate(GetMethod(implObj, "get_SessionId"), flags, 2)
        this.vtbl.Update := CallbackCreate(GetMethod(implObj, "Update"), flags, 3)
        this.vtbl.Close := CallbackCreate(GetMethod(implObj, "Close"), flags, 1)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.GetError)
        CallbackFree(this.vtbl.get_KeySystem)
        CallbackFree(this.vtbl.get_SessionId)
        CallbackFree(this.vtbl.Update)
        CallbackFree(this.vtbl.Close)
    }
}
