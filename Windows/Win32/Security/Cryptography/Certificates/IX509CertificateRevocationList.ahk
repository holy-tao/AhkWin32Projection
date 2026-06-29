#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IX509Extensions.ahk" { IX509Extensions }
#Import ".\IX509CertificateRevocationListEntries.ahk" { IX509CertificateRevocationListEntries }
#Import ".\ISignerCertificate.ahk" { ISignerCertificate }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IObjectId.ahk" { IObjectId }
#Import ".\IX500DistinguishedName.ahk" { IX500DistinguishedName }
#Import ".\IObjectIds.ahk" { IObjectIds }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\EncodingType.ahk" { EncodingType }
#Import ".\IX509PublicKey.ahk" { IX509PublicKey }
#Import ".\IX509SignatureInformation.ahk" { IX509SignatureInformation }
#Import "..\..\..\Foundation\VARIANT_BOOL.ahk" { VARIANT_BOOL }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509CertificateRevocationList extends IDispatch {
    /**
     * The interface identifier for IX509CertificateRevocationList
     * @type {Guid}
     */
    static IID := Guid("{728ab360-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509CertificateRevocationList interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize                      : IntPtr
        InitializeDecode                : IntPtr
        Encode                          : IntPtr
        ResetForEncode                  : IntPtr
        CheckPublicKeySignature         : IntPtr
        CheckSignature                  : IntPtr
        get_Issuer                      : IntPtr
        put_Issuer                      : IntPtr
        get_ThisUpdate                  : IntPtr
        put_ThisUpdate                  : IntPtr
        get_NextUpdate                  : IntPtr
        put_NextUpdate                  : IntPtr
        get_X509CRLEntries              : IntPtr
        get_X509Extensions              : IntPtr
        get_CriticalExtensions          : IntPtr
        get_SignerCertificate           : IntPtr
        put_SignerCertificate           : IntPtr
        get_CRLNumber                   : IntPtr
        put_CRLNumber                   : IntPtr
        get_CAVersion                   : IntPtr
        put_CAVersion                   : IntPtr
        get_BaseCRL                     : IntPtr
        get_NullSigned                  : IntPtr
        get_HashAlgorithm               : IntPtr
        put_HashAlgorithm               : IntPtr
        get_AlternateSignatureAlgorithm : IntPtr
        put_AlternateSignatureAlgorithm : IntPtr
        get_SignatureInformation        : IntPtr
        get_RawData                     : IntPtr
        get_RawDataToBeSigned           : IntPtr
        get_Signature                   : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509CertificateRevocationList.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IX500DistinguishedName} 
     */
    Issuer {
        get => this.get_Issuer()
        set => this.put_Issuer(value)
    }

    /**
     * @type {Float} 
     */
    ThisUpdate {
        get => this.get_ThisUpdate()
        set => this.put_ThisUpdate(value)
    }

    /**
     * @type {Float} 
     */
    NextUpdate {
        get => this.get_NextUpdate()
        set => this.put_NextUpdate(value)
    }

    /**
     * @type {IX509CertificateRevocationListEntries} 
     */
    X509CRLEntries {
        get => this.get_X509CRLEntries()
    }

    /**
     * @type {IX509Extensions} 
     */
    X509Extensions {
        get => this.get_X509Extensions()
    }

    /**
     * @type {IObjectIds} 
     */
    CriticalExtensions {
        get => this.get_CriticalExtensions()
    }

    /**
     * @type {ISignerCertificate} 
     */
    SignerCertificate {
        get => this.get_SignerCertificate()
        set => this.put_SignerCertificate(value)
    }

    /**
     * @type {Integer} 
     */
    CAVersion {
        get => this.get_CAVersion()
        set => this.put_CAVersion(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    BaseCRL {
        get => this.get_BaseCRL()
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    NullSigned {
        get => this.get_NullSigned()
    }

    /**
     * @type {IObjectId} 
     */
    HashAlgorithm {
        get => this.get_HashAlgorithm()
        set => this.put_HashAlgorithm(value)
    }

    /**
     * @type {VARIANT_BOOL} 
     */
    AlternateSignatureAlgorithm {
        get => this.get_AlternateSignatureAlgorithm()
        set => this.put_AlternateSignatureAlgorithm(value)
    }

    /**
     * @type {IX509SignatureInformation} 
     */
    SignatureInformation {
        get => this.get_SignatureInformation()
    }

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @remarks
     * <b>Windows::Foundation::Initialize</b> is changed to create 
     *     ASTAs instead of classic STAs for the <a href="https://docs.microsoft.com/windows/desktop/api/roapi/ne-roapi-ro_init_type">RO_INIT_TYPE</a> 
     *     value <b>RO_INIT_SINGLETHREADED</b>. 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_SINGLETHREADED</b>) 
     *     is not supported for desktop applications and will return <b>CO_E_NOTSUPPORTED</b> if called 
     *     from a process other than a Windows Store app.
     * 
     * For Microsoft DirectX applications, you must initialize the initial thread by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * 
     * For an out-of-process EXE server,  you must initialize the initial thread of the server by using 
     *     <b>Windows::Foundation::Initialize</b>(<b>RO_INIT_MULTITHREADED</b>).
     * @returns {HRESULT} <ul>
     * <li><b>S_OK</b> - Successfully initialized for the first time on the current thread</li>
     * <li><b>S_FALSE</b> - Successful nested initialization (current thread was already 
     *         initialized for the specified apartment type)</li>
     * <li><b>E_INVALIDARG</b> - Invalid <i>initType</i> value</li>
     * <li><b>CO_E_INIT_TLS</b> - Failed to allocate COM's internal TLS structure</li>
     * <li><b>E_OUTOFMEMORY</b> - Failed to allocate per-thread/per-apartment structures other 
     *         than the TLS</li>
     * <li><b>RPC_E_CHANGED_MODE</b> - The current thread is already initialized for a different 
     *         apartment type from what is specified.</li>
     * </ul>
     * @see https://learn.microsoft.com/windows/win32/api/roapi/nf-roapi-initialize
     */
    Initialize() {
        result := ComCall(7, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strEncodedData 
     * @param {EncodingType} Encoding 
     * @returns {HRESULT} 
     */
    InitializeDecode(strEncodedData, Encoding) {
        strEncodedData := strEncodedData is String ? BSTR.Alloc(strEncodedData).Value : strEncodedData

        result := ComCall(8, this, BSTR, strEncodedData, EncodingType, Encoding, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Encode() {
        result := ComCall(9, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    ResetForEncode() {
        result := ComCall(10, this, "HRESULT")
        return result
    }

    /**
     * 
     * @param {IX509PublicKey} pPublicKey 
     * @returns {HRESULT} 
     */
    CheckPublicKeySignature(pPublicKey) {
        result := ComCall(11, this, "ptr", pPublicKey, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    CheckSignature() {
        result := ComCall(12, this, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX500DistinguishedName} 
     */
    get_Issuer() {
        result := ComCall(13, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX500DistinguishedName(ppValue)
    }

    /**
     * 
     * @param {IX500DistinguishedName} pValue 
     * @returns {HRESULT} 
     */
    put_Issuer(pValue) {
        result := ComCall(14, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_ThisUpdate() {
        result := ComCall(15, this, "double*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_ThisUpdate(Value) {
        result := ComCall(16, this, "double", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Float} 
     */
    get_NextUpdate() {
        result := ComCall(17, this, "double*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Float} Value 
     * @returns {HRESULT} 
     */
    put_NextUpdate(Value) {
        result := ComCall(18, this, "double", Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509CertificateRevocationListEntries} 
     */
    get_X509CRLEntries() {
        result := ComCall(19, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509CertificateRevocationListEntries(ppValue)
    }

    /**
     * 
     * @returns {IX509Extensions} 
     */
    get_X509Extensions() {
        result := ComCall(20, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509Extensions(ppValue)
    }

    /**
     * 
     * @returns {IObjectIds} 
     */
    get_CriticalExtensions() {
        result := ComCall(21, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }

    /**
     * 
     * @returns {ISignerCertificate} 
     */
    get_SignerCertificate() {
        result := ComCall(22, this, "ptr*", &ppValue := 0, "HRESULT")
        return ISignerCertificate(ppValue)
    }

    /**
     * 
     * @param {ISignerCertificate} pValue 
     * @returns {HRESULT} 
     */
    put_SignerCertificate(pValue) {
        result := ComCall(23, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    get_CRLNumber(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(24, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @param {BSTR} Value 
     * @returns {HRESULT} 
     */
    put_CRLNumber(Encoding, Value) {
        Value := Value is String ? BSTR.Alloc(Value).Value : Value

        result := ComCall(25, this, EncodingType, Encoding, BSTR, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_CAVersion() {
        result := ComCall(26, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {Integer} pValue 
     * @returns {HRESULT} 
     */
    put_CAVersion(pValue) {
        result := ComCall(27, this, "int", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_BaseCRL() {
        result := ComCall(28, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_NullSigned() {
        result := ComCall(29, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {IObjectId} 
     */
    get_HashAlgorithm() {
        result := ComCall(30, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectId(ppValue)
    }

    /**
     * 
     * @param {IObjectId} pValue 
     * @returns {HRESULT} 
     */
    put_HashAlgorithm(pValue) {
        result := ComCall(31, this, "ptr", pValue, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {VARIANT_BOOL} 
     */
    get_AlternateSignatureAlgorithm() {
        result := ComCall(32, this, VARIANT_BOOL.Ptr, &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_AlternateSignatureAlgorithm(Value) {
        result := ComCall(33, this, VARIANT_BOOL, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509SignatureInformation} 
     */
    get_SignatureInformation() {
        result := ComCall(34, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509SignatureInformation(ppValue)
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    get_RawData(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(35, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    get_RawDataToBeSigned(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(36, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    get_Signature(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(37, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509CertificateRevocationList.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 1)
        this.vtbl.InitializeDecode := CallbackCreate(GetMethod(implObj, "InitializeDecode"), flags, 3)
        this.vtbl.Encode := CallbackCreate(GetMethod(implObj, "Encode"), flags, 1)
        this.vtbl.ResetForEncode := CallbackCreate(GetMethod(implObj, "ResetForEncode"), flags, 1)
        this.vtbl.CheckPublicKeySignature := CallbackCreate(GetMethod(implObj, "CheckPublicKeySignature"), flags, 2)
        this.vtbl.CheckSignature := CallbackCreate(GetMethod(implObj, "CheckSignature"), flags, 1)
        this.vtbl.get_Issuer := CallbackCreate(GetMethod(implObj, "get_Issuer"), flags, 2)
        this.vtbl.put_Issuer := CallbackCreate(GetMethod(implObj, "put_Issuer"), flags, 2)
        this.vtbl.get_ThisUpdate := CallbackCreate(GetMethod(implObj, "get_ThisUpdate"), flags, 2)
        this.vtbl.put_ThisUpdate := CallbackCreate(GetMethod(implObj, "put_ThisUpdate"), flags, 2)
        this.vtbl.get_NextUpdate := CallbackCreate(GetMethod(implObj, "get_NextUpdate"), flags, 2)
        this.vtbl.put_NextUpdate := CallbackCreate(GetMethod(implObj, "put_NextUpdate"), flags, 2)
        this.vtbl.get_X509CRLEntries := CallbackCreate(GetMethod(implObj, "get_X509CRLEntries"), flags, 2)
        this.vtbl.get_X509Extensions := CallbackCreate(GetMethod(implObj, "get_X509Extensions"), flags, 2)
        this.vtbl.get_CriticalExtensions := CallbackCreate(GetMethod(implObj, "get_CriticalExtensions"), flags, 2)
        this.vtbl.get_SignerCertificate := CallbackCreate(GetMethod(implObj, "get_SignerCertificate"), flags, 2)
        this.vtbl.put_SignerCertificate := CallbackCreate(GetMethod(implObj, "put_SignerCertificate"), flags, 2)
        this.vtbl.get_CRLNumber := CallbackCreate(GetMethod(implObj, "get_CRLNumber"), flags, 3)
        this.vtbl.put_CRLNumber := CallbackCreate(GetMethod(implObj, "put_CRLNumber"), flags, 3)
        this.vtbl.get_CAVersion := CallbackCreate(GetMethod(implObj, "get_CAVersion"), flags, 2)
        this.vtbl.put_CAVersion := CallbackCreate(GetMethod(implObj, "put_CAVersion"), flags, 2)
        this.vtbl.get_BaseCRL := CallbackCreate(GetMethod(implObj, "get_BaseCRL"), flags, 2)
        this.vtbl.get_NullSigned := CallbackCreate(GetMethod(implObj, "get_NullSigned"), flags, 2)
        this.vtbl.get_HashAlgorithm := CallbackCreate(GetMethod(implObj, "get_HashAlgorithm"), flags, 2)
        this.vtbl.put_HashAlgorithm := CallbackCreate(GetMethod(implObj, "put_HashAlgorithm"), flags, 2)
        this.vtbl.get_AlternateSignatureAlgorithm := CallbackCreate(GetMethod(implObj, "get_AlternateSignatureAlgorithm"), flags, 2)
        this.vtbl.put_AlternateSignatureAlgorithm := CallbackCreate(GetMethod(implObj, "put_AlternateSignatureAlgorithm"), flags, 2)
        this.vtbl.get_SignatureInformation := CallbackCreate(GetMethod(implObj, "get_SignatureInformation"), flags, 2)
        this.vtbl.get_RawData := CallbackCreate(GetMethod(implObj, "get_RawData"), flags, 3)
        this.vtbl.get_RawDataToBeSigned := CallbackCreate(GetMethod(implObj, "get_RawDataToBeSigned"), flags, 3)
        this.vtbl.get_Signature := CallbackCreate(GetMethod(implObj, "get_Signature"), flags, 3)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.InitializeDecode)
        CallbackFree(this.vtbl.Encode)
        CallbackFree(this.vtbl.ResetForEncode)
        CallbackFree(this.vtbl.CheckPublicKeySignature)
        CallbackFree(this.vtbl.CheckSignature)
        CallbackFree(this.vtbl.get_Issuer)
        CallbackFree(this.vtbl.put_Issuer)
        CallbackFree(this.vtbl.get_ThisUpdate)
        CallbackFree(this.vtbl.put_ThisUpdate)
        CallbackFree(this.vtbl.get_NextUpdate)
        CallbackFree(this.vtbl.put_NextUpdate)
        CallbackFree(this.vtbl.get_X509CRLEntries)
        CallbackFree(this.vtbl.get_X509Extensions)
        CallbackFree(this.vtbl.get_CriticalExtensions)
        CallbackFree(this.vtbl.get_SignerCertificate)
        CallbackFree(this.vtbl.put_SignerCertificate)
        CallbackFree(this.vtbl.get_CRLNumber)
        CallbackFree(this.vtbl.put_CRLNumber)
        CallbackFree(this.vtbl.get_CAVersion)
        CallbackFree(this.vtbl.put_CAVersion)
        CallbackFree(this.vtbl.get_BaseCRL)
        CallbackFree(this.vtbl.get_NullSigned)
        CallbackFree(this.vtbl.get_HashAlgorithm)
        CallbackFree(this.vtbl.put_HashAlgorithm)
        CallbackFree(this.vtbl.get_AlternateSignatureAlgorithm)
        CallbackFree(this.vtbl.put_AlternateSignatureAlgorithm)
        CallbackFree(this.vtbl.get_SignatureInformation)
        CallbackFree(this.vtbl.get_RawData)
        CallbackFree(this.vtbl.get_RawDataToBeSigned)
        CallbackFree(this.vtbl.get_Signature)
    }
}
