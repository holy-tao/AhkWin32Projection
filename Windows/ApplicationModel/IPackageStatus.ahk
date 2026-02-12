#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel
 * @version WindowsRuntime 1.4
 */
class IPackageStatus extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IPackageStatus
     * @type {Guid}
     */
    static IID => Guid("{5fe74f71-a365-4c09-a02d-046d525ea1da}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["VerifyIsOK", "get_NotAvailable", "get_PackageOffline", "get_DataOffline", "get_Disabled", "get_NeedsRemediation", "get_LicenseIssue", "get_Modified", "get_Tampered", "get_DependencyIssue", "get_Servicing", "get_DeploymentInProgress"]

    /**
     * @type {Boolean} 
     */
    NotAvailable {
        get => this.get_NotAvailable()
    }

    /**
     * @type {Boolean} 
     */
    PackageOffline {
        get => this.get_PackageOffline()
    }

    /**
     * @type {Boolean} 
     */
    DataOffline {
        get => this.get_DataOffline()
    }

    /**
     * @type {Boolean} 
     */
    Disabled {
        get => this.get_Disabled()
    }

    /**
     * @type {Boolean} 
     */
    NeedsRemediation {
        get => this.get_NeedsRemediation()
    }

    /**
     * @type {Boolean} 
     */
    LicenseIssue {
        get => this.get_LicenseIssue()
    }

    /**
     * @type {Boolean} 
     */
    Modified {
        get => this.get_Modified()
    }

    /**
     * @type {Boolean} 
     */
    Tampered {
        get => this.get_Tampered()
    }

    /**
     * @type {Boolean} 
     */
    DependencyIssue {
        get => this.get_DependencyIssue()
    }

    /**
     * @type {Boolean} 
     */
    Servicing {
        get => this.get_Servicing()
    }

    /**
     * @type {Boolean} 
     */
    DeploymentInProgress {
        get => this.get_DeploymentInProgress()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    VerifyIsOK() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NotAvailable() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_PackageOffline() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DataOffline() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Disabled() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_NeedsRemediation() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_LicenseIssue() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Modified() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Tampered() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DependencyIssue() {
        result := ComCall(15, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Servicing() {
        result := ComCall(16, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DeploymentInProgress() {
        result := ComCall(17, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
