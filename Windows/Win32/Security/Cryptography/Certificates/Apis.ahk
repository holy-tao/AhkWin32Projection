#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 * @version v4.0.30319
 */
class Certificates {

;@region Constants

    /**
     * @type {String}
     */
    static wszREGKEYNOSYSTEMCERTSVCPATH => "CurrentControlSet\Services\CertSvc"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszOCSPCAPROP_CACERTIFICATE => "CACertificate"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_HASHALGORITHMID => "HashAlgorithmId"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_SIGNINGFLAGS => "SigningFlags"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_REMINDERDURATION => "ReminderDuration"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_SIGNINGCERTIFICATE => "SigningCertificate"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_CSPNAME => "CSPName"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_KEYSPEC => "KeySpec"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_ERRORCODE => "ErrorCode"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_PROVIDERCLSID => "ProviderCLSID"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_PROVIDERPROPERTIES => "Provider"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_LOCALREVOCATIONINFORMATION => "LocalRevocationInformation"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_SIGNINGCERTIFICATETEMPLATE => "SigningCertificateTemplate"

    /**
     * @type {String}
     */
    static wszOCSPCAPROP_CACONFIG => "CAConfig"

    /**
     * @type {String}
     */
    static wszOCSPPROP_LOGLEVEL => "LogLevel"

    /**
     * @type {String}
     */
    static wszOCSPPROP_DEBUG => "Debug"

    /**
     * @type {String}
     */
    static wszOCSPPROP_AUDITFILTER => "AuditFilter"

    /**
     * @type {String}
     */
    static wszOCSPPROP_ARRAYCONTROLLER => "ArrayController"

    /**
     * @type {String}
     */
    static wszOCSPPROP_ARRAYMEMBERS => "ArrayMembers"

    /**
     * @type {String}
     */
    static wszOCSPPROP_ENROLLPOLLINTERVAL => "EnrollPollInterval"

    /**
     * @type {String}
     */
    static wszOCSPISAPIPROP_VIRTUALROOTNAME => "VirtualRootName"

    /**
     * @type {String}
     */
    static wszOCSPISAPIPROP_NUMOFTHREADS => "NumOfThreads"

    /**
     * @type {String}
     */
    static wszOCSPISAPIPROP_NUMOFBACKENDCONNECTIONS => "NumOfBackendConnections"

    /**
     * @type {String}
     */
    static wszOCSPISAPIPROP_REFRESHRATE => "RefreshRate"

    /**
     * @type {String}
     */
    static wszOCSPISAPIPROP_MAXNUMOFCACHEENTRIES => "MaxNumOfCacheEntries"

    /**
     * @type {String}
     */
    static wszOCSPISAPIPROP_MAXAGE => "MaxAge"

    /**
     * @type {String}
     */
    static wszOCSPISAPIPROP_DEBUG => "ISAPIDebug"

    /**
     * @type {String}
     */
    static wszOCSPCOMMONPROP_REQFLAGS => "RequestFlags"

    /**
     * @type {String}
     */
    static wszOCSPCOMMONPROP_MAXINCOMINGMESSAGESIZE => "MaxIncomingMessageSize"

    /**
     * @type {String}
     */
    static wszOCSPCOMMONPROP_MAXNUMOFREQUESTENTRIES => "MaxNumOfRequestEntries"

    /**
     * @type {String}
     */
    static wszOCSPREVPROP_CRLURLTIMEOUT => "CrlUrlTimeOut"

    /**
     * @type {String}
     */
    static wszOCSPREVPROP_BASECRLURLS => "BaseCrlUrls"

    /**
     * @type {String}
     */
    static wszOCSPREVPROP_SERIALNUMBERSDIRS => "IssuedSerialNumbersDirectories"

    /**
     * @type {String}
     */
    static wszOCSPREVPROP_BASECRL => "BaseCrl"

    /**
     * @type {String}
     */
    static wszOCSPREVPROP_DELTACRLURLS => "DeltaCrlUrls"

    /**
     * @type {String}
     */
    static wszOCSPREVPROP_DELTACRL => "DeltaCrl"

    /**
     * @type {String}
     */
    static wszOCSPREVPROP_REFRESHTIMEOUT => "RefreshTimeOut"

    /**
     * @type {String}
     */
    static wszOCSPREVPROP_ERRORCODE => "RevocationErrorCode"

    /**
     * @type {String}
     */
    static szBACKUPANNOTATION => "Cert Server Backup Interface"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszCONFIG_COMMONNAME => "CommonName"

    /**
     * @type {String}
     */
    static wszCONFIG_ORGUNIT => "OrgUnit"

    /**
     * @type {String}
     */
    static wszCONFIG_ORGANIZATION => "Organization"

    /**
     * @type {String}
     */
    static wszCONFIG_LOCALITY => "Locality"

    /**
     * @type {String}
     */
    static wszCONFIG_STATE => "State"

    /**
     * @type {String}
     */
    static wszCONFIG_COUNTRY => "Country"

    /**
     * @type {String}
     */
    static wszCONFIG_CONFIG => "Config"

    /**
     * @type {String}
     */
    static wszCONFIG_EXCHANGECERTIFICATE => "ExchangeCertificate"

    /**
     * @type {String}
     */
    static wszCONFIG_SIGNATURECERTIFICATE => "SignatureCertificate"

    /**
     * @type {String}
     */
    static wszCONFIG_DESCRIPTION => "Description"

    /**
     * @type {String}
     */
    static wszCONFIG_COMMENT => "Comment"

    /**
     * @type {String}
     */
    static wszCONFIG_SERVER => "Server"

    /**
     * @type {String}
     */
    static wszCONFIG_AUTHORITY => "Authority"

    /**
     * @type {String}
     */
    static wszCONFIG_SANITIZEDNAME => "SanitizedName"

    /**
     * @type {String}
     */
    static wszCONFIG_SHORTNAME => "ShortName"

    /**
     * @type {String}
     */
    static wszCONFIG_SANITIZEDSHORTNAME => "SanitizedShortName"

    /**
     * @type {String}
     */
    static wszCONFIG_FLAGS => "Flags"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszSERVICE_NAME => "CertSvc"

    /**
     * @type {String}
     */
    static wszREGKEYBASE => "SYSTEM\CurrentControlSet\Services\CertSvc"

    /**
     * @type {String}
     */
    static wszREGKEYCONFIG => "Configuration"

    /**
     * @type {String}
     */
    static wszREGACTIVE => "Active"

    /**
     * @type {String}
     */
    static wszREGDIRECTORY => "ConfigurationDirectory"

    /**
     * @type {String}
     */
    static wszREGDBDIRECTORY => "DBDirectory"

    /**
     * @type {String}
     */
    static wszREGDBLOGDIRECTORY => "DBLogDirectory"

    /**
     * @type {String}
     */
    static wszREGDBSYSDIRECTORY => "DBSystemDirectory"

    /**
     * @type {String}
     */
    static wszREGDBTEMPDIRECTORY => "DBTempDirectory"

    /**
     * @type {String}
     */
    static wszREGDBSESSIONCOUNT => "DBSessionCount"

    /**
     * @type {String}
     */
    static wszREGDBMAXREADSESSIONCOUNT => "DBMaxReadSessionCount"

    /**
     * @type {String}
     */
    static wszREGDBFLAGS => "DBFlags"

    /**
     * @type {String}
     */
    static wszREGDBLASTFULLBACKUP => "DBLastFullBackup"

    /**
     * @type {String}
     */
    static wszREGDBLASTINCREMENTALBACKUP => "DBLastIncrementalBackup"

    /**
     * @type {String}
     */
    static wszREGDBLASTRECOVERY => "DBLastRecovery"

    /**
     * @type {String}
     */
    static wszREGWEBCLIENTCAMACHINE => "WebClientCAMachine"

    /**
     * @type {String}
     */
    static wszREGVERSION => "Version"

    /**
     * @type {String}
     */
    static wszREGWEBCLIENTCANAME => "WebClientCAName"

    /**
     * @type {String}
     */
    static wszREGWEBCLIENTCATYPE => "WebClientCAType"

    /**
     * @type {String}
     */
    static wszREGLDAPFLAGS => "LDAPFlags"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszREGKEYRESTOREINPROGRESS => "RestoreInProgress"

    /**
     * @type {String}
     */
    static wszREGKEYDBPARAMETERS => "DBParameters"

    /**
     * @type {String}
     */
    static wszREGCADESCRIPTION => "CADescription"

    /**
     * @type {String}
     */
    static wszREGCACERTHASH => "CACertHash"

    /**
     * @type {String}
     */
    static wszREGCASERIALNUMBER => "CACertSerialNumber"

    /**
     * @type {String}
     */
    static wszREGCAXCHGCERTHASH => "CAXchgCertHash"

    /**
     * @type {String}
     */
    static wszREGKRACERTHASH => "KRACertHash"

    /**
     * @type {String}
     */
    static wszREGKRACERTCOUNT => "KRACertCount"

    /**
     * @type {String}
     */
    static wszREGKRAFLAGS => "KRAFlags"

    /**
     * @type {String}
     */
    static wszREGCATYPE => "CAType"

    /**
     * @type {String}
     */
    static wszREGCERTENROLLCOMPATIBLE => "CertEnrollCompatible"

    /**
     * @type {String}
     */
    static wszREGENFORCEX500NAMELENGTHS => "EnforceX500NameLengths"

    /**
     * @type {String}
     */
    static wszREGCOMMONNAME => "CommonName"

    /**
     * @type {String}
     */
    static wszREGCLOCKSKEWMINUTES => "ClockSkewMinutes"

    /**
     * @type {String}
     */
    static wszREGCRLNEXTPUBLISH => "CRLNextPublish"

    /**
     * @type {String}
     */
    static wszREGCRLPERIODSTRING => "CRLPeriod"

    /**
     * @type {String}
     */
    static wszREGCRLPERIODCOUNT => "CRLPeriodUnits"

    /**
     * @type {String}
     */
    static wszREGCRLOVERLAPPERIODSTRING => "CRLOverlapPeriod"

    /**
     * @type {String}
     */
    static wszREGCRLOVERLAPPERIODCOUNT => "CRLOverlapUnits"

    /**
     * @type {String}
     */
    static wszREGCRLDELTANEXTPUBLISH => "CRLDeltaNextPublish"

    /**
     * @type {String}
     */
    static wszREGCRLDELTAPERIODSTRING => "CRLDeltaPeriod"

    /**
     * @type {String}
     */
    static wszREGCRLDELTAPERIODCOUNT => "CRLDeltaPeriodUnits"

    /**
     * @type {String}
     */
    static wszREGCRLDELTAOVERLAPPERIODSTRING => "CRLDeltaOverlapPeriod"

    /**
     * @type {String}
     */
    static wszREGCRLDELTAOVERLAPPERIODCOUNT => "CRLDeltaOverlapUnits"

    /**
     * @type {String}
     */
    static wszREGCRLPUBLICATIONURLS => "CRLPublicationURLs"

    /**
     * @type {String}
     */
    static wszREGCACERTPUBLICATIONURLS => "CACertPublicationURLs"

    /**
     * @type {String}
     */
    static wszREGCAXCHGVALIDITYPERIODSTRING => "CAXchgValidityPeriod"

    /**
     * @type {String}
     */
    static wszREGCAXCHGVALIDITYPERIODCOUNT => "CAXchgValidityPeriodUnits"

    /**
     * @type {String}
     */
    static wszREGCAXCHGOVERLAPPERIODSTRING => "CAXchgOverlapPeriod"

    /**
     * @type {String}
     */
    static wszREGCAXCHGOVERLAPPERIODCOUNT => "CAXchgOverlapPeriodUnits"

    /**
     * @type {String}
     */
    static wszREGCRLPATH_OLD => "CRLPath"

    /**
     * @type {String}
     */
    static wszREGCRLEDITFLAGS => "CRLEditFlags"

    /**
     * @type {String}
     */
    static wszREGCRLFLAGS => "CRLFlags"

    /**
     * @type {String}
     */
    static wszREGCRLATTEMPTREPUBLISH => "CRLAttemptRepublish"

    /**
     * @type {String}
     */
    static wszREGENABLED => "Enabled"

    /**
     * @type {String}
     */
    static wszREGFORCETELETEX => "ForceTeletex"

    /**
     * @type {String}
     */
    static wszREGLOGLEVEL => "LogLevel"

    /**
     * @type {String}
     */
    static wszREGHIGHSERIAL => "HighSerial"

    /**
     * @type {String}
     */
    static wszREGPOLICYFLAGS => "PolicyFlags"

    /**
     * @type {String}
     */
    static wszREGNAMESEPARATOR => "SubjectNameSeparator"

    /**
     * @type {String}
     */
    static wszREGSUBJECTTEMPLATE => "SubjectTemplate"

    /**
     * @type {String}
     */
    static wszREGCAUSEDS => "UseDS"

    /**
     * @type {String}
     */
    static wszREGVALIDITYPERIODSTRING => "ValidityPeriod"

    /**
     * @type {String}
     */
    static wszREGVALIDITYPERIODCOUNT => "ValidityPeriodUnits"

    /**
     * @type {String}
     */
    static wszREGPARENTCAMACHINE => "ParentCAMachine"

    /**
     * @type {String}
     */
    static wszREGPARENTCANAME => "ParentCAName"

    /**
     * @type {String}
     */
    static wszREGREQUESTFILENAME => "RequestFileName"

    /**
     * @type {String}
     */
    static wszREGREQUESTID => "RequestId"

    /**
     * @type {String}
     */
    static wszREGREQUESTKEYCONTAINER => "RequestKeyContainer"

    /**
     * @type {String}
     */
    static wszREGREQUESTKEYINDEX => "RequestKeyIndex"

    /**
     * @type {String}
     */
    static wszREGCASERVERNAME => "CAServerName"

    /**
     * @type {String}
     */
    static wszREGCACERTFILENAME => "CACertFileName"

    /**
     * @type {String}
     */
    static wszREGCASECURITY => "Security"

    /**
     * @type {String}
     */
    static wszREGAUDITFILTER => "AuditFilter"

    /**
     * @type {String}
     */
    static wszREGOFFICERRIGHTS => "OfficerRights"

    /**
     * @type {String}
     */
    static wszENROLLMENTAGENTRIGHTS => "EnrollmentAgentRights"

    /**
     * @type {String}
     */
    static wszREGMAXINCOMINGMESSAGESIZE => "MaxIncomingMessageSize"

    /**
     * @type {String}
     */
    static wszREGMAXINCOMINGALLOCSIZE => "MaxIncomingAllocSize"

    /**
     * @type {String}
     */
    static wszREGROLESEPARATIONENABLED => "RoleSeparationEnabled"

    /**
     * @type {String}
     */
    static wszREGALTERNATEPUBLISHDOMAINS => "AlternatePublishDomains"

    /**
     * @type {String}
     */
    static wszREGSETUPSTATUS => "SetupStatus"

    /**
     * @type {String}
     */
    static wszREGINTERFACEFLAGS => "InterfaceFlags"

    /**
     * @type {String}
     */
    static wszREGDSCONFIGDN => "DSConfigDN"

    /**
     * @type {String}
     */
    static wszREGDSDOMAINDN => "DSDomainDN"

    /**
     * @type {String}
     */
    static wszREGVIEWAGEMINUTES => "ViewAgeMinutes"

    /**
     * @type {String}
     */
    static wszREGVIEWIDLEMINUTES => "ViewIdleMinutes"

    /**
     * @type {String}
     */
    static wszREGEKPUBLISTDIRECTORIES => "EndorsementKeyListDirectories"

    /**
     * @type {String}
     */
    static wszCERTIFICATETRANSPARENCYFLAGS => "CertificateTransparencyFlags"

    /**
     * @type {String}
     */
    static wszREGMAXSCTLISTSIZE => "MaxSCTListSize"

    /**
     * @type {String}
     */
    static wszREGCERTIFICATETRANSPARENCYINFOOID => "CTInformationExtensionOid"

    /**
     * @type {String}
     */
    static wszREGPROCESSINGFLAGS => "ProcessingFlags"

    /**
     * @type {String}
     */
    static wszREGUSEDEFINEDCACERTINREQ => "UseDefinedCACertInRequest"

    /**
     * @type {String}
     */
    static wszREGENABLEDEKUFORDEFINEDCACERT => "EnabledEKUForDefinedCACert"

    /**
     * @type {String}
     */
    static wszREGEKUOIDSFORPUBLISHEXPIREDCERTINCRL => "EKUOIDsForPublishExpiredCertInCRL"

    /**
     * @type {String}
     */
    static wszCRTFILENAMEEXT => ".crt"

    /**
     * @type {String}
     */
    static wszPFXFILENAMEEXT => ".p12"

    /**
     * @type {String}
     */
    static wszDATFILENAMEEXT => ".dat"

    /**
     * @type {String}
     */
    static wszLOGFILENAMEEXT => ".log"

    /**
     * @type {String}
     */
    static wszDBFILENAMEEXT => ".edb"

    /**
     * @type {String}
     */
    static szDBBASENAMEPARM => "edb"

    /**
     * @type {String}
     */
    static wszLOGPATH => "CertLog"

    /**
     * @type {String}
     */
    static wszDBBACKUPSUBDIR => "DataBase"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszREGKEYCSP => "CSP"

    /**
     * @type {String}
     */
    static wszREGKEYENCRYPTIONCSP => "EncryptionCSP"

    /**
     * @type {String}
     */
    static wszREGKEYEXITMODULES => "ExitModules"

    /**
     * @type {String}
     */
    static wszREGKEYPOLICYMODULES => "PolicyModules"

    /**
     * @type {String}
     */
    static wszSECUREDATTRIBUTES => "SignedAttributes"

    /**
     * @type {String}
     */
    static wszzDEFAULTSIGNEDATTRIBUTES => "RequesterName\u0000"

    /**
     * @type {String}
     */
    static wszREGBACKUPLOGDIRECTORY => "BackupLogDirectory"

    /**
     * @type {String}
     */
    static wszREGCHECKPOINTFILE => "CheckPointFile"

    /**
     * @type {String}
     */
    static wszREGHIGHLOGNUMBER => "HighLogNumber"

    /**
     * @type {String}
     */
    static wszREGLOWLOGNUMBER => "LowLogNumber"

    /**
     * @type {String}
     */
    static wszREGLOGPATH => "LogPath"

    /**
     * @type {String}
     */
    static wszREGRESTOREMAPCOUNT => "RestoreMapCount"

    /**
     * @type {String}
     */
    static wszREGRESTOREMAP => "RestoreMap"

    /**
     * @type {String}
     */
    static wszREGDATABASERECOVERED => "DatabaseRecovered"

    /**
     * @type {String}
     */
    static wszREGRESTORESTATUS => "RestoreStatus"

    /**
     * @type {String}
     */
    static wszREGB2ICERTMANAGEMODULE => "ICertManageModule"

    /**
     * @type {String}
     */
    static wszREGSP4DEFAULTCONFIGURATION => "DefaultConfiguration"

    /**
     * @type {String}
     */
    static wszREGSP4KEYSETNAME => "KeySetName"

    /**
     * @type {String}
     */
    static wszREGSP4SUBJECTNAMESEPARATOR => "SubjectNameSeparator"

    /**
     * @type {String}
     */
    static wszREGSP4NAMES => "Names"

    /**
     * @type {String}
     */
    static wszREGSP4QUERIES => "Queries"

    /**
     * @type {String}
     */
    static wszREGNETSCAPECERTTYPE => "NetscapeCertType"

    /**
     * @type {String}
     */
    static wszNETSCAPEREVOCATIONTYPE => "Netscape"

    /**
     * @type {String}
     */
    static wszREGPROVIDERTYPE => "ProviderType"

    /**
     * @type {String}
     */
    static wszREGPROVIDER => "Provider"

    /**
     * @type {String}
     */
    static wszHASHALGORITHM => "HashAlgorithm"

    /**
     * @type {String}
     */
    static wszENCRYPTIONALGORITHM => "EncryptionAlgorithm"

    /**
     * @type {String}
     */
    static wszMACHINEKEYSET => "MachineKeyset"

    /**
     * @type {String}
     */
    static wszREGKEYSIZE => "KeySize"

    /**
     * @type {String}
     */
    static wszREGSYMMETRICKEYSIZE => "SymmetricKeySize"

    /**
     * @type {String}
     */
    static wszCNGPUBLICKEYALGORITHM => "CNGPublicKeyAlgorithm"

    /**
     * @type {String}
     */
    static wszCNGHASHALGORITHM => "CNGHashAlgorithm"

    /**
     * @type {String}
     */
    static wszCNGENCRYPTIONALGORITHM => "CNGEncryptionAlgorithm"

    /**
     * @type {String}
     */
    static wszREGALTERNATESIGNATUREALGORITHM => "AlternateSignatureAlgorithm"

    /**
     * @type {String}
     */
    static szNAMESEPARATORDEFAULT => "\u000a"

    /**
     * @type {String}
     */
    static wszPERIODYEARS => "Years"

    /**
     * @type {String}
     */
    static wszPERIODMONTHS => "Months"

    /**
     * @type {String}
     */
    static wszPERIODWEEKS => "Weeks"

    /**
     * @type {String}
     */
    static wszPERIODDAYS => "Days"

    /**
     * @type {String}
     */
    static wszPERIODHOURS => "Hours"

    /**
     * @type {String}
     */
    static wszPERIODMINUTES => "Minutes"

    /**
     * @type {String}
     */
    static wszPERIODSECONDS => "Seconds"

    /**
     * @type {String}
     */
    static wszREGISSUERCERTURLFLAGS => "IssuerCertURLFlags"

    /**
     * @type {String}
     */
    static wszREGEDITFLAGS => "EditFlags"

    /**
     * @type {String}
     */
    static wszREGUPNMAP => "UPNMap"

    /**
     * @type {String}
     */
    static wszREGSUBJECTALTNAME => "SubjectAltName"

    /**
     * @type {String}
     */
    static wszREGSUBJECTALTNAME2 => "SubjectAltName2"

    /**
     * @type {String}
     */
    static wszREGREQUESTDISPOSITION => "RequestDisposition"

    /**
     * @type {String}
     */
    static wszREGCAPATHLENGTH => "CAPathLength"

    /**
     * @type {String}
     */
    static wszREGREVOCATIONTYPE => "RevocationType"

    /**
     * @type {String}
     */
    static wszREGLDAPREVOCATIONCRLURL_OLD => "LDAPRevocationCRLURL"

    /**
     * @type {String}
     */
    static wszREGREVOCATIONCRLURL_OLD => "RevocationCRLURL"

    /**
     * @type {String}
     */
    static wszREGFTPREVOCATIONCRLURL_OLD => "FTPRevocationCRLURL"

    /**
     * @type {String}
     */
    static wszREGFILEREVOCATIONCRLURL_OLD => "FileRevocationCRLURL"

    /**
     * @type {String}
     */
    static wszREGREVOCATIONURL => "RevocationURL"

    /**
     * @type {String}
     */
    static wszREGLDAPISSUERCERTURL_OLD => "LDAPIssuerCertURL"

    /**
     * @type {String}
     */
    static wszREGISSUERCERTURL_OLD => "IssuerCertURL"

    /**
     * @type {String}
     */
    static wszREGFTPISSUERCERTURL_OLD => "FTPIssuerCertURL"

    /**
     * @type {String}
     */
    static wszREGFILEISSUERCERTURL_OLD => "FileIssuerCertURL"

    /**
     * @type {String}
     */
    static wszREGENABLEREQUESTEXTENSIONLIST => "EnableRequestExtensionList"

    /**
     * @type {String}
     */
    static wszREGENABLEENROLLEEREQUESTEXTENSIONLIST => "EnableEnrolleeRequestExtensionList"

    /**
     * @type {String}
     */
    static wszREGDISABLEEXTENSIONLIST => "DisableExtensionList"

    /**
     * @type {String}
     */
    static wszREGEKUOIDSFORVOLATILEREQUESTS => "EKUOIDsforVolatileRequests"

    /**
     * @type {String}
     */
    static wszREGLDAPSESSIONOPTIONS => "LDAPSessionOptions"

    /**
     * @type {String}
     */
    static wszLDAPSESSIONOPTIONVALUE => "LDAPSessionOptionValue"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszREGLDAPREVOCATIONDN_OLD => "LDAPRevocationDN"

    /**
     * @type {String}
     */
    static wszREGLDAPREVOCATIONDNTEMPLATE_OLD => "LDAPRevocationDNTemplate"

    /**
     * @type {String}
     */
    static wszCRLPUBLISHRETRYCOUNT => "CRLPublishRetryCount"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszCLASS_CERTADMIN => "CertificateAuthority.Admin"

    /**
     * @type {String}
     */
    static wszCLASS_CERTCONFIG => "CertificateAuthority.Config"

    /**
     * @type {String}
     */
    static wszCLASS_CERTGETCONFIG => "CertificateAuthority.GetConfig"

    /**
     * @type {String}
     */
    static wszCLASS_CERTENCODE => "CertificateAuthority.Encode"

    /**
     * @type {String}
     */
    static wszCLASS_CERTDBMEM => "CertificateAuthority.DBMem"

    /**
     * @type {String}
     */
    static wszCLASS_CERTREQUEST => "CertificateAuthority.Request"

    /**
     * @type {String}
     */
    static wszCLASS_CERTSERVEREXIT => "CertificateAuthority.ServerExit"

    /**
     * @type {String}
     */
    static wszCLASS_CERTSERVERPOLICY => "CertificateAuthority.ServerPolicy"

    /**
     * @type {String}
     */
    static wszCLASS_CERTVIEW => "CertificateAuthority.View"

    /**
     * @type {String}
     */
    static wszMICROSOFTCERTMODULE_PREFIX => "CertificateAuthority_MicrosoftDefault"

    /**
     * @type {String}
     */
    static wszCERTMANAGE_SUFFIX => "Manage"

    /**
     * @type {String}
     */
    static wszCERTEXITMODULE_POSTFIX => ".Exit"

    /**
     * @type {String}
     */
    static wszCERTPOLICYMODULE_POSTFIX => ".Policy"

    /**
     * @type {String}
     */
    static wszCAPOLICYFILE => "CAPolicy.inf"

    /**
     * @type {String}
     */
    static wszINFSECTION_CDP => "CRLDistributionPoint"

    /**
     * @type {String}
     */
    static wszINFSECTION_AIA => "AuthorityInformationAccess"

    /**
     * @type {String}
     */
    static wszINFSECTION_EKU => "EnhancedKeyUsageExtension"

    /**
     * @type {String}
     */
    static wszINFSECTION_CCDP => "CrossCertificateDistributionPointsExtension"

    /**
     * @type {String}
     */
    static wszINFSECTION_CERTSERVER => "certsrv_server"

    /**
     * @type {String}
     */
    static wszINFKEY_RENEWALKEYLENGTH => "RenewalKeyLength"

    /**
     * @type {String}
     */
    static wszINFKEY_RENEWALVALIDITYPERIODSTRING => "RenewalValidityPeriod"

    /**
     * @type {String}
     */
    static wszINFKEY_RENEWALVALIDITYPERIODCOUNT => "RenewalValidityPeriodUnits"

    /**
     * @type {String}
     */
    static wszINFKEY_UTF8 => "UTF8"

    /**
     * @type {String}
     */
    static wszINFKEY_CRLPERIODSTRING => "CRLPeriod"

    /**
     * @type {String}
     */
    static wszINFKEY_CRLPERIODCOUNT => "CRLPeriodUnits"

    /**
     * @type {String}
     */
    static wszINFKEY_CRLDELTAPERIODSTRING => "CRLDeltaPeriod"

    /**
     * @type {String}
     */
    static wszINFKEY_CRLDELTAPERIODCOUNT => "CRLDeltaPeriodUnits"

    /**
     * @type {String}
     */
    static wszINFKEY_LOADDEFAULTTEMPLATES => "LoadDefaultTemplates"

    /**
     * @type {String}
     */
    static wszINFKEY_ENABLEKEYCOUNTING => "EnableKeyCounting"

    /**
     * @type {String}
     */
    static wszINFKEY_FORCEUTF8 => "ForceUTF8"

    /**
     * @type {String}
     */
    static wszINFKEY_ALTERNATESIGNATUREALGORITHM => "AlternateSignatureAlgorithm"

    /**
     * @type {String}
     */
    static wszINFKEY_SHOWALLCSPS => "ShowAllCSPs"

    /**
     * @type {String}
     */
    static wszINFKEY_CRITICAL => "Critical"

    /**
     * @type {String}
     */
    static wszINFKEY_EMPTY => "Empty"

    /**
     * @type {String}
     */
    static wszINFKEY_CCDPSYNCDELTATIME => "SyncDeltaTime"

    /**
     * @type {String}
     */
    static wszINFSECTION_CAPOLICY => "CAPolicy"

    /**
     * @type {String}
     */
    static wszINFSECTION_POLICYSTATEMENT => "PolicyStatementExtension"

    /**
     * @type {String}
     */
    static wszINFSECTION_APPLICATIONPOLICYSTATEMENT => "ApplicationPolicyStatementExtension"

    /**
     * @type {String}
     */
    static wszINFKEY_POLICIES => "Policies"

    /**
     * @type {String}
     */
    static wszINFKEY_OID => "OID"

    /**
     * @type {String}
     */
    static wszINFKEY_NOTICE => "Notice"

    /**
     * @type {String}
     */
    static wszINFKEY_FLAGS => "Flags"

    /**
     * @type {String}
     */
    static wszINFSECTION_REQUESTATTRIBUTES => "RequestAttributes"

    /**
     * @type {String}
     */
    static wszINFSECTION_NAMECONSTRAINTS => "NameConstraintsExtension"

    /**
     * @type {String}
     */
    static wszINFKEY_INCLUDE => "Include"

    /**
     * @type {String}
     */
    static wszINFKEY_EXCLUDE => "Exclude"

    /**
     * @type {String}
     */
    static wszINFKEY_SUBTREE => "SubTree"

    /**
     * @type {String}
     */
    static wszINFKEY_UPN => "UPN"

    /**
     * @type {String}
     */
    static wszINFKEY_EMAIL => "EMail"

    /**
     * @type {String}
     */
    static wszINFKEY_DNS => "DNS"

    /**
     * @type {String}
     */
    static wszINFKEY_DIRECTORYNAME => "DirectoryName"

    /**
     * @type {String}
     */
    static wszINFKEY_URL => "URL"

    /**
     * @type {String}
     */
    static wszINFKEY_IPADDRESS => "IPAddress"

    /**
     * @type {String}
     */
    static wszINFKEY_REGISTEREDID => "RegisteredId"

    /**
     * @type {String}
     */
    static wszINFKEY_OTHERNAME => "OtherName"

    /**
     * @type {String}
     */
    static wszINFSECTION_POLICYMAPPINGS => "PolicyMappingsExtension"

    /**
     * @type {String}
     */
    static wszINFSECTION_APPLICATIONPOLICYMAPPINGS => "ApplicationPolicyMappingsExtension"

    /**
     * @type {String}
     */
    static wszINFSECTION_POLICYCONSTRAINTS => "PolicyConstraintsExtension"

    /**
     * @type {String}
     */
    static wszINFSECTION_APPLICATIONPOLICYCONSTRAINTS => "ApplicationPolicyConstraintsExtension"

    /**
     * @type {String}
     */
    static wszINFKEY_REQUIREEXPLICITPOLICY => "RequireExplicitPolicy"

    /**
     * @type {String}
     */
    static wszINFKEY_INHIBITPOLICYMAPPING => "InhibitPolicyMapping"

    /**
     * @type {String}
     */
    static wszINFSECTION_BASICCONSTRAINTS => "BasicConstraintsExtension"

    /**
     * @type {String}
     */
    static wszINFKEY_PATHLENGTH => "PathLength"

    /**
     * @type {String}
     */
    static wszINFSECTION_EXTENSIONS => "Extensions"

    /**
     * @type {String}
     */
    static wszINFSECTION_PROPERTIES => "Properties"

    /**
     * @type {String}
     */
    static wszINFKEY_CONTINUE => "_continue_"

    /**
     * @type {String}
     */
    static wszINFSECTION_NEWREQUEST => "NewRequest"

    /**
     * @type {String}
     */
    static wszINFKEY_SUBJECT => "Subject"

    /**
     * @type {String}
     */
    static wszINFKEY_SUBJECTNAMEFLAGS => "SubjectNameFlags"

    /**
     * @type {String}
     */
    static wszINFKEY_X500NAMEFLAGS => "X500NameFlags"

    /**
     * @type {String}
     */
    static wszINFKEY_EXPORTABLE => "Exportable"

    /**
     * @type {String}
     */
    static wszINFKEY_EXPORTABLEENCRYPTED => "ExportableEncrypted"

    /**
     * @type {String}
     */
    static wszINFKEY_HASHALGORITHM => "HashAlgorithm"

    /**
     * @type {String}
     */
    static wszINFKEY_KEYALGORITHM => "KeyAlgorithm"

    /**
     * @type {String}
     */
    static wszINFKEY_KEYALGORITHMPARMETERS => "KeyAlgorithmParameters"

    /**
     * @type {String}
     */
    static wszINFKEY_KEYCONTAINER => "KeyContainer"

    /**
     * @type {String}
     */
    static wszINFKEY_READERNAME => "ReaderName"

    /**
     * @type {String}
     */
    static wszINFKEY_KEYLENGTH => "KeyLength"

    /**
     * @type {String}
     */
    static wszINFKEY_LEGACYKEYSPEC => "KeySpec"

    /**
     * @type {String}
     */
    static wszINFKEY_KEYUSAGEEXTENSION => "KeyUsage"

    /**
     * @type {String}
     */
    static wszINFKEY_KEYUSAGEPROPERTY => "KeyUsageProperty"

    /**
     * @type {String}
     */
    static wszINFKEY_MACHINEKEYSET => "MachineKeySet"

    /**
     * @type {String}
     */
    static wszINFKEY_PRIVATEKEYARCHIVE => "PrivateKeyArchive"

    /**
     * @type {String}
     */
    static wszINFKEY_ENCRYPTIONALGORITHM => "EncryptionAlgorithm"

    /**
     * @type {String}
     */
    static wszINFKEY_ENCRYPTIONLENGTH => "EncryptionLength"

    /**
     * @type {String}
     */
    static wszINFKEY_PROVIDERNAME => "ProviderName"

    /**
     * @type {String}
     */
    static wszINFKEY_PROVIDERTYPE => "ProviderType"

    /**
     * @type {String}
     */
    static wszINFKEY_RENEWALCERT => "RenewalCert"

    /**
     * @type {String}
     */
    static wszINFKEY_REQUESTTYPE => "RequestType"

    /**
     * @type {String}
     */
    static wszINFKEY_SECURITYDESCRIPTOR => "SecurityDescriptor"

    /**
     * @type {String}
     */
    static wszINFKEY_SILENT => "Silent"

    /**
     * @type {String}
     */
    static wszINFKEY_SMIME => "SMIME"

    /**
     * @type {String}
     */
    static wszINFKEY_SUPPRESSDEFAULTS => "SuppressDefaults"

    /**
     * @type {String}
     */
    static wszINFKEY_USEEXISTINGKEY => "UseExistingKeySet"

    /**
     * @type {String}
     */
    static wszINFKEY_USERPROTECTED => "UserProtected"

    /**
     * @type {String}
     */
    static wszINFKEY_KEYPROTECTION => "KeyProtection"

    /**
     * @type {String}
     */
    static wszINFKEY_UICONTEXTMESSAGE => "UIContextMessage"

    /**
     * @type {String}
     */
    static wszINFKEY_FRIENDLYNAME => "FriendlyName"

    /**
     * @type {String}
     */
    static wszINFKEY_NOTBEFORE => "NotBefore"

    /**
     * @type {String}
     */
    static wszINFKEY_NOTAFTER => "NotAfter"

    /**
     * @type {String}
     */
    static wszINFKEY_ATTESTPRIVATEKEY => "AttestPrivateKey"

    /**
     * @type {String}
     */
    static wszINFKEY_PUBLICKEY => "PublicKey"

    /**
     * @type {String}
     */
    static wszINFKEY_PUBLICKEYPARAMETERS => "PublicKeyParameters"

    /**
     * @type {String}
     */
    static wszINFKEY_ECCKEYPARAMETERS => "EccKeyParameters"

    /**
     * @type {String}
     */
    static wszINFKEY_ECCKEYPARAMETERS_P => "EccKeyParameters_P"

    /**
     * @type {String}
     */
    static wszINFKEY_ECCKEYPARAMETERS_A => "EccKeyParameters_A"

    /**
     * @type {String}
     */
    static wszINFKEY_ECCKEYPARAMETERS_B => "EccKeyParameters_B"

    /**
     * @type {String}
     */
    static wszINFKEY_ECCKEYPARAMETERS_SEED => "EccKeyParameters_Seed"

    /**
     * @type {String}
     */
    static wszINFKEY_ECCKEYPARAMETERS_BASE => "EccKeyParameters_Base"

    /**
     * @type {String}
     */
    static wszINFKEY_ECCKEYPARAMETERS_ORDER => "EccKeyParameters_Order"

    /**
     * @type {String}
     */
    static wszINFKEY_ECCKEYPARAMETERS_COFACTOR => "EccKeyParameters_Cofactor"

    /**
     * @type {String}
     */
    static wszINFKEY_ECCKEYPARAMETERSTYPE => "EccKeyParametersType"

    /**
     * @type {String}
     */
    static wszINFKEY_SERIALNUMBER => "SerialNumber"

    /**
     * @type {String}
     */
    static wszINFKEY_CATHUMBPRINT => "CAThumbprint"

    /**
     * @type {String}
     */
    static wszINFKEY_CACERTS => "CACerts"

    /**
     * @type {String}
     */
    static wszINFKEY_CACAPABILITIES => "CACapabilities"

    /**
     * @type {String}
     */
    static wszINFKEY_CHALLENGEPASSWORD => "ChallengePassword"

    /**
     * @type {String}
     */
    static wszINFVALUE_REQUESTTYPE_PKCS10 => "PKCS10"

    /**
     * @type {String}
     */
    static wszINFVALUE_REQUESTTYPE_PKCS7 => "PKCS7"

    /**
     * @type {String}
     */
    static wszINFVALUE_REQUESTTYPE_CMC => "CMC"

    /**
     * @type {String}
     */
    static wszINFVALUE_REQUESTTYPE_CERT => "Cert"

    /**
     * @type {String}
     */
    static wszINFVALUE_REQUESTTYPE_SCEP => "SCEP"

    /**
     * @type {String}
     */
    static wszINFVALUE_ENDORSEMENTKEY => "EndorsementKey"

    /**
     * @type {String}
     */
    static wszREGEXITSMTPKEY => "SMTP"

    /**
     * @type {String}
     */
    static wszREGEXITSMTPTEMPLATES => "Templates"

    /**
     * @type {String}
     */
    static wszREGEXITSMTPEVENTFILTER => "EventFilter"

    /**
     * @type {String}
     */
    static wszREGEXITSMTPSERVER => "SMTPServer"

    /**
     * @type {String}
     */
    static wszREGEXITSMTPAUTHENTICATE => "SMTPAuthenticate"

    /**
     * @type {String}
     */
    static wszREGEXITDENIEDKEY => "Denied"

    /**
     * @type {String}
     */
    static wszREGEXITISSUEDKEY => "Issued"

    /**
     * @type {String}
     */
    static wszREGEXITPENDINGKEY => "Pending"

    /**
     * @type {String}
     */
    static wszREGEXITREVOKEDKEY => "Revoked"

    /**
     * @type {String}
     */
    static wszREGEXITCRLISSUEDKEY => "CRLIssued"

    /**
     * @type {String}
     */
    static wszREGEXITSHUTDOWNKEY => "Shutdown"

    /**
     * @type {String}
     */
    static wszREGEXITSTARTUPKEY => "Startup"

    /**
     * @type {String}
     */
    static wszREGEXITIMPORTEDKEY => "Imported"

    /**
     * @type {String}
     */
    static wszREGEXITSMTPFROM => "From"

    /**
     * @type {String}
     */
    static wszREGEXITSMTPTO => "To"

    /**
     * @type {String}
     */
    static wszREGEXITSMTPCC => "Cc"

    /**
     * @type {String}
     */
    static wszREGEXITTITLEFORMAT => "TitleFormat"

    /**
     * @type {String}
     */
    static wszREGEXITTITLEARG => "TitleArg"

    /**
     * @type {String}
     */
    static wszREGEXITBODYFORMAT => "BodyFormat"

    /**
     * @type {String}
     */
    static wszREGEXITBODYARG => "BodyArg"

    /**
     * @type {String}
     */
    static wszREGEXITPROPNOTFOUND => "???"

    /**
     * @type {String}
     */
    static wszREGKEYENROLLMENT => "Software\Microsoft\Cryptography\AutoEnrollment"

    /**
     * @type {String}
     */
    static wszREGKEYGROUPPOLICYENROLLMENT => "Software\Policies\Microsoft\Cryptography\AutoEnrollment"

    /**
     * @type {String}
     */
    static wszREGMAXPENDINGREQUESTDAYS => "MaxPendingRequestDays"

    /**
     * @type {String}
     */
    static wszREGAELOGLEVEL_OLD => "AEEventLogLevel"

    /**
     * @type {String}
     */
    static wszREGENROLLFLAGS => "EnrollFlags"

    /**
     * @type {String}
     */
    static wszREGVERIFYFLAGS => "VerifyFlags"

    /**
     * @type {String}
     */
    static wszREGUNICODE => "Unicode"

    /**
     * @type {String}
     */
    static wszREGAIKCLOUDCAURL => "AIKCloudCAURL"

    /**
     * @type {String}
     */
    static wszREGAIKKEYALGORITHM => "AIKKeyAlgorithm"

    /**
     * @type {String}
     */
    static wszREGAIKKEYLENGTH => "AIKKeyLength"

    /**
     * @type {String}
     */
    static wszREGPRESERVESCEPDUMMYCERTS => "PreserveSCEPDummyCerts"

    /**
     * @type {String}
     */
    static wszREGALLPROVIDERS => "All"

    /**
     * @type {Integer (UInt32)}
     */
    static TP_MACHINEPOLICY => 1

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszPROPDISTINGUISHEDNAME => "DistinguishedName"

    /**
     * @type {String}
     */
    static wszPROPRAWNAME => "RawName"

    /**
     * @type {String}
     */
    static wszPROPCOUNTRY => "Country"

    /**
     * @type {String}
     */
    static wszPROPORGANIZATION => "Organization"

    /**
     * @type {String}
     */
    static wszPROPORGUNIT => "OrgUnit"

    /**
     * @type {String}
     */
    static wszPROPCOMMONNAME => "CommonName"

    /**
     * @type {String}
     */
    static wszPROPLOCALITY => "Locality"

    /**
     * @type {String}
     */
    static wszPROPSTATE => "State"

    /**
     * @type {String}
     */
    static wszPROPTITLE => "Title"

    /**
     * @type {String}
     */
    static wszPROPGIVENNAME => "GivenName"

    /**
     * @type {String}
     */
    static wszPROPINITIALS => "Initials"

    /**
     * @type {String}
     */
    static wszPROPSURNAME => "SurName"

    /**
     * @type {String}
     */
    static wszPROPDOMAINCOMPONENT => "DomainComponent"

    /**
     * @type {String}
     */
    static wszPROPEMAIL => "EMail"

    /**
     * @type {String}
     */
    static wszPROPSTREETADDRESS => "StreetAddress"

    /**
     * @type {String}
     */
    static wszPROPUNSTRUCTUREDNAME => "UnstructuredName"

    /**
     * @type {String}
     */
    static wszPROPUNSTRUCTUREDADDRESS => "UnstructuredAddress"

    /**
     * @type {String}
     */
    static wszPROPDEVICESERIALNUMBER => "DeviceSerialNumber"

    /**
     * @type {String}
     */
    static wszPROPSUBJECTDOT => "Subject."

    /**
     * @type {String}
     */
    static wszPROPREQUESTDOT => "Request."

    /**
     * @type {String}
     */
    static wszPROPREQUESTREQUESTID => "RequestID"

    /**
     * @type {String}
     */
    static wszPROPREQUESTRAWREQUEST => "RawRequest"

    /**
     * @type {String}
     */
    static wszPROPREQUESTRAWARCHIVEDKEY => "RawArchivedKey"

    /**
     * @type {String}
     */
    static wszPROPREQUESTARCHIVEDKEY => "ArchivedKey"

    /**
     * @type {String}
     */
    static wszPROPREQUESTKEYRECOVERYHASHES => "KeyRecoveryHashes"

    /**
     * @type {String}
     */
    static wszPROPREQUESTRAWOLDCERTIFICATE => "RawOldCertificate"

    /**
     * @type {String}
     */
    static wszPROPREQUESTATTRIBUTES => "RequestAttributes"

    /**
     * @type {String}
     */
    static wszPROPREQUESTTYPE => "RequestType"

    /**
     * @type {String}
     */
    static wszPROPREQUESTFLAGS => "RequestFlags"

    /**
     * @type {String}
     */
    static wszPROPREQUESTSTATUSCODE => "StatusCode"

    /**
     * @type {String}
     */
    static wszPROPREQUESTDISPOSITION => "Disposition"

    /**
     * @type {String}
     */
    static wszPROPREQUESTDISPOSITIONMESSAGE => "DispositionMessage"

    /**
     * @type {String}
     */
    static wszPROPREQUESTSUBMITTEDWHEN => "SubmittedWhen"

    /**
     * @type {String}
     */
    static wszPROPREQUESTRESOLVEDWHEN => "ResolvedWhen"

    /**
     * @type {String}
     */
    static wszPROPREQUESTREVOKEDWHEN => "RevokedWhen"

    /**
     * @type {String}
     */
    static wszPROPREQUESTREVOKEDEFFECTIVEWHEN => "RevokedEffectiveWhen"

    /**
     * @type {String}
     */
    static wszPROPREQUESTREVOKEDREASON => "RevokedReason"

    /**
     * @type {String}
     */
    static wszPROPREQUESTERNAME => "RequesterName"

    /**
     * @type {String}
     */
    static wszPROPCALLERNAME => "CallerName"

    /**
     * @type {String}
     */
    static wszPROPSIGNERPOLICIES => "SignerPolicies"

    /**
     * @type {String}
     */
    static wszPROPSIGNERAPPLICATIONPOLICIES => "SignerApplicationPolicies"

    /**
     * @type {String}
     */
    static wszPROPOFFICER => "Officer"

    /**
     * @type {String}
     */
    static wszPROPPUBLISHEXPIREDCERTINCRL => "PublishExpiredCertInCRL"

    /**
     * @type {String}
     */
    static wszPROPREQUESTERNAMEFROMOLDCERTIFICATE => "RequesterNameFromOldCertificate"

    /**
     * @type {String}
     */
    static wszPROPATTESTATIONCHALLENGE => "AttestationChallenge"

    /**
     * @type {String}
     */
    static wszPROPENDORSEMENTKEYHASH => "EndorsementKeyHash"

    /**
     * @type {String}
     */
    static wszPROPENDORSEMENTCERTIFICATEHASH => "EndorsementCertificateHash"

    /**
     * @type {String}
     */
    static wszPROPRAWPRECERTIFICATE => "RawPrecertificate"

    /**
     * @type {String}
     */
    static wszPROPCHALLENGE => "Challenge"

    /**
     * @type {String}
     */
    static wszPROPEXPECTEDCHALLENGE => "ExpectedChallenge"

    /**
     * @type {String}
     */
    static wszPROPDISPOSITION => "Disposition"

    /**
     * @type {String}
     */
    static wszPROPDISPOSITIONDENY => "Deny"

    /**
     * @type {String}
     */
    static wszPROPDISPOSITIONPENDING => "Pending"

    /**
     * @type {String}
     */
    static wszPROPVALIDITYPERIODSTRING => "ValidityPeriod"

    /**
     * @type {String}
     */
    static wszPROPVALIDITYPERIODCOUNT => "ValidityPeriodUnits"

    /**
     * @type {String}
     */
    static wszPROPEXPIRATIONDATE => "ExpirationDate"

    /**
     * @type {String}
     */
    static wszPROPCERTTYPE => "CertType"

    /**
     * @type {String}
     */
    static wszPROPCERTTEMPLATE => "CertificateTemplate"

    /**
     * @type {String}
     */
    static wszPROPCERTUSAGE => "CertificateUsage"

    /**
     * @type {String}
     */
    static wszPROPREQUESTOSVERSION => "RequestOSVersion"

    /**
     * @type {String}
     */
    static wszPROPREQUESTCSPPROVIDER => "RequestCSPProvider"

    /**
     * @type {String}
     */
    static wszPROPEXITCERTFILE => "CertFile"

    /**
     * @type {String}
     */
    static wszPROPCLIENTBROWSERMACHINE => "cbm"

    /**
     * @type {String}
     */
    static wszPROPCERTCLIENTMACHINE => "ccm"

    /**
     * @type {String}
     */
    static wszPROPCLIENTDCDNS => "cdc"

    /**
     * @type {String}
     */
    static wszPROPREQUESTMACHINEDNS => "rmd"

    /**
     * @type {String}
     */
    static wszPROPSUBJECTALTNAME2 => "san"

    /**
     * @type {String}
     */
    static wszPROPDNS => "dns"

    /**
     * @type {String}
     */
    static wszPROPDN => "dn"

    /**
     * @type {String}
     */
    static wszPROPURL => "url"

    /**
     * @type {String}
     */
    static wszPROPIPADDRESS => "ipaddress"

    /**
     * @type {String}
     */
    static wszPROPGUID => "guid"

    /**
     * @type {String}
     */
    static wszPROPOID => "oid"

    /**
     * @type {String}
     */
    static wszPROPUPN => "upn"

    /**
     * @type {String}
     */
    static szPROPASNTAG => "{asn}"

    /**
     * @type {String}
     */
    static wszPROPCRITICALTAG => "{critical}"

    /**
     * @type {String}
     */
    static wszPROPUTF8TAG => "{utf8}"

    /**
     * @type {String}
     */
    static wszPROPOCTETTAG => "{octet}"

    /**
     * @type {String}
     */
    static wszPROPHEXTAG => "{hex}"

    /**
     * @type {String}
     */
    static wszPROPTEXTTAG => "{text}"

    /**
     * @type {String}
     */
    static wszPROPDECIMALTAG => "{decimal}"

    /**
     * @type {String}
     */
    static wszPROPFILETAG => "{file}"

    /**
     * @type {String}
     */
    static wszAT_EKCERTINF => "@EKCert"

    /**
     * @type {String}
     */
    static wszAT_TESTROOT => "@TestRoot"

    /**
     * @type {String}
     */
    static wszPROPCATYPE => "CAType"

    /**
     * @type {String}
     */
    static wszPROPSANITIZEDCANAME => "SanitizedCAName"

    /**
     * @type {String}
     */
    static wszPROPSANITIZEDSHORTNAME => "SanitizedShortName"

    /**
     * @type {String}
     */
    static wszPROPMACHINEDNSNAME => "MachineDNSName"

    /**
     * @type {String}
     */
    static wszPROPMODULEREGLOC => "ModuleRegistryLocation"

    /**
     * @type {String}
     */
    static wszPROPUSEDS => "fUseDS"

    /**
     * @type {String}
     */
    static wszPROPDELTACRLSDISABLED => "fDeltaCRLsDisabled"

    /**
     * @type {String}
     */
    static wszPROPSERVERUPGRADED => "fServerUpgraded"

    /**
     * @type {String}
     */
    static wszPROPCONFIGDN => "ConfigDN"

    /**
     * @type {String}
     */
    static wszPROPDOMAINDN => "DomainDN"

    /**
     * @type {String}
     */
    static wszPROPLOGLEVEL => "LogLevel"

    /**
     * @type {String}
     */
    static wszPROPSESSIONCOUNT => "SessionCount"

    /**
     * @type {String}
     */
    static wszPROPTEMPLATECHANGESEQUENCENUMBER => "TemplateChangeSequenceNumber"

    /**
     * @type {String}
     */
    static wszPROPVOLATILEMODE => "VolatileMode"

    /**
     * @type {String}
     */
    static wszLOCALIZEDTIMEPERIODUNITS => "LocalizedTimePeriodUnits"

    /**
     * @type {String}
     */
    static wszPROPREQUESTERCAACCESS => "RequesterCAAccess"

    /**
     * @type {String}
     */
    static wszPROPUSERDN => "UserDN"

    /**
     * @type {String}
     */
    static wszPROPKEYARCHIVED => "KeyArchived"

    /**
     * @type {String}
     */
    static wszPROPCERTCOUNT => "CertCount"

    /**
     * @type {String}
     */
    static wszPROPRAWCACERTIFICATE => "RawCACertificate"

    /**
     * @type {String}
     */
    static wszPROPCERTSTATE => "CertState"

    /**
     * @type {String}
     */
    static wszPROPCERTSUFFIX => "CertSuffix"

    /**
     * @type {String}
     */
    static wszPROPRAWCRL => "RawCRL"

    /**
     * @type {String}
     */
    static wszPROPRAWDELTACRL => "RawDeltaCRL"

    /**
     * @type {String}
     */
    static wszPROPCRLINDEX => "CRLIndex"

    /**
     * @type {String}
     */
    static wszPROPCRLSTATE => "CRLState"

    /**
     * @type {String}
     */
    static wszPROPCRLSUFFIX => "CRLSuffix"

    /**
     * @type {String}
     */
    static wszPROPEVENTLOGTERSE => "EventLogTerse"

    /**
     * @type {String}
     */
    static wszPROPEVENTLOGERROR => "EventLogError"

    /**
     * @type {String}
     */
    static wszPROPEVENTLOGWARNING => "EventLogWarning"

    /**
     * @type {String}
     */
    static wszPROPEVENTLOGVERBOSE => "EventLogVerbose"

    /**
     * @type {String}
     */
    static wszPROPEVENTLOGEXHAUSTIVE => "EventLogExhaustive"

    /**
     * @type {String}
     */
    static wszPROPDCNAME => "DCName"

    /**
     * @type {String}
     */
    static wszPROPCROSSFOREST => "CrossForest"

    /**
     * @type {String}
     */
    static wszPROPREQUESTERSAMNAME => "RequesterSAMName"

    /**
     * @type {String}
     */
    static wszPROPREQUESTERUPN => "RequesterUPN"

    /**
     * @type {String}
     */
    static wszPROPREQUESTERDN => "RequesterDN"

    /**
     * @type {String}
     */
    static wszPROPSEAUDITID => "SEAuditId"

    /**
     * @type {String}
     */
    static wszPROPSEAUDITFILTER => "SEAuditFilter"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATEREQUESTID => "RequestID"

    /**
     * @type {String}
     */
    static wszPROPRAWCERTIFICATE => "RawCertificate"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATEHASH => "CertificateHash"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATETEMPLATE => "CertificateTemplate"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATEENROLLMENTFLAGS => "EnrollmentFlags"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATEGENERALFLAGS => "GeneralFlags"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATEPRIVATEKEYFLAGS => "PrivatekeyFlags"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATESERIALNUMBER => "SerialNumber"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATENOTBEFOREDATE => "NotBefore"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATENOTAFTERDATE => "NotAfter"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATESUBJECTKEYIDENTIFIER => "SubjectKeyIdentifier"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATERAWPUBLICKEY => "RawPublicKey"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATEPUBLICKEYLENGTH => "PublicKeyLength"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATEPUBLICKEYALGORITHM => "PublicKeyAlgorithm"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATERAWPUBLICKEYALGORITHMPARAMETERS => "RawPublicKeyAlgorithmParameters"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATEUPN => "UPN"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATETYPE => "CertificateType"

    /**
     * @type {String}
     */
    static wszPROPCERTIFICATERAWSMIMECAPABILITIES => "RawSMIMECapabilities"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszPROPEXTREQUESTID => "ExtensionRequestId"

    /**
     * @type {String}
     */
    static wszPROPEXTNAME => "ExtensionName"

    /**
     * @type {String}
     */
    static wszPROPEXTFLAGS => "ExtensionFlags"

    /**
     * @type {String}
     */
    static wszPROPEXTRAWVALUE => "ExtensionRawValue"

    /**
     * @type {String}
     */
    static wszPROPATTRIBREQUESTID => "AttributeRequestId"

    /**
     * @type {String}
     */
    static wszPROPATTRIBNAME => "AttributeName"

    /**
     * @type {String}
     */
    static wszPROPATTRIBVALUE => "AttributeValue"

    /**
     * @type {String}
     */
    static wszPROPCRLROWID => "CRLRowId"

    /**
     * @type {String}
     */
    static wszPROPCRLNUMBER => "CRLNumber"

    /**
     * @type {String}
     */
    static wszPROPCRLMINBASE => "CRLMinBase"

    /**
     * @type {String}
     */
    static wszPROPCRLNAMEID => "CRLNameId"

    /**
     * @type {String}
     */
    static wszPROPCRLCOUNT => "CRLCount"

    /**
     * @type {String}
     */
    static wszPROPCRLTHISUPDATE => "CRLThisUpdate"

    /**
     * @type {String}
     */
    static wszPROPCRLNEXTUPDATE => "CRLNextUpdate"

    /**
     * @type {String}
     */
    static wszPROPCRLTHISPUBLISH => "CRLThisPublish"

    /**
     * @type {String}
     */
    static wszPROPCRLNEXTPUBLISH => "CRLNextPublish"

    /**
     * @type {String}
     */
    static wszPROPCRLEFFECTIVE => "CRLEffective"

    /**
     * @type {String}
     */
    static wszPROPCRLPROPAGATIONCOMPLETE => "CRLPropagationComplete"

    /**
     * @type {String}
     */
    static wszPROPCRLLASTPUBLISHED => "CRLLastPublished"

    /**
     * @type {String}
     */
    static wszPROPCRLPUBLISHATTEMPTS => "CRLPublishAttempts"

    /**
     * @type {String}
     */
    static wszPROPCRLPUBLISHFLAGS => "CRLPublishFlags"

    /**
     * @type {String}
     */
    static wszPROPCRLPUBLISHSTATUSCODE => "CRLPublishStatusCode"

    /**
     * @type {String}
     */
    static wszPROPCRLPUBLISHERROR => "CRLPublishError"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszCERT_TYPE => "RequestType"

    /**
     * @type {String}
     */
    static wszCERT_TYPE_CLIENT => "Client"

    /**
     * @type {String}
     */
    static wszCERT_TYPE_SERVER => "Server"

    /**
     * @type {String}
     */
    static wszCERT_TYPE_CODESIGN => "CodeSign"

    /**
     * @type {String}
     */
    static wszCERT_TYPE_CUSTOMER => "SetCustomer"

    /**
     * @type {String}
     */
    static wszCERT_TYPE_MERCHANT => "SetMerchant"

    /**
     * @type {String}
     */
    static wszCERT_TYPE_PAYMENT => "SetPayment"

    /**
     * @type {String}
     */
    static wszCERT_VERSION => "Version"

    /**
     * @type {String}
     */
    static wszCERT_VERSION_1 => "1"

    /**
     * @type {String}
     */
    static wszCERT_VERSION_2 => "2"

    /**
     * @type {String}
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
     * @type {String}
     */
    static wszCMM_PROP_NAME => "Name"

    /**
     * @type {String}
     */
    static wszCMM_PROP_DESCRIPTION => "Description"

    /**
     * @type {String}
     */
    static wszCMM_PROP_COPYRIGHT => "Copyright"

    /**
     * @type {String}
     */
    static wszCMM_PROP_FILEVER => "File Version"

    /**
     * @type {String}
     */
    static wszCMM_PROP_PRODUCTVER => "Product Version"

    /**
     * @type {String}
     */
    static wszCMM_PROP_DISPLAY_HWND => "HWND"

    /**
     * @type {String}
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
     * @param {Pointer<PWSTR>} pwszServerName A pointer to the NetBIOS or DNS machine name of the server to check for online status.
     * @param {Pointer<Int32>} pfServerOnline A pointer to Boolean value which will be <b>TRUE</b> if the Certificate Services server is online and <b>FALSE</b> if it is not online.
     * @returns {Integer} The return value is an <b>HRESULT</b>. This function will fail if Certificate Services is not running. If Certificate Services is running and ready to accept requests, this function will return S_OK, and *<i>pfServerOnline</i> will point to a value of <b>TRUE</b>. If Certificate Services is running in suspended (or paused) mode, this function will return S_OK, and *<i>pfServerOnline</i> will point to a value of <b>FALSE</b>.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvisserveronlinew
     * @since windowsserver2003
     */
    static CertSrvIsServerOnlineW(pwszServerName, pfServerOnline) {
        result := DllCall("certadm.dll\CertSrvIsServerOnlineW", "ptr", pwszServerName, "ptr", pfServerOnline, "int")
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
     * @param {Pointer<UInt32>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzFileList</i>.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupgetdynamicfilelistw
     * @since windowsserver2003
     */
    static CertSrvBackupGetDynamicFileListW(hbc, ppwszzFileList, pcbSize) {
        result := DllCall("certadm.dll\CertSrvBackupGetDynamicFileListW", "ptr", hbc, "ptr", ppwszzFileList, "ptr", pcbSize, "int")
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
     * @param {Pointer<PWSTR>} pwszServerName A pointer to the machine name of the server to prepare for online backup. This name can be the NetBIOS name or the DNS name.
     * @param {Integer} grbitJet Value used by the database engine; this value should be set to zero.
     * @param {Integer} dwBackupFlags 
     * @param {Pointer<Void>} phbc A pointer to a Certificate Services backup context handle (<b>HCSBC</b>).
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success, and *<i>phbc</i> will be set to an <b>HCSBC</b> which can be used by other Certificate Services backup APIs.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackuppreparew
     * @since windowsserver2003
     */
    static CertSrvBackupPrepareW(pwszServerName, grbitJet, dwBackupFlags, phbc) {
        result := DllCall("certadm.dll\CertSrvBackupPrepareW", "ptr", pwszServerName, "uint", grbitJet, "uint", dwBackupFlags, "ptr", phbc, "int")
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
     * @param {Pointer<UInt32>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzAttachmentInformation</i>.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw
     * @since windowsserver2003
     */
    static CertSrvBackupGetDatabaseNamesW(hbc, ppwszzAttachmentInformation, pcbSize) {
        result := DllCall("certadm.dll\CertSrvBackupGetDatabaseNamesW", "ptr", hbc, "ptr", ppwszzAttachmentInformation, "ptr", pcbSize, "int")
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
     * @param {Pointer<PWSTR>} pwszAttachmentName File name to open for backup purposes. This file name would be parsed from a list produced by means of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw">CertSrvBackupGetBackupLogs</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupgetdatabasenamesw">CertSrvBackupGetDatabaseNames</a>. Note that the names returned by <b>CertSrvBackupGetBackupLogs</b> and <b>CertSrvBackupGetDatabaseNames</b> must have the single-WCHAR CSBFT_* prefix stripped before <b>CertSrvBackupOpenFile</b> is called.
     * @param {Integer} cbReadHintSize Number of bytes used as a hint when the file is read by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupread">CertSrvBackupRead</a>. The <i>cbReadHintSize</i> parameter passed to the first <b>CertSrvBackupOpenFile</b> call for the backup context is used to size the read buffer. Pass zero for this parameter, and the buffer will be sized at a reasonably efficient size chosen by <b>CertSrvBackupOpenFile</b>. If insufficient memory is available, the buffer size will be reduced until memory allocation succeeds or until the buffer size reaches its minimum possible value. Pass a nonzero size to cause <b>CertSrvBackupOpenFile</b> to size the buffer to a power of two near the value of <i>cbReadHintSize</i>. The  implementation will choose only powers of two between 64 KB and 4 MB.
     * @param {Pointer<Int64>} pliFileSize A pointer to a <b>LARGE_INTEGER</b> value that represents the number of bytes in the file.
     * @returns {Integer} If the function succeeds, the function returns S_OK.
     * 
     * If the function fails, it returns an <b>HRESULT</b> value that indicates the error. For a list of common error codes, see <a href="https://docs.microsoft.com/windows/desktop/SecCrypto/common-hresult-values">Common HRESULT Values</a>.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupopenfilew
     * @since windowsserver2003
     */
    static CertSrvBackupOpenFileW(hbc, pwszAttachmentName, cbReadHintSize, pliFileSize) {
        result := DllCall("certadm.dll\CertSrvBackupOpenFileW", "ptr", hbc, "ptr", pwszAttachmentName, "uint", cbReadHintSize, "ptr", pliFileSize, "int")
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
     * @param {Pointer<UInt32>} pcbRead A pointer to a <b>DWORD</b> value which represents the actual number of bytes read by <b>CertSrvBackupRead</b>. The number of bytes read can be less than the size of the storage area allocated to <i>pvBuffer</i> if the end of the file has been reached.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupread
     * @since windowsserver2003
     */
    static CertSrvBackupRead(hbc, pvBuffer, cbBuffer, pcbRead) {
        result := DllCall("certadm.dll\CertSrvBackupRead", "ptr", hbc, "ptr", pvBuffer, "uint", cbBuffer, "ptr", pcbRead, "int")
        return result
    }

    /**
     * Closes the file opened by the CertSrvBackupOpenFile function.
     * @remarks
     * For every successful call to <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackupopenfilew">CertSrvBackupOpenFile</a>, there should be a subsequent call to <b>CertSrvBackupClose</b>. Upon completion of backing up a  file, the file needs to be closed.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupclose
     * @since windowsserver2003
     */
    static CertSrvBackupClose(hbc) {
        result := DllCall("certadm.dll\CertSrvBackupClose", "ptr", hbc, "int")
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
     * @param {Pointer<UInt32>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzBackupLogFiles</i>.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupgetbackuplogsw
     * @since windowsserver2003
     */
    static CertSrvBackupGetBackupLogsW(hbc, ppwszzBackupLogFiles, pcbSize) {
        result := DllCall("certadm.dll\CertSrvBackupGetBackupLogsW", "ptr", hbc, "ptr", ppwszzBackupLogFiles, "ptr", pcbSize, "int")
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
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackuptruncatelogs
     * @since windowsserver2003
     */
    static CertSrvBackupTruncateLogs(hbc) {
        result := DllCall("certadm.dll\CertSrvBackupTruncateLogs", "ptr", hbc, "int")
        return result
    }

    /**
     * Ends a Certificate Services backup session.
     * @remarks
     * Upon completion of a backup session, the session needs to be terminated by means of <b>CertSrvBackupEnd</b>. For every successful call to <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvbackuppreparew">CertSrvBackupPrepare</a>, there should be a call to <b>CertSrvBackupEnd</b>.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupend
     * @since windowsserver2003
     */
    static CertSrvBackupEnd(hbc) {
        result := DllCall("certadm.dll\CertSrvBackupEnd", "ptr", hbc, "int")
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
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvbackupfree
     * @since windowsserver2003
     */
    static CertSrvBackupFree(pv) {
        DllCall("certadm.dll\CertSrvBackupFree", "ptr", pv)
    }

    /**
     * Used both in backup and restore scenarios and retrieves the list of Certificate Services database location names for all the files being backed up or restored.
     * @remarks
     * Certificate Services must be running for this method to succeed.
     * 
     * This function's name in Certadm.dll is <b>CertSrvRestoreGetDatabaseLocationsW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVRESTOREGETDATABASELOCATIONSW</b> in the Certbcli.h header file.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup or restore context.
     * @param {Pointer<PWSTR>} ppwszzDatabaseLocationList 
     * @param {Pointer<UInt32>} pcbSize A pointer to the <b>DWORD</b> value that specifies the number of bytes in <i>ppwszzDatabaseLocationList</i>.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw
     * @since windowsserver2003
     */
    static CertSrvRestoreGetDatabaseLocationsW(hbc, ppwszzDatabaseLocationList, pcbSize) {
        result := DllCall("certadm.dll\CertSrvRestoreGetDatabaseLocationsW", "ptr", hbc, "ptr", ppwszzDatabaseLocationList, "ptr", pcbSize, "int")
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
     * @param {Pointer<PWSTR>} pwszServerName A pointer to the computer name of the server to prepare for restore operations. This name can be the NetBIOS name or the DNS name.
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
     * @param {Pointer<Void>} phbc A pointer to a Certificate Services backup context handle (<b>HCSBC</b>).
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success, and *<i>phbc</i> is set to an <b>HCSBC</b>, which can be used by other Certificate Services restore APIs.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestorepreparew
     * @since windowsserver2003
     */
    static CertSrvRestorePrepareW(pwszServerName, dwRestoreFlags, phbc) {
        result := DllCall("certadm.dll\CertSrvRestorePrepareW", "ptr", pwszServerName, "uint", dwRestoreFlags, "ptr", phbc, "int")
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
     * @param {Pointer<PWSTR>} pwszCheckPointFilePath A pointer to a null-terminated Unicode string that contains the restore path for the check point file. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Pointer<PWSTR>} pwszLogPath A pointer to a null-terminated Unicode string that contains the current log file directory. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Pointer<CSEDB_RSTMAPW>} rgrstmap An array of <b>CSEDB_RSTMAP</b> structures that contains the restore map. If you are performing a full database restoration, this parameter specifies the name of the backup database, as well as a new name for the database after it is restored. The backup database name is referenced by the <b>pwszDatabaseName</b> member, and the new database name is referenced by the <b>pwszNewDatabaseName</b> member. If the intent is to maintain the same name for both the backup database and the restored database, set both the <b>pwszNewDatabaseName</b> and the <b>pwszDatabaseName</b> members to the same name. The backup database name is constructed from the path returned by the backup client's call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw">CertSrvRestoreGetDatabaseLocations</a> function. <b>CertSrvRestoreGetDatabaseLocations</b> would have been called during a full backup, and the backup client would have saved the returned path.
     * 
     * If you are performing an incremental restoration, pass <b>NULL</b> for this parameter.
     * @param {Integer} crstmap The number of elements in the <i>rgrstmap</i> array. Pass zero for this parameter if you are performing an incremental restoration.
     * @param {Pointer<PWSTR>} pwszBackupLogPath A pointer to a null-terminated Unicode string that contains the path for the backup log directory. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Integer} genLow The lowest log number that was restored in this restore session. Log files are in the form of edbXXXXX.log, where XXXXX is a five hexadecimal digit value. For example, edb00001.log is the first log file created by the internal database. For purposes of this function, a value of one in <i>genLow</i> corresponds to the log file edb00001.log.
     * @param {Integer} genHigh The highest log number that was restored in this restore session.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoreregisterw
     * @since windowsserver2003
     */
    static CertSrvRestoreRegisterW(hbc, pwszCheckPointFilePath, pwszLogPath, rgrstmap, crstmap, pwszBackupLogPath, genLow, genHigh) {
        result := DllCall("certadm.dll\CertSrvRestoreRegisterW", "ptr", hbc, "ptr", pwszCheckPointFilePath, "ptr", pwszLogPath, "ptr", rgrstmap, "int", crstmap, "ptr", pwszBackupLogPath, "uint", genLow, "uint", genHigh, "int")
        return result
    }

    /**
     * Registers a Certificate Services restore. (CertSrvRestoreRegisterThroughFile)
     * @remarks
     * This function is identical to the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregisterw">CertSrvRestoreRegister</a> function except that <b>CertSrvRestoreRegister</b> requires the calling account to be a local administrator. The <b>CertSrvRestoreRegisterThroughFile</b> function only requires that the calling account have the restore privilege.
     * @param {Pointer<Void>} hbc A handle to the Certificate Services restore context. This handle is obtained by calling 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestorepreparew">CertSrvRestorePrepare</a> function.
     * @param {Pointer<PWSTR>} pwszCheckPointFilePath A pointer to a null-terminated Unicode string that contains the restore path for the check point file. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Pointer<PWSTR>} pwszLogPath A pointer to a null-terminated Unicode string that contains the current log file directory. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Pointer<CSEDB_RSTMAPW>} rgrstmap An array of <b>CSEDB_RSTMAP</b> structures that contains the restore map. If you are performing a full database restoration, this parameter specifies the name of the backup database, as well as a new name for the database after it is restored. The backup database name is referenced by the <b>pwszDatabaseName</b> member, and the new database name is referenced by the <b>pwszNewDatabaseName</b> member. If the intent is to maintain the same name for both the backup database and the restored database, set both the <b>pwszNewDatabaseName</b> and the <b>pwszDatabaseName</b> members to the same name. The backup database name is constructed from the path returned by the backup client's call to 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoregetdatabaselocationsw">CertSrvRestoreGetDatabaseLocations</a> function. <b>CertSrvRestoreGetDatabaseLocations</b> would have been called during a full backup, and the backup client would have saved the returned path.
     * 
     * If you are performing an incremental restoration, set this parameter to <b>NULL</b>.
     * @param {Integer} crstmap The number of elements in the <i>rgrstmap</i> array. Set this value to one if a you are performing a full restoration, or zero if you are performing an incremental restoration.
     * @param {Pointer<PWSTR>} pwszBackupLogPath A pointer to a null-terminated Unicode string that contains the path for the backup log directory. Pass <b>NULL</b> for this parameter if it is not needed.
     * @param {Integer} genLow The lowest log number that was restored in this restore session. Log files are in the form of edbXXXXX.log, where XXXXX is a five hexadecimal digit value. For example, edb00001.log is the first log file created by the internal database. For purposes of this function, a value of one in <i>genLow</i> corresponds to the log file edb00001.log.
     * @param {Integer} genHigh The highest log number that was restored in this restore session.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of <b>S_OK</b> indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoreregisterthroughfile
     * @since windowsserver2003
     */
    static CertSrvRestoreRegisterThroughFile(hbc, pwszCheckPointFilePath, pwszLogPath, rgrstmap, crstmap, pwszBackupLogPath, genLow, genHigh) {
        result := DllCall("certadm.dll\CertSrvRestoreRegisterThroughFile", "ptr", hbc, "ptr", pwszCheckPointFilePath, "ptr", pwszLogPath, "ptr", rgrstmap, "int", crstmap, "ptr", pwszBackupLogPath, "uint", genLow, "uint", genHigh, "int")
        return result
    }

    /**
     * Completes a registered Certificate Services restore operation.
     * @remarks
     * If a registered restore operation is not completed, Certificate Services will not start.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services restore context. You must set this handle by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestoreregisterw">CertSrvRestoreRegister</a> before using it in <b>CertSrvRestoreRegisterComplete</b>.
     * @param {Integer} hrRestoreState <b>HRESULT</b> value indicating the success code for the restore operation. Set this value to S_OK if the restore operation was successful.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoreregistercomplete
     * @since windowsserver2003
     */
    static CertSrvRestoreRegisterComplete(hbc, hrRestoreState) {
        result := DllCall("certadm.dll\CertSrvRestoreRegisterComplete", "ptr", hbc, "int", hrRestoreState, "int")
        return result
    }

    /**
     * Ends a Certificate Services restore session.
     * @remarks
     * When a restore session is complete, terminate the session by calling <b>CertSrvRestoreEnd</b>. For every successful call to <a href="https://docs.microsoft.com/windows/desktop/api/certbcli/nf-certbcli-certsrvrestorepreparew">CertSrvRestorePrepare</a>, there should be a call to <b>CertSrvRestoreEnd</b>.
     * 
     * When a restore is complete, it is important that you make a new full backup of the Certificate Services database. This is necessary to truncate the restored log files and to establish a base backup set for future restores. Backups performed after a restore cannot be mixed with backups (full or incremental) taken before the restore; that is, after a certificate services database is restored and has progressed to a subsequent state, you cannot use the pre-restoration backups to restore the database to that subsequent state.
     * @param {Pointer<Void>} hbc A handle to a Certificate Services backup context.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvrestoreend
     * @since windowsserver2003
     */
    static CertSrvRestoreEnd(hbc) {
        result := DllCall("certadm.dll\CertSrvRestoreEnd", "ptr", hbc, "int")
        return result
    }

    /**
     * Issues a service control command to programmatically stop Certificate Services.
     * @remarks
     * The purpose of this function is to allow a backup or restore application to programmatically stop the Certificate Services application (thereby not requiring the use of the service controller APIs). Stopping Certificate Services in this manner will also work when Certificate Services is running in console mode; the service controller APIs cannot control applications running in console mode.
     * 
     * This function's name in Certadm.dll is <b>CertSrvServerControlW</b>. You must use this form of the name when calling <a href="https://docs.microsoft.com/windows/desktop/api/libloaderapi/nf-libloaderapi-getprocaddress">GetProcAddress</a>. Also, this function is defined as type <b>FNCERTSRVSERVERCONTROLW</b> in the Certbcli.h header file.
     * @param {Pointer<PWSTR>} pwszServerName A pointer to a name or a configuration string of the server to be issued the control command.
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
     * @param {Pointer<UInt32>} pcbOut For future use, this parameter will be the number of bytes allocated to <i>ppbOut</i>. The current implementation does not allocate memory to <i>ppbOut</i>. You can set this value to <b>NULL</b>.
     * @param {Pointer<Byte>} ppbOut For future use, this parameter will be the pointer to pointer to bytes representing the output from the issued command. The current implementation does not allocate memory to <i>ppbOut</i>. You can set this value to <b>NULL</b>.
     * @returns {Integer} The return value is an <b>HRESULT</b>. A value of S_OK indicates success.
     * @see https://learn.microsoft.com/windows/win32/api/certbcli/nf-certbcli-certsrvservercontrolw
     * @since windowsserver2003
     */
    static CertSrvServerControlW(pwszServerName, dwControlFlags, pcbOut, ppbOut) {
        result := DllCall("certadm.dll\CertSrvServerControlW", "ptr", pwszServerName, "uint", dwControlFlags, "ptr", pcbOut, "ptr", ppbOut, "int")
        return result
    }

    /**
     * Retrieves a list of certification authorities (CAs) trusted by the specified server.
     * @param {Pointer<UNICODE_STRING>} pTargetName The name of the server to check.
     * @param {Integer} cCriteria The number of elements in the <i>rgpCriteria</i> array.
     * @param {Pointer<CERT_SELECT_CRITERIA>} rgpCriteria A constant pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_select_criteria">CERT_SELECT_CRITERIA</a> structures that specify the criteria used to select certificate chains.
     * @param {Pointer<SecPkgContext_IssuerListInfoEx>} ppTrustedIssuers A pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/schannel/ns-schannel-secpkgcontext_issuerlistinfoex">SecPkgContext_IssuerListInfoEx</a> structures that receive the CAs trusted by the server specified by the <i>pTargetName</i> parameter.
     * @returns {Integer} If the function succeeds, return STATUS_SUCCESS.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstgettrustanchors
     * @since windows6.1
     */
    static PstGetTrustAnchors(pTargetName, cCriteria, rgpCriteria, ppTrustedIssuers) {
        result := DllCall("certpoleng.dll\PstGetTrustAnchors", "ptr", pTargetName, "uint", cCriteria, "ptr", rgpCriteria, "ptr", ppTrustedIssuers, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<UNICODE_STRING>} pTargetName 
     * @param {Integer} cCriteria 
     * @param {Pointer<CERT_SELECT_CRITERIA>} rgpCriteria 
     * @param {Pointer<CERT_CONTEXT>} pCertContext 
     * @param {Pointer<SecPkgContext_IssuerListInfoEx>} ppTrustedIssuers 
     * @returns {Integer} 
     */
    static PstGetTrustAnchorsEx(pTargetName, cCriteria, rgpCriteria, pCertContext, ppTrustedIssuers) {
        result := DllCall("certpoleng.dll\PstGetTrustAnchorsEx", "ptr", pTargetName, "uint", cCriteria, "ptr", rgpCriteria, "ptr", pCertContext, "ptr", ppTrustedIssuers, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<CERT_CONTEXT>} pCert 
     * @param {Pointer<SecPkgContext_IssuerListInfoEx>} pTrustedIssuers 
     * @param {Pointer<CERT_CHAIN_CONTEXT>} ppCertChainContext 
     * @returns {Integer} 
     */
    static PstGetCertificateChain(pCert, pTrustedIssuers, ppCertChainContext) {
        result := DllCall("certpoleng.dll\PstGetCertificateChain", "ptr", pCert, "ptr", pTrustedIssuers, "ptr", ppCertChainContext, "int")
        return result
    }

    /**
     * Retrieves certificate chains that specify certificates that can be used to authenticate a user on the specified server.
     * @param {Pointer<UNICODE_STRING>} pTargetName The name of the server to check.
     * @param {Integer} cCriteria The number of elements in the <i>rgpCriteria</i> array.
     * @param {Pointer<CERT_SELECT_CRITERIA>} rgpCriteria A constant pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_select_criteria">CERT_SELECT_CRITERIA</a> structures that specify the criteria used to select certificate chains.
     * @param {Integer} bIsClient <b>TRUE</b> if the caller is the client; otherwise, <b>FALSE</b>.
     * @param {Pointer<UInt32>} pdwCertChainContextCount The number of elements in the <i>ppCertChainContexts</i> array.
     * @param {Pointer<CERT_CHAIN_CONTEXT>} ppCertChainContexts The address of a pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_chain_context">CERT_CHAIN_CONTEXT</a> structures that specifies the certificate chains of certificates that can be used to authenticate a user on the server specified by the <i>pTargetName</i> parameter.
     * @returns {Integer} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstgetcertificates
     * @since windows6.1
     */
    static PstGetCertificates(pTargetName, cCriteria, rgpCriteria, bIsClient, pdwCertChainContextCount, ppCertChainContexts) {
        result := DllCall("certpoleng.dll\PstGetCertificates", "ptr", pTargetName, "uint", cCriteria, "ptr", rgpCriteria, "int", bIsClient, "ptr", pdwCertChainContextCount, "ptr", ppCertChainContexts, "int")
        return result
    }

    /**
     * Associates the caller's private key with the specified certificate.
     * @param {Pointer<CERT_CONTEXT>} pCert The certificate with which to associate the private key.
     * @returns {Integer} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstacquireprivatekey
     * @since windows6.1
     */
    static PstAcquirePrivateKey(pCert) {
        result := DllCall("certpoleng.dll\PstAcquirePrivateKey", "ptr", pCert, "int")
        return result
    }

    /**
     * Validates the specified certificate.
     * @param {Pointer<UNICODE_STRING>} pTargetName The name of the server. If the caller is not the client, this parameter is <b>NULL</b>.
     * @param {Integer} bIsClient <b>TRUE</b> if the caller is the client; otherwise, <b>FALSE</b>.
     * @param {Pointer<CERT_USAGE_MATCH>} pRequestedIssuancePolicy A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_usage_match">CERT_USAGE_MATCH</a> structure that specifies identifiers that the certificate must match to be validated.
     * @param {Pointer<HCERTSTORE>} phAdditionalCertStore A handle to a <a href="https://docs.microsoft.com/windows/desktop/SecGloss/c-gly">certificate store</a> that contains additional certificates used for the authentication.
     * @param {Pointer<CERT_CONTEXT>} pCert A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate to validate.
     * @param {Pointer<Guid>} pProvGUID A pointer to  a <b>GUID</b> structure that receives the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security support provider</a> (SSP) used for the authentication.
     * @returns {Integer} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstvalidate
     * @since windows6.1
     */
    static PstValidate(pTargetName, bIsClient, pRequestedIssuancePolicy, phAdditionalCertStore, pCert, pProvGUID) {
        result := DllCall("certpoleng.dll\PstValidate", "ptr", pTargetName, "int", bIsClient, "ptr", pRequestedIssuancePolicy, "ptr", phAdditionalCertStore, "ptr", pCert, "ptr", pProvGUID, "int")
        return result
    }

    /**
     * Retrieves a structure that specifies information that can be used to create a user token associated with the specified certificate.
     * @param {Pointer<CERT_CONTEXT>} pCert A constant pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate for which to obtain token information.
     * @param {Pointer<Int32>} pTokenInformationType A pointer to a value of the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecpkg/ne-ntsecpkg-lsa_token_information_type">LSA_TOKEN_INFORMATION_TYPE</a> enumeration that indicates the type of structure pointed to by the <i>ppTokenInformation</i> parameter.
     * @param {Pointer<Void>} ppTokenInformation The address of a pointer to a structure that specifies information that can be used to create a user token.
     * @returns {Integer} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstmapcertificate
     * @since windows6.1
     */
    static PstMapCertificate(pCert, pTokenInformationType, ppTokenInformation) {
        result := DllCall("certpoleng.dll\PstMapCertificate", "ptr", pCert, "ptr", pTokenInformationType, "ptr", ppTokenInformation, "int")
        return result
    }

    /**
     * Retrieves the user name associated with the specified certificate.
     * @param {Pointer<CERT_CONTEXT>} pCertContext A constant pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/wincrypt/ns-wincrypt-cert_context">CERT_CONTEXT</a> structure that specifies the certificate for which to obtain the user name.
     * @param {Pointer<UNICODE_STRING>} UserName The user name associated with the certificate specified by the <i>pCertContext</i> parameter.
     * @returns {Integer} If the function succeeds, return <b>STATUS_SUCCESS</b>.
     * 
     * If the function fails, return an <b>NTSTATUS</b> code that indicates the reason it failed.
     * @see https://learn.microsoft.com/windows/win32/api/certpoleng/nf-certpoleng-pstgetusernameforcertificate
     * @since windows6.1
     */
    static PstGetUserNameForCertificate(pCertContext, UserName) {
        result := DllCall("certpoleng.dll\PstGetUserNameForCertificate", "ptr", pCertContext, "ptr", UserName, "int")
        return result
    }

;@endregion Methods
}
