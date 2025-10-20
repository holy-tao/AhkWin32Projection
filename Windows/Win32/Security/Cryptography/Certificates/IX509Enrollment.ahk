#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\BSTR.ahk
#Include ..\..\..\System\Com\IDispatch.ahk

/**
 * Represents the top level object and enables you to enroll in a certificate hierarchy and install a certificate response.
 * @see https://docs.microsoft.com/windows/win32/api//certenroll/nn-certenroll-ix509enrollment
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class IX509Enrollment extends IDispatch{
    /**
     * The interface identifier for IX509Enrollment
     * @type {Guid}
     */
    static IID => Guid("{728ab346-217d-11da-b2a4-000e7bbb2b09}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 7

    /**
     * Initializes a thread to use Windows Runtime APIs.
     * @param {Integer} Context 
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
     * @see https://docs.microsoft.com/windows/win32/api//roapi/nf-roapi-initialize
     */
    Initialize(Context) {
        result := ComCall(7, this, "int", Context, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Context 
     * @param {BSTR} strTemplateName 
     * @returns {HRESULT} 
     */
    InitializeFromTemplateName(Context, strTemplateName) {
        strTemplateName := strTemplateName is String ? BSTR.Alloc(strTemplateName).Value : strTemplateName

        result := ComCall(8, this, "int", Context, "ptr", strTemplateName, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateRequest>} pRequest 
     * @returns {HRESULT} 
     */
    InitializeFromRequest(pRequest) {
        result := ComCall(9, this, "ptr", pRequest, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    CreateRequest(Encoding, pValue) {
        result := ComCall(10, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Enroll() {
        result := ComCall(11, this, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Restrictions 
     * @param {BSTR} strResponse 
     * @param {Integer} Encoding 
     * @param {BSTR} strPassword 
     * @returns {HRESULT} 
     */
    InstallResponse(Restrictions, strResponse, Encoding, strPassword) {
        strResponse := strResponse is String ? BSTR.Alloc(strResponse).Value : strResponse
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(12, this, "int", Restrictions, "ptr", strResponse, "int", Encoding, "ptr", strPassword, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strPassword 
     * @param {Integer} ExportOptions 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    CreatePFX(strPassword, ExportOptions, Encoding, pValue) {
        strPassword := strPassword is String ? BSTR.Alloc(strPassword).Value : strPassword

        result := ComCall(13, this, "ptr", strPassword, "int", ExportOptions, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509CertificateRequest>} pValue 
     * @returns {HRESULT} 
     */
    get_Request(pValue) {
        result := ComCall(14, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT_BOOL>} pValue 
     * @returns {HRESULT} 
     */
    get_Silent(pValue) {
        result := ComCall(15, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {VARIANT_BOOL} Value 
     * @returns {HRESULT} 
     */
    put_Silent(Value) {
        result := ComCall(16, this, "short", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_ParentWindow(pValue) {
        result := ComCall(17, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Value 
     * @returns {HRESULT} 
     */
    put_ParentWindow(Value) {
        result := ComCall(18, this, "int", Value, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509NameValuePairs>} ppValue 
     * @returns {HRESULT} 
     */
    get_NameValuePairs(ppValue) {
        result := ComCall(19, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_EnrollmentContext(pValue) {
        result := ComCall(20, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<IX509EnrollmentStatus>} ppValue 
     * @returns {HRESULT} 
     */
    get_Status(ppValue) {
        result := ComCall(21, this, "ptr", ppValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_Certificate(Encoding, pValue) {
        result := ComCall(22, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Integer} Encoding 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_Response(Encoding, pValue) {
        result := ComCall(23, this, "int", Encoding, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_CertificateFriendlyName(pValue) {
        result := ComCall(24, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    put_CertificateFriendlyName(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(25, this, "ptr", strValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_CertificateDescription(pValue) {
        result := ComCall(26, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {BSTR} strValue 
     * @returns {HRESULT} 
     */
    put_CertificateDescription(strValue) {
        strValue := strValue is String ? BSTR.Alloc(strValue).Value : strValue

        result := ComCall(27, this, "ptr", strValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<Int32>} pValue 
     * @returns {HRESULT} 
     */
    get_RequestId(pValue) {
        result := ComCall(28, this, "int*", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<BSTR>} pValue 
     * @returns {HRESULT} 
     */
    get_CAConfigString(pValue) {
        result := ComCall(29, this, "ptr", pValue, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }
}
