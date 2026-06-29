#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\Guid.ahk" { Guid }
#Import ".\IMFCdmSuspendNotify.ahk" { IMFCdmSuspendNotify }
#Import ".\MF_MEDIAKEYSESSION_TYPE.ahk" { MF_MEDIAKEYSESSION_TYPE }
#Import ".\IMFContentDecryptionModuleSession.ahk" { IMFContentDecryptionModuleSession }
#Import ".\IMFContentEnabler.ahk" { IMFContentEnabler }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IMFAsyncResult.ahk" { IMFAsyncResult }
#Import ".\IMFTrustedInput.ahk" { IMFTrustedInput }
#Import ".\IMFPMPHostApp.ahk" { IMFPMPHostApp }
#Import "..\..\System\Com\IUnknown.ahk" { IUnknown }
#Import ".\IMFContentDecryptionModuleSessionCallbacks.ahk" { IMFContentDecryptionModuleSessionCallbacks }

/**
 * Represents a Content Decryption Module (CDM) for a DRM key system.
 * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nn-mfcontentdecryptionmodule-imfcontentdecryptionmodule
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct IMFContentDecryptionModule extends IUnknown {
    /**
     * The interface identifier for IMFContentDecryptionModule
     * @type {Guid}
     */
    static IID := Guid("{87be986c-10be-4943-bf48-4b54ce1983a2}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IMFContentDecryptionModule interfaces
    */
    struct Vtbl extends IUnknown.Vtbl {
        SetContentEnabler      : IntPtr
        GetSuspendNotify       : IntPtr
        SetPMPHostApp          : IntPtr
        CreateSession          : IntPtr
        SetServerCertificate   : IntPtr
        CreateTrustedInput     : IntPtr
        GetProtectionSystemIds : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IMFContentDecryptionModule.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * Allows the caller to specify the IMFContentEnabler interface that shall be used by the Content Decryption Module (CDM).
     * @remarks
     * The IMFContentEnabler is typically obtained by calling  [IMFInputTrustAuthority::RequestAccess](../mfidl/nf-mfidl-imfinputtrustauthority-requestaccess.md).
     * @param {IMFContentEnabler} contentEnabler The [IMFContentEnabler](../mfidl/nn-mfidl-imfcontentenabler.md) interface to be used by the CDM.
     * @param {IMFAsyncResult} result An [IMFAsyncResult](../mfobjects/nn-mfobjects-imfasyncresult.md) that provides information about the result of the operation.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-setcontentenabler
     */
    SetContentEnabler(contentEnabler, result) {
        result := ComCall(3, this, "ptr", contentEnabler, "ptr", result, "HRESULT")
        return result
    }

    /**
     * Retrieves an object for IMFContentDecryptionModuleSession suspend events.
     * @returns {IMFCdmSuspendNotify} Receives an [IMFCdmSuspendNotify](../mfmediaengine/nn-mfmediaengine-imfcdmsuspendnotify.md) object that notifies the Content Decryption Module (CDM) when global resources should be brought into a consistent state prior to suspending.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-getsuspendnotify
     */
    GetSuspendNotify() {
        result := ComCall(4, this, "ptr*", &notify := 0, "HRESULT")
        return IMFCdmSuspendNotify(notify)
    }

    /**
     * Allows the caller to specify the IMFPMPHostApp interface, which represents a protected process.
     * @param {IMFPMPHostApp} pmpHostApp The **IMFPMPHostApp** representing a protected process.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-setpmphostapp
     */
    SetPMPHostApp(pmpHostApp) {
        result := ComCall(5, this, "ptr", pmpHostApp, "HRESULT")
        return result
    }

    /**
     * The IMFContentDecryptionModule::CreateSession function creates a IMFContentDecryptionModuleSession object representing a Content Decryption Module (CDM) session.
     * @remarks
     * **CreateSession** is based on the Encrypted Media Extension specification's [createSession](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeys-createsession).
     * @param {MF_MEDIAKEYSESSION_TYPE} sessionType A member of the [MF_MEDIAKEYSESSION_TYPE](../mfidl/ne-mfidl-mf_mediakeysession_type.md) that specifies the type of CDM session to create.
     * @param {IMFContentDecryptionModuleSessionCallbacks} callbacks An [IMFContentDecryptionModuleSessionCallbacks](nn-mfcontentdecryptionmodule-imfcontentdecryptionmodulesessioncallbacks.md) object for receiving key status change updates.
     * @returns {IMFContentDecryptionModuleSession} Receives the created **IMFContentDecryptionModuleSession** object.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-createsession
     */
    CreateSession(sessionType, callbacks) {
        result := ComCall(6, this, MF_MEDIAKEYSESSION_TYPE, sessionType, "ptr", callbacks, "ptr*", &session := 0, "HRESULT")
        return IMFContentDecryptionModuleSession(session)
    }

    /**
     * Provides a server certificate to be used to encrypt messages to the license server.
     * @remarks
     * **SetServerCertificate** is based on the Encrypted Media Extension specification's [SetServerCertificate](https://www.w3.org/TR/2017/REC-encrypted-media-20170918/#dom-mediakeys-setservercertificate).
     * @param {Pointer<Integer>} certificate A **BYTE** array containing the certificate.
     * @param {Integer} certificateSize The size of the array in *certificate*.
     * @returns {HRESULT} Returns S_OK on success.
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-setservercertificate
     */
    SetServerCertificate(certificate, certificateSize) {
        certificateMarshal := certificate is VarRef ? "char*" : "ptr"

        result := ComCall(7, this, certificateMarshal, certificate, "uint", certificateSize, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-createtrustedinput
     */
    CreateTrustedInput(contentInitData, contentInitDataSize) {
        contentInitDataMarshal := contentInitData is VarRef ? "char*" : "ptr"

        result := ComCall(8, this, contentInitDataMarshal, contentInitData, "uint", contentInitDataSize, "ptr*", &trustedInput := 0, "HRESULT")
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
     * @see https://learn.microsoft.com/windows/win32/api/mfcontentdecryptionmodule/nf-mfcontentdecryptionmodule-imfcontentdecryptionmodule-getprotectionsystemids
     */
    GetProtectionSystemIds(systemIds, count) {
        systemIdsMarshal := systemIds is VarRef ? "ptr*" : "ptr"
        countMarshal := count is VarRef ? "uint*" : "ptr"

        result := ComCall(9, this, systemIdsMarshal, systemIds, countMarshal, count, "HRESULT")
        return result
    }

    Query(iid) {
        if (IMFContentDecryptionModule.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.SetContentEnabler := CallbackCreate(GetMethod(implObj, "SetContentEnabler"), flags, 3)
        this.vtbl.GetSuspendNotify := CallbackCreate(GetMethod(implObj, "GetSuspendNotify"), flags, 2)
        this.vtbl.SetPMPHostApp := CallbackCreate(GetMethod(implObj, "SetPMPHostApp"), flags, 2)
        this.vtbl.CreateSession := CallbackCreate(GetMethod(implObj, "CreateSession"), flags, 4)
        this.vtbl.SetServerCertificate := CallbackCreate(GetMethod(implObj, "SetServerCertificate"), flags, 3)
        this.vtbl.CreateTrustedInput := CallbackCreate(GetMethod(implObj, "CreateTrustedInput"), flags, 4)
        this.vtbl.GetProtectionSystemIds := CallbackCreate(GetMethod(implObj, "GetProtectionSystemIds"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.SetContentEnabler)
        CallbackFree(this.vtbl.GetSuspendNotify)
        CallbackFree(this.vtbl.SetPMPHostApp)
        CallbackFree(this.vtbl.CreateSession)
        CallbackFree(this.vtbl.SetServerCertificate)
        CallbackFree(this.vtbl.CreateTrustedInput)
        CallbackFree(this.vtbl.GetProtectionSystemIds)
    }
}
