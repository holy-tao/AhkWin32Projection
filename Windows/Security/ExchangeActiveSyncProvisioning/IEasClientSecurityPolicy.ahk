#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Foundation\TimeSpan.ahk
#Include .\EasComplianceResults.ahk
#Include ..\..\Foundation\IAsyncOperation.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class IEasClientSecurityPolicy extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEasClientSecurityPolicy
     * @type {Guid}
     */
    static IID => Guid("{45b72362-dfba-4a9b-aced-6fe2adcb6420}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_RequireEncryption", "put_RequireEncryption", "get_MinPasswordLength", "put_MinPasswordLength", "get_DisallowConvenienceLogon", "put_DisallowConvenienceLogon", "get_MinPasswordComplexCharacters", "put_MinPasswordComplexCharacters", "get_PasswordExpiration", "put_PasswordExpiration", "get_PasswordHistory", "put_PasswordHistory", "get_MaxPasswordFailedAttempts", "put_MaxPasswordFailedAttempts", "get_MaxInactivityTimeLock", "put_MaxInactivityTimeLock", "CheckCompliance", "ApplyAsync"]

    /**
     * @type {Boolean} 
     */
    RequireEncryption {
        get => this.get_RequireEncryption()
        set => this.put_RequireEncryption(value)
    }

    /**
     * @type {Integer} 
     */
    MinPasswordLength {
        get => this.get_MinPasswordLength()
        set => this.put_MinPasswordLength(value)
    }

    /**
     * @type {Boolean} 
     */
    DisallowConvenienceLogon {
        get => this.get_DisallowConvenienceLogon()
        set => this.put_DisallowConvenienceLogon(value)
    }

    /**
     * @type {Integer} 
     */
    MinPasswordComplexCharacters {
        get => this.get_MinPasswordComplexCharacters()
        set => this.put_MinPasswordComplexCharacters(value)
    }

    /**
     * @type {TimeSpan} 
     */
    PasswordExpiration {
        get => this.get_PasswordExpiration()
        set => this.put_PasswordExpiration(value)
    }

    /**
     * @type {Integer} 
     */
    PasswordHistory {
        get => this.get_PasswordHistory()
        set => this.put_PasswordHistory(value)
    }

    /**
     * @type {Integer} 
     */
    MaxPasswordFailedAttempts {
        get => this.get_MaxPasswordFailedAttempts()
        set => this.put_MaxPasswordFailedAttempts(value)
    }

    /**
     * @type {TimeSpan} 
     */
    MaxInactivityTimeLock {
        get => this.get_MaxInactivityTimeLock()
        set => this.put_MaxInactivityTimeLock(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequireEncryption() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequireEncryption(value) {
        result := ComCall(7, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPasswordLength() {
        result := ComCall(8, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinPasswordLength(value) {
        result := ComCall(9, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisallowConvenienceLogon() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DisallowConvenienceLogon(value) {
        result := ComCall(11, this, "int", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPasswordComplexCharacters() {
        result := ComCall(12, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinPasswordComplexCharacters(value) {
        result := ComCall(13, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_PasswordExpiration() {
        value := TimeSpan()
        result := ComCall(14, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_PasswordExpiration(value) {
        result := ComCall(15, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PasswordHistory() {
        result := ComCall(16, this, "uint*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PasswordHistory(value) {
        result := ComCall(17, this, "uint", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPasswordFailedAttempts() {
        result := ComCall(18, this, "char*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxPasswordFailedAttempts(value) {
        result := ComCall(19, this, "char", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxInactivityTimeLock() {
        value := TimeSpan()
        result := ComCall(20, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_MaxInactivityTimeLock(value) {
        result := ComCall(21, this, "ptr", value, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @returns {EasComplianceResults} 
     */
    CheckCompliance() {
        result := ComCall(22, this, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return EasComplianceResults(result_)
    }

    /**
     * 
     * @returns {IAsyncOperation<EasComplianceResults>} 
     */
    ApplyAsync() {
        result := ComCall(23, this, "ptr*", &operation := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperation(EasComplianceResults, operation)
    }
}
