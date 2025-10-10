#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.ExtensibleAuthenticationProtocol
 * @version v4.0.30319
 */
class ExtensibleAuthenticationProtocol {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_EAP_MESSAGE => 2114

    /**
     * @type {Integer (Int32)}
     */
    static EAP_GROUP_MASK => 65280

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_EAPHOST_FIRST => -2143158272

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_EAPHOST_LAST => -2143158017

    /**
     * @type {Integer (Int32)}
     */
    static EAP_I_EAPHOST_FIRST => -2143158272

    /**
     * @type {Integer (Int32)}
     */
    static EAP_I_EAPHOST_LAST => -2143158017

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_CERT_STORE_INACCESSIBLE => 2151809040

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_EAPHOST_METHOD_NOT_INSTALLED => 2151809041

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_EAPHOST_THIRDPARTY_METHOD_HOST_RESET => 2151809042

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_EAPHOST_EAPQEC_INACCESSIBLE => 2151809043

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_EAPHOST_IDENTITY_UNKNOWN => 2151809044

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_AUTHENTICATION_FAILED => 2151809045

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_I_EAPHOST_EAP_NEGOTIATION_FAILED => 1078067222

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_EAPHOST_METHOD_INVALID_PACKET => 2151809047

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_EAPHOST_REMOTE_INVALID_PACKET => 2151809048

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_EAPHOST_XML_MALFORMED => 2151809049

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_METHOD_CONFIG_DOES_NOT_SUPPORT_SSO => 2151809050

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_EAPHOST_METHOD_OPERATION_NOT_SUPPORTED => 2151809056

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_USER_FIRST => -2143158016

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_USER_LAST => -2143157761

    /**
     * @type {Integer (Int32)}
     */
    static EAP_I_USER_FIRST => 1078067456

    /**
     * @type {Integer (Int32)}
     */
    static EAP_I_USER_LAST => 1078067711

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_CERT_NOT_FOUND => 2151809280

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_CERT_INVALID => 2151809281

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_CERT_EXPIRED => 2151809282

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_CERT_REVOKED => 2151809283

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_CERT_OTHER_ERROR => 2151809284

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_CERT_REJECTED => 2151809285

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_I_USER_ACCOUNT_OTHER_ERROR => 1078067472

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_CREDENTIALS_REJECTED => 2151809297

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_NAME_PASSWORD_REJECTED => 2151809298

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_NO_SMART_CARD_READER => 2151809299

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_SERVER_FIRST => -2143157760

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_SERVER_LAST => -2143157505

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_SERVER_CERT_NOT_FOUND => 2151809536

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_SERVER_CERT_INVALID => 2151809537

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_SERVER_CERT_EXPIRED => 2151809538

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_SERVER_CERT_REVOKED => 2151809539

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_SERVER_CERT_OTHER_ERROR => 2151809540

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_USER_ROOT_CERT_FIRST => -2143157504

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_USER_ROOT_CERT_LAST => -2143157249

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_ROOT_CERT_NOT_FOUND => 2151809792

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_ROOT_CERT_INVALID => 2151809793

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_USER_ROOT_CERT_EXPIRED => 2151809794

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_SERVER_ROOT_CERT_FIRST => -2143157248

    /**
     * @type {Integer (Int32)}
     */
    static EAP_E_SERVER_ROOT_CERT_LAST => -2143156993

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_SERVER_ROOT_CERT_NOT_FOUND => 2151810048

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_SERVER_ROOT_CERT_INVALID => 2151810049

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_SERVER_ROOT_CERT_NAME_REQUIRED => 2151810054

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_E_SIM_NOT_VALID => 2151810304

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_METHOD_INVALID_PACKET => 2151809047

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_INVALID_PACKET => 2151809048

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_PEER_FLAG_GUEST_ACCESS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropCipherSuiteNegotiation => 1

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropMutualAuth => 2

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropIntegrity => 4

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropReplayProtection => 8

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropConfidentiality => 16

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropKeyDerivation => 32

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropKeyStrength64 => 64

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropKeyStrength128 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropKeyStrength256 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropKeyStrength512 => 512

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropKeyStrength1024 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropDictionaryAttackResistance => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropFastReconnect => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropCryptoBinding => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropSessionIndependence => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropFragmentation => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropChannelBinding => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropNap => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropStandalone => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropMppeEncryption => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropTunnelMethod => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropSupportsConfig => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropCertifiedMethod => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropHiddenMethod => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropMachineAuth => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropUserAuth => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropIdentityPrivacy => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropMethodChaining => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropSharedStateEquivalence => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static eapPropReserved => 2147483648

    /**
     * @type {String}
     */
    static EAP_VALUENAME_PROPERTIES => "Properties"

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_Reserved1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_NON_INTERACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_LOGON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_PREVIEW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_Reserved2 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_MACHINE_AUTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_GUEST_ACCESS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_Reserved3 => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_Reserved4 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_RESUME_FROM_HIBERNATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_Reserved5 => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_Reserved6 => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_FULL_AUTH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_PREFER_ALT_CREDENTIALS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_Reserved7 => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_PEER_FLAG_HEALTH_STATE_CHANGE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_SUPRESS_UI => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_PRE_LOGON => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_USER_AUTH => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_CONFG_READONLY => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_Reserved8 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_Reserved9 => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_VPN => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_ONLY_EAP_TLS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_FLAG_SERVER_VALIDATION_REQUIRED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_CONFIG_INPUT_FIELD_PROPS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_CONFIG_INPUT_FIELD_PROPS_NON_DISPLAYABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_CONFIG_INPUT_FIELD_PROPS_NON_PERSIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_UI_INPUT_FIELD_PROPS_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_UI_INPUT_FIELD_PROPS_NON_DISPLAYABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_UI_INPUT_FIELD_PROPS_NON_PERSIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_UI_INPUT_FIELD_PROPS_READ_ONLY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_CREDENTIAL_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_INTERACTIVE_UI_DATA_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EAPHOST_PEER_API_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EAPHOST_METHOD_API_VERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EAP_CONFIG_INPUT_FIELD_LENGTH => 256

    /**
     * @type {Integer (UInt32)}
     */
    static MAX_EAP_CONFIG_INPUT_FIELD_VALUE_LENGTH => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CERTIFICATE_HASH_LENGTH => 20

    /**
     * @type {Integer (UInt32)}
     */
    static NCRYPT_PIN_CACHE_PIN_BYTE_LENGTH => 90

    /**
     * @type {String}
     */
    static EAP_REGISTRY_LOCATION => "System\CurrentControlSet\Services\EapHost\Methods"

    /**
     * @type {String}
     */
    static EAP_PEER_VALUENAME_DLL_PATH => "PeerDllPath"

    /**
     * @type {String}
     */
    static EAP_PEER_VALUENAME_FRIENDLY_NAME => "PeerFriendlyName"

    /**
     * @type {String}
     */
    static EAP_PEER_VALUENAME_CONFIGUI => "PeerConfigUIPath"

    /**
     * @type {String}
     */
    static EAP_PEER_VALUENAME_REQUIRE_CONFIGUI => "PeerRequireConfigUI"

    /**
     * @type {String}
     */
    static EAP_PEER_VALUENAME_IDENTITY => "PeerIdentityPath"

    /**
     * @type {String}
     */
    static EAP_PEER_VALUENAME_INTERACTIVEUI => "PeerInteractiveUIPath"

    /**
     * @type {String}
     */
    static EAP_PEER_VALUENAME_INVOKE_NAMEDLG => "PeerInvokeUsernameDialog"

    /**
     * @type {String}
     */
    static EAP_PEER_VALUENAME_INVOKE_PWDDLG => "PeerInvokePasswordDialog"

    /**
     * @type {String}
     */
    static EAP_PEER_VALUENAME_PROPERTIES => "Properties"

    /**
     * @type {String}
     */
    static EAP_AUTHENTICATOR_VALUENAME_DLL_PATH => "AuthenticatorDllPath"

    /**
     * @type {String}
     */
    static EAP_AUTHENTICATOR_VALUENAME_FRIENDLY_NAME => "AuthenticatorFriendlyName"

    /**
     * @type {String}
     */
    static EAP_AUTHENTICATOR_VALUENAME_PROPERTIES => "Properties"

    /**
     * @type {String}
     */
    static EAP_AUTHENTICATOR_VALUENAME_CONFIGUI => "AuthenticatorConfigUIPath"

    /**
     * @type {Integer (UInt32)}
     */
    static EAP_METHOD_AUTHENTICATOR_CONFIG_IS_IDENTITY_PRIVACY => 1

    /**
     * @type {String}
     */
    static RAS_EAP_REGISTRY_LOCATION => "System\CurrentControlSet\Services\Rasman\PPP\EAP"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_PATH => "Path"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_CONFIGUI => "ConfigUIPath"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_INTERACTIVEUI => "InteractiveUIPath"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_IDENTITY => "IdentityPath"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_FRIENDLY_NAME => "FriendlyName"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_DEFAULT_DATA => "ConfigData"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_REQUIRE_CONFIGUI => "RequireConfigUI"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_ENCRYPTION => "MPPEEncryptionSupported"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_INVOKE_NAMEDLG => "InvokeUsernameDialog"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_INVOKE_PWDDLG => "InvokePasswordDialog"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_CONFIG_CLSID => "ConfigCLSID"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_STANDALONE_SUPPORTED => "StandaloneSupported"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_ROLES_SUPPORTED => "RolesSupported"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_PER_POLICY_CONFIG => "PerPolicyConfig"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_ISTUNNEL_METHOD => "IsTunnelMethod"

    /**
     * @type {String}
     */
    static RAS_EAP_VALUENAME_FILTER_INNERMETHODS => "FilterInnerMethods"

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_ROLE_AUTHENTICATOR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_ROLE_AUTHENTICATEE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_ROLE_EXCLUDE_IN_EAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_ROLE_EXCLUDE_IN_PEAP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_ROLE_EXCLUDE_IN_VPN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static raatARAPChallenge => 33

    /**
     * @type {Integer (UInt32)}
     */
    static raatARAPOldPassword => 19

    /**
     * @type {Integer (UInt32)}
     */
    static raatARAPNewPassword => 20

    /**
     * @type {Integer (UInt32)}
     */
    static raatARAPPasswordChangeReason => 21

    /**
     * @type {Integer (UInt32)}
     */
    static EAPCODE_Request => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EAPCODE_Response => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EAPCODE_Success => 3

    /**
     * @type {Integer (UInt32)}
     */
    static EAPCODE_Failure => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MAXEAPCODE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_ROUTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_NON_INTERACTIVE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_LOGON => 4

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_PREVIEW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_FIRST_LINK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_MACHINE_AUTH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_GUEST_ACCESS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_8021X_AUTH => 128

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_HOSTED_IN_PEAP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_RESUME_FROM_HIBERNATE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_PEAP_UPFRONT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_ALTERNATIVE_USER_DB => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_PEAP_FORCE_FULL_AUTH => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_PRE_LOGON => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_CONFG_READONLY => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_RESERVED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_SAVE_CREDMAN => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static RAS_EAP_FLAG_SERVER_VALIDATION_REQUIRED => 33554432

    /**
     * @type {String}
     */
    static GUID_EapHost_Default => "{00000000-0000-0000-0000-000000000000}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_MethodDLLNotFound => "{9612fc67-6150-4209-a85e-a8d800000001}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactSysadmin => "{9612fc67-6150-4209-a85e-a8d800000002}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_CertStoreInaccessible => "{9612fc67-6150-4209-a85e-a8d800000004}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_Generic_AuthFailure => "{9612fc67-6150-4209-a85e-a8d800000104}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_IdentityUnknown => "{9612fc67-6150-4209-a85e-a8d800000204}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_SimNotValid => "{9612fc67-6150-4209-a85e-a8d800000304}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_Server_CertExpired => "{9612fc67-6150-4209-a85e-a8d800000005}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_Server_CertInvalid => "{9612fc67-6150-4209-a85e-a8d800000006}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_Server_CertNotFound => "{9612fc67-6150-4209-a85e-a8d800000007}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_Server_CertRevoked => "{9612fc67-6150-4209-a85e-a8d800000008}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_Server_CertOtherError => "{9612fc67-6150-4209-a85e-a8d800000108}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_CertExpired => "{9612fc67-6150-4209-a85e-a8d800000009}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_CertInvalid => "{9612fc67-6150-4209-a85e-a8d80000000a}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_CertNotFound => "{9612fc67-6150-4209-a85e-a8d80000000b}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_CertOtherError => "{9612fc67-6150-4209-a85e-a8d80000000c}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_CertRejected => "{9612fc67-6150-4209-a85e-a8d80000000d}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_CertRevoked => "{9612fc67-6150-4209-a85e-a8d80000000e}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_Account_OtherProblem => "{9612fc67-6150-4209-a85e-a8d80000010e}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_CredsRejected => "{9612fc67-6150-4209-a85e-a8d80000020e}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_Root_CertExpired => "{9612fc67-6150-4209-a85e-a8d80000000f}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_Root_CertInvalid => "{9612fc67-6150-4209-a85e-a8d800000010}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_User_Root_CertNotFound => "{9612fc67-6150-4209-a85e-a8d800000011}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_Server_Root_CertNameRequired => "{9612fc67-6150-4209-a85e-a8d800000012}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_Server_Root_CertNotFound => "{9612fc67-6150-4209-a85e-a8d800000112}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_ThirdPartyMethod_Host_Reset => "{9612fc67-6150-4209-a85e-a8d800000212}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_EapQecInaccessible => "{9612fc67-6150-4209-a85e-a8d800000312}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_Server_ClientSelectServerCert => "{9612fc67-6150-4209-a85e-a8d800000018}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_User_AuthFailure => "{9612fc67-6150-4209-a85e-a8d800000019}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_User_GetNewCert => "{9612fc67-6150-4209-a85e-a8d80000001a}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_User_SelectValidCert => "{9612fc67-6150-4209-a85e-a8d80000001b}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_Retry_Authentication => "{9612fc67-6150-4209-a85e-a8d80000011b}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_EapNegotiationFailed => "{9612fc67-6150-4209-a85e-a8d80000001c}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_XmlMalformed => "{9612fc67-6150-4209-a85e-a8d80000001d}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_MethodDoesNotSupportOperation => "{9612fc67-6150-4209-a85e-a8d80000001e}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_AuthFailure => "{9612fc67-6150-4209-a85e-a8d80000001f}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_IdentityUnknown => "{9612fc67-6150-4209-a85e-a8d800000020}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_NegotiationFailed => "{9612fc67-6150-4209-a85e-a8d800000021}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_MethodNotFound => "{9612fc67-6150-4209-a85e-a8d800000022}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_RestartNap => "{9612fc67-6150-4209-a85e-a8d800000023}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_CertStoreInaccessible => "{9612fc67-6150-4209-a85e-a8d800000024}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_InvalidUserAccount => "{9612fc67-6150-4209-a85e-a8d800000025}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_RootCertInvalid => "{9612fc67-6150-4209-a85e-a8d800000026}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_RootCertNotFound => "{9612fc67-6150-4209-a85e-a8d800000027}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_RootExpired => "{9612fc67-6150-4209-a85e-a8d800000028}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_CertNameAbsent => "{9612fc67-6150-4209-a85e-a8d800000029}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_NoSmartCardReader => "{9612fc67-6150-4209-a85e-a8d80000002a}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_No_SmartCardReader_Found => "{9612fc67-6150-4209-a85e-a8d80000002b}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_ContactAdmin_InvalidUserCert => "{9612fc67-6150-4209-a85e-a8d80000002c}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_Method_Not_Support_Sso => "{9612fc67-6150-4209-a85e-a8d80000002d}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Repair_No_ValidSim_Found => "{9612fc67-6150-4209-a85e-a8d80000002e}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Help_ObtainingCerts => "{f535eea3-1bdd-46ca-a2fc-a6655939b7e8}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Help_Troubleshooting => "{33307acf-0698-41ba-b014-ea0a2eb8d0a8}"

    /**
     * @type {String}
     */
    static GUID_EapHost_Cause_Method_Config_Does_Not_Support_Sso => "{da18bd32-004f-41fa-ae08-0bc85e5845ac}"
;@endregion Constants

;@region Methods
    /**
     * Enumerates all EAP methods installed and available for use, including legacy EAP Methods.
     * @param {Pointer<EAP_METHOD_INFO_ARRAY>} pEapMethodInfoArray A pointer  to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info_array">EAP_METHOD_INFO_ARRAY</a> structure for installed EAP methods. The caller should free the inner pointers
     *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeErrorMemory</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeergetmethods
     * @since windows6.0.6000
     */
    static EapHostPeerGetMethods(pEapMethodInfoArray, ppEapError) {
        result := DllCall("eappcfg.dll\EapHostPeerGetMethods", "ptr", pEapMethodInfoArray, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Used to retrieve the properties of an EAP method given the connection and user data.
     * @remarks
     * 
     * <b>EapHostPeerGetMethodProperties</b> allows the user to retrieve the properties of an EAP method through the EAPHost supplicant interface. The properties returned by this API may be different from properties returned by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeergetmethods">EapHostPeerGetMethods</a> function. The <b>EapHostPeerGetMethodProperties</b> function returns the properties of an EAP method for a specific connection and user data.
     * 
     * 
     * @param {Integer} dwVersion The version number of the API. Set this parameter to zero.
     * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the EAP authentication session behavior.
     * @param {Pointer} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the EAP method the supplicant is to use.
     * @param {Pointer<Void>} hUserImpersonationToken A handle to the user impersonation token to use in this session.
     * @param {Integer} dwEapConnDataSize The size, in bytes, of the connection data buffer provided in <i>pbEapConnData</i>.
     * @param {Pointer<Byte>} pbEapConnData Connection data used for the EAP method. If set to <b>NULL</b>, the static property of the method, as configured in the registry, is returned.
     * @param {Integer} dwUserDataSize The size, in bytes, of the user data buffer provided in <i>pbUserData</i>.
     * @param {Pointer<Byte>} pbUserData A pointer to a byte buffer that contains the opaque user data  BLOB. This parameter can be <b>NULL</b>.
     * @param {Pointer<EAP_METHOD_PROPERTY_ARRAY>} pMethodPropertyArray A pointer to the method properties array <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_property_array">EAP_METHOD_PROPERTY_ARRAY</a>. Caller should free the inner pointers using   <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a> starting
     *                 at the innermost pointer. The caller should free an <b>empvString</b> value only when the type is <b>empvtString</b>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by passing a pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeErrorMemory</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeergetmethodproperties
     * @since windows6.1
     */
    static EapHostPeerGetMethodProperties(dwVersion, dwFlags, eapMethodType, hUserImpersonationToken, dwEapConnDataSize, pbEapConnData, dwUserDataSize, pbUserData, pMethodPropertyArray, ppEapError) {
        result := DllCall("eappcfg.dll\EapHostPeerGetMethodProperties", "uint", dwVersion, "uint", dwFlags, "ptr", eapMethodType, "ptr", hUserImpersonationToken, "uint", dwEapConnDataSize, "char*", pbEapConnData, "uint", dwUserDataSize, "char*", pbUserData, "ptr", pMethodPropertyArray, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Starts the configuration user interface of the specified EAP method.
     * @param {Pointer<Void>} hwndParent The handle of the parent window under which configuration dialog appears.
     * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
     * @param {Pointer} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the EAP method.
     * @param {Integer} dwSizeOfConfigIn The size of input configuration. May be set to 0 (zero).
     * @param {Pointer<Byte>} pConfigIn A pointer to a byte buffer that contains configuration elements. The buffer is of size <i>dwSizeOfConfigIn</i>. This parameter can be <b>NULL</b>, if <i>dwSizeOfConfigIn</i> is set to 0 (zero).
     * @param {Pointer<UInt32>} pdwSizeOfConfigOut A pointer to a DWORD that specifies the size of the buffer pointed to by <i>ppConfigOut</i>.
     * @param {Pointer<Byte>} ppConfigOut A pointer to a pointer to a byte buffer that contains updated configuration data from the user. After consuming the data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeconfigui
     * @since windows6.0.6000
     */
    static EapHostPeerInvokeConfigUI(hwndParent, dwFlags, eapMethodType, dwSizeOfConfigIn, pConfigIn, pdwSizeOfConfigOut, ppConfigOut, ppEapError) {
        result := DllCall("eappcfg.dll\EapHostPeerInvokeConfigUI", "ptr", hwndParent, "uint", dwFlags, "ptr", eapMethodType, "uint", dwSizeOfConfigIn, "char*", pConfigIn, "uint*", pdwSizeOfConfigOut, "ptr", ppConfigOut, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Allows the user to determine what kind of credentials are required by the methods to perform authentication in a Single-Sign-On (SSO) scenario.
     * @remarks
     * 
     * <b>EapHostPeerQueryCredentialInputFields</b> supports Single-Sign-On (SSO).  This supplicant function, like <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerqueryuserblobfromcredentialinputfields">EapHostPeerQueryUserBlobFromCredentialInputFields</a>, is used only in an SSO scenario.
     * 
     * <b>EapHostPeerQueryCredentialInputFields</b> obtains the fields to be displayed in the UI during the session. The input fields are obtained to display data entered by the user in the SSO UI. The <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_array">EAP_CONFIG_INPUT_FIELD_ARRAY</a> structure returned contains details on how to display the input fields.
     * 
     * After <b>EapHostPeerQueryCredentialInputFields</b>, EAPHost calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryuserblobfromcredentialinputfields">EapHostPeerQueryUserBlobFromCredentialInputFields</a>.
     * 
     * 
     * @param {Pointer<Void>} hUserImpersonationToken A handle to the user impersonation token to use in this session.
     * @param {Pointer} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that identifies the EAP method the supplicant is to use.
     * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
     * @param {Integer} dwEapConnDataSize The size, in bytes, of the connection data buffer provided in <i>pbEapConnData.</i>
     * @param {Pointer<Byte>} pbEapConnData Connection data used for the EAP method.
     * @param {Pointer<EAP_CONFIG_INPUT_FIELD_ARRAY>} pEapConfigInputFieldArray A pointer  to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_info_array">EAP_METHOD_INFO_ARRAY</a> structure for installed EAP methods. The caller should free the inner pointers
     *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by passing a pointer to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerquerycredentialinputfields
     * @since windows6.0.6000
     */
    static EapHostPeerQueryCredentialInputFields(hUserImpersonationToken, eapMethodType, dwFlags, dwEapConnDataSize, pbEapConnData, pEapConfigInputFieldArray, ppEapError) {
        result := DllCall("eappcfg.dll\EapHostPeerQueryCredentialInputFields", "ptr", hUserImpersonationToken, "ptr", eapMethodType, "uint", dwFlags, "uint", dwEapConnDataSize, "char*", pbEapConnData, "ptr", pEapConfigInputFieldArray, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Obtains a credential BLOB that can be used to start authentication from user input received from the Single-Sign-On (SSO) UI.
     * @remarks
     * 
     * <b>EapHostPeerQueryUserBlobFromCredentialInputFields</b> supports SSO. This supplicant function, like <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerquerycredentialinputfields">EapHostPeerQueryCredentialInputFields</a>, is used only in an SSO scenario.
     * 
     * After <b>EapHostPeerQueryUserBlobFromCredentialInputFields</b>, EAPHost calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>. The supplicant  uses the <b>EAP_FLAG_PRE_LOGON</b> flag in <b>EapHostPeerBeginSession</b> to indicate that EAPHost should provide SSO.
     * 
     * 
     * @param {Pointer<Void>} hUserImpersonationToken A handle to the user impersonation token to use in this session.
     * @param {Pointer} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the type of EAP authentication to use for this session.
     * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
     * @param {Integer} dwEapConnDataSize The size, in bytes, of the connection data buffer provided in <i>pConnectionData.</i>
     * @param {Pointer<Byte>} pbEapConnData Connection data used for the EAP method.
     * @param {Pointer<EAP_CONFIG_INPUT_FIELD_ARRAY>} pEapConfigInputFieldArray A pointer  to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_config_input_field_array">EAP_CONFIG_INPUT_FIELD_ARRAY</a> structure the contains the UI input field data. The caller should free the inner pointers
     *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer.
     * @param {Pointer<UInt32>} pdwUserBlobSize A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by <i>ppbUserBlob</i>. If this value is not set to zero, then a pointer to a buffer of the size specified in this parameter must be supplied to <i>ppbUserBlob</i>.
     * @param {Pointer<Byte>} ppbUserBlob A pointer to the credential BLOB that can be used in authentication.
     *                 Memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>. If a non-null value is supplied for this parameter (meaning that an existing data BLOB is passed to it), the supplied data BLOB will be updated and returned in this parameter.  If a non-NULL BLOB value is supplied, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> function should be used.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryuserblobfromcredentialinputfields
     * @since windows6.0.6000
     */
    static EapHostPeerQueryUserBlobFromCredentialInputFields(hUserImpersonationToken, eapMethodType, dwFlags, dwEapConnDataSize, pbEapConnData, pEapConfigInputFieldArray, pdwUserBlobSize, ppbUserBlob, ppEapError) {
        result := DllCall("eappcfg.dll\EapHostPeerQueryUserBlobFromCredentialInputFields", "ptr", hUserImpersonationToken, "ptr", eapMethodType, "uint", dwFlags, "uint", dwEapConnDataSize, "char*", pbEapConnData, "ptr", pEapConfigInputFieldArray, "uint*", pdwUserBlobSize, "ptr", ppbUserBlob, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * This function is called by tunnel methods to invoke the identity UI of the inner methods. This function returns the identity as well as credentials to use in order to start the authentication.
     * @param {Integer} dwVersion The version number of the API. Must be set to zero.
     * @param {Pointer} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the type of EAP authentication to use for this session.
     * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
     * @param {Pointer<Void>} hwndParent Handle of the parent window under which the configuration dialog will show up.
     * @param {Integer} dwSizeofConnectionData Size of the buffer indicated by the <i>pConnectionData</i> parameter, in bytes.
     * @param {Pointer<Byte>} pConnectionData Pointer to configuration data that is used for the EAP method.
     * @param {Integer} dwSizeofUserData Size of the buffer indicated by the <i>pUserData</i> parameter, in bytes.
     * @param {Pointer<Byte>} pUserData Pointer to user credential information that pertains to this authentication.
     * @param {Pointer<UInt32>} pdwSizeOfUserDataOut Size of the buffer set to receive the user data returned by the <i>ppUserDataOut</i> parameter, in bytes.
     * @param {Pointer<Byte>} ppUserDataOut A pointer to a pointer to a buffer that contains user data information returned by the method. After use, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
     * @param {Pointer<Char>} ppwszIdentity A pointer to a NULL-terminated user identity string. After use, this memory must be freed by calling  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised during the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @param {Pointer<Void>} ppvReserved Reserved for future use.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeidentityui
     * @since windows6.0.6000
     */
    static EapHostPeerInvokeIdentityUI(dwVersion, eapMethodType, dwFlags, hwndParent, dwSizeofConnectionData, pConnectionData, dwSizeofUserData, pUserData, pdwSizeOfUserDataOut, ppUserDataOut, ppwszIdentity, ppEapError, ppvReserved) {
        result := DllCall("eappcfg.dll\EapHostPeerInvokeIdentityUI", "uint", dwVersion, "ptr", eapMethodType, "uint", dwFlags, "ptr", hwndParent, "uint", dwSizeofConnectionData, "char*", pConnectionData, "uint", dwSizeofUserData, "char*", pUserData, "uint*", pdwSizeOfUserDataOut, "ptr", ppUserDataOut, "ptr", ppwszIdentity, "ptr", ppEapError, "ptr", ppvReserved, "uint")
        return result
    }

    /**
     * Raises an interactive user interface used to get credentials from the user.
     * @remarks
     * 
     * The supplicant should call [EAP_E_EAPHOST_METHOD_OPERATION_NOT_SUPPORTED](/windows/win32/eaphost/eap-related-error-and-information-constants) is returned, the supplicant should resort to the traditional model of invoking method interactive UI by calling <b>EapHostPeerInvokeInteractiveUI</b>. 
     * 
     * If called,<b>EapHostPeerInvokeInteractiveUI</b> raises the user interface for the EAP method after the supplicant calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeergetuicontext">EapHostPeerGetUIContext</a>. This occurs when a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerprocessreceivedpacket">EapHostPeerProcessReceivedPacket</a> 
     *    returns the <b>EapHostPeerResponseInvokeUi</b>action code. <b>EapHostPeerGetUIContext</b>returns UI context that 
     *    the supplicant then passes to <b>EapHostPeerInvokeInteractiveUI</b> to raise the UI.
     * 
     * 
     * @param {Pointer<Void>} hwndParent The handle of the parent window under which configuration dialog appears.
     * @param {Integer} dwSizeofUIContextData The size, in bytes, of the buffer pointed to by the <i>pUIContextData</i> parameter.
     * @param {Pointer<Byte>} pUIContextData A pointer to a buffer that contains the supplicant UI context data from EAPHost. The context data is returned by  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeergetuicontext">EapHostPeerGetUIContext</a>. The buffer  is of size <i>dwSizeOfUIContextData</i>.
     * @param {Pointer<UInt32>} pdwSizeOfDataFromInteractiveUI A pointer to a DWORD  that represents the size, in bytes, of the buffer pointed to by the <i>ppDataFromInteractiveUI</i> parameter.
     * @param {Pointer<Byte>} ppDataFromInteractiveUI A pointer to a pointer to a byte buffer that  contains data from the interactive UI necessary for authentication to continue. The parameter <i>ppDataFromInteractiveUI</i> should be passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeersetuicontext">EapHostPeerSetUIContext</a> as the IN parameter <i>pUIContextData</i>. After consuming the data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>. The buffer is of size <i>pdwSizeofDataFromInteractiveUI</i>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeinteractiveui
     * @since windows6.0.6000
     */
    static EapHostPeerInvokeInteractiveUI(hwndParent, dwSizeofUIContextData, pUIContextData, pdwSizeOfDataFromInteractiveUI, ppDataFromInteractiveUI, ppEapError) {
        result := DllCall("eappcfg.dll\EapHostPeerInvokeInteractiveUI", "ptr", hwndParent, "uint", dwSizeofUIContextData, "char*", pUIContextData, "uint*", pdwSizeOfDataFromInteractiveUI, "ptr", ppDataFromInteractiveUI, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Obtains the input fields for interactive UI components to be raised on the supplicant.
     * @remarks
     * 
     * <b>EapHostPeerQueryInteractiveUIInputFields</b> can be employed to support Single-Sign-On (SSO). The supplicant  uses the <b>EAP_FLAG_PRE_LOGON</b> flag in <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a> to indicate to EAPHost that SSO should be provided. If the <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerResponseInvokeUI</a> action code is received after calling <b>EapHostPeerBeginSession</b>, EAPHost then calls <b>EapHostPeerQueryInteractiveUIInputFields</b>, and later calls <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryuiblobfrominteractiveuiinputfields">EapHostPeerQueryUIBlobFromInteractiveUIInputFields</a>. 
     * 
     * The supplicant should call the [EAP_E_EAPHOST_METHOD_OPERATION_NOT_SUPPORTED](/windows/win32/eaphost/eap-related-error-and-information-constants) is returned, the supplicant should resort to the traditional model of invoking method interactive UI by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeinteractiveui">EapHostPeerInvokeInteractiveUI</a>. If there is an error, <b>EapHostPeerQueryInteractiveUIInputFields</b> will return a return code other than <b>NULL</b>.
     * 
     * 
     * @param {Integer} dwVersion The version number of the API. 
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAPHOST_PEER_API_VERSION"></a><a id="eaphost_peer_api_version"></a><dl>
     * <dt><b>EAPHOST_PEER_API_VERSION</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version of the EAPHost peer API.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
     * @param {Integer} dwSizeofUIContextData The size of the context data in <i>pUIContextData</i>, in bytes.
     * @param {Pointer<Byte>} pUIContextData Pointer to a BLOB that contains UI context data, represented as inner pointers to field data. These inner pointers must be freed by passing them to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting with the innermost pointer.
     * @param {Pointer<EAP_INTERACTIVE_UI_DATA>} pEapInteractiveUIData Pointer that receives an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_interactive_ui_data">EAP_INTERACTIVE_UI_DATA</a> structure that contains configuration information for interactive UI components raised on an EAP supplicant. The caller should free the inner pointers
     *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @param {Pointer<Void>} ppvReserved Reserved for future use. This parameter must be set to 0.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryinteractiveuiinputfields
     * @since windows6.0.6000
     */
    static EapHostPeerQueryInteractiveUIInputFields(dwVersion, dwFlags, dwSizeofUIContextData, pUIContextData, pEapInteractiveUIData, ppEapError, ppvReserved) {
        result := DllCall("eappcfg.dll\EapHostPeerQueryInteractiveUIInputFields", "uint", dwVersion, "uint", dwFlags, "uint", dwSizeofUIContextData, "char*", pUIContextData, "ptr", pEapInteractiveUIData, "ptr", ppEapError, "ptr", ppvReserved, "uint")
        return result
    }

    /**
     * Converts user information into a user BLOB that can be consumed by EAPHost run-time functions.
     * @remarks
     * 
     * [Supplicant API Call Sequence](/windows/win32/eaphost/supplicant-api-call-sequence).
     * 
     * 
     * @param {Integer} dwVersion The version number of the API.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EAPHOST_PEER_API_VERSION"></a><a id="eaphost_peer_api_version"></a><dl>
     * <dt><b>EAPHOST_PEER_API_VERSION</b></dt>
     * <dt>1</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The version of the EAPHost Peer APIs.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
     * @param {Integer} dwSizeofUIContextData The size of the context data in <i>pUIContextData</i>, in bytes.
     * @param {Pointer<Byte>} pUIContextData Pointer to a BLOB that contains UI context data, represented as inner pointers to field data. These inner pointers must be freed by passing them to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting with the innermost pointer.
     * @param {Pointer<EAP_INTERACTIVE_UI_DATA>} pEapInteractiveUIData Pointer that receives an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_interactive_ui_data">EAP_INTERACTIVE_UI_DATA</a> structure that contains configuration information for interactive UI components raised on an EAP supplicant.
     * @param {Pointer<UInt32>} pdwSizeOfDataFromInteractiveUI A pointer to a DWORD that specifies the size, in bytes, of the buffer pointed to by <i>ppDataFromInteractiveUI</i>. If this value is not set to zero, then a pointer to a buffer of the size specified in this parameter must be supplied to <i>ppDataFromInteractiveUI</i>.
     * @param {Pointer<Byte>} ppDataFromInteractiveUI Pointer that receives a credentials BLOB that can be used in authentication.
     *                 The caller should free the inner pointers
     *                 using the function <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>, starting at the innermost pointer. If a non-null value is supplied for this parameter (meaning that an existing data BLOB is passed to it), the supplied data BLOB will be updated and returned in this parameter. If a non-NULL BLOB value is supplied, the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localalloc">LocalAlloc</a> function should be used.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @param {Pointer<Void>} ppvReserved Reserved for future use. This parameter must be set to 0.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerqueryuiblobfrominteractiveuiinputfields
     * @since windows6.0.6000
     */
    static EapHostPeerQueryUIBlobFromInteractiveUIInputFields(dwVersion, dwFlags, dwSizeofUIContextData, pUIContextData, pEapInteractiveUIData, pdwSizeOfDataFromInteractiveUI, ppDataFromInteractiveUI, ppEapError, ppvReserved) {
        result := DllCall("eappcfg.dll\EapHostPeerQueryUIBlobFromInteractiveUIInputFields", "uint", dwVersion, "uint", dwFlags, "uint", dwSizeofUIContextData, "char*", pUIContextData, "ptr", pEapInteractiveUIData, "uint*", pdwSizeOfDataFromInteractiveUI, "ptr", ppDataFromInteractiveUI, "ptr", ppEapError, "ptr", ppvReserved, "uint")
        return result
    }

    /**
     * Converts XML into the configuration BLOB.
     * @param {Integer} dwFlags Not used. Set to 0.
     * @param {Pointer<IXMLDOMNode>} pConfigDoc Sends a pointer to the XML configuration to be converted.
     * @param {Pointer<UInt32>} pdwSizeOfConfigOut A pointer to the size, in bytes, of the configuration BLOB.
     * @param {Pointer<Byte>} ppConfigOut A pointer to a pointer to a byte buffer that contains the configuration data converted from XML. The configuration data is created inside [EapHostConfig Schema](/windows/win32/eaphost/eaphostconfigschema-schema) element. The buffer is of size <i>pdwSizeOfConfigOut</i>. After consuming the data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
     * @param {Pointer<EAP_METHOD_TYPE>} pEapMethodType A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure referred to in the XML document.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised  by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerconfigxml2blob
     * @since windows6.0.6000
     */
    static EapHostPeerConfigXml2Blob(dwFlags, pConfigDoc, pdwSizeOfConfigOut, ppConfigOut, pEapMethodType, ppEapError) {
        result := DllCall("eappcfg.dll\EapHostPeerConfigXml2Blob", "uint", dwFlags, "ptr", pConfigDoc, "uint*", pdwSizeOfConfigOut, "ptr", ppConfigOut, "ptr", pEapMethodType, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Generates the credentials BLOB.
     * @remarks
     * 
     * The configuration BLOB is originally returned by one of the following methods.
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerconfigxml2blob">EapHostPeerConfigXml2Blob</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeconfigui">EapHostPeerInvokeConfigUI</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeergetresult">EapHostPeerGetResult</a>
     * </li>
     * </ul>
     *  The XML based credentials can come from group policy or from a system administrator.
     * 
     * 
     * @param {Integer} dwFlags Not used. Set to 0.
     * @param {Pointer<IXMLDOMNode>} pCredentialsDoc A pointer to an XML node of a document that contains credentials which are either user or machine credentials depending on the configuration passed in. The XML document is created with the [EapHostUserCredentials Schema](/windows/win32/eaphost/eaphostusercredentialsschema-schema).
     * @param {Integer} dwSizeOfConfigIn The size, in bytes, of the buffer pointed to by the <i>pConfigIn</i> parameter.
     * @param {Pointer<Byte>} pConfigIn A pointer to a byte buffer that contains a configuration BLOB for which the credentials are configured. The  buffer is of size <i>dwSizeofConfigIn</i>.
     * @param {Pointer<UInt32>} pdwSizeOfCredentialsOut The size, in bytes, of the buffer pointed to by <i>ppCredentialsOut</i>.
     * @param {Pointer<Byte>} ppCredentialsOut A pointer to a pointer to a byte buffer that receives the credentials BLOB buffer generated by the input XML. The buffer can is of size <i>pdwSizeofCredentialsOut</i>. After consuming the data, this memory must be freed by calling  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory">EapHostPeerFreeMemory</a>.
     * @param {Pointer<EAP_METHOD_TYPE>} pEapMethodType A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure referred to in the XML document.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised  by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeErrorMemory</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeercredentialsxml2blob
     * @since windows6.0.6000
     */
    static EapHostPeerCredentialsXml2Blob(dwFlags, pCredentialsDoc, dwSizeOfConfigIn, pConfigIn, pdwSizeOfCredentialsOut, ppCredentialsOut, pEapMethodType, ppEapError) {
        result := DllCall("eappcfg.dll\EapHostPeerCredentialsXml2Blob", "uint", dwFlags, "ptr", pCredentialsDoc, "uint", dwSizeOfConfigIn, "char*", pConfigIn, "uint*", pdwSizeOfCredentialsOut, "ptr", ppCredentialsOut, "ptr", pEapMethodType, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Converts the configuration BLOB to XML.
     * @param {Integer} dwFlags Not used. Set to 0.
     * @param {Pointer} eapMethodType Refers to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that is referred to in the XML document.
     * @param {Integer} dwSizeOfConfigIn The size, in bytes, of the configuration BLOB.
     * @param {Pointer<Byte>} pConfigIn A pointer to a buffer that  contains the configuration BLOB to convert.  The buffer is of size <i>dwSizeOfConfigIn</i>.
     * @param {Pointer<IXMLDOMDocument2>} ppConfigDoc A pointer to a pointer to an XML document that  contains the converted configuration. If the EAP method does not support
     *                 the [EapHostConfig Schema](/windows/win32/eaphost/eaphostconfigschema-schema) element.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised by EAPHost during  the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerconfigblob2xml
     * @since windows6.0.6000
     */
    static EapHostPeerConfigBlob2Xml(dwFlags, eapMethodType, dwSizeOfConfigIn, pConfigIn, ppConfigDoc, ppEapError) {
        result := DllCall("eappcfg.dll\EapHostPeerConfigBlob2Xml", "uint", dwFlags, "ptr", eapMethodType, "uint", dwSizeOfConfigIn, "char*", pConfigIn, "ptr", ppConfigDoc, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Frees memory returned by the configuration APIs.
     * @param {Pointer<Byte>} pData A pointer to the memory to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreememory
     * @since windows6.0.6000
     */
    static EapHostPeerFreeMemory(pData) {
        DllCall("eappcfg.dll\EapHostPeerFreeMemory", "char*", pData)
    }

    /**
     * Frees memory allocated to an EAP_ERROR structure.
     * @param {Pointer<EAP_ERROR>} pEapError A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that  contains the error data to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory
     * @since windows6.0.6000
     */
    static EapHostPeerFreeErrorMemory(pEapError) {
        DllCall("eappcfg.dll\EapHostPeerFreeErrorMemory", "ptr", pEapError)
    }

    /**
     * Initializes an EAPHost authentication session.
     * @remarks
     * 
     * <b>EapHostPeerInitialize</b> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeeruninitialize">EapHostPeerUninitialize</a> are always thread
     * safe.
     * 
     * The following call occurs within the <b>EapHostPeerInitialize</b> function:
     * 
     * <c>CoInitializeEx(NULL, COINIT_MULTITHREADED);</c>
     * 
     * The client should not initialize a conflicting COM environment.
     * If different COM environment (such as a single-threaded apartment) is required, the client should call  <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-coinitializeex">CoInitializeEx</a> directly, and not call <b>EapHostPeerInitialize</b>. If <b>CoInitializeEx</b> is called directly, then the client must call <a href="https://docs.microsoft.com/windows/desktop/api/combaseapi/nf-combaseapi-couninitialize">CoUninitialize</a> to uninitialize the session. In addition, the client must use COM functions (and not EAPHost supplicant functions) to allocate and free memory.
     * 
     * 
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeerinitialize
     * @since windows6.0.6000
     */
    static EapHostPeerInitialize() {
        result := DllCall("eappprxy.dll\EapHostPeerInitialize", "uint")
        return result
    }

    /**
     * Uninitializes all EAPHost authentication sessions.
     * @remarks
     * 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerinitialize">EapHostPeerInitialize</a> and <b>EapHostPeerUninitialize</b> are always thread
     * safe.
     * 
     * <b>EapHostPeerUninitialize</b> calls <b>CoUninitialize</b>.
     * 
     * 
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeeruninitialize
     * @since windows6.0.6000
     */
    static EapHostPeerUninitialize() {
        DllCall("eappprxy.dll\EapHostPeerUninitialize")
    }

    /**
     * Starts an EAP authentication session.
     * @remarks
     * 
     * If an EAPHost supplicant is participating in NAP, the supplicant will respond to changes in the state of its network health. If that state changes, the supplicant must then initiate a re-authentication session as follows. 
     * 
     * <ul>
     * <li>If there is a current session when re-authentication occurs, the supplicant should tear down the current session by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerendsession">EapHostPeerEndSession</a>, and then start a new session by calling <b>EapHostPeerBeginSession</b>.</li>
     * <li>If there is no current session with re-authentication occurs, or the previous session was already ended by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerendsession">EapHostPeerEndSession</a>, the supplicant only needs to start a new session by calling <b>EapHostPeerBeginSession</b>.</li>
     * </ul>
     * The call to <b>EapHostPeerBeginSession</b> to establish the re-authentication session can be made from the callback specified in the <i>func</i> parameter  and called when the health state changes. This callback function indicates to the supplicant to tear down the network authentication associated with the GUID and re-authenticate.   
     * 
     * A  connection can be kept across multiple sessions because <b>EapHostPeerBeginSession</b> can provide a valid GUID to register the connection. When <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerendsession">EapHostPeerEndSession</a> is called, only the current session is terminated. Because the registration with the GUID isn't terminated, the original registration by <b>EapHostPeerBeginSession</b> remains intact. Therefore, the registration is effective across multiple sessions. 
     * 
     * <div class="alert"><b>Note</b>  Registering the connection refers to providing a valid GUID and valid callback function pointer.</div>
     * <div> </div>
     * 
     * 
     * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  new EAP authentication session behavior.
     * @param {Pointer} eapType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the type of EAP authentication to use for this session.
     * @param {Pointer<EAP_ATTRIBUTES>} pAttributeArray Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EapAttributes</a> structure that specifies the EAP attributes of the entity to authenticate.
     * @param {Pointer<Void>} hTokenImpersonateUser Handle to the user impersonation token to use in this session.
     * @param {Integer} dwSizeofConnectionData The size, in bytes, of the connection data buffer provided in <i>pConnectionData</i>.
     * @param {Pointer<Byte>} pConnectionData Describes the configuration used for authentication. <b>NULL</b> connection data is considered valid. The method should work with the default configuration.
     * @param {Integer} dwSizeofUserData The size, in bytes, of the user data buffer provided in <i>pUserData</i>.
     * @param {Pointer<Byte>} pUserData A pointer to a byte buffer that contains the opaque user data BLOB containing user data returned from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeergetidentity">EapPeerGetIdentity</a> function.  User data may include credentials or certificates used for authentication. <i>pUserData</i> can be <b>NULL</b>. The interpretation of a <b>NULL</b> pointer depends on the implementation of a method. The user data consists of user or machine credentials used for authentication. Typically the user data depends on the configuration data.
     * 
     * If <b>EAP_FLAG_PREFER_ALT_CREDENTIALS</b> is indicated in <i>dwflags</i>, then credentials passed into <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eapmethodpeerapis/nf-eapmethodpeerapis-eappeerbeginsession">EapPeerBeginSession</a> are preferred to all other forms of credential retrieval, even if configuration  data passed into <i>pConnectionData</i> requests a different mode of credential retrieval. If passing credentials into <b>EapPeerBeginSession</b> fails, then EAPHost resorts to method specific credential retrieval, in which case credentials could be obtained from a file, Windows login, or a certificate store, for example.
     * 
     * The EAP method author defines both the default credentials and alternate credentials. For example, in the case of EAP-MSCHAPv2 the default credentials are Windows credentials obtained from winlogon, and  alternate credentials are the credentials (user name, password, domain) passed into  <i>pUserData</i>.
     * @param {Integer} dwMaxSendPacketSize The maximum size, in bytes, of an EAP packet that can be sent during the session.
     * @param {Pointer<Guid>} pConnectionId A pointer to a GUID value that uniquely identifies the logical network interface over which the authentication of the supplicant will take place. If the supplicant seeks re-authentication after a NAP health change, it should provide a unique GUID.
     *    The parameter should be <b>NULL</b> when this function is called by a tunneling method to start its inner method.   When the <i>pConnectionId</i> parameter is <b>NULL</b>, the <i>func</i> and <i>pContextData</i> parameters are ignored.
     * @param {Pointer<NotificationHandler>} func A <a href="https://docs.microsoft.com/windows/desktop/api/eappapis/nc-eappapis-notificationhandler">NotificationHandler</a> function pointer that provides the callback used by EAPHost to notify the supplicant when re-authentication is needed. 
     * 
     * If the function handler is <b>NULL</b>, the <i>pContextData</i> parameter is ignored. If the function handler is <b>NULL</b>, it also means that the caller is not interested in SoH change notification
     *    from the EAP quarantine enforcement client (QEC).
     * 
     * The following code shows a <a href="https://docs.microsoft.com/windows/desktop/api/eappapis/nc-eappapis-notificationhandler">NotificationHandler</a> callback call.
     * 
     * <pre class="syntax" xml:space="preserve"><c>func(*pConnectionId, pContextData);</c></pre>
     * @param {Pointer<Void>} pContextData A pointer to re-authentication context data that the supplicant will associate with the connection when <i>func</i> is called. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} pSessionId A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeerbeginsession
     * @since windows6.0.6000
     */
    static EapHostPeerBeginSession(dwFlags, eapType, pAttributeArray, hTokenImpersonateUser, dwSizeofConnectionData, pConnectionData, dwSizeofUserData, pUserData, dwMaxSendPacketSize, pConnectionId, func, pContextData, pSessionId, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerBeginSession", "uint", dwFlags, "ptr", eapType, "ptr", pAttributeArray, "ptr", hTokenImpersonateUser, "uint", dwSizeofConnectionData, "char*", pConnectionData, "uint", dwSizeofUserData, "char*", pUserData, "uint", dwMaxSendPacketSize, "ptr", pConnectionId, "ptr", func, "ptr", pContextData, "uint*", pSessionId, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Is called by the supplicant every time the supplicant receives a packet that EAPHost needs to process.
     * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>. <i>sessionHandle</i> can be zero if the supplicant receives a new identity request not associated with any session.
     * @param {Integer} cbReceivePacket The size, in bytes, of the received packet buffer pointed to by the <i>cbReceivePacket</i> parameter.
     * @param {Pointer<Byte>} pReceivePacket A pointer to a buffer that contains the incoming EAP data received by 
     *       the supplicant.
     * @param {Pointer<Int32>} pEapOutput A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerResponseAction</a> value that indicates the supplicant should take appropriate action. Typically the supplicant either calls 
     *       another method on EAPHost or acts  on its own.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeerprocessreceivedpacket
     * @since windows6.0.6000
     */
    static EapHostPeerProcessReceivedPacket(sessionHandle, cbReceivePacket, pReceivePacket, pEapOutput, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerProcessReceivedPacket", "uint", sessionHandle, "uint", cbReceivePacket, "char*", pReceivePacket, "int*", pEapOutput, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Is called by the supplicant when the supplicant needs to obtains a packet from EAPHost to send to the authenticator.
     * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Pointer<UInt32>} pcbSendPacket A pointer to a DWORD that specifies the maximum size, in bytes,  of the buffer pointed to by   <i>ppSendPacket</i>. <b>EapHostPeerGetSendPacket</b> on return is the size of the actual data pointed to by <i>ppSendPacket</i>.
     * @param {Pointer<Byte>} ppSendPacket A pointer to a pointer to a  buffer that contains the packet data returned by the EAP module. The buffer is allocated by EAPHost.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeergetsendpacket
     * @since windows6.0.6000
     */
    static EapHostPeerGetSendPacket(sessionHandle, pcbSendPacket, ppSendPacket, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerGetSendPacket", "uint", sessionHandle, "uint*", pcbSendPacket, "ptr", ppSendPacket, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Obtains the authentication result for the specified EAP authentication session.
     * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Integer} reason An <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeermethodresultreason">EapHostPeerMethodResultReason</a> enumeration value that specifies the reason code for the authentication result returned in <i>ppResult</i>.
     * @param {Pointer<EapHostPeerMethodResult>} ppResult A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeermethodresultreason">EapHostPeerMethodResultReason</a> structure that contains the authentication results. EAPHost fills this structure with authentication related information defined in <a href="https://docs.microsoft.com/windows/desktop/api/eaphostpeertypes/ns-eaphostpeertypes-eaphostpeermethodresult">EapHostPeerMethodResult</a>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. Supplicants must refer to this parameter to determine if the authentication was successful. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} If the function succeeds, the return value is <b>NO_ERROR</b>. The return value does not indicate if the authentication was successful. Supplicants must refer to the <i>ppEapError</i> parameter to determine the authentication result.
     * 
     * If the function fails, the return value should be an appropriate error code from Winerror.h, Raserror.h, or Mprerror.h.
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeergetresult
     * @since windows6.0.6000
     */
    static EapHostPeerGetResult(sessionHandle, reason, ppResult, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerGetResult", "uint", sessionHandle, "int", reason, "ptr", ppResult, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Obtains the user interface context for the supplicant from EAPHost if the UI is to be raised.
     * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Pointer<UInt32>} pdwSizeOfUIContextData A pointer to a value that specifies the size, in bytes, of the UI context data  buffer returned in <i>ppUIContextData</i>.
     * @param {Pointer<Byte>} ppUIContextData A pointer to a pointer to a  buffer that contains the supplicant UI context data from EAPHost. The address pointed to by this parameter is passed to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeinteractiveui">EapHostPeerInvokeInteractiveUI</a> as IN parameter <i>pUIContextData</i>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeergetuicontext
     * @since windows6.0.6000
     */
    static EapHostPeerGetUIContext(sessionHandle, pdwSizeOfUIContextData, ppUIContextData, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerGetUIContext", "uint", sessionHandle, "uint*", pdwSizeOfUIContextData, "ptr", ppUIContextData, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Provides a new or updated user interface context to the EAP peer method loaded on EAPHost after the UI has been raised.
     * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Integer} dwSizeOfUIContextData The size, in bytes, of the user interface context data buffer provided in <i>pUIContextData</i>.
     * @param {Pointer<Byte>} pUIContextData A pointer to a byte buffer that contains the new supplicant UI context data to be set on EAPHost. The data is returned from the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerinvokeinteractiveui">EapHostPeerInvokeInteractiveUI</a> OUT parameter.
     * @param {Pointer<Int32>} pEapOutput A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerResponseAction</a> enumeration value that specifies the action code for the next step the supplicant must take as a response.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeersetuicontext
     * @since windows6.0.6000
     */
    static EapHostPeerSetUIContext(sessionHandle, dwSizeOfUIContextData, pUIContextData, pEapOutput, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerSetUIContext", "uint", sessionHandle, "uint", dwSizeOfUIContextData, "char*", pUIContextData, "int*", pEapOutput, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Obtains an array of EAP authentication attributes from EAPHost.
     * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Pointer<EAP_ATTRIBUTES>} pAttribs A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EAP_ATTRIBUTES</a> structure that contains an array of EAP authentication response attributes for the supplicant.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeergetresponseattributes
     * @since windows6.0.6000
     */
    static EapHostPeerGetResponseAttributes(sessionHandle, pAttribs, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerGetResponseAttributes", "uint", sessionHandle, "ptr", pAttribs, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Provides updated EAP authentication attributes to EAPHost.
     * @remarks
     * 
     * To progress to the next step in the state machine after a call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeergetresponseattributes">EapHostPeerGetResponseAttributes</a>, the supplicant must call <b>EapHostPeerSetResponseAttributes</b>. The supplicant must do so to pass a valid <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EapAttributes</a>  structure, even if the supplicant cannot use the attributes
     * returned from <b>EapHostPeerGetResponseAttributes</b>.   
     * 
     * The following example shows a  <b>EapHostPeerSetResponseAttributes</b> call that is made solely to progress to the next state in the state machine. 
     * 
     * <pre class="syntax" xml:space="preserve"><code>EapHostPeerGetResponseAttributes(session_id, &amp;eapAttributes, ppEapError);
     * 
     * // overwrite attributes returned by EapHostPeerGetResponseAttributes
     * EapAttributes eapAttributes={0,NULL};
     * 
     * // progress to the next state in the state machine
     * EapHostPeerSetResponseAttributes(session_id, &amp;eapAttributes, pEapOutput, ppEapError);</code></pre>
     * 
     * 
     * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Pointer<EAP_ATTRIBUTES>} pAttribs A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_attributes">EapAttributes</a> structure that contains an array of new EAP authentication response attributes to set for the supplicant on EAPHost.
     * @param {Pointer<Int32>} pEapOutput A pointer to an <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerresponseaction">EapHostPeerResponseAction</a> enumeration value that specifies the action code for the next step the supplicant must take as a response.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeersetresponseattributes
     * @since windows6.0.6000
     */
    static EapHostPeerSetResponseAttributes(sessionHandle, pAttribs, pEapOutput, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerSetResponseAttributes", "uint", sessionHandle, "ptr", pAttribs, "int*", pEapOutput, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Obtains the supplicant's current EAP authentication status from EAPHost.
     * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Integer} authParam An <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ne-eaphostpeertypes-eaphostpeerauthparams">EapHostPeerAuthParams</a> enumeration value that specifies the type of EAP authentication data to obtain from EAPHost.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EapHostPeerAuthStatus"></a><a id="eaphostpeerauthstatus"></a><a id="EAPHOSTPEERAUTHSTATUS"></a><dl>
     * <dt><b>EapHostPeerAuthStatus</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ppAuthData</i> contains a <a href="https://docs.microsoft.com/windows/win32/api/eaphostpeertypes/ns-eaphostpeertypes-eaphost_auth_info">EAPHOST_AUTH_INFO</a> structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EapHostPeerIdentity"></a><a id="eaphostpeeridentity"></a><a id="EAPHOSTPEERIDENTITY"></a><dl>
     * <dt><b>EapHostPeerIdentity</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ppAuthData</i> contains a <b>WCHAR</b> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EapHostPeerIdentityExtendedInfo"></a><a id="eaphostpeeridentityextendedinfo"></a><a id="EAPHOSTPEERIDENTITYEXTENDEDINFO"></a><dl>
     * <dt><b>EapHostPeerIdentityExtendedInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * <i>ppAuthData</i> contains a <b>CHAR</b> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="EapHostNapInfo"></a><a id="eaphostnapinfo"></a><a id="EAPHOSTNAPINFO"></a><dl>
     * <dt><b>EapHostNapInfo</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Windows 7 or later: [EapHostPeerNapInfo](/windows/win32/eaphost/eaphostpeernapinfo) structure.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<UInt32>} pcbAuthData The size, in bytes, of the EAP authentication data buffer pointed to by the <i>ppAuthData</i> parameter.
     * @param {Pointer<Byte>} ppAuthData A pointer to a pointer to a byte buffer that contains the authentication data from EAPHost. The format of this data depends on the value supplied in <i>authParam</i>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeergetauthstatus
     * @since windows6.0.6000
     */
    static EapHostPeerGetAuthStatus(sessionHandle, authParam, pcbAuthData, ppAuthData, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerGetAuthStatus", "uint", sessionHandle, "int", authParam, "uint*", pcbAuthData, "ptr", ppAuthData, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Terminates the current EAP authentication session between EAPHost and the calling supplicant, and clears data stored for the session.
     * @param {Integer} sessionHandle A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeerendsession
     * @since windows6.0.6000
     */
    static EapHostPeerEndSession(sessionHandle, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerEndSession", "uint", sessionHandle, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Returns the Connection Id,User Impersonation Token and Eaphost Process Id used by EAPHost to save the credentials for SSO. This data is needed to unplumb previously plumbed credentials.
     * @param {Pointer<Guid>} pConnectionIdThatLastSavedCreds The  GUID of the EAP peer session that last plumbed credentials.
     * @param {Pointer<IntPtr>} phCredentialImpersonationToken Handle to impersonate the user at the time of plumbing credentials. The user can be impersonated by a call to <b>ImpersonateLoggedOnUser</b>.
     * @param {Integer} sessionHandle A pseudo handle to the EAPHost process. This is the  __int3264 value returned to EAPHost when it called <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-getcurrentprocess">GetCurrentProcess</a>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to an <b>EAP_SESSIONID</b> structure that contains the unique handle for this EAP authentication session on the EAPHost server. This handle is returned in the <i>pSessionId</i> parameter in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Pointer<Int32>} fSaveToCredMan A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeergetdatatounplumbcredentials
     * @since windows10.0.10240
     */
    static EapHostPeerGetDataToUnplumbCredentials(pConnectionIdThatLastSavedCreds, phCredentialImpersonationToken, sessionHandle, ppEapError, fSaveToCredMan) {
        result := DllCall("eappprxy.dll\EapHostPeerGetDataToUnplumbCredentials", "ptr", pConnectionIdThatLastSavedCreds, "ptr*", phCredentialImpersonationToken, "uint", sessionHandle, "ptr", ppEapError, "int*", fSaveToCredMan, "uint")
        return result
    }

    /**
     * Clears the authentication session connection.
     * @param {Pointer<Guid>} pConnectionId A pointer to a GUID value that uniquely identifies a logical network interface for a connection to terminate between the supplicant and the EAPHost. This connection ID must have been provided in a previous call to <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerbeginsession">EapHostPeerBeginSession</a>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to the address of an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure. The address should be set to <b>NULL</b> before calling this function. If error data is available, a pointer to the address of an <b>EAP_ERROR</b> structure that contains any errors raised during the execution of this function call is received. After using the error data, free this memory by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeeaperror">EapHostPeerFreeEapError</a>.
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeerclearconnection
     * @since windows6.0.6000
     */
    static EapHostPeerClearConnection(pConnectionId, ppEapError) {
        result := DllCall("eappprxy.dll\EapHostPeerClearConnection", "ptr", pConnectionId, "ptr", ppEapError, "uint")
        return result
    }

    /**
     * Frees EAP_ERROR structures returned by EAPHost run-time APIs.
     * @remarks
     * 
     * To release all memory allocated by EAPHost for a authentication session, the caller must call <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerendsession">EapHostPeerEndSession</a>. To release all memory allocated by EAPHost for a connection, the caller must call the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerclearconnection">EapHostPeerClearConnection</a> function.
     * 
     * <b>EapHostPeerFreeEapError</b> is not thread safe. Any given <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> must be freed on one thread only. Do not call  <b>EapHostPeerFreeEapError</b> twice on the same <b>EAP_ERROR</b> structure.
     * 
     * 
     * @param {Pointer<EAP_ERROR>} pEapError A pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that  contains the error data to free.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeerfreeeaperror
     * @since windows6.0.6000
     */
    static EapHostPeerFreeEapError(pEapError) {
        DllCall("eappprxy.dll\EapHostPeerFreeEapError", "ptr", pEapError)
    }

    /**
     * This function is called by tunnel methods to request identity information from the inner methods. This function returns the identity and user credential information.
     * @param {Integer} dwVersion The version number of the API. Must be set to zero.
     * @param {Integer} dwFlags A combination of [EAP flags](/windows/win32/eaphost/eap-method-flags) that describe the  EAP authentication session behavior.
     * @param {Pointer} eapMethodType An <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_method_type">EAP_METHOD_TYPE</a> structure that specifies the type of EAP authentication to use for this session.
     * @param {Integer} dwSizeofConnectionData Size of the buffer indicated by the <i>pConnectionData</i> parameter, in bytes.
     * @param {Pointer<Byte>} pConnectionData Pointer to configuration data that is used for the EAP method.
     * @param {Integer} dwSizeofUserData Size of the buffer indicated by the <i>pUserData</i> parameter, in bytes.
     * @param {Pointer<Byte>} pUserData Pointer to user credential information that pertains to this authentication session.
     * @param {Pointer<Void>} hTokenImpersonateUser Impersonation token for a logged-on user to collect user-related information.
     * @param {Pointer<Int32>} pfInvokeUI Returns <b>TRUE</b> if the user identity and user data blob aren't returned successfully, and the method seeks to collect the information from the user through the user interface dialog.
     * @param {Pointer<UInt32>} pdwSizeOfUserDataOut Size of the buffer indicated by the <i>ppUserDataOut</i> parameter, in bytes.
     * @param {Pointer<Byte>} ppUserDataOut User data information returned by the method. After use, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeruntimememory">EapHostPeerFreeRuntimeMemory</a>.
     * @param {Pointer<Char>} ppwszIdentity A pointer to a NULL-terminated user identity string. After use, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eappapis/nf-eappapis-eaphostpeerfreeruntimememory">EapHostPeerFreeRuntimeMemory</a>.
     * @param {Pointer<EAP_ERROR>} ppEapError A pointer to a pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/eaptypes/ns-eaptypes-eap_error">EAP_ERROR</a> structure that contains any errors raised during the execution of this function call. After consuming the error data, this memory must be freed by calling <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/eaphostpeerconfigapis/nf-eaphostpeerconfigapis-eaphostpeerfreeerrormemory">EapHostPeerFreeErrorMemory</a>.
     * @param {Pointer<Byte>} ppvReserved Reserved for future use
     * @returns {Integer} 
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeergetidentity
     * @since windows6.0.6000
     */
    static EapHostPeerGetIdentity(dwVersion, dwFlags, eapMethodType, dwSizeofConnectionData, pConnectionData, dwSizeofUserData, pUserData, hTokenImpersonateUser, pfInvokeUI, pdwSizeOfUserDataOut, ppUserDataOut, ppwszIdentity, ppEapError, ppvReserved) {
        result := DllCall("eappprxy.dll\EapHostPeerGetIdentity", "uint", dwVersion, "uint", dwFlags, "ptr", eapMethodType, "uint", dwSizeofConnectionData, "char*", pConnectionData, "uint", dwSizeofUserData, "char*", pUserData, "ptr", hTokenImpersonateUser, "int*", pfInvokeUI, "uint*", pdwSizeOfUserDataOut, "ptr", ppUserDataOut, "ptr", ppwszIdentity, "ptr", ppEapError, "ptr", ppvReserved, "uint")
        return result
    }

    /**
     * 
     * @param {Integer} dwSizeofPassword 
     * @param {Pointer} szPassword 
     * @param {Pointer<Char>} ppszEncPassword 
     * @returns {Integer} 
     */
    static EapHostPeerGetEncryptedPassword(dwSizeofPassword, szPassword, ppszEncPassword) {
        result := DllCall("eappprxy.dll\EapHostPeerGetEncryptedPassword", "uint", dwSizeofPassword, "ptr", szPassword, "ptr", ppszEncPassword, "uint")
        return result
    }

    /**
     * Releases the memory space used during run-time.
     * @remarks
     * 
     * This method is called to release a specified memory buffer returned by any  EAPHost peer run-time APIs.
     * 
     * This call is performed by a peer-based EAPHost using a function pointer to this API. This API must be implemented on the EAP method loaded by EAPHost, and must strictly conform to the syntax and parameter types specified in the documentation.
     * 
     * 
     * @param {Pointer<Byte>} pData A pointer to a buffer returned by any EapHost peer run-time API.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//eappapis/nf-eappapis-eaphostpeerfreeruntimememory
     * @since windows6.0.6000
     */
    static EapHostPeerFreeRuntimeMemory(pData) {
        DllCall("eappprxy.dll\EapHostPeerFreeRuntimeMemory", "char*", pData)
    }

;@endregion Methods
}
