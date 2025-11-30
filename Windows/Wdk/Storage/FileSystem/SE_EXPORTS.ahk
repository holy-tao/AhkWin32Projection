#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\LUID.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class SE_EXPORTS extends Win32Struct
{
    static sizeof => 584

    static packingSize => 8

    /**
     * @type {LUID}
     */
    SeCreateTokenPrivilege{
        get {
            if(!this.HasProp("__SeCreateTokenPrivilege"))
                this.__SeCreateTokenPrivilege := LUID(0, this)
            return this.__SeCreateTokenPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeAssignPrimaryTokenPrivilege{
        get {
            if(!this.HasProp("__SeAssignPrimaryTokenPrivilege"))
                this.__SeAssignPrimaryTokenPrivilege := LUID(8, this)
            return this.__SeAssignPrimaryTokenPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeLockMemoryPrivilege{
        get {
            if(!this.HasProp("__SeLockMemoryPrivilege"))
                this.__SeLockMemoryPrivilege := LUID(16, this)
            return this.__SeLockMemoryPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeIncreaseQuotaPrivilege{
        get {
            if(!this.HasProp("__SeIncreaseQuotaPrivilege"))
                this.__SeIncreaseQuotaPrivilege := LUID(24, this)
            return this.__SeIncreaseQuotaPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeUnsolicitedInputPrivilege{
        get {
            if(!this.HasProp("__SeUnsolicitedInputPrivilege"))
                this.__SeUnsolicitedInputPrivilege := LUID(32, this)
            return this.__SeUnsolicitedInputPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeTcbPrivilege{
        get {
            if(!this.HasProp("__SeTcbPrivilege"))
                this.__SeTcbPrivilege := LUID(40, this)
            return this.__SeTcbPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeSecurityPrivilege{
        get {
            if(!this.HasProp("__SeSecurityPrivilege"))
                this.__SeSecurityPrivilege := LUID(48, this)
            return this.__SeSecurityPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeTakeOwnershipPrivilege{
        get {
            if(!this.HasProp("__SeTakeOwnershipPrivilege"))
                this.__SeTakeOwnershipPrivilege := LUID(56, this)
            return this.__SeTakeOwnershipPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeLoadDriverPrivilege{
        get {
            if(!this.HasProp("__SeLoadDriverPrivilege"))
                this.__SeLoadDriverPrivilege := LUID(64, this)
            return this.__SeLoadDriverPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeCreatePagefilePrivilege{
        get {
            if(!this.HasProp("__SeCreatePagefilePrivilege"))
                this.__SeCreatePagefilePrivilege := LUID(72, this)
            return this.__SeCreatePagefilePrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeIncreaseBasePriorityPrivilege{
        get {
            if(!this.HasProp("__SeIncreaseBasePriorityPrivilege"))
                this.__SeIncreaseBasePriorityPrivilege := LUID(80, this)
            return this.__SeIncreaseBasePriorityPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeSystemProfilePrivilege{
        get {
            if(!this.HasProp("__SeSystemProfilePrivilege"))
                this.__SeSystemProfilePrivilege := LUID(88, this)
            return this.__SeSystemProfilePrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeSystemtimePrivilege{
        get {
            if(!this.HasProp("__SeSystemtimePrivilege"))
                this.__SeSystemtimePrivilege := LUID(96, this)
            return this.__SeSystemtimePrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeProfileSingleProcessPrivilege{
        get {
            if(!this.HasProp("__SeProfileSingleProcessPrivilege"))
                this.__SeProfileSingleProcessPrivilege := LUID(104, this)
            return this.__SeProfileSingleProcessPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeCreatePermanentPrivilege{
        get {
            if(!this.HasProp("__SeCreatePermanentPrivilege"))
                this.__SeCreatePermanentPrivilege := LUID(112, this)
            return this.__SeCreatePermanentPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeBackupPrivilege{
        get {
            if(!this.HasProp("__SeBackupPrivilege"))
                this.__SeBackupPrivilege := LUID(120, this)
            return this.__SeBackupPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeRestorePrivilege{
        get {
            if(!this.HasProp("__SeRestorePrivilege"))
                this.__SeRestorePrivilege := LUID(128, this)
            return this.__SeRestorePrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeShutdownPrivilege{
        get {
            if(!this.HasProp("__SeShutdownPrivilege"))
                this.__SeShutdownPrivilege := LUID(136, this)
            return this.__SeShutdownPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeDebugPrivilege{
        get {
            if(!this.HasProp("__SeDebugPrivilege"))
                this.__SeDebugPrivilege := LUID(144, this)
            return this.__SeDebugPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeAuditPrivilege{
        get {
            if(!this.HasProp("__SeAuditPrivilege"))
                this.__SeAuditPrivilege := LUID(152, this)
            return this.__SeAuditPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeSystemEnvironmentPrivilege{
        get {
            if(!this.HasProp("__SeSystemEnvironmentPrivilege"))
                this.__SeSystemEnvironmentPrivilege := LUID(160, this)
            return this.__SeSystemEnvironmentPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeChangeNotifyPrivilege{
        get {
            if(!this.HasProp("__SeChangeNotifyPrivilege"))
                this.__SeChangeNotifyPrivilege := LUID(168, this)
            return this.__SeChangeNotifyPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeRemoteShutdownPrivilege{
        get {
            if(!this.HasProp("__SeRemoteShutdownPrivilege"))
                this.__SeRemoteShutdownPrivilege := LUID(176, this)
            return this.__SeRemoteShutdownPrivilege
        }
    }

    /**
     * @type {PSID}
     */
    SeNullSid {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {PSID}
     */
    SeWorldSid {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {PSID}
     */
    SeLocalSid {
        get => NumGet(this, 200, "ptr")
        set => NumPut("ptr", value, this, 200)
    }

    /**
     * @type {PSID}
     */
    SeCreatorOwnerSid {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {PSID}
     */
    SeCreatorGroupSid {
        get => NumGet(this, 216, "ptr")
        set => NumPut("ptr", value, this, 216)
    }

    /**
     * @type {PSID}
     */
    SeNtAuthoritySid {
        get => NumGet(this, 224, "ptr")
        set => NumPut("ptr", value, this, 224)
    }

    /**
     * @type {PSID}
     */
    SeDialupSid {
        get => NumGet(this, 232, "ptr")
        set => NumPut("ptr", value, this, 232)
    }

    /**
     * @type {PSID}
     */
    SeNetworkSid {
        get => NumGet(this, 240, "ptr")
        set => NumPut("ptr", value, this, 240)
    }

    /**
     * @type {PSID}
     */
    SeBatchSid {
        get => NumGet(this, 248, "ptr")
        set => NumPut("ptr", value, this, 248)
    }

    /**
     * @type {PSID}
     */
    SeInteractiveSid {
        get => NumGet(this, 256, "ptr")
        set => NumPut("ptr", value, this, 256)
    }

    /**
     * @type {PSID}
     */
    SeLocalSystemSid {
        get => NumGet(this, 264, "ptr")
        set => NumPut("ptr", value, this, 264)
    }

    /**
     * @type {PSID}
     */
    SeAliasAdminsSid {
        get => NumGet(this, 272, "ptr")
        set => NumPut("ptr", value, this, 272)
    }

    /**
     * @type {PSID}
     */
    SeAliasUsersSid {
        get => NumGet(this, 280, "ptr")
        set => NumPut("ptr", value, this, 280)
    }

    /**
     * @type {PSID}
     */
    SeAliasGuestsSid {
        get => NumGet(this, 288, "ptr")
        set => NumPut("ptr", value, this, 288)
    }

    /**
     * @type {PSID}
     */
    SeAliasPowerUsersSid {
        get => NumGet(this, 296, "ptr")
        set => NumPut("ptr", value, this, 296)
    }

    /**
     * @type {PSID}
     */
    SeAliasAccountOpsSid {
        get => NumGet(this, 304, "ptr")
        set => NumPut("ptr", value, this, 304)
    }

    /**
     * @type {PSID}
     */
    SeAliasSystemOpsSid {
        get => NumGet(this, 312, "ptr")
        set => NumPut("ptr", value, this, 312)
    }

    /**
     * @type {PSID}
     */
    SeAliasPrintOpsSid {
        get => NumGet(this, 320, "ptr")
        set => NumPut("ptr", value, this, 320)
    }

    /**
     * @type {PSID}
     */
    SeAliasBackupOpsSid {
        get => NumGet(this, 328, "ptr")
        set => NumPut("ptr", value, this, 328)
    }

    /**
     * @type {PSID}
     */
    SeAuthenticatedUsersSid {
        get => NumGet(this, 336, "ptr")
        set => NumPut("ptr", value, this, 336)
    }

    /**
     * @type {PSID}
     */
    SeRestrictedSid {
        get => NumGet(this, 344, "ptr")
        set => NumPut("ptr", value, this, 344)
    }

    /**
     * @type {PSID}
     */
    SeAnonymousLogonSid {
        get => NumGet(this, 352, "ptr")
        set => NumPut("ptr", value, this, 352)
    }

    /**
     * @type {LUID}
     */
    SeUndockPrivilege{
        get {
            if(!this.HasProp("__SeUndockPrivilege"))
                this.__SeUndockPrivilege := LUID(360, this)
            return this.__SeUndockPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeSyncAgentPrivilege{
        get {
            if(!this.HasProp("__SeSyncAgentPrivilege"))
                this.__SeSyncAgentPrivilege := LUID(368, this)
            return this.__SeSyncAgentPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeEnableDelegationPrivilege{
        get {
            if(!this.HasProp("__SeEnableDelegationPrivilege"))
                this.__SeEnableDelegationPrivilege := LUID(376, this)
            return this.__SeEnableDelegationPrivilege
        }
    }

    /**
     * @type {PSID}
     */
    SeLocalServiceSid {
        get => NumGet(this, 384, "ptr")
        set => NumPut("ptr", value, this, 384)
    }

    /**
     * @type {PSID}
     */
    SeNetworkServiceSid {
        get => NumGet(this, 392, "ptr")
        set => NumPut("ptr", value, this, 392)
    }

    /**
     * @type {LUID}
     */
    SeManageVolumePrivilege{
        get {
            if(!this.HasProp("__SeManageVolumePrivilege"))
                this.__SeManageVolumePrivilege := LUID(400, this)
            return this.__SeManageVolumePrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeImpersonatePrivilege{
        get {
            if(!this.HasProp("__SeImpersonatePrivilege"))
                this.__SeImpersonatePrivilege := LUID(408, this)
            return this.__SeImpersonatePrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeCreateGlobalPrivilege{
        get {
            if(!this.HasProp("__SeCreateGlobalPrivilege"))
                this.__SeCreateGlobalPrivilege := LUID(416, this)
            return this.__SeCreateGlobalPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeTrustedCredManAccessPrivilege{
        get {
            if(!this.HasProp("__SeTrustedCredManAccessPrivilege"))
                this.__SeTrustedCredManAccessPrivilege := LUID(424, this)
            return this.__SeTrustedCredManAccessPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeRelabelPrivilege{
        get {
            if(!this.HasProp("__SeRelabelPrivilege"))
                this.__SeRelabelPrivilege := LUID(432, this)
            return this.__SeRelabelPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeIncreaseWorkingSetPrivilege{
        get {
            if(!this.HasProp("__SeIncreaseWorkingSetPrivilege"))
                this.__SeIncreaseWorkingSetPrivilege := LUID(440, this)
            return this.__SeIncreaseWorkingSetPrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeTimeZonePrivilege{
        get {
            if(!this.HasProp("__SeTimeZonePrivilege"))
                this.__SeTimeZonePrivilege := LUID(448, this)
            return this.__SeTimeZonePrivilege
        }
    }

    /**
     * @type {LUID}
     */
    SeCreateSymbolicLinkPrivilege{
        get {
            if(!this.HasProp("__SeCreateSymbolicLinkPrivilege"))
                this.__SeCreateSymbolicLinkPrivilege := LUID(456, this)
            return this.__SeCreateSymbolicLinkPrivilege
        }
    }

    /**
     * @type {PSID}
     */
    SeIUserSid {
        get => NumGet(this, 464, "ptr")
        set => NumPut("ptr", value, this, 464)
    }

    /**
     * @type {PSID}
     */
    SeUntrustedMandatorySid {
        get => NumGet(this, 472, "ptr")
        set => NumPut("ptr", value, this, 472)
    }

    /**
     * @type {PSID}
     */
    SeLowMandatorySid {
        get => NumGet(this, 480, "ptr")
        set => NumPut("ptr", value, this, 480)
    }

    /**
     * @type {PSID}
     */
    SeMediumMandatorySid {
        get => NumGet(this, 488, "ptr")
        set => NumPut("ptr", value, this, 488)
    }

    /**
     * @type {PSID}
     */
    SeHighMandatorySid {
        get => NumGet(this, 496, "ptr")
        set => NumPut("ptr", value, this, 496)
    }

    /**
     * @type {PSID}
     */
    SeSystemMandatorySid {
        get => NumGet(this, 504, "ptr")
        set => NumPut("ptr", value, this, 504)
    }

    /**
     * @type {PSID}
     */
    SeOwnerRightsSid {
        get => NumGet(this, 512, "ptr")
        set => NumPut("ptr", value, this, 512)
    }

    /**
     * @type {PSID}
     */
    SeAllAppPackagesSid {
        get => NumGet(this, 520, "ptr")
        set => NumPut("ptr", value, this, 520)
    }

    /**
     * @type {PSID}
     */
    SeUserModeDriversSid {
        get => NumGet(this, 528, "ptr")
        set => NumPut("ptr", value, this, 528)
    }

    /**
     * @type {PSID}
     */
    SeProcTrustWinTcbSid {
        get => NumGet(this, 536, "ptr")
        set => NumPut("ptr", value, this, 536)
    }

    /**
     * @type {PSID}
     */
    SeTrustedInstallerSid {
        get => NumGet(this, 544, "ptr")
        set => NumPut("ptr", value, this, 544)
    }

    /**
     * @type {LUID}
     */
    SeDelegateSessionUserImpersonatePrivilege{
        get {
            if(!this.HasProp("__SeDelegateSessionUserImpersonatePrivilege"))
                this.__SeDelegateSessionUserImpersonatePrivilege := LUID(552, this)
            return this.__SeDelegateSessionUserImpersonatePrivilege
        }
    }

    /**
     * @type {PSID}
     */
    SeAppSiloSid {
        get => NumGet(this, 560, "ptr")
        set => NumPut("ptr", value, this, 560)
    }

    /**
     * @type {PSID}
     */
    SeAppSiloVolumeRootMinimalCapabilitySid {
        get => NumGet(this, 568, "ptr")
        set => NumPut("ptr", value, this, 568)
    }

    /**
     * @type {PSID}
     */
    SeAppSiloProfilesRootMinimalCapabilitySid {
        get => NumGet(this, 576, "ptr")
        set => NumPut("ptr", value, this, 576)
    }
}
