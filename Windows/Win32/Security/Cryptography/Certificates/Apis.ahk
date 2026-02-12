#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Handle.ahk
#Include ..\..\..\System\WinRT\Apis.ahk
#Include ..\..\..\System\WinRT\HSTRING.ahk

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class Certificates {

;@region Constants

    /**
     * @type {HSTRING}
     */
    static wszREGKEYNOSYSTEMCERTSVCPATH => "CurrentControlSet\Services\CertSvc"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYCERTSVCPATH => "SYSTEM\CurrentControlSet\Services\CertSvc"

    /**
     * @type {Integer (UInt32)}
     */
    static CA_DISP_INCOMPLETE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CA_DISP_ERROR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CA_DISP_REVOKED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CA_DISP_VALID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CA_DISP_INVALID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CA_DISP_UNDER_SUBMISSION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KRA_DISP_EXPIRED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static KRA_DISP_NOTFOUND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KRA_DISP_REVOKED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KRA_DISP_VALID => 3

    /**
     * @type {Integer (UInt32)}
     */
    static KRA_DISP_INVALID => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KRA_DISP_UNTRUSTED => 5

    /**
     * @type {Integer (UInt32)}
     */
    static KRA_DISP_NOTLOADED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CA_ACCESS_MASKROLES => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CA_CRL_BASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CA_CRL_DELTA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CA_CRL_REPUBLISH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ICF_ALLOWFOREIGN => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static ICF_EXISTINGROW => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static IKF_OVERWRITE => 65536

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_CACERTIFICATE => "CACertificate"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_HASHALGORITHMID => "HashAlgorithmId"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_SIGNINGFLAGS => "SigningFlags"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_REMINDERDURATION => "ReminderDuration"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_SIGNINGCERTIFICATE => "SigningCertificate"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_CSPNAME => "CSPName"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_KEYSPEC => "KeySpec"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_ERRORCODE => "ErrorCode"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_PROVIDERCLSID => "ProviderCLSID"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_PROVIDERPROPERTIES => "Provider"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_LOCALREVOCATIONINFORMATION => "LocalRevocationInformation"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_SIGNINGCERTIFICATETEMPLATE => "SigningCertificateTemplate"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCAPROP_CACONFIG => "CAConfig"

    /**
     * @type {HSTRING}
     */
    static wszOCSPPROP_LOGLEVEL => "LogLevel"

    /**
     * @type {HSTRING}
     */
    static wszOCSPPROP_DEBUG => "Debug"

    /**
     * @type {HSTRING}
     */
    static wszOCSPPROP_AUDITFILTER => "AuditFilter"

    /**
     * @type {HSTRING}
     */
    static wszOCSPPROP_ARRAYCONTROLLER => "ArrayController"

    /**
     * @type {HSTRING}
     */
    static wszOCSPPROP_ARRAYMEMBERS => "ArrayMembers"

    /**
     * @type {HSTRING}
     */
    static wszOCSPPROP_ENROLLPOLLINTERVAL => "EnrollPollInterval"

    /**
     * @type {HSTRING}
     */
    static wszOCSPISAPIPROP_VIRTUALROOTNAME => "VirtualRootName"

    /**
     * @type {HSTRING}
     */
    static wszOCSPISAPIPROP_NUMOFTHREADS => "NumOfThreads"

    /**
     * @type {HSTRING}
     */
    static wszOCSPISAPIPROP_NUMOFBACKENDCONNECTIONS => "NumOfBackendConnections"

    /**
     * @type {HSTRING}
     */
    static wszOCSPISAPIPROP_REFRESHRATE => "RefreshRate"

    /**
     * @type {HSTRING}
     */
    static wszOCSPISAPIPROP_MAXNUMOFCACHEENTRIES => "MaxNumOfCacheEntries"

    /**
     * @type {HSTRING}
     */
    static wszOCSPISAPIPROP_MAXAGE => "MaxAge"

    /**
     * @type {HSTRING}
     */
    static wszOCSPISAPIPROP_DEBUG => "ISAPIDebug"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCOMMONPROP_REQFLAGS => "RequestFlags"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCOMMONPROP_MAXINCOMINGMESSAGESIZE => "MaxIncomingMessageSize"

    /**
     * @type {HSTRING}
     */
    static wszOCSPCOMMONPROP_MAXNUMOFREQUESTENTRIES => "MaxNumOfRequestEntries"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_CRLURLTIMEOUT => "CrlUrlTimeOut"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_BASECRLURLS => "BaseCrlUrls"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_SERIALNUMBERSDIRS => "IssuedSerialNumbersDirectories"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_BASECRL => "BaseCrl"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_DELTACRLURLS => "DeltaCrlUrls"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_DELTACRL => "DeltaCrl"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_REFRESHTIMEOUT => "RefreshTimeOut"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_ERRORCODE => "RevocationErrorCode"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_ALLOWUSERONLYCRLS => "AllowUserOnlyCrls"

    /**
     * @type {HSTRING}
     */
    static wszOCSPREVPROP_ALLOWCAONLYCRLS => "AllowCAOnlyCrls"

    /**
     * @type {HSTRING}
     */
    static szBACKUPANNOTATION => "Cert Server Backup Interface"

    /**
     * @type {HSTRING}
     */
    static szRESTOREANNOTATION => "Cert Server Restore Interface"

    /**
     * @type {Integer (UInt32)}
     */
    static CSBACKUP_TYPE_MASK => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CSRESTORE_TYPE_FULL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSRESTORE_TYPE_ONLINE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSRESTORE_TYPE_CATCHUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CSRESTORE_TYPE_MASK => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CSBACKUP_DISABLE_INCREMENTAL => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static CSBFT_DIRECTORY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CSBFT_DATABASE_DIRECTORY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CSBFT_LOG_DIRECTORY => 32

    /**
     * @type {Integer (UInt64)}
     */
    static CSCONTROL_SHUTDOWN => 1

    /**
     * @type {Integer (UInt64)}
     */
    static CSCONTROL_SUSPEND => 2

    /**
     * @type {Integer (UInt64)}
     */
    static CSCONTROL_RESTART => 3

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_COMMONNAME => "CommonName"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_ORGUNIT => "OrgUnit"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_ORGANIZATION => "Organization"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_LOCALITY => "Locality"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_STATE => "State"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_COUNTRY => "Country"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_CONFIG => "Config"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_EXCHANGECERTIFICATE => "ExchangeCertificate"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_SIGNATURECERTIFICATE => "SignatureCertificate"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_DESCRIPTION => "Description"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_COMMENT => "Comment"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_SERVER => "Server"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_AUTHORITY => "Authority"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_SANITIZEDNAME => "SanitizedName"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_SHORTNAME => "ShortName"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_SANITIZEDSHORTNAME => "SanitizedShortName"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_FLAGS => "Flags"

    /**
     * @type {HSTRING}
     */
    static wszCONFIG_WEBENROLLMENTSERVERS => "WebEnrollmentServers"

    /**
     * @type {Integer (UInt32)}
     */
    static CAIF_DSENTRY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CAIF_SHAREDFOLDERENTRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CAIF_REGISTRY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CAIF_LOCAL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CAIF_REGISTRYPARENT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_ENCODEANY => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_ENCODEMASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_FORMATANY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_PKCS10 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_KEYGEN => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_PKCS7 => 768

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_CMC => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_CHALLENGERESPONSE => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_SIGNEDCERTIFICATETIMESTAMPLIST => 1536

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_FORMATMASK => 65280

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_SCEP => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_RPC => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_HTTP => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_FULLRESPONSE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_CRLS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_MACHINE => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_ROBO => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_CLIENTIDNONE => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_CONNECTONLY => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_RETURNCHALLENGE => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_SCEPPOST => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_CERTIFICATETRANSPARENCY => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static CR_IN_PRESIGN => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static CR_DISP_REVOKED => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_BASE64REQUESTHEADER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_HEX => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_HEXASCII => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_BASE64X509CRLHEADER => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_HEXADDR => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_HEXASCIIADDR => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_HEXRAW => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_ENCODEMASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_CHAIN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_CRLS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_NOCRLF => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CR_OUT_NOCR => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CR_GEMT_DEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CR_GEMT_HRESULT_STRING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CR_GEMT_HTTP_ERROR => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_FILEVERSION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_PRODUCTVERSION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_EXITCOUNT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_EXITDESCRIPTION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_POLICYDESCRIPTION => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CANAME => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_SANITIZEDCANAME => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_SHAREDFOLDER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_PARENTCA => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CATYPE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CASIGCERTCOUNT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CASIGCERT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CASIGCERTCHAIN => 13

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CAXCHGCERTCOUNT => 14

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CAXCHGCERT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CAXCHGCERTCHAIN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_BASECRL => 17

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_DELTACRL => 18

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CACERTSTATE => 19

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CRLSTATE => 20

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CAPROPIDMAX => 21

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_DNSNAME => 22

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_ROLESEPARATIONENABLED => 23

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_KRACERTUSEDCOUNT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_KRACERTCOUNT => 25

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_KRACERT => 26

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_KRACERTSTATE => 27

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_ADVANCEDSERVER => 28

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_TEMPLATES => 29

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_BASECRLPUBLISHSTATUS => 30

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_DELTACRLPUBLISHSTATUS => 31

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CASIGCERTCRLCHAIN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CAXCHGCERTCRLCHAIN => 33

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CACERTSTATUSCODE => 34

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CAFORWARDCROSSCERT => 35

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CABACKWARDCROSSCERT => 36

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CAFORWARDCROSSCERTSTATE => 37

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CABACKWARDCROSSCERTSTATE => 38

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CACERTVERSION => 39

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_SANITIZEDCASHORTNAME => 40

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CERTCDPURLS => 41

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CERTAIAURLS => 42

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CERTAIAOCSPURLS => 43

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_LOCALENAME => 44

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_SUBJECTTEMPLATE_OIDS => 45

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_CRLPARTITIONCOUNT => 46

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_PARTITIONED_BASECRL => 47

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_PARTITIONED_DELTACRL => 48

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_PARTITIONED_BASECRLPUBLISHSTATUS => 49

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_PARTITIONED_DELTACRLPUBLISHSTATUS => 50

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_SCEPSERVERCERTS => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_SCEPSERVERCAPABILITIES => 1001

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_SCEPSERVERCERTSCHAIN => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_SCEPMIN => 1000

    /**
     * @type {Integer (UInt32)}
     */
    static CR_PROP_SCEPMAX => 1002

    /**
     * @type {Integer (UInt32)}
     */
    static FR_PROP_CLAIMCHALLENGE => 22

    /**
     * @type {Integer (UInt32)}
     */
    static EAN_NAMEOBJECTID => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static EANR_SUPPRESS_IA5CONVERSION => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CERTENROLL_INDEX_BASE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_INVALID => 0

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_STARTUP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EXITEVENT_CERTIMPORTED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static ENUMEXT_OBJECTID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_REFRESHONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CMM_READONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBG_CERTSRV => 1

    /**
     * @type {HSTRING}
     */
    static wszSERVICE_NAME => "CertSvc"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYBASE => "SYSTEM\CurrentControlSet\Services\CertSvc"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYCONFIG => "Configuration"

    /**
     * @type {HSTRING}
     */
    static wszREGACTIVE => "Active"

    /**
     * @type {HSTRING}
     */
    static wszREGDIRECTORY => "ConfigurationDirectory"

    /**
     * @type {HSTRING}
     */
    static wszREGDBDIRECTORY => "DBDirectory"

    /**
     * @type {HSTRING}
     */
    static wszREGDBLOGDIRECTORY => "DBLogDirectory"

    /**
     * @type {HSTRING}
     */
    static wszREGDBSYSDIRECTORY => "DBSystemDirectory"

    /**
     * @type {HSTRING}
     */
    static wszREGDBTEMPDIRECTORY => "DBTempDirectory"

    /**
     * @type {HSTRING}
     */
    static wszREGDBSESSIONCOUNT => "DBSessionCount"

    /**
     * @type {HSTRING}
     */
    static wszREGDBMAXREADSESSIONCOUNT => "DBMaxReadSessionCount"

    /**
     * @type {HSTRING}
     */
    static wszREGDBFLAGS => "DBFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGDBLASTFULLBACKUP => "DBLastFullBackup"

    /**
     * @type {HSTRING}
     */
    static wszREGDBLASTINCREMENTALBACKUP => "DBLastIncrementalBackup"

    /**
     * @type {HSTRING}
     */
    static wszREGDBLASTRECOVERY => "DBLastRecovery"

    /**
     * @type {HSTRING}
     */
    static wszREGWEBCLIENTCAMACHINE => "WebClientCAMachine"

    /**
     * @type {HSTRING}
     */
    static wszREGVERSION => "Version"

    /**
     * @type {HSTRING}
     */
    static wszREGWEBCLIENTCANAME => "WebClientCAName"

    /**
     * @type {HSTRING}
     */
    static wszREGWEBCLIENTCATYPE => "WebClientCAType"

    /**
     * @type {HSTRING}
     */
    static wszREGLDAPFLAGS => "LDAPFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGCERTSRVDEBUG => "Debug"

    /**
     * @type {Integer (UInt32)}
     */
    static DBSESSIONCOUNTDEFAULT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_READONLY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_CREATEIFNEEDED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_CIRCULARLOGGING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_LAZYFLUSH => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_MAXCACHESIZEX100 => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_CHECKPOINTDEPTH60MB => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_LOGBUFFERSLARGE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_LOGBUFFERSHUGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_LOGFILESIZE16MB => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_MULTITHREADTRANSACTIONS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_DISABLESNAPSHOTBACKUP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DBFLAGS_ENABLEVOLATILEREQUESTS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static LDAPF_SSLENABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static LDAPF_SIGNDISABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MAJOR_WIN2K => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MINOR_WIN2K => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MAJOR_WHISTLER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MINOR_WHISTLER_BETA2 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MINOR_WHISTLER_BETA3 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MAJOR_LONGHORN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MINOR_LONGHORN_BETA1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MAJOR_WIN7 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MINOR_WIN7 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MAJOR_WIN8 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MINOR_WIN8 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MAJOR_WINBLUE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MINOR_WINBLUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MAJOR_THRESHOLD => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MINOR_THRESHOLD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MAJOR => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CSVER_MINOR => 1

    /**
     * @type {HSTRING}
     */
    static wszREGKEYRESTOREINPROGRESS => "RestoreInProgress"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYDBPARAMETERS => "DBParameters"

    /**
     * @type {HSTRING}
     */
    static wszREGCADESCRIPTION => "CADescription"

    /**
     * @type {HSTRING}
     */
    static wszREGCACERTHASH => "CACertHash"

    /**
     * @type {HSTRING}
     */
    static wszREGCASERIALNUMBER => "CACertSerialNumber"

    /**
     * @type {HSTRING}
     */
    static wszREGCAXCHGCERTHASH => "CAXchgCertHash"

    /**
     * @type {HSTRING}
     */
    static wszREGKRACERTHASH => "KRACertHash"

    /**
     * @type {HSTRING}
     */
    static wszREGKRACERTCOUNT => "KRACertCount"

    /**
     * @type {HSTRING}
     */
    static wszREGKRAFLAGS => "KRAFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGCATYPE => "CAType"

    /**
     * @type {HSTRING}
     */
    static wszREGCERTENROLLCOMPATIBLE => "CertEnrollCompatible"

    /**
     * @type {HSTRING}
     */
    static wszREGENFORCEX500NAMELENGTHS => "EnforceX500NameLengths"

    /**
     * @type {HSTRING}
     */
    static wszREGCOMMONNAME => "CommonName"

    /**
     * @type {HSTRING}
     */
    static wszREGCLOCKSKEWMINUTES => "ClockSkewMinutes"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLNEXTPUBLISH => "CRLNextPublish"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLPERIODSTRING => "CRLPeriod"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLPERIODCOUNT => "CRLPeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLOVERLAPPERIODSTRING => "CRLOverlapPeriod"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLOVERLAPPERIODCOUNT => "CRLOverlapUnits"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLDELTANEXTPUBLISH => "CRLDeltaNextPublish"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLDELTAPERIODSTRING => "CRLDeltaPeriod"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLDELTAPERIODCOUNT => "CRLDeltaPeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLDELTAOVERLAPPERIODSTRING => "CRLDeltaOverlapPeriod"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLDELTAOVERLAPPERIODCOUNT => "CRLDeltaOverlapUnits"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLPUBLICATIONURLS => "CRLPublicationURLs"

    /**
     * @type {HSTRING}
     */
    static wszREGCACERTPUBLICATIONURLS => "CACertPublicationURLs"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLMAXPARTITIONS => "CRLMaxPartitions"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLSUSPENDEDPARTITIONS => "CRLSuspendedPartitions"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLCURRENTPARTITION => "CRLCurrentPartition"

    /**
     * @type {HSTRING}
     */
    static wszREGCAXCHGVALIDITYPERIODSTRING => "CAXchgValidityPeriod"

    /**
     * @type {HSTRING}
     */
    static wszREGCAXCHGVALIDITYPERIODCOUNT => "CAXchgValidityPeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszREGCAXCHGOVERLAPPERIODSTRING => "CAXchgOverlapPeriod"

    /**
     * @type {HSTRING}
     */
    static wszREGCAXCHGOVERLAPPERIODCOUNT => "CAXchgOverlapPeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLPATH_OLD => "CRLPath"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLEDITFLAGS => "CRLEditFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLFLAGS => "CRLFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGCRLATTEMPTREPUBLISH => "CRLAttemptRepublish"

    /**
     * @type {HSTRING}
     */
    static wszREGENABLED => "Enabled"

    /**
     * @type {HSTRING}
     */
    static wszREGFORCETELETEX => "ForceTeletex"

    /**
     * @type {HSTRING}
     */
    static wszREGLOGLEVEL => "LogLevel"

    /**
     * @type {HSTRING}
     */
    static wszREGHIGHSERIAL => "HighSerial"

    /**
     * @type {HSTRING}
     */
    static wszREGPOLICYFLAGS => "PolicyFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGNAMESEPARATOR => "SubjectNameSeparator"

    /**
     * @type {HSTRING}
     */
    static wszREGSUBJECTTEMPLATE => "SubjectTemplate"

    /**
     * @type {HSTRING}
     */
    static wszREGCAUSEDS => "UseDS"

    /**
     * @type {HSTRING}
     */
    static wszREGVALIDITYPERIODSTRING => "ValidityPeriod"

    /**
     * @type {HSTRING}
     */
    static wszREGVALIDITYPERIODCOUNT => "ValidityPeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszREGPARENTCAMACHINE => "ParentCAMachine"

    /**
     * @type {HSTRING}
     */
    static wszREGPARENTCANAME => "ParentCAName"

    /**
     * @type {HSTRING}
     */
    static wszREGREQUESTFILENAME => "RequestFileName"

    /**
     * @type {HSTRING}
     */
    static wszREGREQUESTID => "RequestId"

    /**
     * @type {HSTRING}
     */
    static wszREGREQUESTKEYCONTAINER => "RequestKeyContainer"

    /**
     * @type {HSTRING}
     */
    static wszREGREQUESTKEYINDEX => "RequestKeyIndex"

    /**
     * @type {HSTRING}
     */
    static wszREGCASERVERNAME => "CAServerName"

    /**
     * @type {HSTRING}
     */
    static wszREGCACERTFILENAME => "CACertFileName"

    /**
     * @type {HSTRING}
     */
    static wszREGCASECURITY => "Security"

    /**
     * @type {HSTRING}
     */
    static wszREGAUDITFILTER => "AuditFilter"

    /**
     * @type {HSTRING}
     */
    static wszREGOFFICERRIGHTS => "OfficerRights"

    /**
     * @type {HSTRING}
     */
    static wszENROLLMENTAGENTRIGHTS => "EnrollmentAgentRights"

    /**
     * @type {HSTRING}
     */
    static wszREGMAXINCOMINGMESSAGESIZE => "MaxIncomingMessageSize"

    /**
     * @type {HSTRING}
     */
    static wszREGMAXINCOMINGALLOCSIZE => "MaxIncomingAllocSize"

    /**
     * @type {HSTRING}
     */
    static wszREGROLESEPARATIONENABLED => "RoleSeparationEnabled"

    /**
     * @type {HSTRING}
     */
    static wszREGALTERNATEPUBLISHDOMAINS => "AlternatePublishDomains"

    /**
     * @type {HSTRING}
     */
    static wszREGSETUPSTATUS => "SetupStatus"

    /**
     * @type {HSTRING}
     */
    static wszREGINTERFACEFLAGS => "InterfaceFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGDSCONFIGDN => "DSConfigDN"

    /**
     * @type {HSTRING}
     */
    static wszREGDSDOMAINDN => "DSDomainDN"

    /**
     * @type {HSTRING}
     */
    static wszREGVIEWAGEMINUTES => "ViewAgeMinutes"

    /**
     * @type {HSTRING}
     */
    static wszREGVIEWIDLEMINUTES => "ViewIdleMinutes"

    /**
     * @type {HSTRING}
     */
    static wszREGEKPUBLISTDIRECTORIES => "EndorsementKeyListDirectories"

    /**
     * @type {HSTRING}
     */
    static wszCERTIFICATETRANSPARENCYFLAGS => "CertificateTransparencyFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGMAXSCTLISTSIZE => "MaxSCTListSize"

    /**
     * @type {HSTRING}
     */
    static wszREGCERTIFICATETRANSPARENCYINFOOID => "CTInformationExtensionOid"

    /**
     * @type {HSTRING}
     */
    static wszREGPROCESSINGFLAGS => "ProcessingFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGUSEDEFINEDCACERTINREQ => "UseDefinedCACertInRequest"

    /**
     * @type {HSTRING}
     */
    static wszREGENABLEDEKUFORDEFINEDCACERT => "EnabledEKUForDefinedCACert"

    /**
     * @type {HSTRING}
     */
    static wszREGEKUOIDSFORPUBLISHEXPIREDCERTINCRL => "EKUOIDsForPublishExpiredCertInCRL"

    /**
     * @type {HSTRING}
     */
    static wszCRTFILENAMEEXT => ".crt"

    /**
     * @type {HSTRING}
     */
    static wszPFXFILENAMEEXT => ".p12"

    /**
     * @type {HSTRING}
     */
    static wszDATFILENAMEEXT => ".dat"

    /**
     * @type {HSTRING}
     */
    static wszLOGFILENAMEEXT => ".log"

    /**
     * @type {HSTRING}
     */
    static wszDBFILENAMEEXT => ".edb"

    /**
     * @type {HSTRING}
     */
    static szDBBASENAMEPARM => "edb"

    /**
     * @type {HSTRING}
     */
    static wszLOGPATH => "CertLog"

    /**
     * @type {HSTRING}
     */
    static wszDBBACKUPSUBDIR => "DataBase"

    /**
     * @type {HSTRING}
     */
    static wszDBBACKUPCERTBACKDAT => "certbkxp.dat"

    /**
     * @type {Integer (UInt32)}
     */
    static CCLOCKSKEWMINUTESDEFAULT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static CVIEWAGEMINUTESDEFAULT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static dwVALIDITYPERIODCOUNTDEFAULT_ROOT => 5

    /**
     * @type {Integer (UInt32)}
     */
    static dwVALIDITYPERIODCOUNTDEFAULT_ENTERPRISE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static dwVALIDITYPERIODCOUNTDEFAULT_STANDALONE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static dwCAXCHGVALIDITYPERIODCOUNTDEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static dwCAXCHGOVERLAPPERIODCOUNTDEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static dwCRLPERIODCOUNTDEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static dwCRLOVERLAPPERIODCOUNTDEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static dwCRLDELTAPERIODCOUNTDEFAULT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static dwCRLDELTAOVERLAPPERIODCOUNTDEFAULT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_SERVER_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_CLIENT_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_SUSPEND_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_REQUEST_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_ONLINE_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_DENIED_FLAG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_CREATEDB_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_ATTEMPT_VROOT_CREATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_FORCECRL_FLAG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_UPDATE_CAOBJECT_SVRTYPE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_SERVER_UPGRADED_FLAG => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_W2K_SECURITY_NOT_UPGRADED_FLAG => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_SECURITY_CHANGED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_DCOM_SECURITY_UPDATED_FLAG => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SETUP_SERVER_IS_UP_TO_DATE_FLAG => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_DELTA_USE_OLDEST_UNEXPIRED_BASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_DELETE_EXPIRED_CRLS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_CRLNUMBER_CRITICAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_REVCHECK_IGNORE_OFFLINE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_IGNORE_INVALID_POLICIES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_REBUILD_MODIFIED_SUBJECT_ONLY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_SAVE_FAILED_CERTS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_IGNORE_UNKNOWN_CMC_ATTRIBUTES => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_IGNORE_CROSS_CERT_TRUST_ERROR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_PUBLISH_EXPIRED_CERT_CRLS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_ENFORCE_ENROLLMENT_AGENT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_DISABLE_RDN_REORDER => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_DISABLE_ROOT_CROSS_CERTS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_LOG_FULL_RESPONSE => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_USE_XCHG_CERT_TEMPLATE => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_USE_CROSS_CERT_TEMPLATE => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_ALLOW_REQUEST_ATTRIBUTE_SUBJECT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_REVCHECK_IGNORE_NOREVCHECK => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_PRESERVE_EXPIRED_CA_CERTS => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_PRESERVE_REVOKED_CA_CERTS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_DISABLE_CHAIN_VERIFICATION => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_BUILD_ROOTCA_CRLENTRIES_BASEDONKEY => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_ENABLE_CRL_PARTITION => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_PARTITION_ZERO_EXCLUSIVE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_CONTAINS_ONLY_CACERTS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static CRLF_CONTAINS_ONLY_USERCERTS => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static KRAF_ENABLEFOREIGN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KRAF_SAVEBADREQUESTKEY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static KRAF_ENABLEARCHIVEALL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static KRAF_DISABLEUSEDEFAULTPROVIDER => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IF_LOCKICERTREQUEST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IF_NOREMOTEICERTREQUEST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IF_NOLOCALICERTREQUEST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static IF_NORPCICERTREQUEST => 8

    /**
     * @type {Integer (UInt32)}
     */
    static IF_NOREMOTEICERTADMIN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static IF_NOLOCALICERTADMIN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static IF_NOREMOTEICERTADMINBACKUP => 64

    /**
     * @type {Integer (UInt32)}
     */
    static IF_NOLOCALICERTADMINBACKUP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static IF_NOSNAPSHOTBACKUP => 256

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ENFORCEENCRYPTICERTREQUEST => 512

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ENFORCEENCRYPTICERTADMIN => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ENABLEEXITKEYRETRIEVAL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ENABLEADMINASAUDITOR => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static IF_ENABLEPRESIGNSUPPORT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PROCFLG_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PROCFLG_ENFORCEGOODKEYS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSURL_SERVERPUBLISH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSURL_ADDTOCERTCDP => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSURL_ADDTOFRESHESTCRL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CSURL_ADDTOCRLCDP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CSURL_PUBLISHRETRY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CSURL_ADDTOCERTOCSP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CSURL_SERVERPUBLISHDELTA => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CSURL_ADDTOIDP => 128

    /**
     * @type {HSTRING}
     */
    static wszREGKEYCSP => "CSP"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYENCRYPTIONCSP => "EncryptionCSP"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYEXITMODULES => "ExitModules"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYPOLICYMODULES => "PolicyModules"

    /**
     * @type {HSTRING}
     */
    static wszSECUREDATTRIBUTES => "SignedAttributes"

    /**
     * @type {HSTRING}
     */
    static wszzDEFAULTSIGNEDATTRIBUTES => "RequesterName" Chr(0) ""

    /**
     * @type {HSTRING}
     */
    static wszREGBACKUPLOGDIRECTORY => "BackupLogDirectory"

    /**
     * @type {HSTRING}
     */
    static wszREGCHECKPOINTFILE => "CheckPointFile"

    /**
     * @type {HSTRING}
     */
    static wszREGHIGHLOGNUMBER => "HighLogNumber"

    /**
     * @type {HSTRING}
     */
    static wszREGLOWLOGNUMBER => "LowLogNumber"

    /**
     * @type {HSTRING}
     */
    static wszREGLOGPATH => "LogPath"

    /**
     * @type {HSTRING}
     */
    static wszREGRESTOREMAPCOUNT => "RestoreMapCount"

    /**
     * @type {HSTRING}
     */
    static wszREGRESTOREMAP => "RestoreMap"

    /**
     * @type {HSTRING}
     */
    static wszREGDATABASERECOVERED => "DatabaseRecovered"

    /**
     * @type {HSTRING}
     */
    static wszREGRESTORESTATUS => "RestoreStatus"

    /**
     * @type {HSTRING}
     */
    static wszREGB2ICERTMANAGEMODULE => "ICertManageModule"

    /**
     * @type {HSTRING}
     */
    static wszREGSP4DEFAULTCONFIGURATION => "DefaultConfiguration"

    /**
     * @type {HSTRING}
     */
    static wszREGSP4KEYSETNAME => "KeySetName"

    /**
     * @type {HSTRING}
     */
    static wszREGSP4SUBJECTNAMESEPARATOR => "SubjectNameSeparator"

    /**
     * @type {HSTRING}
     */
    static wszREGSP4NAMES => "Names"

    /**
     * @type {HSTRING}
     */
    static wszREGSP4QUERIES => "Queries"

    /**
     * @type {HSTRING}
     */
    static wszREGNETSCAPECERTTYPE => "NetscapeCertType"

    /**
     * @type {HSTRING}
     */
    static wszNETSCAPEREVOCATIONTYPE => "Netscape"

    /**
     * @type {HSTRING}
     */
    static wszREGPROVIDERTYPE => "ProviderType"

    /**
     * @type {HSTRING}
     */
    static wszREGPROVIDER => "Provider"

    /**
     * @type {HSTRING}
     */
    static wszHASHALGORITHM => "HashAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszENCRYPTIONALGORITHM => "EncryptionAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszMACHINEKEYSET => "MachineKeyset"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYSIZE => "KeySize"

    /**
     * @type {HSTRING}
     */
    static wszREGSYMMETRICKEYSIZE => "SymmetricKeySize"

    /**
     * @type {HSTRING}
     */
    static wszCNGPUBLICKEYALGORITHM => "CNGPublicKeyAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszCNGHASHALGORITHM => "CNGHashAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszCNGENCRYPTIONALGORITHM => "CNGEncryptionAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszREGALTERNATESIGNATUREALGORITHM => "AlternateSignatureAlgorithm"

    /**
     * @type {HSTRING}
     */
    static szNAMESEPARATORDEFAULT => "" Chr(10) ""

    /**
     * @type {HSTRING}
     */
    static wszPERIODYEARS => "Years"

    /**
     * @type {HSTRING}
     */
    static wszPERIODMONTHS => "Months"

    /**
     * @type {HSTRING}
     */
    static wszPERIODWEEKS => "Weeks"

    /**
     * @type {HSTRING}
     */
    static wszPERIODDAYS => "Days"

    /**
     * @type {HSTRING}
     */
    static wszPERIODHOURS => "Hours"

    /**
     * @type {HSTRING}
     */
    static wszPERIODMINUTES => "Minutes"

    /**
     * @type {HSTRING}
     */
    static wszPERIODSECONDS => "Seconds"

    /**
     * @type {HSTRING}
     */
    static wszREGISSUERCERTURLFLAGS => "IssuerCertURLFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGEDITFLAGS => "EditFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGUPNMAP => "UPNMap"

    /**
     * @type {HSTRING}
     */
    static wszREGSUBJECTALTNAME => "SubjectAltName"

    /**
     * @type {HSTRING}
     */
    static wszREGSUBJECTALTNAME2 => "SubjectAltName2"

    /**
     * @type {HSTRING}
     */
    static wszREGREQUESTDISPOSITION => "RequestDisposition"

    /**
     * @type {HSTRING}
     */
    static wszREGCAPATHLENGTH => "CAPathLength"

    /**
     * @type {HSTRING}
     */
    static wszREGREVOCATIONTYPE => "RevocationType"

    /**
     * @type {HSTRING}
     */
    static wszREGLDAPREVOCATIONCRLURL_OLD => "LDAPRevocationCRLURL"

    /**
     * @type {HSTRING}
     */
    static wszREGREVOCATIONCRLURL_OLD => "RevocationCRLURL"

    /**
     * @type {HSTRING}
     */
    static wszREGFTPREVOCATIONCRLURL_OLD => "FTPRevocationCRLURL"

    /**
     * @type {HSTRING}
     */
    static wszREGFILEREVOCATIONCRLURL_OLD => "FileRevocationCRLURL"

    /**
     * @type {HSTRING}
     */
    static wszREGREVOCATIONURL => "RevocationURL"

    /**
     * @type {HSTRING}
     */
    static wszREGLDAPISSUERCERTURL_OLD => "LDAPIssuerCertURL"

    /**
     * @type {HSTRING}
     */
    static wszREGISSUERCERTURL_OLD => "IssuerCertURL"

    /**
     * @type {HSTRING}
     */
    static wszREGFTPISSUERCERTURL_OLD => "FTPIssuerCertURL"

    /**
     * @type {HSTRING}
     */
    static wszREGFILEISSUERCERTURL_OLD => "FileIssuerCertURL"

    /**
     * @type {HSTRING}
     */
    static wszREGENABLEREQUESTEXTENSIONLIST => "EnableRequestExtensionList"

    /**
     * @type {HSTRING}
     */
    static wszREGENABLEENROLLEEREQUESTEXTENSIONLIST => "EnableEnrolleeRequestExtensionList"

    /**
     * @type {HSTRING}
     */
    static wszREGDISABLEEXTENSIONLIST => "DisableExtensionList"

    /**
     * @type {HSTRING}
     */
    static wszREGEKUOIDSFORVOLATILEREQUESTS => "EKUOIDsforVolatileRequests"

    /**
     * @type {HSTRING}
     */
    static wszREGLDAPSESSIONOPTIONS => "LDAPSessionOptions"

    /**
     * @type {HSTRING}
     */
    static wszLDAPSESSIONOPTIONVALUE => "LDAPSessionOptionValue"

    /**
     * @type {HSTRING}
     */
    static wszREGDEFAULTSMIME => "DefaultSMIME"

    /**
     * @type {Integer (UInt32)}
     */
    static CAPATHLENGTH_INFINITE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static REQDISP_PENDING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static REQDISP_ISSUE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REQDISP_DENY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REQDISP_USEREQUESTATTRIBUTE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static REQDISP_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static REQDISP_PENDINGFIRST => 256

    /**
     * @type {Integer (UInt32)}
     */
    static REQDISP_DEFAULT_ENTERPRISE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REVEXT_CDPLDAPURL_OLD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REVEXT_CDPHTTPURL_OLD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REVEXT_CDPFTPURL_OLD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REVEXT_CDPFILEURL_OLD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static REVEXT_CDPURLMASK_OLD => 255

    /**
     * @type {Integer (UInt32)}
     */
    static REVEXT_CDPENABLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static REVEXT_ASPENABLE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static REVEXT_DEFAULT_NODS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static REVEXT_DEFAULT_DS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ISSCERT_LDAPURL_OLD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ISSCERT_HTTPURL_OLD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ISSCERT_FTPURL_OLD => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ISSCERT_FILEURL_OLD => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ISSCERT_URLMASK_OLD => 255

    /**
     * @type {Integer (UInt32)}
     */
    static ISSCERT_ENABLE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ISSCERT_DEFAULT_NODS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static ISSCERT_DEFAULT_DS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLEREQUESTEXTENSIONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_REQUESTEXTENSIONLIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_DISABLEEXTENSIONLIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ADDOLDKEYUSAGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ADDOLDCERTTYPE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ATTRIBUTEENDDATE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_BASICCONSTRAINTSCRITICAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_BASICCONSTRAINTSCA => 128

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLEAKIKEYID => 256

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ATTRIBUTECA => 512

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_IGNOREREQUESTERGROUP => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLEAKIISSUERNAME => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLEAKIISSUERSERIAL => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLEAKICRITICAL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_SERVERUPGRADED => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ATTRIBUTEEKU => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLEDEFAULTSMIME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_EMAILOPTIONAL => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ATTRIBUTESUBJECTALTNAME2 => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLELDAPREFERRALS => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLECHASECLIENTDC => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_AUDITCERTTEMPLATELOAD => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_DISABLEOLDOSCNUPN => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_DISABLELDAPPACKAGELIST => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLEUPNMAP => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLEOCSPREVNOCHECK => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLERENEWONBEHALFOF => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static EDITF_ENABLEKEYENCIPHERMENTCACERT => 134217728

    /**
     * @type {HSTRING}
     */
    static wszREGLDAPREVOCATIONDN_OLD => "LDAPRevocationDN"

    /**
     * @type {HSTRING}
     */
    static wszREGLDAPREVOCATIONDNTEMPLATE_OLD => "LDAPRevocationDNTemplate"

    /**
     * @type {HSTRING}
     */
    static wszCRLPUBLISHRETRYCOUNT => "CRLPublishRetryCount"

    /**
     * @type {HSTRING}
     */
    static wszREGCERTPUBLISHFLAGS => "PublishCertFlags"

    /**
     * @type {Integer (UInt32)}
     */
    static EXITPUB_FILE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXITPUB_ACTIVEDIRECTORY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXITPUB_REMOVEOLDCERTS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static EXITPUB_DEFAULT_ENTERPRISE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXITPUB_DEFAULT_STANDALONE => 1

    /**
     * @type {HSTRING}
     */
    static wszCLASS_CERTADMIN => "CertificateAuthority.Admin"

    /**
     * @type {HSTRING}
     */
    static wszCLASS_CERTCONFIG => "CertificateAuthority.Config"

    /**
     * @type {HSTRING}
     */
    static wszCLASS_CERTGETCONFIG => "CertificateAuthority.GetConfig"

    /**
     * @type {HSTRING}
     */
    static wszCLASS_CERTENCODE => "CertificateAuthority.Encode"

    /**
     * @type {HSTRING}
     */
    static wszCLASS_CERTDBMEM => "CertificateAuthority.DBMem"

    /**
     * @type {HSTRING}
     */
    static wszCLASS_CERTREQUEST => "CertificateAuthority.Request"

    /**
     * @type {HSTRING}
     */
    static wszCLASS_CERTSERVEREXIT => "CertificateAuthority.ServerExit"

    /**
     * @type {HSTRING}
     */
    static wszCLASS_CERTSERVERPOLICY => "CertificateAuthority.ServerPolicy"

    /**
     * @type {HSTRING}
     */
    static wszCLASS_CERTVIEW => "CertificateAuthority.View"

    /**
     * @type {HSTRING}
     */
    static wszMICROSOFTCERTMODULE_PREFIX => "CertificateAuthority_MicrosoftDefault"

    /**
     * @type {HSTRING}
     */
    static wszCERTMANAGE_SUFFIX => "Manage"

    /**
     * @type {HSTRING}
     */
    static wszCERTEXITMODULE_POSTFIX => ".Exit"

    /**
     * @type {HSTRING}
     */
    static wszCERTPOLICYMODULE_POSTFIX => ".Policy"

    /**
     * @type {HSTRING}
     */
    static wszCAPOLICYFILE => "CAPolicy.inf"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_CDP => "CRLDistributionPoint"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_AIA => "AuthorityInformationAccess"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_EKU => "EnhancedKeyUsageExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_CCDP => "CrossCertificateDistributionPointsExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_CERTSERVER => "certsrv_server"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_RENEWALKEYLENGTH => "RenewalKeyLength"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_RENEWALVALIDITYPERIODSTRING => "RenewalValidityPeriod"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_RENEWALVALIDITYPERIODCOUNT => "RenewalValidityPeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_UTF8 => "UTF8"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CRLPERIODSTRING => "CRLPeriod"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CRLPERIODCOUNT => "CRLPeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CRLDELTAPERIODSTRING => "CRLDeltaPeriod"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CRLDELTAPERIODCOUNT => "CRLDeltaPeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_LOADDEFAULTTEMPLATES => "LoadDefaultTemplates"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ENABLEKEYCOUNTING => "EnableKeyCounting"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_FORCEUTF8 => "ForceUTF8"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ALTERNATESIGNATUREALGORITHM => "AlternateSignatureAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_SHOWALLCSPS => "ShowAllCSPs"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CRITICAL => "Critical"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_EMPTY => "Empty"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CCDPSYNCDELTATIME => "SyncDeltaTime"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_CAPOLICY => "CAPolicy"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_POLICYSTATEMENT => "PolicyStatementExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_APPLICATIONPOLICYSTATEMENT => "ApplicationPolicyStatementExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_POLICIES => "Policies"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_OID => "OID"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_NOTICE => "Notice"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_FLAGS => "Flags"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_REQUESTATTRIBUTES => "RequestAttributes"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_NAMECONSTRAINTS => "NameConstraintsExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_INCLUDE => "Include"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_EXCLUDE => "Exclude"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_SUBTREE => "SubTree"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_UPN => "UPN"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_EMAIL => "EMail"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_DNS => "DNS"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_DIRECTORYNAME => "DirectoryName"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_URL => "URL"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_IPADDRESS => "IPAddress"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_REGISTEREDID => "RegisteredId"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_OTHERNAME => "OtherName"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_POLICYMAPPINGS => "PolicyMappingsExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_APPLICATIONPOLICYMAPPINGS => "ApplicationPolicyMappingsExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_POLICYCONSTRAINTS => "PolicyConstraintsExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_APPLICATIONPOLICYCONSTRAINTS => "ApplicationPolicyConstraintsExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_REQUIREEXPLICITPOLICY => "RequireExplicitPolicy"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_INHIBITPOLICYMAPPING => "InhibitPolicyMapping"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_BASICCONSTRAINTS => "BasicConstraintsExtension"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_PATHLENGTH => "PathLength"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_EXTENSIONS => "Extensions"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_PROPERTIES => "Properties"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CONTINUE => "_continue_"

    /**
     * @type {HSTRING}
     */
    static wszINFSECTION_NEWREQUEST => "NewRequest"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_SUBJECT => "Subject"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_SUBJECTNAMEFLAGS => "SubjectNameFlags"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_X500NAMEFLAGS => "X500NameFlags"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_EXPORTABLE => "Exportable"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_EXPORTABLEENCRYPTED => "ExportableEncrypted"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_HASHALGORITHM => "HashAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_KEYALGORITHM => "KeyAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_KEYALGORITHMPARMETERS => "KeyAlgorithmParameters"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_KEYCONTAINER => "KeyContainer"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_READERNAME => "ReaderName"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_KEYLENGTH => "KeyLength"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_LEGACYKEYSPEC => "KeySpec"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_KEYUSAGEEXTENSION => "KeyUsage"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_KEYUSAGEPROPERTY => "KeyUsageProperty"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_MACHINEKEYSET => "MachineKeySet"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_PRIVATEKEYARCHIVE => "PrivateKeyArchive"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ENCRYPTIONALGORITHM => "EncryptionAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ENCRYPTIONLENGTH => "EncryptionLength"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_PROVIDERNAME => "ProviderName"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_PROVIDERTYPE => "ProviderType"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_RENEWALCERT => "RenewalCert"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_REQUESTTYPE => "RequestType"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_SECURITYDESCRIPTOR => "SecurityDescriptor"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_SILENT => "Silent"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_SMIME => "SMIME"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_SUPPRESSDEFAULTS => "SuppressDefaults"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_USEEXISTINGKEY => "UseExistingKeySet"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_USERPROTECTED => "UserProtected"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_KEYPROTECTION => "KeyProtection"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_UICONTEXTMESSAGE => "UIContextMessage"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_FRIENDLYNAME => "FriendlyName"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_NOTBEFORE => "NotBefore"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_NOTAFTER => "NotAfter"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ATTESTPRIVATEKEY => "AttestPrivateKey"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_PUBLICKEY => "PublicKey"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_PUBLICKEYPARAMETERS => "PublicKeyParameters"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ECCKEYPARAMETERS => "EccKeyParameters"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ECCKEYPARAMETERS_P => "EccKeyParameters_P"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ECCKEYPARAMETERS_A => "EccKeyParameters_A"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ECCKEYPARAMETERS_B => "EccKeyParameters_B"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ECCKEYPARAMETERS_SEED => "EccKeyParameters_Seed"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ECCKEYPARAMETERS_BASE => "EccKeyParameters_Base"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ECCKEYPARAMETERS_ORDER => "EccKeyParameters_Order"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ECCKEYPARAMETERS_COFACTOR => "EccKeyParameters_Cofactor"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_ECCKEYPARAMETERSTYPE => "EccKeyParametersType"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_SERIALNUMBER => "SerialNumber"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CATHUMBPRINT => "CAThumbprint"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CACERTS => "CACerts"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CACAPABILITIES => "CACapabilities"

    /**
     * @type {HSTRING}
     */
    static wszINFKEY_CHALLENGEPASSWORD => "ChallengePassword"

    /**
     * @type {HSTRING}
     */
    static wszINFVALUE_REQUESTTYPE_PKCS10 => "PKCS10"

    /**
     * @type {HSTRING}
     */
    static wszINFVALUE_REQUESTTYPE_PKCS7 => "PKCS7"

    /**
     * @type {HSTRING}
     */
    static wszINFVALUE_REQUESTTYPE_CMC => "CMC"

    /**
     * @type {HSTRING}
     */
    static wszINFVALUE_REQUESTTYPE_CERT => "Cert"

    /**
     * @type {HSTRING}
     */
    static wszINFVALUE_REQUESTTYPE_SCEP => "SCEP"

    /**
     * @type {HSTRING}
     */
    static wszINFVALUE_ENDORSEMENTKEY => "EndorsementKey"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSMTPKEY => "SMTP"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSMTPTEMPLATES => "Templates"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSMTPEVENTFILTER => "EventFilter"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSMTPSERVER => "SMTPServer"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSMTPAUTHENTICATE => "SMTPAuthenticate"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITDENIEDKEY => "Denied"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITISSUEDKEY => "Issued"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITPENDINGKEY => "Pending"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITREVOKEDKEY => "Revoked"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITCRLISSUEDKEY => "CRLIssued"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSHUTDOWNKEY => "Shutdown"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSTARTUPKEY => "Startup"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITIMPORTEDKEY => "Imported"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSMTPFROM => "From"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSMTPTO => "To"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITSMTPCC => "Cc"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITTITLEFORMAT => "TitleFormat"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITTITLEARG => "TitleArg"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITBODYFORMAT => "BodyFormat"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITBODYARG => "BodyArg"

    /**
     * @type {HSTRING}
     */
    static wszREGEXITPROPNOTFOUND => "???"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYENROLLMENT => "Software\Microsoft\Cryptography\AutoEnrollment"

    /**
     * @type {HSTRING}
     */
    static wszREGKEYGROUPPOLICYENROLLMENT => "Software\Policies\Microsoft\Cryptography\AutoEnrollment"

    /**
     * @type {HSTRING}
     */
    static wszREGMAXPENDINGREQUESTDAYS => "MaxPendingRequestDays"

    /**
     * @type {HSTRING}
     */
    static wszREGAELOGLEVEL_OLD => "AEEventLogLevel"

    /**
     * @type {HSTRING}
     */
    static wszREGENROLLFLAGS => "EnrollFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGVERIFYFLAGS => "VerifyFlags"

    /**
     * @type {HSTRING}
     */
    static wszREGUNICODE => "Unicode"

    /**
     * @type {HSTRING}
     */
    static wszREGAIKCLOUDCAURL => "AIKCloudCAURL"

    /**
     * @type {HSTRING}
     */
    static wszREGAIKKEYALGORITHM => "AIKKeyAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszREGAIKKEYLENGTH => "AIKKeyLength"

    /**
     * @type {HSTRING}
     */
    static wszREGPRESERVESCEPDUMMYCERTS => "PreserveSCEPDummyCerts"

    /**
     * @type {HSTRING}
     */
    static wszREGALLPROVIDERS => "All"

    /**
     * @type {Integer (UInt32)}
     */
    static TP_MACHINEPOLICY => 1

    /**
     * @type {HSTRING}
     */
    static wszREGKEYREPAIR => "KeyRepair"

    /**
     * @type {Integer (UInt32)}
     */
    static KR_ENABLE_MACHINE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static KR_ENABLE_USER => 2

    /**
     * @type {HSTRING}
     */
    static CONFIGURATION_STATUS_PARENT_REG_PATH => "Software\Microsoft\ADCS"

    /**
     * @type {HSTRING}
     */
    static CONFIGURATION_STATUS_REG_VALUE_NAME => "ConfigurationStatus"

    /**
     * @type {HSTRING}
     */
    static CONFIGURATION_REG_EPTOKENCHECKVALUE => "EPTokenCheckValue"

    /**
     * @type {Integer (UInt32)}
     */
    static EP_TOKENCHECK_DEFAULT_VALUE => 2

    /**
     * @type {HSTRING}
     */
    static CONFIGURATION_REG_DISABLE_HTTPSONLY => "DisableHTTPSOnly"

    /**
     * @type {HSTRING}
     */
    static wszPROPDISTINGUISHEDNAME => "DistinguishedName"

    /**
     * @type {HSTRING}
     */
    static wszPROPRAWNAME => "RawName"

    /**
     * @type {HSTRING}
     */
    static wszPROPCOUNTRY => "Country"

    /**
     * @type {HSTRING}
     */
    static wszPROPORGANIZATION => "Organization"

    /**
     * @type {HSTRING}
     */
    static wszPROPORGUNIT => "OrgUnit"

    /**
     * @type {HSTRING}
     */
    static wszPROPCOMMONNAME => "CommonName"

    /**
     * @type {HSTRING}
     */
    static wszPROPLOCALITY => "Locality"

    /**
     * @type {HSTRING}
     */
    static wszPROPSTATE => "State"

    /**
     * @type {HSTRING}
     */
    static wszPROPTITLE => "Title"

    /**
     * @type {HSTRING}
     */
    static wszPROPGIVENNAME => "GivenName"

    /**
     * @type {HSTRING}
     */
    static wszPROPINITIALS => "Initials"

    /**
     * @type {HSTRING}
     */
    static wszPROPSURNAME => "SurName"

    /**
     * @type {HSTRING}
     */
    static wszPROPDOMAINCOMPONENT => "DomainComponent"

    /**
     * @type {HSTRING}
     */
    static wszPROPEMAIL => "EMail"

    /**
     * @type {HSTRING}
     */
    static wszPROPSTREETADDRESS => "StreetAddress"

    /**
     * @type {HSTRING}
     */
    static wszPROPUNSTRUCTUREDNAME => "UnstructuredName"

    /**
     * @type {HSTRING}
     */
    static wszPROPUNSTRUCTUREDADDRESS => "UnstructuredAddress"

    /**
     * @type {HSTRING}
     */
    static wszPROPDEVICESERIALNUMBER => "DeviceSerialNumber"

    /**
     * @type {HSTRING}
     */
    static wszPROPSUBJECTDOT => "Subject."

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTDOT => "Request."

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTREQUESTID => "RequestID"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTRAWREQUEST => "RawRequest"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTRAWARCHIVEDKEY => "RawArchivedKey"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTARCHIVEDKEY => "ArchivedKey"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTKEYRECOVERYHASHES => "KeyRecoveryHashes"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTRAWOLDCERTIFICATE => "RawOldCertificate"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTATTRIBUTES => "RequestAttributes"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTTYPE => "RequestType"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTFLAGS => "RequestFlags"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTSTATUSCODE => "StatusCode"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTDISPOSITION => "Disposition"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTDISPOSITIONMESSAGE => "DispositionMessage"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTSUBMITTEDWHEN => "SubmittedWhen"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTRESOLVEDWHEN => "ResolvedWhen"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTREVOKEDWHEN => "RevokedWhen"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTREVOKEDEFFECTIVEWHEN => "RevokedEffectiveWhen"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTREVOKEDREASON => "RevokedReason"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTERNAME => "RequesterName"

    /**
     * @type {HSTRING}
     */
    static wszPROPCALLERNAME => "CallerName"

    /**
     * @type {HSTRING}
     */
    static wszPROPSIGNERPOLICIES => "SignerPolicies"

    /**
     * @type {HSTRING}
     */
    static wszPROPSIGNERAPPLICATIONPOLICIES => "SignerApplicationPolicies"

    /**
     * @type {HSTRING}
     */
    static wszPROPOFFICER => "Officer"

    /**
     * @type {HSTRING}
     */
    static wszPROPPUBLISHEXPIREDCERTINCRL => "PublishExpiredCertInCRL"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTERNAMEFROMOLDCERTIFICATE => "RequesterNameFromOldCertificate"

    /**
     * @type {HSTRING}
     */
    static wszPROPATTESTATIONCHALLENGE => "AttestationChallenge"

    /**
     * @type {HSTRING}
     */
    static wszPROPENDORSEMENTKEYHASH => "EndorsementKeyHash"

    /**
     * @type {HSTRING}
     */
    static wszPROPENDORSEMENTCERTIFICATEHASH => "EndorsementCertificateHash"

    /**
     * @type {HSTRING}
     */
    static wszPROPRAWPRECERTIFICATE => "RawPrecertificate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLPARTITIONINDEX => "CRLPartitionIndex"

    /**
     * @type {HSTRING}
     */
    static wszPROPLINTERCERTIFICATE => "LinterCertificate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCHALLENGE => "Challenge"

    /**
     * @type {HSTRING}
     */
    static wszPROPEXPECTEDCHALLENGE => "ExpectedChallenge"

    /**
     * @type {HSTRING}
     */
    static wszPROPDISPOSITION => "Disposition"

    /**
     * @type {HSTRING}
     */
    static wszPROPDISPOSITIONDENY => "Deny"

    /**
     * @type {HSTRING}
     */
    static wszPROPDISPOSITIONPENDING => "Pending"

    /**
     * @type {HSTRING}
     */
    static wszPROPVALIDITYPERIODSTRING => "ValidityPeriod"

    /**
     * @type {HSTRING}
     */
    static wszPROPVALIDITYPERIODCOUNT => "ValidityPeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszPROPEXPIRATIONDATE => "ExpirationDate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTTYPE => "CertType"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTTEMPLATE => "CertificateTemplate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTUSAGE => "CertificateUsage"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTOSVERSION => "RequestOSVersion"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTCSPPROVIDER => "RequestCSPProvider"

    /**
     * @type {HSTRING}
     */
    static wszPROPEXITCERTFILE => "CertFile"

    /**
     * @type {HSTRING}
     */
    static wszPROPCLIENTBROWSERMACHINE => "cbm"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTCLIENTMACHINE => "ccm"

    /**
     * @type {HSTRING}
     */
    static wszPROPCLIENTDCDNS => "cdc"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTMACHINEDNS => "rmd"

    /**
     * @type {HSTRING}
     */
    static wszPROPSUBJECTALTNAME2 => "san"

    /**
     * @type {HSTRING}
     */
    static wszPROPDNS => "dns"

    /**
     * @type {HSTRING}
     */
    static wszPROPDN => "dn"

    /**
     * @type {HSTRING}
     */
    static wszPROPURL => "url"

    /**
     * @type {HSTRING}
     */
    static wszPROPIPADDRESS => "ipaddress"

    /**
     * @type {HSTRING}
     */
    static wszPROPGUID => "guid"

    /**
     * @type {HSTRING}
     */
    static wszPROPOID => "oid"

    /**
     * @type {HSTRING}
     */
    static wszPROPUPN => "upn"

    /**
     * @type {HSTRING}
     */
    static szPROPASNTAG => "{asn}"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRITICALTAG => "{critical}"

    /**
     * @type {HSTRING}
     */
    static wszPROPUTF8TAG => "{utf8}"

    /**
     * @type {HSTRING}
     */
    static wszPROPOCTETTAG => "{octet}"

    /**
     * @type {HSTRING}
     */
    static wszPROPHEXTAG => "{hex}"

    /**
     * @type {HSTRING}
     */
    static wszPROPTEXTTAG => "{text}"

    /**
     * @type {HSTRING}
     */
    static wszPROPDECIMALTAG => "{decimal}"

    /**
     * @type {HSTRING}
     */
    static wszPROPFILETAG => "{file}"

    /**
     * @type {HSTRING}
     */
    static wszAT_EKCERTINF => "@EKCert"

    /**
     * @type {HSTRING}
     */
    static wszAT_TESTROOT => "@TestRoot"

    /**
     * @type {HSTRING}
     */
    static wszPROPLINTCERTIFICATE => "LintCertificate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCATYPE => "CAType"

    /**
     * @type {HSTRING}
     */
    static wszPROPSANITIZEDCANAME => "SanitizedCAName"

    /**
     * @type {HSTRING}
     */
    static wszPROPSANITIZEDSHORTNAME => "SanitizedShortName"

    /**
     * @type {HSTRING}
     */
    static wszPROPMACHINEDNSNAME => "MachineDNSName"

    /**
     * @type {HSTRING}
     */
    static wszPROPMODULEREGLOC => "ModuleRegistryLocation"

    /**
     * @type {HSTRING}
     */
    static wszPROPUSEDS => "fUseDS"

    /**
     * @type {HSTRING}
     */
    static wszPROPDELTACRLSDISABLED => "fDeltaCRLsDisabled"

    /**
     * @type {HSTRING}
     */
    static wszPROPSERVERUPGRADED => "fServerUpgraded"

    /**
     * @type {HSTRING}
     */
    static wszPROPCONFIGDN => "ConfigDN"

    /**
     * @type {HSTRING}
     */
    static wszPROPDOMAINDN => "DomainDN"

    /**
     * @type {HSTRING}
     */
    static wszPROPLOGLEVEL => "LogLevel"

    /**
     * @type {HSTRING}
     */
    static wszPROPSESSIONCOUNT => "SessionCount"

    /**
     * @type {HSTRING}
     */
    static wszPROPTEMPLATECHANGESEQUENCENUMBER => "TemplateChangeSequenceNumber"

    /**
     * @type {HSTRING}
     */
    static wszPROPVOLATILEMODE => "VolatileMode"

    /**
     * @type {HSTRING}
     */
    static wszLOCALIZEDTIMEPERIODUNITS => "LocalizedTimePeriodUnits"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTERCAACCESS => "RequesterCAAccess"

    /**
     * @type {HSTRING}
     */
    static wszPROPUSERDN => "UserDN"

    /**
     * @type {HSTRING}
     */
    static wszPROPKEYARCHIVED => "KeyArchived"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTCOUNT => "CertCount"

    /**
     * @type {HSTRING}
     */
    static wszPROPRAWCACERTIFICATE => "RawCACertificate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTSTATE => "CertState"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTSUFFIX => "CertSuffix"

    /**
     * @type {HSTRING}
     */
    static wszPROPRAWCRL => "RawCRL"

    /**
     * @type {HSTRING}
     */
    static wszPROPRAWDELTACRL => "RawDeltaCRL"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLINDEX => "CRLIndex"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLSTATE => "CRLState"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLSUFFIX => "CRLSuffix"

    /**
     * @type {HSTRING}
     */
    static wszPROPEVENTLOGTERSE => "EventLogTerse"

    /**
     * @type {HSTRING}
     */
    static wszPROPEVENTLOGERROR => "EventLogError"

    /**
     * @type {HSTRING}
     */
    static wszPROPEVENTLOGWARNING => "EventLogWarning"

    /**
     * @type {HSTRING}
     */
    static wszPROPEVENTLOGVERBOSE => "EventLogVerbose"

    /**
     * @type {HSTRING}
     */
    static wszPROPEVENTLOGEXHAUSTIVE => "EventLogExhaustive"

    /**
     * @type {HSTRING}
     */
    static wszPROPDCNAME => "DCName"

    /**
     * @type {HSTRING}
     */
    static wszPROPCROSSFOREST => "CrossForest"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTERSAMNAME => "RequesterSAMName"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTERUPN => "RequesterUPN"

    /**
     * @type {HSTRING}
     */
    static wszPROPREQUESTERDN => "RequesterDN"

    /**
     * @type {HSTRING}
     */
    static wszPROPSEAUDITID => "SEAuditId"

    /**
     * @type {HSTRING}
     */
    static wszPROPSEAUDITFILTER => "SEAuditFilter"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATEREQUESTID => "RequestID"

    /**
     * @type {HSTRING}
     */
    static wszPROPRAWCERTIFICATE => "RawCertificate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATEHASH => "CertificateHash"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATETEMPLATE => "CertificateTemplate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATEENROLLMENTFLAGS => "EnrollmentFlags"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATEGENERALFLAGS => "GeneralFlags"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATEPRIVATEKEYFLAGS => "PrivatekeyFlags"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATESERIALNUMBER => "SerialNumber"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATENOTBEFOREDATE => "NotBefore"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATENOTAFTERDATE => "NotAfter"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATESUBJECTKEYIDENTIFIER => "SubjectKeyIdentifier"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATERAWPUBLICKEY => "RawPublicKey"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATEPUBLICKEYLENGTH => "PublicKeyLength"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATEPUBLICKEYALGORITHM => "PublicKeyAlgorithm"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATERAWPUBLICKEYALGORITHMPARAMETERS => "RawPublicKeyAlgorithmParameters"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATEUPN => "UPN"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATETYPE => "CertificateType"

    /**
     * @type {HSTRING}
     */
    static wszPROPCERTIFICATERAWSMIMECAPABILITIES => "RawSMIMECapabilities"

    /**
     * @type {HSTRING}
     */
    static wszPROPNAMETYPE => "NameType"

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_CRITICAL_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_DISABLE_FLAG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_DELETE_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_POLICY_MASK => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_REQUEST => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_POLICY => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_ADMIN => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_SERVER => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_RENEWALCERT => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_IMPORTEDCERT => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_PKCS7 => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_CMC => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_CACERT => 589824

    /**
     * @type {Integer (UInt32)}
     */
    static EXTENSION_ORIGIN_MASK => 983040

    /**
     * @type {HSTRING}
     */
    static wszPROPEXTREQUESTID => "ExtensionRequestId"

    /**
     * @type {HSTRING}
     */
    static wszPROPEXTNAME => "ExtensionName"

    /**
     * @type {HSTRING}
     */
    static wszPROPEXTFLAGS => "ExtensionFlags"

    /**
     * @type {HSTRING}
     */
    static wszPROPEXTRAWVALUE => "ExtensionRawValue"

    /**
     * @type {HSTRING}
     */
    static wszPROPATTRIBREQUESTID => "AttributeRequestId"

    /**
     * @type {HSTRING}
     */
    static wszPROPATTRIBNAME => "AttributeName"

    /**
     * @type {HSTRING}
     */
    static wszPROPATTRIBVALUE => "AttributeValue"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLROWID => "CRLRowId"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLNUMBER => "CRLNumber"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLMINBASE => "CRLMinBase"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLNAMEID => "CRLNameId"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLCOUNT => "CRLCount"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLTHISUPDATE => "CRLThisUpdate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLNEXTUPDATE => "CRLNextUpdate"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLTHISPUBLISH => "CRLThisPublish"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLNEXTPUBLISH => "CRLNextPublish"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLEFFECTIVE => "CRLEffective"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLPROPAGATIONCOMPLETE => "CRLPropagationComplete"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLLASTPUBLISHED => "CRLLastPublished"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLPUBLISHATTEMPTS => "CRLPublishAttempts"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLPUBLISHFLAGS => "CRLPublishFlags"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLPUBLISHSTATUSCODE => "CRLPublishStatusCode"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLPUBLISHERROR => "CRLPublishError"

    /**
     * @type {HSTRING}
     */
    static wszPROPCRLRAWCRL => "CRLRawCRL"

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_BASE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_DELTA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_COMPLETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_SHADOW => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_CASTORE_ERROR => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_BADURL_ERROR => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_MANUAL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_SIGNATURE_ERROR => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_LDAP_ERROR => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_FILE_ERROR => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_FTP_ERROR => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_HTTP_ERROR => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_POSTPONED_BASE_LDAP_ERROR => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CPF_POSTPONED_BASE_FILE_ERROR => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static PROPTYPE_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static PROPCALLER_SERVER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static PROPCALLER_POLICY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static PROPCALLER_EXIT => 768

    /**
     * @type {Integer (UInt32)}
     */
    static PROPCALLER_ADMIN => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static PROPCALLER_REQUEST => 1280

    /**
     * @type {Integer (UInt32)}
     */
    static PROPCALLER_MASK => 3840

    /**
     * @type {Integer (UInt32)}
     */
    static PROPFLAGS_INDEXED => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_FORCETELETEX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_RENEWAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_FORCEUTF8 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_CAXCHGCERT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_ENROLLONBEHALFOF => 16

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_SUBJECTUNMODIFIED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_VALIDENCRYPTEDKEYHASH => 64

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_CACROSSCERT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_ENFORCEUTF8 => 256

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_DEFINEDCACERT => 512

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_CHALLENGEPENDING => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_CHALLENGESATISFIED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_TRUSTONUSE => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_TRUSTEKCERT => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_TRUSTEKKEY => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static CR_FLG_PUBLISHERROR => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_ACTIVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_PENDING => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_QUEUE_MAX => 9

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_FOREIGN => 12

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_CA_CERT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_CA_CERT_CHAIN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_KRA_CERT => 17

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_LOG_MIN => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_ISSUED => 20

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_REVOKED => 21

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_LOG_FAILED_MIN => 30

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_ERROR => 30

    /**
     * @type {Integer (UInt32)}
     */
    static DB_DISP_DENIED => 31

    /**
     * @type {Integer (UInt32)}
     */
    static VR_PENDING => 0

    /**
     * @type {Integer (UInt32)}
     */
    static VR_INSTANT_OK => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VR_INSTANT_BAD => 2

    /**
     * @type {HSTRING}
     */
    static wszCERT_TYPE => "RequestType"

    /**
     * @type {HSTRING}
     */
    static wszCERT_TYPE_CLIENT => "Client"

    /**
     * @type {HSTRING}
     */
    static wszCERT_TYPE_SERVER => "Server"

    /**
     * @type {HSTRING}
     */
    static wszCERT_TYPE_CODESIGN => "CodeSign"

    /**
     * @type {HSTRING}
     */
    static wszCERT_TYPE_CUSTOMER => "SetCustomer"

    /**
     * @type {HSTRING}
     */
    static wszCERT_TYPE_MERCHANT => "SetMerchant"

    /**
     * @type {HSTRING}
     */
    static wszCERT_TYPE_PAYMENT => "SetPayment"

    /**
     * @type {HSTRING}
     */
    static wszCERT_VERSION => "Version"

    /**
     * @type {HSTRING}
     */
    static wszCERT_VERSION_1 => "1"

    /**
     * @type {HSTRING}
     */
    static wszCERT_VERSION_2 => "2"

    /**
     * @type {HSTRING}
     */
    static wszCERT_VERSION_3 => "3"

    /**
     * @type {Integer (UInt32)}
     */
    static CV_OUT_HEXRAW => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CV_OUT_ENCODEMASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CV_OUT_NOCRLF => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static CV_OUT_NOCR => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static CVR_SEEK_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CVR_SEEK_MASK => 255

    /**
     * @type {Integer (UInt32)}
     */
    static CVR_SEEK_NODELTA => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static CVR_SORT_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static CVR_SORT_ASCEND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CVR_SORT_DESCEND => 2

    /**
     * @type {Integer (Int32)}
     */
    static CV_COLUMN_EXTENSION_DEFAULT => -4

    /**
     * @type {Integer (Int32)}
     */
    static CV_COLUMN_ATTRIBUTE_DEFAULT => -5

    /**
     * @type {Integer (Int32)}
     */
    static CV_COLUMN_CRL_DEFAULT => -6

    /**
     * @type {Integer (Int32)}
     */
    static CV_COLUMN_LOG_REVOKED_DEFAULT => -7

    /**
     * @type {Integer (UInt32)}
     */
    static CVRC_TABLE_MASK => 61440

    /**
     * @type {Integer (UInt32)}
     */
    static CVRC_TABLE_SHIFT => 12

    /**
     * @type {Integer (UInt32)}
     */
    static CRYPT_ENUM_ALL_PROVIDERS => 1

    /**
     * @type {Integer (Int32)}
     */
    static XEPR_ENUM_FIRST => -1

    /**
     * @type {Integer (UInt32)}
     */
    static XEPR_DATE => 5

    /**
     * @type {Integer (UInt32)}
     */
    static XEPR_TEMPLATENAME => 6

    /**
     * @type {Integer (UInt32)}
     */
    static XEPR_VERSION => 7

    /**
     * @type {Integer (UInt32)}
     */
    static XEPR_V1TEMPLATENAME => 9

    /**
     * @type {Integer (UInt32)}
     */
    static XEPR_V2TEMPLATEOID => 16

    /**
     * @type {Integer (UInt32)}
     */
    static XEKL_KEYSIZE_DEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static XECP_STRING_PROPERTY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XECI_DISABLE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static XECI_XENROLL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static XECI_AUTOENROLL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static XECI_REQWIZARD => 3

    /**
     * @type {Integer (UInt32)}
     */
    static XECI_CERTREQ => 4

    /**
     * @type {HSTRING}
     */
    static wszCMM_PROP_NAME => "Name"

    /**
     * @type {HSTRING}
     */
    static wszCMM_PROP_DESCRIPTION => "Description"

    /**
     * @type {HSTRING}
     */
    static wszCMM_PROP_COPYRIGHT => "Copyright"

    /**
     * @type {HSTRING}
     */
    static wszCMM_PROP_FILEVER => "File Version"

    /**
     * @type {HSTRING}
     */
    static wszCMM_PROP_PRODUCTVER => "Product Version"

    /**
     * @type {HSTRING}
     */
    static wszCMM_PROP_DISPLAY_HWND => "HWND"

    /**
     * @type {HSTRING}
     */
    static wszCMM_PROP_ISMULTITHREADED => "IsMultiThreaded"
;@endregion Constants

;@region Methods
    /**
     * Determines if a Certificate Services server is online; if the Certificate Services server is not online, backup operations will not be successful.
     * @remarks
     * Call this function to determine whether a Certificate Services server is online and available for backup operations.
     * 
     * This function's name in Certadm.dll is <b>CertSrvIsServerOnlineW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVISSERVERONLINEW</b> in the Certbcli.h header file.
     * @param {PWSTR} pwszServerName A pointer to the NetBIOS or DNS machine name of the server to check for online status.
     * @param {Pointer<BOOL>} pfServerOnline A pointer to Boolean value which will be <b>TRUE</b> if the Certificate Services server is online and <b>FALSE</b> if it is not online.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. This function will fail if Certificate Services is not running. If Certificate Services is running and ready to accept requests, this function will return S_OK, and *<i>pfServerOnline</i> will point to a value of <b>TRUE</b>. If Certificate Services is running in suspended (or paused) mode, this function will return S_OK, and *<i>pfServerOnline</i> will point to a value of <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvisserveronlinew
     * @since windowsserver2003
     */
    static CertSrvIsServerOnlineW(pwszServerName, pfServerOnline) {
        pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

        pfServerOnlineMarshal := pfServerOnline is VarRef ? "int*" : "ptr"

        result := DllCall("certadm.dll\CertSrvIsServerOnlineW", "ptr", pwszServerName, pfServerOnlineMarshal, pfServerOnline, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the list of Certificate Services dynamic file names that need to be backed up for the given backup context.
     * @remarks
     * Use this function to retrieve a list of the Certificate Services dynamic file names. These files are separate from the Certificate Services database and log files, and they are not backed up by the Certificate Services backup APIs. As a result, some other means must be used to back up the dynamic files. An example of a Certificate Services dynamic file is the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate revocation list</a> (CRL).
     * 
     * This function's name in the Certadm.dll is <b>CertSrvBackupGetDynamicFileListW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPGETDYNAMICFILELISTW</b> in the Certbcli.h header file.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @param {Pointer<PWSTR>} ppwszzFileList A pointer to a <b>WCHAR</b> pointer that will receive the list of null-terminated dynamic file names used by Certificate Services. There is a null character after every file name and an extra null character at the end of the list. The file name will be in the UNC form "&#92;&#92;<i>Server</i>&#92;<i>SharePoint</i>\…<i>Path</i>…&#92;<i>FileName</i>.ext". When you have finished using this allocated memory, free it by calling the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupfree">CertSrvBackupFree</a> function.
     * 
     * Before calling this function, setting *<i>ppwszzFileList</i> to <b>NULL</b> is optional.
     * @param {Pointer<Integer>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzFileList</i>.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackupgetdynamicfilelistw
     * @since windowsserver2003
     */
    static CertSrvBackupGetDynamicFileListW(hbc, ppwszzFileList, pcbSize) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
        ppwszzFileListMarshal := ppwszzFileList is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := DllCall("certadm.dll\CertSrvBackupGetDynamicFileListW", hbcMarshal, hbc, ppwszzFileListMarshal, ppwszzFileList, pcbSizeMarshal, pcbSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Used to prepare a Certificate Services server for backup operations.
     * @remarks
     * Before a Certificate Services backup can occur, it is necessary to create an <b>HCSBC</b> by means of <b>CertSrvBackupPrepare</b>. The resulting <b>HCSBC</b> is a necessary parameter of Certificate Services backup functions which can be used to list, open, read, and close files, as well as truncate the log files.
     * 
     * <div class="alert"><b>Note</b>  When the backup session is completed, it is necessary to call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupend">CertSrvBackupEnd</a> to release the <b>HCSBC</b> which resulted from the call to <b>CertSrvBackupPrepare</b>.</div>
     * <div> </div>
     * This function's name in Certadm.dll is <b>CertSrvBackupPrepareW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPPREPAREW</b> in the Certbcli.h header file.
     * 
     * To execute this call, you must have the backup <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privilege</a>. For details, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/setting-the-backup-and-restore-privileges">Setting the Backup and Restore Privileges</a>.
     * @param {PWSTR} pwszServerName A pointer to the machine name of the server to prepare for online backup. This name can be the NetBIOS name or the DNS name.
     * @param {Integer} grbitJet Value used by the database engine; this value should be set to zero.
     * @param {Integer} dwBackupFlags 
     * @param {Pointer<Pointer<Void>>} phbc A pointer to a Certificate Services backup context handle (<b>HCSBC</b>).
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success, and *<i>phbc</i> will be set to an <b>HCSBC</b> which can be used by other Certificate Services backup APIs.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackuppreparew
     * @since windowsserver2003
     */
    static CertSrvBackupPrepareW(pwszServerName, grbitJet, dwBackupFlags, phbc) {
        pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

        phbcMarshal := phbc is VarRef ? "ptr*" : "ptr"

        result := DllCall("certadm.dll\CertSrvBackupPrepareW", "ptr", pwszServerName, "uint", grbitJet, "uint", dwBackupFlags, phbcMarshal, phbc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the list of Certificate Services database file names that need to be backed up for the given backup context.
     * @remarks
     * This function's name in the Certadm.dll is <b>CertSrvBackupGetDatabaseNamesW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPGETDATABASENAMESW</b> in the Certbcli.h header file.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @param {Pointer<PWSTR>} ppwszzAttachmentInformation A pointer to a <b>WCHAR</b> pointer that will receive the list of null-terminated database file names. There is a null character after every file name and an extra null character at the end of the list. The file name will be in the UNC form "## \\\\<i>Server</i>\\<i>SharePoint</i>\…<i>Path</i>…\\<i>FileName</i>.ext". The directory names will have the same form but without the trailing "\\<i>FileName</i>.ext". The text "##" denotes a Certificate Services Backup file type (CSBFT_*) and is stored as a single non-null <a href="https://docs.microsoft.com/windows/desktop/SecGloss/u-gly">Unicode</a> character prefixed onto each UNC path. The type tag is defined in Certbcli.h and can be the following value for this function. 
     * 
     * 
     * 
     * 
     * 					
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CSBFT_CERTSERVER_DATABASE"></a><a id="csbft_certserver_database"></a><dl>
     * <dt><b>CSBFT_CERTSERVER_DATABASE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Certificate Services database file name including path.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * You must free this allocated memory when done by calling <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupfree">CertSrvBackupFree</a>. Before calling this function, setting *<i>ppwszzAttachmentInformation</i> to <b>NULL</b> is optional.
     * @param {Pointer<Integer>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzAttachmentInformation</i>.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw
     * @since windowsserver2003
     */
    static CertSrvBackupGetDatabaseNamesW(hbc, ppwszzAttachmentInformation, pcbSize) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
        ppwszzAttachmentInformationMarshal := ppwszzAttachmentInformation is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := DllCall("certadm.dll\CertSrvBackupGetDatabaseNamesW", hbcMarshal, hbc, ppwszzAttachmentInformationMarshal, ppwszzAttachmentInformation, pcbSizeMarshal, pcbSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Opens a file for backup.
     * @remarks
     * Use this function to open a file for backup purposes. When you have finished using the file, close the file by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupclose">CertSrvBackupClose</a> function.
     * 
     * The name of this  function in Certadm.dll is <b>CertSrvBackupOpenFileW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPOPENFILEW</b> in  Certbcli.h.
     * @param {Pointer<Void>} hbc A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">Certificate Services</a> backup context.
     * @param {PWSTR} pwszAttachmentName File name to open for backup purposes. This file name would be parsed from a list produced by means of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw">CertSrvBackupGetBackupLogs</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw">CertSrvBackupGetDatabaseNames</a>. Note that the names returned by <b>CertSrvBackupGetBackupLogs</b> and <b>CertSrvBackupGetDatabaseNames</b> must have the single-WCHAR CSBFT_* prefix stripped before <b>CertSrvBackupOpenFile</b> is called.
     * @param {Integer} cbReadHintSize Number of bytes used as a hint when the file is read by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupread">CertSrvBackupRead</a>. The <i>cbReadHintSize</i> parameter passed to the first <b>CertSrvBackupOpenFile</b> call for the backup context is used to size the read buffer. Pass zero for this parameter, and the buffer will be sized at a reasonably efficient size chosen by <b>CertSrvBackupOpenFile</b>. If insufficient memory is available, the buffer size will be reduced until memory allocation succeeds or until the buffer size reaches its minimum possible value. Pass a nonzero size to cause <b>CertSrvBackupOpenFile</b> to size the buffer to a power of two near the value of <i>cbReadHintSize</i>. The  implementation will choose only powers of two between 64 KB and 4 MB.
     * @param {Pointer<Integer>} pliFileSize A pointer to a <b>LARGE_INTEGER</b> value that represents the number of bytes in the file.
     * @returns {HRESULT} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackupopenfilew
     * @since windowsserver2003
     */
    static CertSrvBackupOpenFileW(hbc, pwszAttachmentName, cbReadHintSize, pliFileSize) {
        pwszAttachmentName := pwszAttachmentName is String ? StrPtr(pwszAttachmentName) : pwszAttachmentName

        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
        pliFileSizeMarshal := pliFileSize is VarRef ? "int64*" : "ptr"

        result := DllCall("certadm.dll\CertSrvBackupOpenFileW", hbcMarshal, hbc, "ptr", pwszAttachmentName, "uint", cbReadHintSize, pliFileSizeMarshal, pliFileSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Reads bytes from a Certificate Services file.
     * @remarks
     * After opening the file for backup purposes (using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupopenfilew">CertSrvBackupOpenFile</a>), call <b>CertSrvBackupRead</b> to retrieve the contents of the file, and call an application-specific routine to write the contents to a backup medium. <b>CertSrvBackupRead</b> and the application-specific routine can be placed in a loop until all the bytes of the file are read and backed up. When done reading the file, close it by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupclose">CertSrvBackupClose</a>.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @param {Pointer<Void>} pvBuffer Void pointer to storage which will contain bytes read from the file being backed up.
     * @param {Integer} cbBuffer Size of the storage area referenced by <i>pvBuffer</i>.
     * @param {Pointer<Integer>} pcbRead A pointer to a <b>DWORD</b> value which represents the actual number of bytes read by <b>CertSrvBackupRead</b>. The number of bytes read can be less than the size of the storage area allocated to <i>pvBuffer</i> if the end of the file has been reached.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackupread
     * @since windowsserver2003
     */
    static CertSrvBackupRead(hbc, pvBuffer, cbBuffer, pcbRead) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
        pvBufferMarshal := pvBuffer is VarRef ? "ptr" : "ptr"
        pcbReadMarshal := pcbRead is VarRef ? "uint*" : "ptr"

        result := DllCall("certadm.dll\CertSrvBackupRead", hbcMarshal, hbc, pvBufferMarshal, pvBuffer, "uint", cbBuffer, pcbReadMarshal, pcbRead, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Closes the file opened by the CertSrvBackupOpenFile function.
     * @remarks
     * For every successful call to <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupopenfilew">CertSrvBackupOpenFile</a>, there should be a subsequent call to <b>CertSrvBackupClose</b>. Upon completion of backing up a  file, the file needs to be closed.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackupclose
     * @since windowsserver2003
     */
    static CertSrvBackupClose(hbc) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

        result := DllCall("certadm.dll\CertSrvBackupClose", hbcMarshal, hbc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves the list of Certificate Services log file names that need to be backed up for the given backup context.
     * @remarks
     * The log files represent database activity (request submissions, certificate revocation, and so on) that has occurred since the last log file truncation. Log file volume increases as database activity occurs. The log files can be decreased in size by performing a backup and then calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackuptruncatelogs">CertSrvBackupTruncateLogs</a>.
     * 
     * This function's name in the Certadm.dll is <b>CertSrvBackupGetBackupLogsW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVBACKUPGETBACKUPLOGSW</b> in the Certbcli.h header file.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @param {Pointer<PWSTR>} ppwszzBackupLogFiles 
     * @param {Pointer<Integer>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzBackupLogFiles</i>.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw
     * @since windowsserver2003
     */
    static CertSrvBackupGetBackupLogsW(hbc, ppwszzBackupLogFiles, pcbSize) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
        ppwszzBackupLogFilesMarshal := ppwszzBackupLogFiles is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := DllCall("certadm.dll\CertSrvBackupGetBackupLogsW", hbcMarshal, hbc, ppwszzBackupLogFilesMarshal, ppwszzBackupLogFiles, pcbSizeMarshal, pcbSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Eliminates redundant records and reduces the disk storage space used by log files.
     * @remarks
     * After securing a backup of the database and log files, the log files can optionally be truncated. Log file volume increases with database activity, and truncating the log files will reduce the redundant records in the log files (thereby decreasing the disk space used to store the log files).
     * 
     * The log files are provided for database integrity and efficiency. If a less-than-graceful exit occurs with the Certificate Services application, the next time Certificate Services is started, the database replays the log files to prevent data corruption from being introduced into the database.
     * 
     * Depending on the volume of the log files, the log file replay can be a time-consuming process. During this replay, the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certification authority</a> will be unavailable for other activity. Note that if the Certificate Services application is properly halted (such as by stopping the service or by shutting down the operating system properly), the log files are not replayed the next time it is started.
     * 
     * <div class="alert"><b>Note</b>  If you call <b>CertSrvBackupTruncateLogs</b> without backing up all files returned from 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw">CertSrvBackupGetDatabaseNames</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw">CertSrvBackupGetBackupLogs</a>, you will not be able to restore the backup set successfully, resulting in an unusable Certificate Services machine. Therefore, call <b>CertSrvBackupTruncateLogs</b> only when the backup set contains all files returned from 
     * <b>CertSrvBackupGetDatabaseNames</b> and 
     * <b>CertSrvBackupGetBackupLogs</b>.</div>
     * <div> </div>
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackuptruncatelogs
     * @since windowsserver2003
     */
    static CertSrvBackupTruncateLogs(hbc) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

        result := DllCall("certadm.dll\CertSrvBackupTruncateLogs", hbcMarshal, hbc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Ends a Certificate Services backup session.
     * @remarks
     * Upon completion of a backup session, the session needs to be terminated by means of <b>CertSrvBackupEnd</b>. For every successful call to <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackuppreparew">CertSrvBackupPrepare</a>, there should be a call to <b>CertSrvBackupEnd</b>.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackupend
     * @since windowsserver2003
     */
    static CertSrvBackupEnd(hbc) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

        result := DllCall("certadm.dll\CertSrvBackupEnd", hbcMarshal, hbc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Used to free memory allocated from certain Certificate Services Backup APIs.
     * @remarks
     * Call this function when finished with memory allocated by using the following functions:
     * 
     * <ul>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw">CertSrvBackupGetBackupLogs</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw">CertSrvBackupGetDatabaseNames</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetdynamicfilelistw">CertSrvBackupGetDynamicFileList</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvservercontrolw">CertSrvServerControl</a>
     * </li>
     * <li>
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw">CertSrvRestoreGetDatabaseLocations</a>
     * </li>
     * </ul>
     * @param {Pointer<Void>} pv A pointer to the memory to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvbackupfree
     * @since windowsserver2003
     */
    static CertSrvBackupFree(pv) {
        pvMarshal := pv is VarRef ? "ptr" : "ptr"

        DllCall("certadm.dll\CertSrvBackupFree", pvMarshal, pv)
    }

    /**
     * Used both in backup and restore scenarios and retrieves the list of Certificate Services database location names for all the files being backed up or restored.
     * @remarks
     * Certificate Services must be running for this method to succeed.
     * 
     * This function's name in Certadm.dll is <b>CertSrvRestoreGetDatabaseLocationsW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVRESTOREGETDATABASELOCATIONSW</b> in the Certbcli.h header file.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup or restore context.
     * @param {Pointer<PWSTR>} ppwszzDatabaseLocationList 
     * @param {Pointer<Integer>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzDatabaseLocationList</i>.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw
     * @since windowsserver2003
     */
    static CertSrvRestoreGetDatabaseLocationsW(hbc, ppwszzDatabaseLocationList, pcbSize) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"
        ppwszzDatabaseLocationListMarshal := ppwszzDatabaseLocationList is VarRef ? "ptr*" : "ptr"
        pcbSizeMarshal := pcbSize is VarRef ? "uint*" : "ptr"

        result := DllCall("certadm.dll\CertSrvRestoreGetDatabaseLocationsW", hbcMarshal, hbc, ppwszzDatabaseLocationListMarshal, ppwszzDatabaseLocationList, pcbSizeMarshal, pcbSize, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Prepares a Certificate Services instance for restore operations.
     * @remarks
     * Before a Certificate Services restore operation can occur, it is necessary to create an <b>HCSBC</b> by means of <b>CertSrvRestorePrepare</b>. This <b>HCSBC</b> can be used by various Certificate Services restore functions.
     * 
     * <div class="alert"><b>Note</b>  When the restore session is completed, it is necessary to call <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreend">CertSrvRestoreEnd</a> to release the <b>HCSBC</b> which resulted from the call to <b>CertSrvRestorePrepare</b>.</div>
     * <div> </div>
     * This function's name in Certadm.dll is <b>CertSrvRestorePrepareW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVRESTOREPREPAREW</b> in the Certbcli.h header file.
     * 
     * To execute this call, you must have the restore <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">privilege</a>. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/setting-the-backup-and-restore-privileges">Setting the Backup and Restore Privileges</a>.
     * @param {PWSTR} pwszServerName A pointer to the computer name of the server to prepare for restore operations. This name can be the NetBIOS name or the DNS name.
     * @param {Integer} dwRestoreFlags A bitfield that represents the combination of values in the following table.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CSRESTORE_TYPE_FULL"></a><a id="csrestore_type_full"></a><dl>
     * <dt><b>CSRESTORE_TYPE_FULL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Restore Certificate Services database, logs, and related files.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Void>>} phbc A pointer to a Certificate Services backup context handle (<b>HCSBC</b>).
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success, and *<i>phbc</i> is set to an <b>HCSBC</b>, which can be used by other Certificate Services restore APIs.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvrestorepreparew
     * @since windowsserver2003
     */
    static CertSrvRestorePrepareW(pwszServerName, dwRestoreFlags, phbc) {
        pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

        phbcMarshal := phbc is VarRef ? "ptr*" : "ptr"

        result := DllCall("certadm.dll\CertSrvRestorePrepareW", "ptr", pwszServerName, "uint", dwRestoreFlags, phbcMarshal, phbc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a Certificate Services restore. (CertSrvRestoreRegisterW)
     * @remarks
     * Use this function to register a restore operation. All subsequent restore operations will be interlocked. The restore target will be prevented from starting (or successfully executing another call to <b>CertSrvRestoreRegister</b>) until 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregistercomplete">CertSrvRestoreRegisterComplete</a> is called.
     * 
     * When restoring more than one incremental backup, the order in which the incremental backups are registered does not matter. However, the full database backup must be registered before registering the incremental backups.
     * 
     * This function requires that the calling account be  a local administrator. If this is not practical, use the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregisterthroughfile">CertSrvRestoreRegisterThroughFile</a> function instead. The <b>CertSrvRestoreRegisterThroughFile</b> function only requires that the calling account have the restore privilege.
     * @param {Pointer<Void>} hbc A handle to the Certificate Services restore context. This handle is obtained by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestorepreparew">CertSrvRestorePrepare</a> function.
     * @param {PWSTR} pwszCheckPointFilePath A pointer to a null-terminated Unicode string that contains the restore path for the check point file. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {PWSTR} pwszLogPath A pointer to a null-terminated Unicode string that contains the current log file directory. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Pointer<CSEDB_RSTMAPW>} rgrstmap An array of <b>CSEDB_RSTMAP</b> structures that contains the restore map. If you are performing a full database restoration, this parameter specifies the name of the backup database, as well as a new name for the database after it is restored. The backup database name is referenced by the <b>pwszDatabaseName</b> member, and the new database name is referenced by the <b>pwszNewDatabaseName</b> member. If the intent is to maintain the same name for both the backup database and the restored database, set both the <b>pwszNewDatabaseName</b> and the <b>pwszDatabaseName</b> members to the same name. The backup database name is constructed from the path returned by the backup client's call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw">CertSrvRestoreGetDatabaseLocations</a> function. <b>CertSrvRestoreGetDatabaseLocations</b> would have been called during a full backup, and the backup client would have saved the returned path.
     * 
     * If you are performing an incremental restoration, pass <b>NULL</b> for this parameter.
     * @param {Integer} crstmap The number of elements in the <i>rgrstmap</i> array. Pass zero for this parameter if you are performing an incremental restoration.
     * @param {PWSTR} pwszBackupLogPath A pointer to a null-terminated Unicode string that contains the path for the backup log directory. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Integer} genLow The lowest log number that was restored in this restore session. Log files are in the form of edbXXXXX.log, where XXXXX is a five hexadecimal digit value. For example, edb00001.log is the first log file created by the internal database. For purposes of this function, a value of one in <i>genLow</i> corresponds to the log file edb00001.log.
     * @param {Integer} genHigh The highest log number that was restored in this restore session.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvrestoreregisterw
     * @since windowsserver2003
     */
    static CertSrvRestoreRegisterW(hbc, pwszCheckPointFilePath, pwszLogPath, rgrstmap, crstmap, pwszBackupLogPath, genLow, genHigh) {
        pwszCheckPointFilePath := pwszCheckPointFilePath is String ? StrPtr(pwszCheckPointFilePath) : pwszCheckPointFilePath
        pwszLogPath := pwszLogPath is String ? StrPtr(pwszLogPath) : pwszLogPath
        pwszBackupLogPath := pwszBackupLogPath is String ? StrPtr(pwszBackupLogPath) : pwszBackupLogPath

        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

        result := DllCall("certadm.dll\CertSrvRestoreRegisterW", hbcMarshal, hbc, "ptr", pwszCheckPointFilePath, "ptr", pwszLogPath, "ptr", rgrstmap, "int", crstmap, "ptr", pwszBackupLogPath, "uint", genLow, "uint", genHigh, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Registers a Certificate Services restore. (CertSrvRestoreRegisterThroughFile)
     * @remarks
     * This function is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregisterw">CertSrvRestoreRegister</a> function except that <b>CertSrvRestoreRegister</b> requires the calling account to be a local administrator. The <b>CertSrvRestoreRegisterThroughFile</b> function only requires that the calling account have the restore privilege.
     * @param {Pointer<Void>} hbc A handle to the Certificate Services restore context. This handle is obtained by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestorepreparew">CertSrvRestorePrepare</a> function.
     * @param {PWSTR} pwszCheckPointFilePath A pointer to a null-terminated Unicode string that contains the restore path for the check point file. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {PWSTR} pwszLogPath A pointer to a null-terminated Unicode string that contains the current log file directory. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Pointer<CSEDB_RSTMAPW>} rgrstmap An array of <b>CSEDB_RSTMAP</b> structures that contains the restore map. If you are performing a full database restoration, this parameter specifies the name of the backup database, as well as a new name for the database after it is restored. The backup database name is referenced by the <b>pwszDatabaseName</b> member, and the new database name is referenced by the <b>pwszNewDatabaseName</b> member. If the intent is to maintain the same name for both the backup database and the restored database, set both the <b>pwszNewDatabaseName</b> and the <b>pwszDatabaseName</b> members to the same name. The backup database name is constructed from the path returned by the backup client's call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw">CertSrvRestoreGetDatabaseLocations</a> function. <b>CertSrvRestoreGetDatabaseLocations</b> would have been called during a full backup, and the backup client would have saved the returned path.
     * 
     * If you are performing an incremental restoration, set this parameter to <b>NULL</b>.
     * @param {Integer} crstmap The number of elements in the <i>rgrstmap</i> array. Set this value to one if a you are performing a full restoration, or zero if you are performing an incremental restoration.
     * @param {PWSTR} pwszBackupLogPath A pointer to a null-terminated Unicode string that contains the path for the backup log directory. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Integer} genLow The lowest log number that was restored in this restore session. Log files are in the form of edbXXXXX.log, where XXXXX is a five hexadecimal digit value. For example, edb00001.log is the first log file created by the internal database. For purposes of this function, a value of one in <i>genLow</i> corresponds to the log file edb00001.log.
     * @param {Integer} genHigh The highest log number that was restored in this restore session.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvrestoreregisterthroughfile
     * @since windowsserver2003
     */
    static CertSrvRestoreRegisterThroughFile(hbc, pwszCheckPointFilePath, pwszLogPath, rgrstmap, crstmap, pwszBackupLogPath, genLow, genHigh) {
        pwszCheckPointFilePath := pwszCheckPointFilePath is String ? StrPtr(pwszCheckPointFilePath) : pwszCheckPointFilePath
        pwszLogPath := pwszLogPath is String ? StrPtr(pwszLogPath) : pwszLogPath
        pwszBackupLogPath := pwszBackupLogPath is String ? StrPtr(pwszBackupLogPath) : pwszBackupLogPath

        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

        result := DllCall("certadm.dll\CertSrvRestoreRegisterThroughFile", hbcMarshal, hbc, "ptr", pwszCheckPointFilePath, "ptr", pwszLogPath, "ptr", rgrstmap, "int", crstmap, "ptr", pwszBackupLogPath, "uint", genLow, "uint", genHigh, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Completes a registered Certificate Services restore operation.
     * @remarks
     * If a registered restore operation is not completed, Certificate Services will not start.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services restore context. You must set this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregisterw">CertSrvRestoreRegister</a> before using it in <b>CertSrvRestoreRegisterComplete</b>.
     * @param {HRESULT} hrRestoreState <b>HRESULT</b> value indicating the success code for the restore operation. Set this value to S_OK if the restore operation was successful.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvrestoreregistercomplete
     * @since windowsserver2003
     */
    static CertSrvRestoreRegisterComplete(hbc, hrRestoreState) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

        result := DllCall("certadm.dll\CertSrvRestoreRegisterComplete", hbcMarshal, hbc, "int", hrRestoreState, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Ends a Certificate Services restore session.
     * @remarks
     * When a restore session is complete, terminate the session by calling <b>CertSrvRestoreEnd</b>. For every successful call to <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestorepreparew">CertSrvRestorePrepare</a>, there should be a call to <b>CertSrvRestoreEnd</b>.
     * 
     * When a restore is complete, it is important that you make a new full backup of the Certificate Services database. This is necessary to truncate the restored log files and to establish a base backup set for future restores. Backups performed after a restore cannot be mixed with backups (full or incremental) taken before the restore; that is, after a certificate services database is restored and has progressed to a subsequent state, you cannot use the pre-restoration backups to restore the database to that subsequent state.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvrestoreend
     * @since windowsserver2003
     */
    static CertSrvRestoreEnd(hbc) {
        hbcMarshal := hbc is VarRef ? "ptr" : "ptr"

        result := DllCall("certadm.dll\CertSrvRestoreEnd", hbcMarshal, hbc, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Issues a service control command to programmatically stop Certificate Services.
     * @remarks
     * The purpose of this function is to allow a backup or restore application to programmatically stop the Certificate Services application (thereby not requiring the use of the service controller APIs). Stopping Certificate Services in this manner will also work when Certificate Services is running in console mode; the service controller APIs cannot control applications running in console mode.
     * 
     * This function's name in Certadm.dll is <b>CertSrvServerControlW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVSERVERCONTROLW</b> in the Certbcli.h header file.
     * @param {PWSTR} pwszServerName A pointer to a name or a configuration string of the server to be issued the control command.
     * @param {Integer} dwControlFlags Value representing the control command being issued to the Certificate Services server specified by <i>pwszServerName</i>. The following value is supported for <i>dwControlFlags</i>.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="CSCONTROL_SHUTDOWN"></a><a id="cscontrol_shutdown"></a><dl>
     * <dt><b>CSCONTROL_SHUTDOWN</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Stop Certificate Services.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Integer>} pcbOut For future use, this parameter will be the number of bytes allocated to <i>ppbOut</i>. The current implementation does not allocate memory to <i>ppbOut</i>. You can set this value to <b>NULL</b>.
     * @param {Pointer<Pointer<Integer>>} ppbOut For future use, this parameter will be the pointer to pointer to bytes representing the output from the issued command. The current implementation does not allocate memory to <i>ppbOut</i>. You can set this value to <b>NULL</b>.
     * @returns {HRESULT} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api//content/certbcli/nf-certbcli-certsrvservercontrolw
     * @since windowsserver2003
     */
    static CertSrvServerControlW(pwszServerName, dwControlFlags, pcbOut, ppbOut) {
        pwszServerName := pwszServerName is String ? StrPtr(pwszServerName) : pwszServerName

        pcbOutMarshal := pcbOut is VarRef ? "uint*" : "ptr"
        ppbOutMarshal := ppbOut is VarRef ? "ptr*" : "ptr"

        result := DllCall("certadm.dll\CertSrvServerControlW", "ptr", pwszServerName, "uint", dwControlFlags, pcbOutMarshal, pcbOut, ppbOutMarshal, ppbOut, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * Retrieves a list of certification authorities (CAs) trusted by the specified server.
     * @param {Pointer<UNICODE_STRING>} pTargetName The name of the server to check.
     * @param {Integer} cCriteria The number of elements in the <i>rgpCriteria</i> array.
     * @param {Pointer<CERT_SELECT_CRITERIA>} rgpCriteria A constant pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_select_criteria">CERT_SELECT_CRITERIA</a> structures that specify the criteria used to select certificate chains.
     * @param {Pointer<Pointer<SecPkgContext_IssuerListInfoEx>>} ppTrustedIssuers A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-secpkgcontext_issuerlistinfoex">SecPkgContext_IssuerListInfoEx</a> structures that receive the CAs trusted by the server specified by the <i>pTargetName</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/certpoleng/nf-certpoleng-pstgettrustanchors
     * @since windows6.1
     */
    static PstGetTrustAnchors(pTargetName, cCriteria, rgpCriteria, ppTrustedIssuers) {
        ppTrustedIssuersMarshal := ppTrustedIssuers is VarRef ? "ptr*" : "ptr"

        result := DllCall("certpoleng.dll\PstGetTrustAnchors", "ptr", pTargetName, "uint", cCriteria, "ptr", rgpCriteria, ppTrustedIssuersMarshal, ppTrustedIssuers, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} pTargetName 
     * @param {Integer} cCriteria 
     * @param {Pointer<CERT_SELECT_CRITERIA>} rgpCriteria 
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @param {Pointer<Pointer<SecPkgContext_IssuerListInfoEx>>} ppTrustedIssuers 
     * @returns {NTSTATUS} 
     */
    static PstGetTrustAnchorsEx(pTargetName, cCriteria, rgpCriteria, pCertContext, ppTrustedIssuers) {
        ppTrustedIssuersMarshal := ppTrustedIssuers is VarRef ? "ptr*" : "ptr"

        result := DllCall("certpoleng.dll\PstGetTrustAnchorsEx", "ptr", pTargetName, "uint", cCriteria, "ptr", rgpCriteria, "ptr", pCertContext, ppTrustedIssuersMarshal, ppTrustedIssuers, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pCert 
     * @param {Pointer<SecPkgContext_IssuerListInfoEx>} pTrustedIssuers 
     * @param {Pointer<Pointer<CERT_CHAIN_CONTEXT>>} ppCertChainContext 
     * @returns {NTSTATUS} 
     */
    static PstGetCertificateChain(pCert, pTrustedIssuers, ppCertChainContext) {
        ppCertChainContextMarshal := ppCertChainContext is VarRef ? "ptr*" : "ptr"

        result := DllCall("certpoleng.dll\PstGetCertificateChain", "ptr", pCert, "ptr", pTrustedIssuers, ppCertChainContextMarshal, ppCertChainContext, "int")
        return result
    }

    /**
     * Retrieves certificate chains that specify certificates that can be used to authenticate a user on the specified server.
     * @param {Pointer<UNICODE_STRING>} pTargetName The name of the server to check.
     * @param {Integer} cCriteria The number of elements in the <i>rgpCriteria</i> array.
     * @param {Pointer<CERT_SELECT_CRITERIA>} rgpCriteria A constant pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_select_criteria">CERT_SELECT_CRITERIA</a> structures that specify the criteria used to select certificate chains.
     * @param {BOOL} bIsClient <b>TRUE</b> if the caller is the client; otherwise, <b>FALSE</b>.
     * @param {Pointer<Integer>} pdwCertChainContextCount The number of elements in the <i>ppCertChainContexts</i> array.
     * @param {Pointer<Pointer<Pointer<CERT_CHAIN_CONTEXT>>>} ppCertChainContexts The address of a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structures that specifies the certificate chains of certificates that can be used to authenticate a user on the server specified by the <i>pTargetName</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/certpoleng/nf-certpoleng-pstgetcertificates
     * @since windows6.1
     */
    static PstGetCertificates(pTargetName, cCriteria, rgpCriteria, bIsClient, pdwCertChainContextCount, ppCertChainContexts) {
        pdwCertChainContextCountMarshal := pdwCertChainContextCount is VarRef ? "uint*" : "ptr"
        ppCertChainContextsMarshal := ppCertChainContexts is VarRef ? "ptr*" : "ptr"

        result := DllCall("certpoleng.dll\PstGetCertificates", "ptr", pTargetName, "uint", cCriteria, "ptr", rgpCriteria, "int", bIsClient, pdwCertChainContextCountMarshal, pdwCertChainContextCount, ppCertChainContextsMarshal, ppCertChainContexts, "int")
        return result
    }

    /**
     * Associates the caller's private key with the specified certificate.
     * @param {Pointer<CERT_CONTEXT>} pCert The certificate with which to associate the private key.
     * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/certpoleng/nf-certpoleng-pstacquireprivatekey
     * @since windows6.1
     */
    static PstAcquirePrivateKey(pCert) {
        result := DllCall("certpoleng.dll\PstAcquirePrivateKey", "ptr", pCert, "int")
        return result
    }

    /**
     * Validates the specified certificate.
     * @param {Pointer<UNICODE_STRING>} pTargetName The name of the server. If the caller is not the client, this parameter is <b>NULL</b>.
     * @param {BOOL} bIsClient <b>TRUE</b> if the caller is the client; otherwise, <b>FALSE</b>.
     * @param {Pointer<CERT_USAGE_MATCH>} pRequestedIssuancePolicy A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_usage_match">CERT_USAGE_MATCH</a> structure that specifies identifiers that the certificate must match to be validated.
     * @param {Pointer<HCERTSTORE>} phAdditionalCertStore A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> that contains additional certificates used for the authentication.
     * @param {Pointer<CERT_CONTEXT>} pCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate to validate.
     * @param {Pointer<Guid>} pProvGUID A pointer to  a <b>GUID</b> structure that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP) used for the authentication.
     * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/certpoleng/nf-certpoleng-pstvalidate
     * @since windows6.1
     */
    static PstValidate(pTargetName, bIsClient, pRequestedIssuancePolicy, phAdditionalCertStore, pCert, pProvGUID) {
        result := DllCall("certpoleng.dll\PstValidate", "ptr", pTargetName, "int", bIsClient, "ptr", pRequestedIssuancePolicy, "ptr", phAdditionalCertStore, "ptr", pCert, "ptr", pProvGUID, "int")
        return result
    }

    /**
     * Retrieves a structure that specifies information that can be used to create a user token associated with the specified certificate.
     * @param {Pointer<CERT_CONTEXT>} pCert A constant pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate for which to obtain token information.
     * @param {Pointer<Integer>} pTokenInformationType A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ne-ntsecpkg-lsa_token_information_type">LSA_TOKEN_INFORMATION_TYPE</a> enumeration that indicates the type of structure pointed to by the <i>ppTokenInformation</i> parameter.
     * @param {Pointer<Pointer<Void>>} ppTokenInformation The address of a pointer to a structure that specifies information that can be used to create a user token.
     * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/certpoleng/nf-certpoleng-pstmapcertificate
     * @since windows6.1
     */
    static PstMapCertificate(pCert, pTokenInformationType, ppTokenInformation) {
        pTokenInformationTypeMarshal := pTokenInformationType is VarRef ? "int*" : "ptr"
        ppTokenInformationMarshal := ppTokenInformation is VarRef ? "ptr*" : "ptr"

        result := DllCall("certpoleng.dll\PstMapCertificate", "ptr", pCert, pTokenInformationTypeMarshal, pTokenInformationType, ppTokenInformationMarshal, ppTokenInformation, "int")
        return result
    }

    /**
     * Retrieves the user name associated with the specified certificate.
     * @param {Pointer<CERT_CONTEXT>} pCertContext A constant pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate for which to obtain the user name.
     * @param {Pointer<UNICODE_STRING>} UserName The user name associated with the certificate specified by the <i>pCertContext</i> parameter.
     * @returns {NTSTATUS} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api//content/certpoleng/nf-certpoleng-pstgetusernameforcertificate
     * @since windows6.1
     */
    static PstGetUserNameForCertificate(pCertContext, UserName) {
        result := DllCall("certpoleng.dll\PstGetUserNameForCertificate", "ptr", pCertContext, "ptr", UserName, "int")
        return result
    }

;@endregion Methods
}
