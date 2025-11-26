#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a session with the Digital Rights Management (DRM) key system.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediakeysession
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaKeySession extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFMediaKeySession
     * @type {Guid}
     */
    static IID => Guid("{24fa67d5-d1d0-4dc5-995c-c0efdc191fb5}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetError", "get_KeySystem", "get_SessionId", "Update", "Close"]

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
     * 
     * @param {Pointer<Integer>} code 
     * @param {Pointer<Integer>} systemCode 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-geterror
     */
    GetError(code, systemCode) {
        codeMarshal := code is VarRef ? "ushort*" : "ptr"
        systemCodeMarshal := systemCode is VarRef ? "uint*" : "ptr"

        result := ComCall(3, this, codeMarshal, code, systemCodeMarshal, systemCode, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-get_keysystem
     */
    get_KeySystem() {
        keySystem := BSTR()
        result := ComCall(4, this, "ptr", keySystem, "HRESULT")
        return keySystem
    }

    /**
     * 
     * @returns {BSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-get_sessionid
     */
    get_SessionId() {
        sessionId := BSTR()
        result := ComCall(5, this, "ptr", sessionId, "HRESULT")
        return sessionId
    }

    /**
     * 
     * @param {Pointer} key 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-update
     */
    Update(key, cb) {
        result := ComCall(6, this, "ptr", key, "uint", cb, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfmediaengine/nf-mfmediaengine-imfmediakeysession-close
     */
    Close() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
