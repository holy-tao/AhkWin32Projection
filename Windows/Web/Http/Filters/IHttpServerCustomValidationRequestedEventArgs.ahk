#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\HttpRequestMessage.ahk
#Include ..\..\..\Security\Cryptography\Certificates\Certificate.ahk
#Include ..\..\..\Foundation\Collections\IVectorView.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Foundation\Deferral.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.Http.Filters
 * @version WindowsRuntime 1.4
 */
class IHttpServerCustomValidationRequestedEventArgs extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IHttpServerCustomValidationRequestedEventArgs
     * @type {Guid}
     */
    static IID => Guid("{3165fe32-e7dd-48b7-a361-939c750e63cc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequestMessage", "get_ServerCertificate", "get_ServerCertificateErrorSeverity", "get_ServerCertificateErrors", "get_ServerIntermediateCertificates", "Reject", "GetDeferral"]

    /**
     * @type {HttpRequestMessage} 
     */
    RequestMessage {
        get => this.get_RequestMessage()
    }

    /**
     * @type {Certificate} 
     */
    ServerCertificate {
        get => this.get_ServerCertificate()
    }

    /**
     * @type {Integer} 
     */
    ServerCertificateErrorSeverity {
        get => this.get_ServerCertificateErrorSeverity()
    }

    /**
     * @type {IVectorView<Integer>} 
     */
    ServerCertificateErrors {
        get => this.get_ServerCertificateErrors()
    }

    /**
     * @type {IVectorView<Certificate>} 
     */
    ServerIntermediateCertificates {
        get => this.get_ServerIntermediateCertificates()
    }

    /**
     * 
     * @returns {HttpRequestMessage} 
     */
    get_RequestMessage() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return HttpRequestMessage(value)
    }

    /**
     * 
     * @returns {Certificate} 
     */
    get_ServerCertificate() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Certificate(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_ServerCertificateErrorSeverity() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {IVectorView<Integer>} 
     */
    get_ServerCertificateErrors() {
        result := ComCall(9, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @returns {IVectorView<Certificate>} 
     */
    get_ServerIntermediateCertificates() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IVectorView(Certificate, value)
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Reject() {
        result := ComCall(11, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Deferral} 
     */
    GetDeferral() {
        result := ComCall(12, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Deferral(result_)
    }
}
