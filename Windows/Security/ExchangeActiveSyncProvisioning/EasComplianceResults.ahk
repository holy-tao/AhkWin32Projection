#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEasComplianceResults.ahk
#Include .\IEasComplianceResults2.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > EasComplianceResults may be unavailable for releases after Windows 10.
  * 
  * Provides the mail app with the results of the evaluation of the EAS security policies. Every policy being evaluated returns an enumerated value indicating the evaluation results against the policy. The evaluations results are encapsulated in the EasComplianceResults object for the caller app to retrieve.
 * @remarks
 * An EasComplianceResults object can be returned from a successful [CheckCompliance](easclientsecuritypolicy_checkcompliance_1583667550.md) or [ApplyAsync](easclientsecuritypolicy_applyasync_489349523.md) call.
 * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class EasComplianceResults extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEasComplianceResults

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEasComplianceResults.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Returns the result of whether the computer is compliant with the EAS policies.
     * @remarks
     * The mail app needs to scan through each evaluation result to determine the actual reason for not being compliant if the Compliant property is FALSE.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.compliant
     * @type {Boolean} 
     */
    Compliant {
        get => this.get_Compliant()
    }

    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Returns the result of whether encryption is required.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.requireencryptionresult
     * @type {Integer} 
     */
    RequireEncryptionResult {
        get => this.get_RequireEncryptionResult()
    }

    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Returns the result of the minimum length of the password required.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.minpasswordlengthresult
     * @type {Integer} 
     */
    MinPasswordLengthResult {
        get => this.get_MinPasswordLengthResult()
    }

    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Returns the result of whether convenience logons are disallowed.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.disallowconveniencelogonresult
     * @type {Integer} 
     */
    DisallowConvenienceLogonResult {
        get => this.get_DisallowConvenienceLogonResult()
    }

    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Returns the result of the minimum number of complex password characters required.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.minpasswordcomplexcharactersresult
     * @type {Integer} 
     */
    MinPasswordComplexCharactersResult {
        get => this.get_MinPasswordComplexCharactersResult()
    }

    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Returns the result of whether the password is expired.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.passwordexpirationresult
     * @type {Integer} 
     */
    PasswordExpirationResult {
        get => this.get_PasswordExpirationResult()
    }

    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Returns the result of the history of passwords.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.passwordhistoryresult
     * @type {Integer} 
     */
    PasswordHistoryResult {
        get => this.get_PasswordHistoryResult()
    }

    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Returns the result of the maximum number of failed password attempts allowed.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.maxpasswordfailedattemptsresult
     * @type {Integer} 
     */
    MaxPasswordFailedAttemptsResult {
        get => this.get_MaxPasswordFailedAttemptsResult()
    }

    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Returns the result of the maximum time of inactivity allowed before the computer is locked.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.maxinactivitytimelockresult
     * @type {Integer} 
     */
    MaxInactivityTimeLockResult {
        get => this.get_MaxInactivityTimeLockResult()
    }

    /**
     * > [!NOTE]
     * > [EasComplianceResults](eascomplianceresults.md) may be unavailable for releases after Windows 10.
     * 
     * Gets the type of the Exchange ActiveSync encryption provider.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.eascomplianceresults.encryptionprovidertype
     * @type {Integer} 
     */
    EncryptionProviderType {
        get => this.get_EncryptionProviderType()
    }

;@endregion Instance Properties

;@region Instance Methods
    __New(ptr) {
        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_Compliant() {
        if (!this.HasProp("__IEasComplianceResults")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults := IEasComplianceResults(outPtr)
        }

        return this.__IEasComplianceResults.get_Compliant()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_RequireEncryptionResult() {
        if (!this.HasProp("__IEasComplianceResults")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults := IEasComplianceResults(outPtr)
        }

        return this.__IEasComplianceResults.get_RequireEncryptionResult()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPasswordLengthResult() {
        if (!this.HasProp("__IEasComplianceResults")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults := IEasComplianceResults(outPtr)
        }

        return this.__IEasComplianceResults.get_MinPasswordLengthResult()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_DisallowConvenienceLogonResult() {
        if (!this.HasProp("__IEasComplianceResults")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults := IEasComplianceResults(outPtr)
        }

        return this.__IEasComplianceResults.get_DisallowConvenienceLogonResult()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPasswordComplexCharactersResult() {
        if (!this.HasProp("__IEasComplianceResults")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults := IEasComplianceResults(outPtr)
        }

        return this.__IEasComplianceResults.get_MinPasswordComplexCharactersResult()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PasswordExpirationResult() {
        if (!this.HasProp("__IEasComplianceResults")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults := IEasComplianceResults(outPtr)
        }

        return this.__IEasComplianceResults.get_PasswordExpirationResult()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PasswordHistoryResult() {
        if (!this.HasProp("__IEasComplianceResults")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults := IEasComplianceResults(outPtr)
        }

        return this.__IEasComplianceResults.get_PasswordHistoryResult()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPasswordFailedAttemptsResult() {
        if (!this.HasProp("__IEasComplianceResults")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults := IEasComplianceResults(outPtr)
        }

        return this.__IEasComplianceResults.get_MaxPasswordFailedAttemptsResult()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxInactivityTimeLockResult() {
        if (!this.HasProp("__IEasComplianceResults")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults := IEasComplianceResults(outPtr)
        }

        return this.__IEasComplianceResults.get_MaxInactivityTimeLockResult()
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_EncryptionProviderType() {
        if (!this.HasProp("__IEasComplianceResults2")) {
            if ((queryResult := this.QueryInterface(IEasComplianceResults2.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasComplianceResults2 := IEasComplianceResults2(outPtr)
        }

        return this.__IEasComplianceResults2.get_EncryptionProviderType()
    }

;@endregion Instance Methods
}
