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
     * 
     * @param {Pointer<IMFContentEnabler>} contentEnabler 
     * @param {Pointer<IMFAsyncResult>} result 
     * @returns {HRESULT} 
     */
    SetContentEnabler(contentEnabler, result) {
        result := ComCall(3, this, "ptr", contentEnabler, "ptr", result, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFCdmSuspendNotify>} notify 
     * @returns {HRESULT} 
     */
    GetSuspendNotify(notify) {
        result := ComCall(4, this, "ptr", notify, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IMFPMPHostApp>} pmpHostApp 
     * @returns {HRESULT} 
     */
    SetPMPHostApp(pmpHostApp) {
        result := ComCall(5, this, "ptr", pmpHostApp, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} sessionType 
     * @param {Pointer<IMFContentDecryptionModuleSessionCallbacks>} callbacks 
     * @param {Pointer<IMFContentDecryptionModuleSession>} session 
     * @returns {HRESULT} 
     */
    CreateSession(sessionType, callbacks, session) {
        result := ComCall(6, this, "int", sessionType, "ptr", callbacks, "ptr", session, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} certificate 
     * @param {Integer} certificateSize 
     * @returns {HRESULT} 
     */
    SetServerCertificate(certificate, certificateSize) {
        result := ComCall(7, this, "char*", certificate, "uint", certificateSize, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} contentInitData 
     * @param {Integer} contentInitDataSize 
     * @param {Pointer<IMFTrustedInput>} trustedInput 
     * @returns {HRESULT} 
     */
    CreateTrustedInput(contentInitData, contentInitDataSize, trustedInput) {
        result := ComCall(8, this, "char*", contentInitData, "uint", contentInitDataSize, "ptr", trustedInput, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Guid>} systemIds 
     * @param {Pointer<UInt32>} count 
     * @returns {HRESULT} 
     */
    GetProtectionSystemIds(systemIds, count) {
        result := ComCall(9, this, "ptr", systemIds, "uint*", count, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
