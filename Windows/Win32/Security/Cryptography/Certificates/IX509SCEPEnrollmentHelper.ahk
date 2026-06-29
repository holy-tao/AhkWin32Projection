#Requires AutoHotkey v2.1-alpha.30+ 64-bit
#Import "..\..\..\..\..\Win32ComInterface.ahk" { Win32ComInterface }
#Import "..\..\..\..\..\Guid.ahk" { Guid }
#Import "..\..\..\Foundation\HRESULT.ahk" { HRESULT }
#Import "..\..\..\Foundation\BSTR.ahk" { BSTR }
#Import ".\IX509CertificateRequestPkcs10.ahk" { IX509CertificateRequestPkcs10 }
#Import ".\X509CertificateEnrollmentContext.ahk" { X509CertificateEnrollmentContext }
#Import ".\X509SCEPDisposition.ahk" { X509SCEPDisposition }
#Import ".\X509SCEPProcessMessageFlags.ahk" { X509SCEPProcessMessageFlags }
#Import "..\..\..\System\Com\IDispatch.ahk" { IDispatch }
#Import ".\IX509SCEPEnrollment.ahk" { IX509SCEPEnrollment }

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */
export default struct IX509SCEPEnrollmentHelper extends IDispatch {
    /**
     * The interface identifier for IX509SCEPEnrollmentHelper
     * @type {Guid}
     */
    static IID := Guid("{728ab365-217d-11da-b2a4-000e7bbb2b09}")

    static __New() {
        ; Retype our prototype's vtable pointer to be our vtbl's type
        DefineProp(this.Prototype, 'vtbl', { type: this.Vtbl.Ptr, offset: 0 })
        this.DeleteProp("__New")
    }

    /**
     * The {@link https://devblogs.microsoft.com/oldnewthing/20040205-00/?p=40733 Virtual Function Table}
     * used for IX509SCEPEnrollmentHelper interfaces
    */
    struct Vtbl extends IDispatch.Vtbl {
        Initialize             : IntPtr
        InitializeForPending   : IntPtr
        Enroll                 : IntPtr
        FetchPending           : IntPtr
        get_X509SCEPEnrollment : IntPtr
        get_ResultMessageText  : IntPtr
    }

    __New(implObj := 0, flags := "") {
        if (NumGet(ObjGetDataPtr(this), 0, "ptr") == 0) {
            this.vtbl := IX509SCEPEnrollmentHelper.Vtbl()
        }
        super.__New(implObj, flags)
    }

    /**
     * @type {IX509SCEPEnrollment} 
     */
    X509SCEPEnrollment {
        get => this.get_X509SCEPEnrollment()
    }

    /**
     * @type {BSTR} 
     */
    ResultMessageText {
        get => this.get_ResultMessageText()
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
     * @param {BSTR} strServerUrl 
     * @param {BSTR} strRequestHeaders 
     * @param {IX509CertificateRequestPkcs10} pRequest 
     * @param {BSTR} strCACertificateThumbprint 
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
    Initialize(strServerUrl, strRequestHeaders, pRequest, strCACertificateThumbprint) {
        strServerUrl := strServerUrl is String ? BSTR.Alloc(strServerUrl).Value : strServerUrl
        strRequestHeaders := strRequestHeaders is String ? BSTR.Alloc(strRequestHeaders).Value : strRequestHeaders
        strCACertificateThumbprint := strCACertificateThumbprint is String ? BSTR.Alloc(strCACertificateThumbprint).Value : strCACertificateThumbprint

        result := ComCall(7, this, BSTR, strServerUrl, BSTR, strRequestHeaders, "ptr", pRequest, BSTR, strCACertificateThumbprint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strServerUrl 
     * @param {BSTR} strRequestHeaders 
     * @param {X509CertificateEnrollmentContext} _Context 
     * @param {BSTR} strTransactionId 
     * @returns {HRESULT} 
     */
    InitializeForPending(strServerUrl, strRequestHeaders, _Context, strTransactionId) {
        strServerUrl := strServerUrl is String ? BSTR.Alloc(strServerUrl).Value : strServerUrl
        strRequestHeaders := strRequestHeaders is String ? BSTR.Alloc(strRequestHeaders).Value : strRequestHeaders
        strTransactionId := strTransactionId is String ? BSTR.Alloc(strTransactionId).Value : strTransactionId

        result := ComCall(8, this, BSTR, strServerUrl, BSTR, strRequestHeaders, X509CertificateEnrollmentContext, _Context, BSTR, strTransactionId, "HRESULT")
        return result
    }

    /**
     * 
     * @param {X509SCEPProcessMessageFlags} ProcessFlags 
     * @returns {X509SCEPDisposition} 
     */
    Enroll(ProcessFlags) {
        result := ComCall(9, this, X509SCEPProcessMessageFlags, ProcessFlags, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * 
     * @param {X509SCEPProcessMessageFlags} ProcessFlags 
     * @returns {X509SCEPDisposition} 
     */
    FetchPending(ProcessFlags) {
        result := ComCall(10, this, X509SCEPProcessMessageFlags, ProcessFlags, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * 
     * @returns {IX509SCEPEnrollment} 
     */
    get_X509SCEPEnrollment() {
        result := ComCall(11, this, "ptr*", &ppValue := 0, "HRESULT")
        return IX509SCEPEnrollment(ppValue)
    }

    /**
     * 
     * @returns {BSTR} 
     */
    get_ResultMessageText() {
        pValue := BSTR.Owned()
        result := ComCall(12, this, BSTR.Ptr, pValue, "HRESULT")
        return pValue
    }

    Query(iid) {
        if (IX509SCEPEnrollmentHelper.IID.Equals(iid)) {
            return true
        }
        return super.Query(iid)
    }

    Implement(implObj, flags := "") {
        super.Implement(implObj, flags)
        this.vtbl.Initialize := CallbackCreate(GetMethod(implObj, "Initialize"), flags, 5)
        this.vtbl.InitializeForPending := CallbackCreate(GetMethod(implObj, "InitializeForPending"), flags, 5)
        this.vtbl.Enroll := CallbackCreate(GetMethod(implObj, "Enroll"), flags, 3)
        this.vtbl.FetchPending := CallbackCreate(GetMethod(implObj, "FetchPending"), flags, 3)
        this.vtbl.get_X509SCEPEnrollment := CallbackCreate(GetMethod(implObj, "get_X509SCEPEnrollment"), flags, 2)
        this.vtbl.get_ResultMessageText := CallbackCreate(GetMethod(implObj, "get_ResultMessageText"), flags, 2)
    }

    Dispose() {
        if (!this.owned) {
            throw MethodError("Cannot dispose of an unowned interface", -1, this)
        }
        super.Dispose()
        CallbackFree(this.vtbl.Initialize)
        CallbackFree(this.vtbl.InitializeForPending)
        CallbackFree(this.vtbl.Enroll)
        CallbackFree(this.vtbl.FetchPending)
        CallbackFree(this.vtbl.get_X509SCEPEnrollment)
        CallbackFree(this.vtbl.get_ResultMessageText)
    }
}
