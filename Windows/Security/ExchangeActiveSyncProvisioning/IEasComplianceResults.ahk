#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\Win32ComInterface.ahk
#Include ..\..\..\Guid.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class IEasComplianceResults extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IEasComplianceResults
     * @type {Guid}
     */
    static IID => Guid("{463c299c-7f19-4c66-b403-cb45dd57a2b3}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["get_Compliant", "get_RequireEncryptionResult", "get_MinPasswordLengthResult", "get_DisallowConvenienceLogonResult", "get_MinPasswordComplexCharactersResult", "get_PasswordExpirationResult", "get_PasswordHistoryResult", "get_MaxPasswordFailedAttemptsResult", "get_MaxInactivityTimeLockResult"]

    /**
     * @type {Boolean} 
     */
    Compliant {
        get => this.get_Compliant()
    }

    /**
     * @type {Integer} 
     */
    RequireEncryptionResult {
        get => this.get_RequireEncryptionResult()
    }

    /**
     * @type {Integer} 
     */
    MinPasswordLengthResult {
        get => this.get_MinPasswordLengthResult()
    }

    /**
     * @type {Integer} 
     */
    DisallowConvenienceLogonResult {
        get => this.get_DisallowConvenienceLogonResult()
    }

    /**
     * @type {Integer} 
     */
    MinPasswordComplexCharactersResult {
        get => this.get_MinPasswordComplexCharactersResult()
    }

    /**
     * @type {Integer} 
     */
    PasswordExpirationResult {
        get => this.get_PasswordExpirationResult()
    }

    /**
     * @type {Integer} 
     */
    PasswordHistoryResult {
        get => this.get_PasswordHistoryResult()
    }

    /**
     * @type {Integer} 
     */
    MaxPasswordFailedAttemptsResult {
        get => this.get_MaxPasswordFailedAttemptsResult()
    }

    /**
     * @type {Integer} 
     */
    MaxInactivityTimeLockResult {
        get => this.get_MaxInactivityTimeLockResult()
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Compliant() {
        result := ComCall(6, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequireEncryptionResult() {
        result := ComCall(7, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPasswordLengthResult() {
        result := ComCall(8, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisallowConvenienceLogonResult() {
        result := ComCall(9, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPasswordComplexCharactersResult() {
        result := ComCall(10, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PasswordExpirationResult() {
        result := ComCall(11, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PasswordHistoryResult() {
        result := ComCall(12, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPasswordFailedAttemptsResult() {
        result := ComCall(13, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxInactivityTimeLockResult() {
        result := ComCall(14, this, "int*", &value := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return value
    }
}
