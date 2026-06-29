#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\CRLRevocationReason.ahk" { CRLRevocationReason }
#Import ".\EncodingType.ahk" { EncodingType }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IX509Extensions.ahk" { IX509Extensions }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import ".\IObjectIds.ahk" { IObjectIds }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509CertificateRevocationListEntry extends IDispatch {
    /**
     * The interface identifier for IX509CertificateRevocationListEntry
     * @type {Guid}
     */
    static IID := Guid("{728ab35e-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509CertificateRevocationListEntry interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize             : IntPtr
        get_SerialNumber       : IntPtr
        get_RevocationDate     : IntPtr
        get_RevocationReason   : IntPtr
        put_RevocationReason   : IntPtr
        get_X509Extensions     : IntPtr
        get_CriticalExtensions : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509CertificateRevocationListEntry.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {Float} 
     */
    RevocationDate {
        get => this.get_RevocationDate()
    }

    /**
     * @type {CRLRevocationReason} 
     */
    RevocationReason {
        get => this.get_RevocationReason()
        set => this.put_RevocationReason(value)
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
     * @param {EncodingType} Encoding 
     * @param {BSTR} SerialNumber 
     * @param {Float} RevocationDate 
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
    Initialize(Encoding, SerialNumber, RevocationDate) {
        SerialNumber := SerialNumber is String ? BSTR.Alloc(SerialNumber).Value : SerialNumber

        result := ComCall(7, this, EncodingType, Encoding, BSTR, SerialNumber, "double", RevocationDate, "HRESULT")
        return result
    }

    /**
     * 
     * @param {EncodingType} Encoding 
     * @returns {BSTR} 
     */
    get_SerialNumber(Encoding) {
        pValue := BSTR.Owned()
        result := ComCall(8, this, EncodingType, Encoding, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {Float} 
     */
    get_RevocationDate() {
        result := ComCall(9, this, "double*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @returns {CRLRevocationReason} 
     */
    get_RevocationReason() {
        result := ComCall(10, this, "int*", &pValue := 0, "HRESULT")
        return pValue
    }

    /**
     * 
     * @param {CRLRevocationReason} Value 
     * @returns {HRESULT} 
     */
    put_RevocationReason(Value) {
        result := ComCall(11, this, CRLRevocationReason, Value, "HRESULT")
        return result
    }

    /**
     * 
     * @returns {IX509Extensions} 
     */
    get_X509Extensions() {
        result := ComCall(12, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509Extensions(ppValue)
    }

    /**
     * 
     * @returns {IObjectIds} 
     */
    get_CriticalExtensions() {
        result := ComCall(13, this, "ptr*", &ppValue := 0, "HRESULT")
        return IObjectIds(ppValue)
    }

    Query(iid) {
        if (IX509CertificateRevocationListEntry.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 4)
        this.vtbl.get_SerialNumber := CallbackCreate(GetMethod(implObj, "get_SerialNumber"), flags, 3)
        this.vtbl.get_RevocationDate := CallbackCreate(GetMethod(implObj, "get_RevocationDate"), flags, 2)
        this.vtbl.get_RevocationReason := CallbackCreate(GetMethod(implObj, "get_RevocationReason"), flags, 2)
        this.vtbl.put_RevocationReason := CallbackCreate(GetMethod(implObj, "put_RevocationReason"), flags, 2)
        this.vtbl.get_X509Extensions := CallbackCreate(GetMethod(implObj, "get_X509Extensions"), flags, 2)
        this.vtbl.get_CriticalExtensions := CallbackCreate(GetMethod(implObj, "get_CriticalExtensions"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.get_SerialNumber)
        CallbackFree(this.vtbl.get_RevocationDate)
        CallbackFree(this.vtbl.get_RevocationReason)
        CallbackFree(this.vtbl.put_RevocationReason)
        CallbackFree(this.vtbl.get_X509Extensions)
        CallbackFree(this.vtbl.get_CriticalExtensions)
    }
}
