#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\IReference.ahk
#Include ..\..\Foundation\IPropertyValue.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Management.Update
 * @version WindowsRuntime 1.4
 */
class IWindowsUpdateApprovalData extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWindowsUpdateApprovalData
     * @type {Guid}
     */
    static IID => Guid("{aadf5bfd-84db-59bc-85e2-ad4fc1f62f7c}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Seeker", "put_Seeker", "get_AllowDownloadOnMetered", "put_AllowDownloadOnMetered", "get_ComplianceDeadlineInDays", "put_ComplianceDeadlineInDays", "get_ComplianceGracePeriodInDays", "put_ComplianceGracePeriodInDays", "get_OptOutOfAutoReboot", "put_OptOutOfAutoReboot"]

    /**
     * @type {IReference<Boolean>} 
     */
    Seeker {
        get => this.get_Seeker()
        set => this.put_Seeker(value)
    }

    /**
     * @type {IReference<Boolean>} 
     */
    AllowDownloadOnMetered {
        get => this.get_AllowDownloadOnMetered()
        set => this.put_AllowDownloadOnMetered(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    ComplianceDeadlineInDays {
        get => this.get_ComplianceDeadlineInDays()
        set => this.put_ComplianceDeadlineInDays(value)
    }

    /**
     * @type {IReference<Integer>} 
     */
    ComplianceGracePeriodInDays {
        get => this.get_ComplianceGracePeriodInDays()
        set => this.put_ComplianceGracePeriodInDays(value)
    }

    /**
     * @type {IReference<Boolean>} 
     */
    OptOutOfAutoReboot {
        get => this.get_OptOutOfAutoReboot()
        set => this.put_OptOutOfAutoReboot(value)
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_Seeker() {
        result := ComCall(6, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_Seeker(value) {
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_AllowDownloadOnMetered() {
        result := ComCall(8, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_AllowDownloadOnMetered(value) {
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ComplianceDeadlineInDays() {
        result := ComCall(10, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ComplianceDeadlineInDays(value) {
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Integer>} 
     */
    get_ComplianceGracePeriodInDays() {
        result := ComCall(12, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetInt32(), value)
    }

    /**
     * 
     * @param {IReference<Integer>} value 
     * @returns {HRESULT} 
     */
    put_ComplianceGracePeriodInDays(value) {
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {IReference<Boolean>} 
     */
    get_OptOutOfAutoReboot() {
        result := ComCall(14, this, "ptr*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IReference((ptr) => IPropertyValue(ptr).GetBoolean(), value)
    }

    /**
     * 
     * @param {IReference<Boolean>} value 
     * @returns {HRESULT} 
     */
    put_OptOutOfAutoReboot(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }
}
