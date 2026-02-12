#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.ApplicationModel.Store.LicenseManagement
 * @version WindowsRuntime 1.4
 */
class ILicenseSatisfactionInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for ILicenseSatisfactionInfo
     * @type {Guid}
     */
    static IID => Guid("{3ccbb08f-db31-48d5-8384-fa17c81474e2}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_SatisfiedByDevice", "get_SatisfiedByOpenLicense", "get_SatisfiedByTrial", "get_SatisfiedByPass", "get_SatisfiedByInstallMedia", "get_SatisfiedBySignedInUser", "get_IsSatisfied"]

    /**
     * @type {Boolean} 
     */
    SatisfiedByDevice {
        get => this.get_SatisfiedByDevice()
    }

    /**
     * @type {Boolean} 
     */
    SatisfiedByOpenLicense {
        get => this.get_SatisfiedByOpenLicense()
    }

    /**
     * @type {Boolean} 
     */
    SatisfiedByTrial {
        get => this.get_SatisfiedByTrial()
    }

    /**
     * @type {Boolean} 
     */
    SatisfiedByPass {
        get => this.get_SatisfiedByPass()
    }

    /**
     * @type {Boolean} 
     */
    SatisfiedByInstallMedia {
        get => this.get_SatisfiedByInstallMedia()
    }

    /**
     * @type {Boolean} 
     */
    SatisfiedBySignedInUser {
        get => this.get_SatisfiedBySignedInUser()
    }

    /**
     * @type {Boolean} 
     */
    IsSatisfied {
        get => this.get_IsSatisfied()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_SatisfiedByDevice() {
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
    get_SatisfiedByOpenLicense() {
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
    get_SatisfiedByTrial() {
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
    get_SatisfiedByPass() {
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
    get_SatisfiedByInstallMedia() {
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
    get_SatisfiedBySignedInUser() {
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
    get_IsSatisfied() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
