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
     * @returns {PWSTR} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getsessionid
     */
    GetSessionId() {
        result := ComCall(3, this, "ptr*", &sessionId := 0, "HRESULT")
        return sessionId
    }

    /**
     * 
     * @returns {Float} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getexpiration
     */
    GetExpiration() {
        result := ComCall(4, this, "double*", &expiration := 0, "HRESULT")
        return expiration
    }

    /**
     * 
     * @param {Pointer<Pointer<MFMediaKeyStatus>>} keyStatuses 
     * @param {Pointer<Integer>} numKeyStatuses 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-getkeystatuses
     */
    GetKeyStatuses(keyStatuses, numKeyStatuses) {
        keyStatusesMarshal := keyStatuses is VarRef ? "ptr*" : "ptr"
        numKeyStatusesMarshal := numKeyStatuses is VarRef ? "uint*" : "ptr"

        result := ComCall(5, this, keyStatusesMarshal, keyStatuses, numKeyStatusesMarshal, numKeyStatuses, "HRESULT")
        return result
    }

    /**
     * 
     * @param {PWSTR} sessionId 
     * @returns {BOOL} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-load
     */
    Load(sessionId) {
        sessionId := sessionId is String ? StrPtr(sessionId) : sessionId

        result := ComCall(6, this, "ptr", sessionId, "int*", &loaded := 0, "HRESULT")
        return loaded
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

        initDataMarshal := initData is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, "ptr", initDataType, initDataMarshal, initData, "uint", initDataSize, "HRESULT")
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
        responseMarshal := response is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, responseMarshal, response, "uint", responseSize, "HRESULT")
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
