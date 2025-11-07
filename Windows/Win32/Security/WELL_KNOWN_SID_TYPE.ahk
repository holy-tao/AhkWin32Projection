#Requires AutoHotkey v2.0.0 64-bit

/**
 * A list of commonly used security identifiers (SIDs). Programs can pass these values to the CreateWellKnownSid function to create a SID from this list.
 * @see https://docs.microsoft.com/windows/win32/api//winnt/ne-winnt-well_known_sid_type
 * @namespace Windows.Win32.Security
 * @version v4.0.30319
 */
class WELL_KNOWN_SID_TYPE{

    /**
     * Indicates a null SID.
     * @type {Integer (Int32)}
     */
    static WinNullSid => 0

    /**
     * Indicates a SID that matches everyone.
     * @type {Integer (Int32)}
     */
    static WinWorldSid => 1

    /**
     * Indicates a local SID.
     * @type {Integer (Int32)}
     */
    static WinLocalSid => 2

    /**
     * Indicates a SID that matches the owner or creator of an object.
     * @type {Integer (Int32)}
     */
    static WinCreatorOwnerSid => 3

    /**
     * Indicates a SID that matches the creator group of an object.
     * @type {Integer (Int32)}
     */
    static WinCreatorGroupSid => 4

    /**
     * Indicates a creator owner server SID.
     * @type {Integer (Int32)}
     */
    static WinCreatorOwnerServerSid => 5

    /**
     * Indicates a creator group server SID.
     * @type {Integer (Int32)}
     */
    static WinCreatorGroupServerSid => 6

    /**
     * Indicates a SID for the Windows NT authority account.
     * @type {Integer (Int32)}
     */
    static WinNtAuthoritySid => 7

    /**
     * Indicates a SID for a dial-up account.
     * @type {Integer (Int32)}
     */
    static WinDialupSid => 8

    /**
     * Indicates a SID for a network account. This SID is added to the process of a token when it logs on across a network. The corresponding logon type is LOGON32_LOGON_NETWORK.
     * @type {Integer (Int32)}
     */
    static WinNetworkSid => 9

    /**
     * Indicates a SID for a batch process. This SID is added to the process of a token when it logs on as a batch job. The corresponding logon type is LOGON32_LOGON_BATCH.
     * @type {Integer (Int32)}
     */
    static WinBatchSid => 10

    /**
     * Indicates a SID for an interactive account. This SID is added to the process of a token when it logs on interactively. The corresponding logon type is LOGON32_LOGON_INTERACTIVE.
     * @type {Integer (Int32)}
     */
    static WinInteractiveSid => 11

    /**
     * Indicates a SID for a service. This SID is added to the process of a token when it logs on as a service. The corresponding logon type is LOGON32_LOGON_SERVICE.
     * @type {Integer (Int32)}
     */
    static WinServiceSid => 12

    /**
     * Indicates a SID for the anonymous account.
     * @type {Integer (Int32)}
     */
    static WinAnonymousSid => 13

    /**
     * Indicates a proxy SID.
     * @type {Integer (Int32)}
     */
    static WinProxySid => 14

    /**
     * Indicates a SID for an enterprise controller.
     * @type {Integer (Int32)}
     */
    static WinEnterpriseControllersSid => 15

    /**
     * Indicates a SID for self.
     * @type {Integer (Int32)}
     */
    static WinSelfSid => 16

    /**
     * Indicates a SID that matches any authenticated user.
     * @type {Integer (Int32)}
     */
    static WinAuthenticatedUserSid => 17

    /**
     * Indicates a SID for restricted code.
     * @type {Integer (Int32)}
     */
    static WinRestrictedCodeSid => 18

    /**
     * Indicates a SID that matches a terminal server account.
     * @type {Integer (Int32)}
     */
    static WinTerminalServerSid => 19

    /**
     * Indicates a SID that matches remote logons.
     * @type {Integer (Int32)}
     */
    static WinRemoteLogonIdSid => 20

    /**
     * Indicates a SID that matches logon IDs.
     * @type {Integer (Int32)}
     */
    static WinLogonIdsSid => 21

    /**
     * Indicates a SID that matches the local system.
     * @type {Integer (Int32)}
     */
    static WinLocalSystemSid => 22

    /**
     * Indicates a SID that matches a local service.
     * @type {Integer (Int32)}
     */
    static WinLocalServiceSid => 23

    /**
     * Indicates a SID that matches a network service.
     * @type {Integer (Int32)}
     */
    static WinNetworkServiceSid => 24

    /**
     * Indicates a SID that matches the domain account.
     * @type {Integer (Int32)}
     */
    static WinBuiltinDomainSid => 25

    /**
     * Indicates a SID that matches the administrator group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinAdministratorsSid => 26

    /**
     * Indicates a SID that matches built-in user accounts.
     * @type {Integer (Int32)}
     */
    static WinBuiltinUsersSid => 27

    /**
     * Indicates a SID that matches the guest account.
     * @type {Integer (Int32)}
     */
    static WinBuiltinGuestsSid => 28

    /**
     * Indicates a SID that matches the power users group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinPowerUsersSid => 29

    /**
     * Indicates a SID that matches the account operators account.
     * @type {Integer (Int32)}
     */
    static WinBuiltinAccountOperatorsSid => 30

    /**
     * Indicates a SID that matches the system operators group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinSystemOperatorsSid => 31

    /**
     * Indicates a SID that matches the print operators group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinPrintOperatorsSid => 32

    /**
     * Indicates a SID that matches the backup operators group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinBackupOperatorsSid => 33

    /**
     * Indicates a SID that matches the replicator account.
     * @type {Integer (Int32)}
     */
    static WinBuiltinReplicatorSid => 34

    /**
     * Indicates a SID that matches pre-Windows 2000 compatible accounts.
     * @type {Integer (Int32)}
     */
    static WinBuiltinPreWindows2000CompatibleAccessSid => 35

    /**
     * Indicates a SID that matches remote desktop users.
     * @type {Integer (Int32)}
     */
    static WinBuiltinRemoteDesktopUsersSid => 36

    /**
     * Indicates a SID that matches the network operators group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinNetworkConfigurationOperatorsSid => 37

    /**
     * Indicates a SID that matches the account administrator's account.
     * @type {Integer (Int32)}
     */
    static WinAccountAdministratorSid => 38

    /**
     * Indicates a SID that matches the account guest group.
     * @type {Integer (Int32)}
     */
    static WinAccountGuestSid => 39

    /**
     * Indicates a SID that matches account Kerberos target group.
     * @type {Integer (Int32)}
     */
    static WinAccountKrbtgtSid => 40

    /**
     * Indicates a SID that matches the account domain administrator group.
     * @type {Integer (Int32)}
     */
    static WinAccountDomainAdminsSid => 41

    /**
     * Indicates a SID that matches the account domain users group.
     * @type {Integer (Int32)}
     */
    static WinAccountDomainUsersSid => 42

    /**
     * Indicates a SID that matches the account domain guests group.
     * @type {Integer (Int32)}
     */
    static WinAccountDomainGuestsSid => 43

    /**
     * Indicates a SID that matches the account computer group.
     * @type {Integer (Int32)}
     */
    static WinAccountComputersSid => 44

    /**
     * Indicates a SID that matches the account controller group.
     * @type {Integer (Int32)}
     */
    static WinAccountControllersSid => 45

    /**
     * Indicates a SID that matches the certificate administrators group.
     * @type {Integer (Int32)}
     */
    static WinAccountCertAdminsSid => 46

    /**
     * Indicates a SID that matches the schema administrators group.
     * @type {Integer (Int32)}
     */
    static WinAccountSchemaAdminsSid => 47

    /**
     * Indicates a SID that matches the enterprise administrators group.
     * @type {Integer (Int32)}
     */
    static WinAccountEnterpriseAdminsSid => 48

    /**
     * Indicates a SID that matches the policy administrators group.
     * @type {Integer (Int32)}
     */
    static WinAccountPolicyAdminsSid => 49

    /**
     * Indicates a SID that matches the RAS and IAS server account.
     * @type {Integer (Int32)}
     */
    static WinAccountRasAndIasServersSid => 50

    /**
     * Indicates a SID present when the Microsoft NTLM authentication package authenticated the client.
     * @type {Integer (Int32)}
     */
    static WinNTLMAuthenticationSid => 51

    /**
     * Indicates a SID present when the Microsoft Digest authentication package authenticated the client.
     * @type {Integer (Int32)}
     */
    static WinDigestAuthenticationSid => 52

    /**
     * Indicates a SID present when the Secure Channel (SSL/TLS) authentication package authenticated the client.
     * @type {Integer (Int32)}
     */
    static WinSChannelAuthenticationSid => 53

    /**
     * Indicates a SID present when the user authenticated from within the forest or across a trust that does not have the selective authentication option enabled. If this SID is present, then WinOtherOrganizationSid cannot be present.
     * @type {Integer (Int32)}
     */
    static WinThisOrganizationSid => 54

    /**
     * Indicates a SID present when the user authenticated across a forest with the selective authentication option enabled. If this SID is present, then WinThisOrganizationSid cannot be present.
     * @type {Integer (Int32)}
     */
    static WinOtherOrganizationSid => 55

    /**
     * Indicates a SID that allows a user to create incoming forest trusts. It is added to the token of users who are a member of the Incoming Forest Trust Builders built-in group in the root domain of the forest.
     * @type {Integer (Int32)}
     */
    static WinBuiltinIncomingForestTrustBuildersSid => 56

    /**
     * Indicates a SID that matches the performance monitor user group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinPerfMonitoringUsersSid => 57

    /**
     * Indicates a SID that matches the performance log user group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinPerfLoggingUsersSid => 58

    /**
     * Indicates a SID that matches the Windows Authorization Access group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinAuthorizationAccessSid => 59

    /**
     * Indicates a SID is present in a server that can issue terminal server licenses.
     * @type {Integer (Int32)}
     */
    static WinBuiltinTerminalServerLicenseServersSid => 60

    /**
     * Indicates a SID that matches the distributed COM user group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinDCOMUsersSid => 61

    /**
     * Indicates a SID that matches the Internet  built-in user group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinIUsersSid => 62

    /**
     * Indicates a SID that matches the Internet user group.
     * @type {Integer (Int32)}
     */
    static WinIUserSid => 63

    /**
     * Indicates a SID that allows a user to use cryptographic operations. It is added to the token of users who are a member of the CryptoOperators built-in group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinCryptoOperatorsSid => 64

    /**
     * Indicates a SID that matches an untrusted label.
     * @type {Integer (Int32)}
     */
    static WinUntrustedLabelSid => 65

    /**
     * Indicates a SID that matches an low level of trust label.
     * @type {Integer (Int32)}
     */
    static WinLowLabelSid => 66

    /**
     * Indicates a SID that matches an medium level of trust label.
     * @type {Integer (Int32)}
     */
    static WinMediumLabelSid => 67

    /**
     * Indicates a SID that matches a high level of trust label.
     * @type {Integer (Int32)}
     */
    static WinHighLabelSid => 68

    /**
     * Indicates a SID that matches a system label.
     * @type {Integer (Int32)}
     */
    static WinSystemLabelSid => 69

    /**
     * Indicates a SID that matches a write restricted code group.
     * @type {Integer (Int32)}
     */
    static WinWriteRestrictedCodeSid => 70

    /**
     * Indicates a SID that matches a creator and owner rights group.
     * @type {Integer (Int32)}
     */
    static WinCreatorOwnerRightsSid => 71

    /**
     * Indicates a SID that matches a cacheable principals group.
     * @type {Integer (Int32)}
     */
    static WinCacheablePrincipalsGroupSid => 72

    /**
     * Indicates a SID that matches a non-cacheable principals group.
     * @type {Integer (Int32)}
     */
    static WinNonCacheablePrincipalsGroupSid => 73

    /**
     * Indicates a SID that matches an enterprise wide read-only controllers group.
     * @type {Integer (Int32)}
     */
    static WinEnterpriseReadonlyControllersSid => 74

    /**
     * Indicates a SID that matches an account read-only controllers group.
     * @type {Integer (Int32)}
     */
    static WinAccountReadonlyControllersSid => 75

    /**
     * Indicates a SID that matches an event log readers group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinEventLogReadersGroup => 76

    /**
     * Indicates a SID that matches a read-only enterprise domain controller.
     * @type {Integer (Int32)}
     */
    static WinNewEnterpriseReadonlyControllersSid => 77

    /**
     * Indicates a SID that matches the built-in DCOM certification services access group.
     * @type {Integer (Int32)}
     */
    static WinBuiltinCertSvcDComAccessGroup => 78

    /**
     * Indicates a SID that matches the medium plus integrity label.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinMediumPlusLabelSid => 79

    /**
     * Indicates a SID that matches a local logon group.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinLocalLogonSid => 80

    /**
     * Indicates a SID that matches a console logon group.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinConsoleLogonSid => 81

    /**
     * Indicates a SID that matches a certificate for the given organization.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinThisOrganizationCertificateSid => 82

    /**
     * Indicates a SID that matches the application package authority.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinApplicationPackageAuthoritySid => 83

    /**
     * Indicates a SID that applies to all app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinBuiltinAnyPackageSid => 84

    /**
     * Indicates a SID of Internet client capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilityInternetClientSid => 85

    /**
     * Indicates a SID of Internet client and server capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilityInternetClientServerSid => 86

    /**
     * Indicates a SID of private network client and server capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilityPrivateNetworkClientServerSid => 87

    /**
     * Indicates a SID for pictures library capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilityPicturesLibrarySid => 88

    /**
     * Indicates a SID for videos library capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilityVideosLibrarySid => 89

    /**
     * Indicates a SID for music library capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilityMusicLibrarySid => 90

    /**
     * Indicates a SID for documents library capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilityDocumentsLibrarySid => 91

    /**
     * Indicates a SID for shared user certificates capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilitySharedUserCertificatesSid => 92

    /**
     * Indicates a SID for Windows credentials capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilityEnterpriseAuthenticationSid => 93

    /**
     * Indicates a SID for removable storage capability for app containers.
     * 
     * <b>Windows Server 2008 R2, Windows 7, Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>This value is not available.
     * @type {Integer (Int32)}
     */
    static WinCapabilityRemovableStorageSid => 94

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinBuiltinRDSRemoteAccessServersSid => 95

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinBuiltinRDSEndpointServersSid => 96

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinBuiltinRDSManagementServersSid => 97

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinUserModeDriversSid => 98

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinBuiltinHyperVAdminsSid => 99

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAccountCloneableControllersSid => 100

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinBuiltinAccessControlAssistanceOperatorsSid => 101

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinBuiltinRemoteManagementUsersSid => 102

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAuthenticationAuthorityAssertedSid => 103

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAuthenticationServiceAssertedSid => 104

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinLocalAccountSid => 105

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinLocalAccountAndAdministratorSid => 106

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAccountProtectedUsersSid => 107

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinCapabilityAppointmentsSid => 108

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinCapabilityContactsSid => 109

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAccountDefaultSystemManagedSid => 110

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinBuiltinDefaultSystemManagedGroupSid => 111

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinBuiltinStorageReplicaAdminsSid => 112

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAccountKeyAdminsSid => 113

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAccountEnterpriseKeyAdminsSid => 114

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAuthenticationKeyTrustSid => 115

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAuthenticationKeyPropertyMFASid => 116

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAuthenticationKeyPropertyAttestationSid => 117

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinAuthenticationFreshKeyAuthSid => 118

    /**
     * 
     * @type {Integer (Int32)}
     */
    static WinBuiltinDeviceOwnersSid => 119

    /**
     * @type {Integer (Int32)}
     */
    static WinBuiltinUserModeHardwareOperatorsSid => 120

    /**
     * @type {Integer (Int32)}
     */
    static WinBuiltinOpenSSHUsersSid => 121
}
