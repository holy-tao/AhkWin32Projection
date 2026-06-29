#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_EAP_MESSAGE := 2114

/**
 * @type {Integer (Int32)}
 */
export global EAP_GROUP_MASK := 65280

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_EAPHOST_FIRST := -2143158272

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_EAPHOST_LAST := -2143158017

/**
 * @type {Integer (Int32)}
 */
export global EAP_I_EAPHOST_FIRST := -2143158272

/**
 * @type {Integer (Int32)}
 */
export global EAP_I_EAPHOST_LAST := -2143158017

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_CERT_STORE_INACCESSIBLE := 2151809040

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_EAPHOST_METHOD_NOT_INSTALLED := 2151809041

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_EAPHOST_THIRDPARTY_METHOD_HOST_RESET := 2151809042

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_EAPHOST_EAPQEC_INACCESSIBLE := 2151809043

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_EAPHOST_IDENTITY_UNKNOWN := 2151809044

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_AUTHENTICATION_FAILED := 2151809045

/**
 * @type {Integer (UInt32)}
 */
export global EAP_I_EAPHOST_EAP_NEGOTIATION_FAILED := 1078067222

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_EAPHOST_METHOD_INVALID_PACKET := 2151809047

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_EAPHOST_REMOTE_INVALID_PACKET := 2151809048

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_EAPHOST_XML_MALFORMED := 2151809049

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_METHOD_CONFIG_DOES_NOT_SUPPORT_SSO := 2151809050

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_EAPHOST_METHOD_OPERATION_NOT_SUPPORTED := 2151809056

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_USER_FIRST := -2143158016

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_USER_LAST := -2143157761

/**
 * @type {Integer (Int32)}
 */
export global EAP_I_USER_FIRST := 1078067456

/**
 * @type {Integer (Int32)}
 */
export global EAP_I_USER_LAST := 1078067711

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_CERT_NOT_FOUND := 2151809280

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_CERT_INVALID := 2151809281

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_CERT_EXPIRED := 2151809282

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_CERT_REVOKED := 2151809283

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_CERT_OTHER_ERROR := 2151809284

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_CERT_REJECTED := 2151809285

/**
 * @type {Integer (UInt32)}
 */
export global EAP_I_USER_ACCOUNT_OTHER_ERROR := 1078067472

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_CREDENTIALS_REJECTED := 2151809297

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_NAME_PASSWORD_REJECTED := 2151809298

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_NO_SMART_CARD_READER := 2151809299

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_SERVER_FIRST := -2143157760

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_SERVER_LAST := -2143157505

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_SERVER_CERT_NOT_FOUND := 2151809536

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_SERVER_CERT_INVALID := 2151809537

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_SERVER_CERT_EXPIRED := 2151809538

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_SERVER_CERT_REVOKED := 2151809539

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_SERVER_CERT_OTHER_ERROR := 2151809540

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_USER_ROOT_CERT_FIRST := -2143157504

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_USER_ROOT_CERT_LAST := -2143157249

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_ROOT_CERT_NOT_FOUND := 2151809792

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_ROOT_CERT_INVALID := 2151809793

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_USER_ROOT_CERT_EXPIRED := 2151809794

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_SERVER_ROOT_CERT_FIRST := -2143157248

/**
 * @type {Integer (Int32)}
 */
export global EAP_E_SERVER_ROOT_CERT_LAST := -2143156993

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_SERVER_ROOT_CERT_NOT_FOUND := 2151810048

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_SERVER_ROOT_CERT_INVALID := 2151810049

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_SERVER_ROOT_CERT_NAME_REQUIRED := 2151810054

/**
 * @type {Integer (UInt32)}
 */
export global EAP_E_SIM_NOT_VALID := 2151810304

/**
 * @type {Integer (UInt32)}
 */
export global EAP_METHOD_INVALID_PACKET := 2151809047

/**
 * @type {Integer (UInt32)}
 */
export global EAP_INVALID_PACKET := 2151809048

/**
 * @type {Integer (UInt32)}
 */
export global EAP_PEER_FLAG_GUEST_ACCESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global eapPropCipherSuiteNegotiation := 1

/**
 * @type {Integer (UInt32)}
 */
export global eapPropMutualAuth := 2

/**
 * @type {Integer (UInt32)}
 */
export global eapPropIntegrity := 4

/**
 * @type {Integer (UInt32)}
 */
export global eapPropReplayProtection := 8

/**
 * @type {Integer (UInt32)}
 */
export global eapPropConfidentiality := 16

/**
 * @type {Integer (UInt32)}
 */
export global eapPropKeyDerivation := 32

/**
 * @type {Integer (UInt32)}
 */
export global eapPropKeyStrength64 := 64

/**
 * @type {Integer (UInt32)}
 */
export global eapPropKeyStrength128 := 128

/**
 * @type {Integer (UInt32)}
 */
export global eapPropKeyStrength256 := 256

/**
 * @type {Integer (UInt32)}
 */
export global eapPropKeyStrength512 := 512

/**
 * @type {Integer (UInt32)}
 */
export global eapPropKeyStrength1024 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global eapPropDictionaryAttackResistance := 2048

/**
 * @type {Integer (UInt32)}
 */
export global eapPropFastReconnect := 4096

/**
 * @type {Integer (UInt32)}
 */
export global eapPropCryptoBinding := 8192

/**
 * @type {Integer (UInt32)}
 */
export global eapPropSessionIndependence := 16384

/**
 * @type {Integer (UInt32)}
 */
export global eapPropFragmentation := 32768

/**
 * @type {Integer (UInt32)}
 */
export global eapPropChannelBinding := 65536

/**
 * @type {Integer (UInt32)}
 */
export global eapPropNap := 131072

/**
 * @type {Integer (UInt32)}
 */
export global eapPropStandalone := 262144

/**
 * @type {Integer (UInt32)}
 */
export global eapPropMppeEncryption := 524288

/**
 * @type {Integer (UInt32)}
 */
export global eapPropTunnelMethod := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global eapPropSupportsConfig := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global eapPropCertifiedMethod := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global eapPropHiddenMethod := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global eapPropMachineAuth := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global eapPropUserAuth := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global eapPropIdentityPrivacy := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global eapPropMethodChaining := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global eapPropSharedStateEquivalence := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global eapPropReserved := 2147483648

/**
 * @type {String}
 */
export global EAP_VALUENAME_PROPERTIES := "Properties"

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_Reserved1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_NON_INTERACTIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_LOGON := 4

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_PREVIEW := 8

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_Reserved2 := 16

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_MACHINE_AUTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_GUEST_ACCESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_Reserved3 := 128

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_Reserved4 := 256

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_RESUME_FROM_HIBERNATE := 512

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_Reserved5 := 1024

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_Reserved6 := 2048

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_FULL_AUTH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_PREFER_ALT_CREDENTIALS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_Reserved7 := 16384

/**
 * @type {Integer (UInt32)}
 */
export global EAP_PEER_FLAG_HEALTH_STATE_CHANGE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_SUPRESS_UI := 65536

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_PRE_LOGON := 131072

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_USER_AUTH := 262144

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_CONFG_READONLY := 524288

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_Reserved8 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_Reserved9 := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_VPN := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_ONLY_EAP_TLS := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global EAP_FLAG_SERVER_VALIDATION_REQUIRED := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global EAP_CONFIG_INPUT_FIELD_PROPS_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global EAP_CONFIG_INPUT_FIELD_PROPS_NON_DISPLAYABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global EAP_CONFIG_INPUT_FIELD_PROPS_NON_PERSIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global EAP_UI_INPUT_FIELD_PROPS_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global EAP_UI_INPUT_FIELD_PROPS_NON_DISPLAYABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global EAP_UI_INPUT_FIELD_PROPS_NON_PERSIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global EAP_UI_INPUT_FIELD_PROPS_READ_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global EAP_CREDENTIAL_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global EAP_INTERACTIVE_UI_DATA_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global EAPHOST_PEER_API_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global EAPHOST_METHOD_API_VERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EAP_CONFIG_INPUT_FIELD_LENGTH := 256

/**
 * @type {Integer (UInt32)}
 */
export global MAX_EAP_CONFIG_INPUT_FIELD_VALUE_LENGTH := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CERTIFICATE_HASH_LENGTH := 20

/**
 * @type {Integer (UInt32)}
 */
export global NCRYPT_PIN_CACHE_PIN_BYTE_LENGTH := 90

/**
 * @type {String}
 */
export global EAP_REGISTRY_LOCATION := "System\CurrentControlSet\Services\EapHost\Methods"

/**
 * @type {String}
 */
export global EAP_PEER_VALUENAME_DLL_PATH := "PeerDllPath"

/**
 * @type {String}
 */
export global EAP_PEER_VALUENAME_FRIENDLY_NAME := "PeerFriendlyName"

/**
 * @type {String}
 */
export global EAP_PEER_VALUENAME_CONFIGUI := "PeerConfigUIPath"

/**
 * @type {String}
 */
export global EAP_PEER_VALUENAME_REQUIRE_CONFIGUI := "PeerRequireConfigUI"

/**
 * @type {String}
 */
export global EAP_PEER_VALUENAME_IDENTITY := "PeerIdentityPath"

/**
 * @type {String}
 */
export global EAP_PEER_VALUENAME_INTERACTIVEUI := "PeerInteractiveUIPath"

/**
 * @type {String}
 */
export global EAP_PEER_VALUENAME_INVOKE_NAMEDLG := "PeerInvokeUsernameDialog"

/**
 * @type {String}
 */
export global EAP_PEER_VALUENAME_INVOKE_PWDDLG := "PeerInvokePasswordDialog"

/**
 * @type {String}
 */
export global EAP_PEER_VALUENAME_PROPERTIES := "Properties"

/**
 * @type {String}
 */
export global EAP_AUTHENTICATOR_VALUENAME_DLL_PATH := "AuthenticatorDllPath"

/**
 * @type {String}
 */
export global EAP_AUTHENTICATOR_VALUENAME_FRIENDLY_NAME := "AuthenticatorFriendlyName"

/**
 * @type {String}
 */
export global EAP_AUTHENTICATOR_VALUENAME_PROPERTIES := "Properties"

/**
 * @type {String}
 */
export global EAP_AUTHENTICATOR_VALUENAME_CONFIGUI := "AuthenticatorConfigUIPath"

/**
 * @type {Integer (UInt32)}
 */
export global EAP_METHOD_AUTHENTICATOR_CONFIG_IS_IDENTITY_PRIVACY := 1

/**
 * @type {String}
 */
export global RAS_EAP_REGISTRY_LOCATION := "System\CurrentControlSet\Services\Rasman\PPP\EAP"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_PATH := "Path"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_CONFIGUI := "ConfigUIPath"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_INTERACTIVEUI := "InteractiveUIPath"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_IDENTITY := "IdentityPath"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_FRIENDLY_NAME := "FriendlyName"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_DEFAULT_DATA := "ConfigData"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_REQUIRE_CONFIGUI := "RequireConfigUI"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_ENCRYPTION := "MPPEEncryptionSupported"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_INVOKE_NAMEDLG := "InvokeUsernameDialog"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_INVOKE_PWDDLG := "InvokePasswordDialog"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_CONFIG_CLSID := "ConfigCLSID"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_STANDALONE_SUPPORTED := "StandaloneSupported"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_ROLES_SUPPORTED := "RolesSupported"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_PER_POLICY_CONFIG := "PerPolicyConfig"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_ISTUNNEL_METHOD := "IsTunnelMethod"

/**
 * @type {String}
 */
export global RAS_EAP_VALUENAME_FILTER_INNERMETHODS := "FilterInnerMethods"

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_ROLE_AUTHENTICATOR := 1

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_ROLE_AUTHENTICATEE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_ROLE_EXCLUDE_IN_EAP := 4

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_ROLE_EXCLUDE_IN_PEAP := 8

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_ROLE_EXCLUDE_IN_VPN := 16

/**
 * @type {Integer (UInt32)}
 */
export global raatARAPChallenge := 33

/**
 * @type {Integer (UInt32)}
 */
export global raatARAPOldPassword := 19

/**
 * @type {Integer (UInt32)}
 */
export global raatARAPNewPassword := 20

/**
 * @type {Integer (UInt32)}
 */
export global raatARAPPasswordChangeReason := 21

/**
 * @type {Integer (UInt32)}
 */
export global EAPCODE_Request := 1

/**
 * @type {Integer (UInt32)}
 */
export global EAPCODE_Response := 2

/**
 * @type {Integer (UInt32)}
 */
export global EAPCODE_Success := 3

/**
 * @type {Integer (UInt32)}
 */
export global EAPCODE_Failure := 4

/**
 * @type {Integer (UInt32)}
 */
export global MAXEAPCODE := 4

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_ROUTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_NON_INTERACTIVE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_LOGON := 4

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_PREVIEW := 8

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_FIRST_LINK := 16

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_MACHINE_AUTH := 32

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_GUEST_ACCESS := 64

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_8021X_AUTH := 128

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_HOSTED_IN_PEAP := 256

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_RESUME_FROM_HIBERNATE := 512

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_PEAP_UPFRONT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_ALTERNATIVE_USER_DB := 2048

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_PEAP_FORCE_FULL_AUTH := 4096

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_PRE_LOGON := 131072

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_CONFG_READONLY := 524288

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_RESERVED := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_SAVE_CREDMAN := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global RAS_EAP_FLAG_SERVER_VALIDATION_REQUIRED := 33554432

/**
 * @type {Guid}
 */
export global GUID_EapHost_Default := Guid("{00000000-0000-0000-0000-000000000000}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_MethodDLLNotFound := Guid("{9612fc67-6150-4209-a85e-a8d800000001}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactSysadmin := Guid("{9612fc67-6150-4209-a85e-a8d800000002}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_CertStoreInaccessible := Guid("{9612fc67-6150-4209-a85e-a8d800000004}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_Generic_AuthFailure := Guid("{9612fc67-6150-4209-a85e-a8d800000104}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_IdentityUnknown := Guid("{9612fc67-6150-4209-a85e-a8d800000204}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_SimNotValid := Guid("{9612fc67-6150-4209-a85e-a8d800000304}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_Server_CertExpired := Guid("{9612fc67-6150-4209-a85e-a8d800000005}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_Server_CertInvalid := Guid("{9612fc67-6150-4209-a85e-a8d800000006}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_Server_CertNotFound := Guid("{9612fc67-6150-4209-a85e-a8d800000007}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_Server_CertRevoked := Guid("{9612fc67-6150-4209-a85e-a8d800000008}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_Server_CertOtherError := Guid("{9612fc67-6150-4209-a85e-a8d800000108}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_CertExpired := Guid("{9612fc67-6150-4209-a85e-a8d800000009}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_CertInvalid := Guid("{9612fc67-6150-4209-a85e-a8d80000000a}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_CertNotFound := Guid("{9612fc67-6150-4209-a85e-a8d80000000b}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_CertOtherError := Guid("{9612fc67-6150-4209-a85e-a8d80000000c}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_CertRejected := Guid("{9612fc67-6150-4209-a85e-a8d80000000d}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_CertRevoked := Guid("{9612fc67-6150-4209-a85e-a8d80000000e}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_Account_OtherProblem := Guid("{9612fc67-6150-4209-a85e-a8d80000010e}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_CredsRejected := Guid("{9612fc67-6150-4209-a85e-a8d80000020e}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_Root_CertExpired := Guid("{9612fc67-6150-4209-a85e-a8d80000000f}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_Root_CertInvalid := Guid("{9612fc67-6150-4209-a85e-a8d800000010}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_User_Root_CertNotFound := Guid("{9612fc67-6150-4209-a85e-a8d800000011}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_Server_Root_CertNameRequired := Guid("{9612fc67-6150-4209-a85e-a8d800000012}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_Server_Root_CertNotFound := Guid("{9612fc67-6150-4209-a85e-a8d800000112}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_ThirdPartyMethod_Host_Reset := Guid("{9612fc67-6150-4209-a85e-a8d800000212}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_EapQecInaccessible := Guid("{9612fc67-6150-4209-a85e-a8d800000312}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_Server_ClientSelectServerCert := Guid("{9612fc67-6150-4209-a85e-a8d800000018}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_User_AuthFailure := Guid("{9612fc67-6150-4209-a85e-a8d800000019}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_User_GetNewCert := Guid("{9612fc67-6150-4209-a85e-a8d80000001a}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_User_SelectValidCert := Guid("{9612fc67-6150-4209-a85e-a8d80000001b}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_Retry_Authentication := Guid("{9612fc67-6150-4209-a85e-a8d80000011b}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_EapNegotiationFailed := Guid("{9612fc67-6150-4209-a85e-a8d80000001c}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_XmlMalformed := Guid("{9612fc67-6150-4209-a85e-a8d80000001d}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_MethodDoesNotSupportOperation := Guid("{9612fc67-6150-4209-a85e-a8d80000001e}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_AuthFailure := Guid("{9612fc67-6150-4209-a85e-a8d80000001f}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_IdentityUnknown := Guid("{9612fc67-6150-4209-a85e-a8d800000020}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_NegotiationFailed := Guid("{9612fc67-6150-4209-a85e-a8d800000021}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_MethodNotFound := Guid("{9612fc67-6150-4209-a85e-a8d800000022}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_RestartNap := Guid("{9612fc67-6150-4209-a85e-a8d800000023}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_CertStoreInaccessible := Guid("{9612fc67-6150-4209-a85e-a8d800000024}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_InvalidUserAccount := Guid("{9612fc67-6150-4209-a85e-a8d800000025}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_RootCertInvalid := Guid("{9612fc67-6150-4209-a85e-a8d800000026}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_RootCertNotFound := Guid("{9612fc67-6150-4209-a85e-a8d800000027}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_RootExpired := Guid("{9612fc67-6150-4209-a85e-a8d800000028}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_CertNameAbsent := Guid("{9612fc67-6150-4209-a85e-a8d800000029}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_NoSmartCardReader := Guid("{9612fc67-6150-4209-a85e-a8d80000002a}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_No_SmartCardReader_Found := Guid("{9612fc67-6150-4209-a85e-a8d80000002b}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_ContactAdmin_InvalidUserCert := Guid("{9612fc67-6150-4209-a85e-a8d80000002c}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_Method_Not_Support_Sso := Guid("{9612fc67-6150-4209-a85e-a8d80000002d}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Repair_No_ValidSim_Found := Guid("{9612fc67-6150-4209-a85e-a8d80000002e}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Help_ObtainingCerts := Guid("{f535eea3-1bdd-46ca-a2fc-a6655939b7e8}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Help_Troubleshooting := Guid("{33307acf-0698-41ba-b014-ea0a2eb8d0a8}")

/**
 * @type {Guid}
 */
export global GUID_EapHost_Cause_Method_Config_Does_Not_Support_Sso := Guid("{da18bd32-004f-41fa-ae08-0bc85e5845ac}")
;@endregion Constants
