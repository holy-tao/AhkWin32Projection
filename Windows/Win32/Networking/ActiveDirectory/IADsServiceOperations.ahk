#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include .\IADs.ahk

/**
 * The IADsServiceOperations interface is a dual interface that inherits from IADs.
 * @see https://docs.microsoft.com/windows/win32/api//iads/nn-iads-iadsserviceoperations
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class IADsServiceOperations extends IADs{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IADsServiceOperations
     * @type {Guid}
     */
    static IID => Guid("{5d7b33f0-31ca-11cf-a98a-00aa006bc149}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 20

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Status", "Start", "Stop", "Pause", "Continue", "SetPassword"]

    /**
     * @type {Integer} 
     */
    Status {
        get => this.get_Status()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Status() {
        result := ComCall(20, this, "int*", &retval := 0, "HRESULT")
        return retval
    }

    /**
     * The IADsServiceOperations::Start method starts a network service.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsserviceoperations-start
     */
    Start() {
        result := ComCall(21, this, "HRESULT")
        return result
    }

    /**
     * The IADsServiceOperations::Stop method stops a currently active network service.
     * @returns {HRESULT} This method supports standard return values, including S_OK. For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsserviceoperations-stop
     */
    Stop() {
        result := ComCall(22, this, "HRESULT")
        return result
    }

    /**
     * The IADsServiceOperations::Pause method pauses a service started with the IADsServiceOperations::Start method.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsserviceoperations-pause
     */
    Pause() {
        result := ComCall(23, this, "HRESULT")
        return result
    }

    /**
     * The IADsServiceOperations::Continue method resumes a service operation paused by the IADsServiceOperations::Pause method.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsserviceoperations-continue
     */
    Continue() {
        result := ComCall(24, this, "HRESULT")
        return result
    }

    /**
     * The IADsServiceOperations::SetPassword method sets the password for the account used by the service manager. This method is called when the security context for this service is created.
     * @param {BSTR} bstrNewPassword The null-terminated Unicode string to be stored as the new password.
     * @returns {HRESULT} This method supports the standard return values, including S_OK. For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//iads/nf-iads-iadsserviceoperations-setpassword
     */
    SetPassword(bstrNewPassword) {
        bstrNewPassword := bstrNewPassword is String ? BSTR.Alloc(bstrNewPassword).Value : bstrNewPassword

        result := ComCall(25, this, "ptr", bstrNewPassword, "HRESULT")
        return result
    }
}
