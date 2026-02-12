#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.Authentication.Identity
 * @version WindowsRuntime 1.4
 */
class IEnterpriseKeyCredentialRegistrationInfo extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEnterpriseKeyCredentialRegistrationInfo
     * @type {Guid}
     */
    static IID => Guid("{38321acc-672b-4823-b603-6b3c753daf97}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_TenantId", "get_TenantName", "get_Subject", "get_KeyId", "get_KeyName"]

    /**
     * @type {HSTRING} 
     */
    TenantId {
        get => this.get_TenantId()
    }

    /**
     * @type {HSTRING} 
     */
    TenantName {
        get => this.get_TenantName()
    }

    /**
     * @type {HSTRING} 
     */
    Subject {
        get => this.get_Subject()
    }

    /**
     * @type {HSTRING} 
     */
    KeyId {
        get => this.get_KeyId()
    }

    /**
     * @type {HSTRING} 
     */
    KeyName {
        get => this.get_KeyName()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TenantId() {
        value := HSTRING()
        result := ComCall(6, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_TenantName() {
        value := HSTRING()
        result := ComCall(7, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_Subject() {
        value := HSTRING()
        result := ComCall(8, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyId() {
        value := HSTRING()
        result := ComCall(9, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_KeyName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
