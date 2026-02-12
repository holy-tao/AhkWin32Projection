#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\Uri.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Web.UI
 * @version WindowsRuntime 1.4
 */
class IWebViewControlDeferredPermissionRequest extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWebViewControlDeferredPermissionRequest
     * @type {Guid}
     */
    static IID => Guid("{2ce349e0-d759-445c-9926-8995298f152b}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Id", "get_Uri", "get_PermissionType", "Allow", "Deny"]

    /**
     * @type {Integer} 
     */
    Id {
        get => this.get_Id()
    }

    /**
     * @type {Uri} 
     */
    Uri {
        get => this.get_Uri()
    }

    /**
     * @type {Integer} 
     */
    PermissionType {
        get => this.get_PermissionType()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_Id() {
        result := ComCall(6, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Uri} 
     */
    get_Uri() {
        result := ComCall(7, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return Uri(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PermissionType() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * Documentation varies per use. Refer to each: <see href="https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestcmc2-checksignature">IX509CertificateRequestCmc2.CheckSignature</see>, <see href="https://learn.microsoft.com/windows/win32/api//content/certenroll/nf-certenroll-ix509certificaterequestpkcs10-checksignature">IX509CertificateRequestPkcs10.CheckSignature</see>.
     * @returns {HRESULT} 
     */
    Allow() {
        result := ComCall(9, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {HRESULT} 
     */
    Deny() {
        result := ComCall(10, this, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
