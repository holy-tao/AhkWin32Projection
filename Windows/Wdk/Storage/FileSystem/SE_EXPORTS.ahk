#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\Win32\Security\PSID.ahk" { PSID }

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 */
export default struct SE_EXPORTS {
    #StructPack 8

    SeCreateTokenPrivilege : IntPtr

    SeAssignPrimaryTokenPrivilege : IntPtr

    SeLockMemoryPrivilege : IntPtr

    SeIncreaseQuotaPrivilege : IntPtr

    SeUnsolicitedInputPrivilege : IntPtr

    SeTcbPrivilege : IntPtr

    SeSecurityPrivilege : IntPtr

    SeTakeOwnershipPrivilege : IntPtr

    SeLoadDriverPrivilege : IntPtr

    SeCreatePagefilePrivilege : IntPtr

    SeIncreaseBasePriorityPrivilege : IntPtr

    SeSystemProfilePrivilege : IntPtr

    SeSystemtimePrivilege : IntPtr

    SeProfileSingleProcessPrivilege : IntPtr

    SeCreatePermanentPrivilege : IntPtr

    SeBackupPrivilege : IntPtr

    SeRestorePrivilege : IntPtr

    SeShutdownPrivilege : IntPtr

    SeDebugPrivilege : IntPtr

    SeAuditPrivilege : IntPtr

    SeSystemEnvironmentPrivilege : IntPtr

    SeChangeNotifyPrivilege : IntPtr

    SeRemoteShutdownPrivilege : IntPtr

    SeNullSid : PSID

    SeWorldSid : PSID

    SeLocalSid : PSID

    SeCreatorOwnerSid : PSID

    SeCreatorGroupSid : PSID

    SeNtAuthoritySid : PSID

    SeDialupSid : PSID

    SeNetworkSid : PSID

    SeBatchSid : PSID

    SeInteractiveSid : PSID

    SeLocalSystemSid : PSID

    SeAliasAdminsSid : PSID

    SeAliasUsersSid : PSID

    SeAliasGuestsSid : PSID

    SeAliasPowerUsersSid : PSID

    SeAliasAccountOpsSid : PSID

    SeAliasSystemOpsSid : PSID

    SeAliasPrintOpsSid : PSID

    SeAliasBackupOpsSid : PSID

    SeAuthenticatedUsersSid : PSID

    SeRestrictedSid : PSID

    SeAnonymousLogonSid : PSID

    SeUndockPrivilege : IntPtr

    SeSyncAgentPrivilege : IntPtr

    SeEnableDelegationPrivilege : IntPtr

    SeLocalServiceSid : PSID

    SeNetworkServiceSid : PSID

    SeManageVolumePrivilege : IntPtr

    SeImpersonatePrivilege : IntPtr

    SeCreateGlobalPrivilege : IntPtr

    SeTrustedCredManAccessPrivilege : IntPtr

    SeRelabelPrivilege : IntPtr

    SeIncreaseWorkingSetPrivilege : IntPtr

    SeTimeZonePrivilege : IntPtr

    SeCreateSymbolicLinkPrivilege : IntPtr

    SeIUserSid : PSID

    SeUntrustedMandatorySid : PSID

    SeLowMandatorySid : PSID

    SeMediumMandatorySid : PSID

    SeHighMandatorySid : PSID

    SeSystemMandatorySid : PSID

    SeOwnerRightsSid : PSID

    SeAllAppPackagesSid : PSID

    SeUserModeDriversSid : PSID

    SeProcTrustWinTcbSid : PSID

    SeTrustedInstallerSid : PSID

    SeDelegateSessionUserImpersonatePrivilege : IntPtr

    SeAppSiloSid : PSID

    SeAppSiloVolumeRootMinimalCapabilitySid : PSID

    SeAppSiloProfilesRootMinimalCapabilitySid : PSID

}
