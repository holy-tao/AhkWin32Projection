#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\IMFCdmSuspendNotify.ahk
#Include .\IMFContentDecryptionModuleSession.ahk
#Include .\IMFTrustedInput.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Represents a Content Decryption Module (CDM) for a DRM key system.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodule
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
     * Allows the caller to specify the IMFContentEnabler interface that shall be used by the Content Decryption Module (CDM).
     * @remarks
     * The IMFContentEnabler is typically obtained by calling  [IMFInputTrustAuthority::RequestAccess](../mfidl/nf-mfidl-imfinputtrustauthority-requestaccess.md).
     * @param {IMFContentEnabler} contentEnabler The [IMFContentEnabler](../mfidl/nn-mfidl-imfcontentenabler.md) interface to be used by the CDM.
     * @param {IMFAsyncResult} result_ An [IMFAsyncResult](../mfobjects/nn-mfobjects-imfasyncresult.md) that provides information about the result of the operation.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-setcontentenabler
     */
    SetContentEnabler(contentEnabler, result_) {
        result := ComCall(3, this, "ptr", contentEnabler, "ptr", result_, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves an object for IMFContentDecryptionModuleSession suspend events.
     * @returns {IMFCdmSuspendNotify} Receives an [IMFCdmSuspendNotify](../mfmediaengine/nn-mfmediaengine-imfcdmsuspendnotify.md) object that notifies the Content Decryption Module (CDM) when global resources should be brought into a consistent state prior to suspending.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-getsuspendnotify
     */
    GetSuspendNotify() {
        result := ComCall(4, this, "ptr*", &notify := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFCdmSuspendNotify(notify)
    }

    /**
     * Allows the caller to specify the IMFPMPHostApp interface, which represents a protected process.
     * @param {IMFPMPHostApp} pmpHostApp The **IMFPMPHostApp** representing a protected process.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-setpmphostapp
     */
    SetPMPHostApp(pmpHostApp) {
        result := ComCall(5, this, "ptr", pmpHostApp, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * The IMFContentDecryptionModule::CreateSession function creates a IMFContentDecryptionModuleSession object representing a Content Decryption Module (CDM) session.
     * @remarks
     * **CreateSession** is based on the Encrypted Media Extension specification's [createSession](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeys-createsession).
     * @param {Integer} sessionType A member of the [MF_MEDIAKEYSESSION_TYPE](../mfidl/ne-mfidl-mf_mediakeysession_type.md) that specifies the type of CDM session to create.
     * @param {IMFContentDecryptionModuleSessionCallbacks} callbacks An [IMFContentDecryptionModuleSessionCallbacks](nn-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks.md) object for receiving key status change updates.
     * @returns {IMFContentDecryptionModuleSession} Receives the created **IMFContentDecryptionModuleSession** object.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-createsession
     */
    CreateSession(sessionType, callbacks) {
        result := ComCall(6, this, "int", sessionType, "ptr", callbacks, "ptr*", &session := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFContentDecryptionModuleSession(session)
    }

    /**
     * Provides a server certificate to be used to encrypt messages to the license server.
     * @remarks
     * **SetServerCertificate** is based on the Encrypted Media Extension specification's [SetServerCertificate](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeys-setservercertificate).
     * @param {Pointer<Integer>} certificate A **BYTE** array containing the certificate.
     * @param {Integer} certificateSize The size of the array in *certificate*.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-setservercertificate
     */
    SetServerCertificate(certificate, certificateSize) {
        certificateMarshal := certificate is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, certificateMarshal, certificate, "uint", certificateSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Creates an IMFTrustedInput object that implements the decryption of content.
     * @remarks
     * An implementation of a Content Decryption Module (CDM) may include an implementation of [IMFInputTrustAuthority](../mfidl/nn-mfidl-imfinputtrustauthority.md) obtained by calling **CreateTrustedInput**.
     * 
     * 
     * The following attributes are supported for **IMFInputTrustAuthority** decrypter.
     * 
     * | Property                                      |Description
     * |-----------------------------------------------|---------------------------------------------------------------|
     * | [MFT_POLICY_SET_AWARE](/windows/win32/medfound/mft-policy-set-aware) | If non-zero, indicates that the **IMFTransform** wants to receive [MEPolicySet](/windows/win32/medfound/mepolicyset) completion notifications.|
     * | [MFT_USING_HARDWARE_DRM](/windows/win32/medfound/mft-using-hardware-drm) | Specifies whether the IMFTransform is using hardware DRM. If an MFT decrypter specifies this attribute set to 1, then it is using hardware DRM. If an MFT decrypter specifies this attribute set to 0, then it is not using hardware DRM. If an MFT decrypter does not specify this attribute or specifies it with a different value, then it does not (or is unable to) indicate whether it is using hardware DRM. |
     * @param {Pointer<Integer>} contentInitData A **BYTE** array containing initialization data. *contentInitData* will only be used if initData from [IMFContentDecryptionModuleSession::GenerateRequest](nf-mfcontentdecryptionmodule-imfcontentdecryptionmodulesession-generaterequest.md) is not provided or incomplete. Initialization Data should be structured in PSSH Box Format. For more details, see the Encrypted Media Extension specification's [Common SystemID and PSSH Box Format](https://www.w3.org/TR/eme-initdata-cenc/#common-system).
     * @param {Integer} contentInitDataSize The size of the array in *contentInitData*.
     * @returns {IMFTrustedInput} Receives the created **IMFTrustedInput** object.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-createtrustedinput
     */
    CreateTrustedInput(contentInitData, contentInitDataSize) {
        contentInitDataMarshal := contentInitData is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, contentInitDataMarshal, contentInitData, "uint", contentInitDataSize, "ptr*", &trustedInput := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IMFTrustedInput(trustedInput)
    }

    /**
     * The IMFContentDecryptionModule::GetProtectionSystemIds gets a list of SystemIDs that the IMFContentDecryptionModule supports.
     * @remarks
     * **SystemIDs** are identifiers used in the "cenc" Initialization Data Format. For more details, see ["cenc" Initialization Data Format](https://w3c.github.io/encrypted-media/format-registry/initdata/cenc.html).
     * 
     * The *systemIds* memory must be allocated and freed using [CoTaskMem](../combaseapi/nf-combaseapi-cotaskmemalloc.md).
     * @param {Pointer<Pointer<Guid>>} systemIds A **GUID** array in which the SystemIDs are returned.
     * @param {Pointer<Integer>} count The count of SystemIDs returned in the *systemIds* parameter.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api//content/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-getprotectionsystemids
     */
    GetProtectionSystemIds(systemIds, count) {
        systemIdsMarshal := systemIds is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, systemIdsMarshal, systemIds, countMarshal, count, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
