#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include .\IX509SCEPEnrollment.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509SCEPEnrollmentHelper extends IDispatch{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IX509SCEPEnrollmentHelper
     * @type {Guid}
     */
    static IID => Guid("{728ab365-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Initialize", "InitializeForPending", "Enroll", "FetchPending", "get_X509SCEPEnrollment", "get_ResultMessageText"]

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

        result := ComCall(7, this, "ptr", strServerUrl, "ptr", strRequestHeaders, "ptr", pRequest, "ptr", strCACertificateThumbprint, "HRESULT")
        return result
    }

    /**
     * 
     * @param {BSTR} strServerUrl 
     * @param {BSTR} strRequestHeaders 
     * @param {Integer} _Context 
     * @param {BSTR} strTransactionId 
     * @returns {HRESULT} 
     */
    InitializeForPending(strServerUrl, strRequestHeaders, _Context, strTransactionId) {
        strServerUrl := strServerUrl is String ? BSTR.Alloc(strServerUrl).Value : strServerUrl
        strRequestHeaders := strRequestHeaders is String ? BSTR.Alloc(strRequestHeaders).Value : strRequestHeaders
        strTransactionId := strTransactionId is String ? BSTR.Alloc(strTransactionId).Value : strTransactionId

        result := ComCall(8, this, "ptr", strServerUrl, "ptr", strRequestHeaders, "int", _Context, "ptr", strTransactionId, "HRESULT")
        return result
    }

    /**
     * Specifies certification authority property values.
     * @param {Integer} ProcessFlags 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/certenroll/ne-certenroll-enrollmentcaproperty
     */
    Enroll(ProcessFlags) {
        result := ComCall(9, this, "int", ProcessFlags, "int*", &pDisposition := 0, "HRESULT")
        return pDisposition
    }

    /**
     * 
     * @param {Integer} ProcessFlags 
     * @returns {Integer} 
     */
    FetchPending(ProcessFlags) {
        result := ComCall(10, this, "int", ProcessFlags, "int*", &pDisposition := 0, "HRESULT")
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
        pValue := BSTR()
        result := ComCall(12, this, "ptr", pValue, "HRESULT")
        return pValue
    }
}
