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
     * Gets the error state associated with the media key session.
     * @param {Pointer<Integer>} code The error code.
     * @param {Pointer<Integer>} systemCode Platform specific error information.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediakeysession-geterror
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
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediakeysession-get_keysystem
     */
    get_KeySystem() {
        keySystem := BSTR()
        result := ComCall(4, this, "ptr", keySystem, "HRESULT")
        return keySystem
    }

    /**
     * Gets a unique session id created for this session.
     * @returns {BSTR} The media key session id.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediakeysession-get_sessionid
     */
    get_SessionId() {
        sessionId := BSTR()
        result := ComCall(5, this, "ptr", sessionId, "HRESULT")
        return sessionId
    }

    /**
     * Passes in a key value with any associated data required by the Content Decryption Module for the given key system.
     * @param {Pointer} key 
     * @param {Integer} cb The count in bytes of <i>key</i>.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediakeysession-update
     */
    Update(key, cb) {
        result := ComCall(6, this, "ptr", key, "uint", cb, "HRESULT")
        return result
    }

    /**
     * Closes the media key session and must be called before the key session is released.
     * @returns {HRESULT} If this method succeeds, it returns <b xmlns:loc="http://microsoft.com/wdcml/l10n">S_OK</b>. Otherwise, it returns an <b xmlns:loc="http://microsoft.com/wdcml/l10n">HRESULT</b> error code.
     * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nf-mfmediaengine-imfmediakeysession-close
     */
    Close() {
        result := ComCall(7, this, "HRESULT")
        return result
    }
}
