#Requires AutoHotkey v2.0 64-bit

#Include ..\..\Win32\System\WinRT\Apis.ahk
#Include ..\..\Win32\System\WinRT\HSTRING.ahk
#Include ..\..\Win32\System\WinRT\IInspectable.ahk
#Include .\IEasClientSecurityPolicy.ahk
#Include ..\..\..\Guid.ahk

/**
 * > [!NOTE]
  * > EasClientSecurityPolicy may be unavailable for releases after Windows 10.
  * 
  * Modern mail apps evaluate and apply the EAS security policies. An EasClientSecurityPolicy object is constructed by the caller app to set policies received from the Exchange server or application.
 * @remarks
 * All of the property values for this class can be retrieved using get() only if the property values are previously set. Getting a policy value without previously setting it will result in HRESULT_FROM_WIN32(ERROR_NO_DATA) returned from the get() call.
 * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy
 * @namespace Windows.Security.ExchangeActiveSyncProvisioning
 * @version WindowsRuntime 1.4
 */
class EasClientSecurityPolicy extends IInspectable {
;@region Static Properties
    /**
     * The default interface of is Windows Runtime class. At the ABI level, the class is really
     * just a pointer to this interface
     * @type {Class}
     */
    static WinRTDefaultInterface => IEasClientSecurityPolicy

    /**
     * The IID of this class's default interface. This allows it to be cast using IUnknown::As like any
     * Windows Runtime interface
     * @type {Guid}
     */
    static IID => IEasClientSecurityPolicy.IID

;@endregion Static Properties

;@region Instance Properties
    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Gets or sets whether encryption is required. The MS-ASPROV name is RequireDeviceEncryption.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.requireencryption
     * @type {Boolean} 
     */
    RequireEncryption {
        get => this.get_RequireEncryption()
        set => this.put_RequireEncryption(value)
    }

    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Gets or set the minimum length of password allowed. The MS-ASPROV name is MinPasswordLength.
     * 
     * The MinPasswordLength property is superseded by the MS-ASPROV DevicePasswordEnabled policy. If the caller received DevicePasswordEnabled equal to FALSE, do not set the MinPasswordLength property for evaluation or application. If the caller received DevicePasswordEnabled equal to TRUE, you can set the MinPasswordLength property for evaluation or application.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.minpasswordlength
     * @type {Integer} 
     */
    MinPasswordLength {
        get => this.get_MinPasswordLength()
        set => this.put_MinPasswordLength(value)
    }

    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     *  Gets or sets the ability to prevent convenience logons.  DisallowConvenienceLogon is not defined in MS-ASPROV. It is mapped from MS-ASPROV AllowSimplePassword with respect to the Windows password policies.
     * 
     * When DevicePasswordEnabled is equal to TRUE, if AllowSimplePassword is TRUE, then DisallowConvenienceLogon should be set to FALSE. If AllowSimplePassword is FALSE, then DisallowConvenienceLogon should be set to TRUE.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.disallowconveniencelogon
     * @type {Boolean} 
     */
    DisallowConvenienceLogon {
        get => this.get_DisallowConvenienceLogon()
        set => this.put_DisallowConvenienceLogon(value)
    }

    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Gets or sets the minimum number of complex characters that are required for a password. The MS-ASPROV name is MinDevicePasswordComplexCharacters.
     * 
     * If the caller app receives MS-ASPROV AlphanumericDevicePasswordRequired equal to TRUE, then MinPasswordComplexCharacters must be set to be equal or greater than 2 for evaluation and application.
     * 
     * The MinPasswordComplexCharacters property is superseded by the MS-ASPROV DevicePasswordEnabled policy. If the caller received DevicePasswordEnabled equal to FALSE, do not set the MinPasswordComplexCharacters property for evaluation or application. If the caller received DevicePasswordEnabled equal to TRUE, you can set the MinPasswordComplexCharacters property for evaluation or application.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.minpasswordcomplexcharacters
     * @type {Integer} 
     */
    MinPasswordComplexCharacters {
        get => this.get_MinPasswordComplexCharacters()
        set => this.put_MinPasswordComplexCharacters(value)
    }

    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Gets or set the length of time that a password is valid. The MS-ASPROV name is DevicePasswordExpiration.
     * 
     * The PasswordExpiration property is superseded by the MS-ASPROV DevicePasswordEnabled policy. If the caller received DevicePasswordEnabled equal to FALSE, do not set the PasswordExpiration property for evaluation or application. If the caller received DevicePasswordEnabled equal to TRUE, you can set the PasswordExpiration property for evaluation or application.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.passwordexpiration
     * @type {TimeSpan} 
     */
    PasswordExpiration {
        get => this.get_PasswordExpiration()
        set => this.put_PasswordExpiration(value)
    }

    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Gets or set the password information previously used. The MS-ASPROV name is DevicePasswordHistory.
     * 
     * The PasswordHistory property is superseded by the MS-ASPROV DevicePasswordEnabled policy. If the caller received DevicePasswordEnabled equal to FALSE, do not set the PasswordHistory property for evaluation or application. If the caller received DevicePasswordEnabled equal to TRUE, you can set the PasswordHistory property for evaluation or application.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.passwordhistory
     * @type {Integer} 
     */
    PasswordHistory {
        get => this.get_PasswordHistory()
        set => this.put_PasswordHistory(value)
    }

    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Gets or sets the maximum number of failed password attempts for logging on. The MS-ASPROV name is MaxDevicePasswordFailedAttempts.
     * 
     * The MaxPasswordFailedAttempts property is superseded by the MS-ASPROV DevicePasswordEnabled policy. If the caller received DevicePasswordEnabled equal to FALSE, do not set the MaxPasswordFailedAttempts property for evaluation or application. If the caller received DevicePasswordEnabled equal to TRUE, you can set the MaxPasswordFailedAttempts property for evaluation or application.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.maxpasswordfailedattempts
     * @type {Integer} 
     */
    MaxPasswordFailedAttempts {
        get => this.get_MaxPasswordFailedAttempts()
        set => this.put_MaxPasswordFailedAttempts(value)
    }

    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Gets or sets the maximum length of time the computer can remain inactive before it is locked. The MS-ASPROV name is MaxInactivityTimeDeviceLock.
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.maxinactivitytimelock
     * @type {TimeSpan} 
     */
    MaxInactivityTimeLock {
        get => this.get_MaxInactivityTimeLock()
        set => this.put_MaxInactivityTimeLock(value)
    }

;@endregion Instance Properties

;@region Instance Methods
    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Creates an instance of an object that allows the caller app to set policies received from the Exchange server for evaluation or application.
    */
    __New(ptr := 0) {
        if(ptr == 0) {
            activatableClassId := HSTRING.Create("Windows.Security.ExchangeActiveSyncProvisioning.EasClientSecurityPolicy")
            ptr := WinRT.RoActivateInstance(activatableClassId)
        }

        super.__New(ptr)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_RequireEncryption() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.get_RequireEncryption()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_RequireEncryption(value) {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.put_RequireEncryption(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPasswordLength() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.get_MinPasswordLength()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinPasswordLength(value) {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.put_MinPasswordLength(value)
    }

    /**
     * 
     * @returns {Boolean} 
     */
    get_DisallowConvenienceLogon() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.get_DisallowConvenienceLogon()
    }

    /**
     * 
     * @param {Boolean} value 
     * @returns {HRESULT} 
     */
    put_DisallowConvenienceLogon(value) {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.put_DisallowConvenienceLogon(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MinPasswordComplexCharacters() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.get_MinPasswordComplexCharacters()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MinPasswordComplexCharacters(value) {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.put_MinPasswordComplexCharacters(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_PasswordExpiration() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.get_PasswordExpiration()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_PasswordExpiration(value) {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.put_PasswordExpiration(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_PasswordHistory() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.get_PasswordHistory()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_PasswordHistory(value) {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.put_PasswordHistory(value)
    }

    /**
     * 
     * @returns {Integer} 
     */
    get_MaxPasswordFailedAttempts() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.get_MaxPasswordFailedAttempts()
    }

    /**
     * 
     * @param {Integer} value 
     * @returns {HRESULT} 
     */
    put_MaxPasswordFailedAttempts(value) {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.put_MaxPasswordFailedAttempts(value)
    }

    /**
     * 
     * @returns {TimeSpan} 
     */
    get_MaxInactivityTimeLock() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.get_MaxInactivityTimeLock()
    }

    /**
     * 
     * @param {TimeSpan} value 
     * @returns {HRESULT} 
     */
    put_MaxInactivityTimeLock(value) {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.put_MaxInactivityTimeLock(value)
    }

    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Evaluates the EAS policies.CheckCompliance is called by a UWP app for mail any time the app wants to evaluate whether the local computer is compliant to the given EAS policies. Because this call doesn't involve any UI interactions, it is a synchronous call.
     * @returns {EasComplianceResults} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.checkcompliance
     */
    CheckCompliance() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.CheckCompliance()
    }

    /**
     * > [!NOTE]
     * > [EasClientSecurityPolicy](easclientsecuritypolicy.md) may be unavailable for releases after Windows 10.
     * 
     * Applies the EAS policies in asynchronous mode once the user consents.ApplyAsync is called by a UWP app for mail any time the app wants to make the local computer compliant.
     * @returns {IAsyncOperation<EasComplianceResults>} 
     * @see https://learn.microsoft.com/uwp/api/windows.security.exchangeactivesyncprovisioning.easclientsecuritypolicy.applyasync
     */
    ApplyAsync() {
        if (!this.HasProp("__IEasClientSecurityPolicy")) {
            if ((queryResult := this.QueryInterface(IEasClientSecurityPolicy.IID, &outPtr := 0)) != 0)
                throw OSError(queryResult)
            this.__IEasClientSecurityPolicy := IEasClientSecurityPolicy(outPtr)
        }

        return this.__IEasClientSecurityPolicy.ApplyAsync()
    }

;@endregion Instance Methods
}
