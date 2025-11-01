#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Content Decryption Module (CDM) for a DRM key system.
 * @remarks
 * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodule
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class IMFContentDecryptionModule extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IMFContentDecryptionModule
     * @type {Guid}
     */
    static IID => Guid("{87be986c-10be-4943-bf48-4b54ce1983a2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SetContentEnabler", "GetSuspendNotify", "SetPMPHostApp", "CreateSession", "SetServerCertificate", "CreateTrustedInput", "GetProtectionSystemIds"]

    /**
     * 
     * @param {IMFContentEnabler} contentEnabler 
     * @param {IMFAsyncResult} result 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-setcontentenabler
     */
    SetContentEnabler(contentEnabler, result) {
        result := ComCall(3, this, "ptr", contentEnabler, "ptr", result, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<IMFCdmSuspendNotify>} notify 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-getsuspendnotify
     */
    GetSuspendNotify(notify) {
        result := ComCall(4, this, "ptr*", notify, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IMFPMPHostApp} pmpHostApp 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-setpmphostapp
     */
    SetPMPHostApp(pmpHostApp) {
        result := ComCall(5, this, "ptr", pmpHostApp, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Integer} sessionType 
     * @param {IMFContentDecryptionModuleSessionCallbacks} callbacks 
     * @param {Pointer<IMFContentDecryptionModuleSession>} session 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-createsession
     */
    CreateSession(sessionType, callbacks, session) {
        result := ComCall(6, this, "int", sessionType, "ptr", callbacks, "ptr*", session, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} certificate 
     * @param {Integer} certificateSize 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-setservercertificate
     */
    SetServerCertificate(certificate, certificateSize) {
        certificateMarshal := certificate is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, certificateMarshal, certificate, "uint", certificateSize, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Integer>} contentInitData 
     * @param {Integer} contentInitDataSize 
     * @param {Pointer<IMFTrustedInput>} trustedInput 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-createtrustedinput
     */
    CreateTrustedInput(contentInitData, contentInitDataSize, trustedInput) {
        contentInitDataMarshal := contentInitData is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, contentInitDataMarshal, contentInitData, "uint", contentInitDataSize, "ptr*", trustedInput, "HRESULT")
        return result
    }

    /**
     * 
     * @param {Pointer<Pointer<Guid>>} systemIds 
     * @param {Pointer<Integer>} count 
     * @returns {HRESULT} 
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-getprotectionsystemids
     */
    GetProtectionSystemIds(systemIds, count) {
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, "ptr*", systemIds, countMarshal, count, "HRESULT")
        return result
    }
}
