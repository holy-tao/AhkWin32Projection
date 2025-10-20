#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a session with the Digital Rights Management (DRM) key system.
 * @see https://docs.microsoft.com/windows/win32/api//mfmediaengine/nn-mfmediaengine-imfmediakeysession
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFMediaKeySession extends IUnknown{
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
     * 
     * @param {Pointer<UInt16>} code 
     * @param {Pointer<UInt32>} systemCode 
     * @returns {HRESULT} 
     */
    GetError(code, systemCode) {
        result := ComCall(3, this, "ushort*", code, "uint*", systemCode, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} keySystem 
     * @returns {HRESULT} 
     */
    get_KeySystem(keySystem) {
        result := ComCall(4, this, "ptr", keySystem, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} sessionId 
     * @returns {HRESULT} 
     */
    get_SessionId(sessionId) {
        result := ComCall(5, this, "ptr", sessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer} key 
     * @param {Integer} cb 
     * @returns {HRESULT} 
     */
    Update(key, cb) {
        result := ComCall(6, this, "ptr", key, "uint", cb, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(7, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
