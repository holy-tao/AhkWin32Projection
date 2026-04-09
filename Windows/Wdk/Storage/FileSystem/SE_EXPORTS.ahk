#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
class SE_EXPORTS extends Win32Struct {
    static sizeof => 584

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    SeCreateTokenPrivilege {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer}
     */
    SeAssignPrimaryTokenPrivilege {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    SeLockMemoryPrivilege {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer}
     */
    SeIncreaseQuotaPrivilege {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer}
     */
    SeUnsolicitedInputPrivilege {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {Pointer}
     */
    SeTcbPrivilege {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * @type {Pointer}
     */
    SeSecurityPrivilege {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * @type {Pointer}
     */
    SeTakeOwnershipPrivilege {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * @type {Pointer}
     */
    SeLoadDriverPrivilege {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * @type {Pointer}
     */
    SeCreatePagefilePrivilege {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * @type {Pointer}
     */
    SeIncreaseBasePriorityPrivilege {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * @type {Pointer}
     */
    SeSystemProfilePrivilege {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {Pointer}
     */
    SeSystemtimePrivilege {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * @type {Pointer}
     */
    SeProfileSingleProcessPrivilege {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    /**
     * @type {Pointer}
     */
    SeCreatePermanentPrivilege {
        get => NumGet(this, 112, "ptr")
        set => NumPut("ptr", value, this, 112)
    }

    /**
     * @type {Pointer}
     */
    SeBackupPrivilege {
        get => NumGet(this, 120, "ptr")
        set => NumPut("ptr", value, this, 120)
    }

    /**
     * @type {Pointer}
     */
    SeRestorePrivilege {
        get => NumGet(this, 128, "ptr")
        set => NumPut("ptr", value, this, 128)
    }

    /**
     * @type {Pointer}
     */
    SeShutdownPrivilege {
        get => NumGet(this, 136, "ptr")
        set => NumPut("ptr", value, this, 136)
    }

    /**
     * @type {Pointer}
     */
    SeDebugPrivilege {
        get => NumGet(this, 144, "ptr")
        set => NumPut("ptr", value, this, 144)
    }

    /**
     * @type {Pointer}
     */
    SeAuditPrivilege {
        get => NumGet(this, 152, "ptr")
        set => NumPut("ptr", value, this, 152)
    }

    /**
     * @type {Pointer}
     */
    SeSystemEnvironmentPrivilege {
        get => NumGet(this, 160, "ptr")
        set => NumPut("ptr", value, this, 160)
    }

    /**
     * @type {Pointer}
     */
    SeChangeNotifyPrivilege {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer}
     */
    SeRemoteShutdownPrivilege {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
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
     * @type {Pointer}
     */
    SeUndockPrivilege {
        get => NumGet(this, 360, "ptr")
        set => NumPut("ptr", value, this, 360)
    }

    /**
     * @type {Pointer}
     */
    SeSyncAgentPrivilege {
        get => NumGet(this, 368, "ptr")
        set => NumPut("ptr", value, this, 368)
    }

    /**
     * @type {Pointer}
     */
    SeEnableDelegationPrivilege {
        get => NumGet(this, 376, "ptr")
        set => NumPut("ptr", value, this, 376)
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
     * @type {Pointer}
     */
    SeManageVolumePrivilege {
        get => NumGet(this, 400, "ptr")
        set => NumPut("ptr", value, this, 400)
    }

    /**
     * @type {Pointer}
     */
    SeImpersonatePrivilege {
        get => NumGet(this, 408, "ptr")
        set => NumPut("ptr", value, this, 408)
    }

    /**
     * @type {Pointer}
     */
    SeCreateGlobalPrivilege {
        get => NumGet(this, 416, "ptr")
        set => NumPut("ptr", value, this, 416)
    }

    /**
     * @type {Pointer}
     */
    SeTrustedCredManAccessPrivilege {
        get => NumGet(this, 424, "ptr")
        set => NumPut("ptr", value, this, 424)
    }

    /**
     * @type {Pointer}
     */
    SeRelabelPrivilege {
        get => NumGet(this, 432, "ptr")
        set => NumPut("ptr", value, this, 432)
    }

    /**
     * @type {Pointer}
     */
    SeIncreaseWorkingSetPrivilege {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }

    /**
     * @type {Pointer}
     */
    SeTimeZonePrivilege {
        get => NumGet(this, 448, "ptr")
        set => NumPut("ptr", value, this, 448)
    }

    /**
     * @type {Pointer}
     */
    SeCreateSymbolicLinkPrivilege {
        get => NumGet(this, 456, "ptr")
        set => NumPut("ptr", value, this, 456)
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
     * @type {Pointer}
     */
    SeDelegateSessionUserImpersonatePrivilege {
        get => NumGet(this, 552, "ptr")
        set => NumPut("ptr", value, this, 552)
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
