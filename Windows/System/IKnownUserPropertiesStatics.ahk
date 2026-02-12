#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\Win32ComInterface.ahk
#Include ..\..\Guid.ahk
#Include ..\Win32\System\WinRT\HSTRING.ahk
#Include ..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.System
 * @version WindowsRuntime 1.4
 */
class IKnownUserPropertiesStatics extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IKnownUserPropertiesStatics
     * @type {Guid}
     */
    static IID => Guid("{7755911a-70c5-48e5-b637-5ba3441e4ee4}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_DisplayName", "get_FirstName", "get_LastName", "get_ProviderName", "get_AccountName", "get_GuestHost", "get_PrincipalName", "get_DomainName", "get_SessionInitiationProtocolUri"]

    /**
     * @type {HSTRING} 
     */
    DisplayName {
        get => this.get_DisplayName()
    }

    /**
     * @type {HSTRING} 
     */
    FirstName {
        get => this.get_FirstName()
    }

    /**
     * @type {HSTRING} 
     */
    LastName {
        get => this.get_LastName()
    }

    /**
     * @type {HSTRING} 
     */
    ProviderName {
        get => this.get_ProviderName()
    }

    /**
     * @type {HSTRING} 
     */
    AccountName {
        get => this.get_AccountName()
    }

    /**
     * @type {HSTRING} 
     */
    GuestHost {
        get => this.get_GuestHost()
    }

    /**
     * @type {HSTRING} 
     */
    PrincipalName {
        get => this.get_PrincipalName()
    }

    /**
     * @type {HSTRING} 
     */
    DomainName {
        get => this.get_DomainName()
    }

    /**
     * @type {HSTRING} 
     */
    SessionInitiationProtocolUri {
        get => this.get_SessionInitiationProtocolUri()
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DisplayName() {
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
    get_FirstName() {
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
    get_LastName() {
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
    get_ProviderName() {
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
    get_AccountName() {
        value := HSTRING()
        result := ComCall(10, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_GuestHost() {
        value := HSTRING()
        result := ComCall(11, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_PrincipalName() {
        value := HSTRING()
        result := ComCall(12, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_DomainName() {
        value := HSTRING()
        result := ComCall(13, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {HSTRING} 
     */
    get_SessionInitiationProtocolUri() {
        value := HSTRING()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
