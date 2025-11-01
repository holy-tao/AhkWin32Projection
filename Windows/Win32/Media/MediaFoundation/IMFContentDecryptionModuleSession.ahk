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

    static sizeof => A_PtrSize
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
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetSessionId", "GetExpiration", "GetKeyStatuses", "Load", "GenerateRequest", "Update", "Close", "Remove"]

    /**
     * 
     * @param {Pointer<PWSTR>} sessionId 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getsessionid
     */
    GetSessionId(sessionId) {
        result := ComCall(3, this, "ptr", sessionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Float>} expiration 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getexpiration
     */
    GetExpiration(expiration) {
        result := ComCall(4, this, "double*", expiration, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<MFMediaKeyStatus>>} keyStatuses 
     * @param {Pointer<Integer>} numKeyStatuses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getkeystatuses
     */
    GetKeyStatuses(keyStatuses, numKeyStatuses) {
        result := ComCall(5, this, "ptr*", keyStatuses, "uint*", numKeyStatuses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} sessionId 
     * @param {Pointer<BOOL>} loaded 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-load
     */
    Load(sessionId, loaded) {
        sessionId := sessionId is String ? StrPtr(sessionId) : sessionId

        result := ComCall(6, this, "ptr", sessionId, "ptr", loaded, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} initDataType 
     * @param {Pointer<Integer>} initData 
     * @param {Integer} initDataSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-generaterequest
     */
    GenerateRequest(initDataType, initData, initDataSize) {
        initDataType := initDataType is String ? StrPtr(initDataType) : initDataType

        result := ComCall(7, this, "ptr", initDataType, "char*", initData, "uint", initDataSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} response 
     * @param {Integer} responseSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-update
     */
    Update(response, responseSize) {
        result := ComCall(8, this, "char*", response, "uint", responseSize, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-close
     */
    Close() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-remove
     */
    Remove() {
        result := ComCall(10, this, "HRESULT")
        return result
    }
}
