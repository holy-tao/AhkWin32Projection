#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Provides access to the Content Decryption Module (CDM) for encrypted media extensions support.
 * @remarks
 * 
  * **IMFContentDecryptionModuleSession** is based on the Encrypted Media Extension specification's [MediaKeySession](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeysession).
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentDecryptionModuleSession extends IUnknown{
    /**
     * The interface identifier for IMFContentDecryptionModuleSession
     * @type {Guid}
     */
    static IID => Guid("{4e233efd-1dd2-49e8-b577-d63eee4c0d33}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * 
     * @param {Pointer<PWSTR>} sessionId 
     * @returns {HRESULT} 
     */
    GetSessionId(sessionId) {
        result := ComCall(3, this, "ptr", sessionId, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Double>} expiration 
     * @returns {HRESULT} 
     */
    GetExpiration(expiration) {
        result := ComCall(4, this, "double*", expiration, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<MFMediaKeyStatus>} keyStatuses 
     * @param {Pointer<UInt32>} numKeyStatuses 
     * @returns {HRESULT} 
     */
    GetKeyStatuses(keyStatuses, numKeyStatuses) {
        result := ComCall(5, this, "ptr", keyStatuses, "uint*", numKeyStatuses, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} sessionId 
     * @param {Pointer<BOOL>} loaded 
     * @returns {HRESULT} 
     */
    Load(sessionId, loaded) {
        sessionId := sessionId is String ? StrPtr(sessionId) : sessionId

        result := ComCall(6, this, "ptr", sessionId, "ptr", loaded, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} initDataType 
     * @param {Pointer<Byte>} initData 
     * @param {Integer} initDataSize 
     * @returns {HRESULT} 
     */
    GenerateRequest(initDataType, initData, initDataSize) {
        initDataType := initDataType is String ? StrPtr(initDataType) : initDataType

        result := ComCall(7, this, "ptr", initDataType, "char*", initData, "uint", initDataSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} response 
     * @param {Integer} responseSize 
     * @returns {HRESULT} 
     */
    Update(response, responseSize) {
        result := ComCall(8, this, "char*", response, "uint", responseSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Close() {
        result := ComCall(9, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Remove() {
        result := ComCall(10, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
