#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit

/**
 * @namespace Windows.Win32.Security.Cryptography.Certificates
 */

;@region Constants

/**
 * @type {String}
 */
export global wszREGKEYNOSYSTEMCERTSVCPATH := "CurrentControlSet\Services\CertSvc"

/**
 * @type {String}
 */
export global wszREGKEYCERTSVCPATH := "SYSTEM\CurrentControlSet\Services\CertSvc"

/**
 * @type {Integer (UInt32)}
 */
export global CA_DISP_INCOMPLETE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CA_DISP_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global CA_DISP_REVOKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global CA_DISP_VALID := 3

/**
 * @type {Integer (UInt32)}
 */
export global CA_DISP_INVALID := 4

/**
 * @type {Integer (UInt32)}
 */
export global CA_DISP_UNDER_SUBMISSION := 5

/**
 * @type {Integer (UInt32)}
 */
export global KRA_DISP_EXPIRED := 0

/**
 * @type {Integer (UInt32)}
 */
export global KRA_DISP_NOTFOUND := 1

/**
 * @type {Integer (UInt32)}
 */
export global KRA_DISP_REVOKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global KRA_DISP_VALID := 3

/**
 * @type {Integer (UInt32)}
 */
export global KRA_DISP_INVALID := 4

/**
 * @type {Integer (UInt32)}
 */
export global KRA_DISP_UNTRUSTED := 5

/**
 * @type {Integer (UInt32)}
 */
export global KRA_DISP_NOTLOADED := 6

/**
 * @type {Integer (UInt32)}
 */
export global CA_ACCESS_MASKROLES := 255

/**
 * @type {Integer (UInt32)}
 */
export global CA_CRL_BASE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CA_CRL_DELTA := 2

/**
 * @type {Integer (UInt32)}
 */
export global CA_CRL_REPUBLISH := 16

/**
 * @type {Integer (UInt32)}
 */
export global ICF_ALLOWFOREIGN := 65536

/**
 * @type {Integer (UInt32)}
 */
export global ICF_EXISTINGROW := 131072

/**
 * @type {Integer (UInt32)}
 */
export global IKF_OVERWRITE := 65536

/**
 * @type {String}
 */
export global wszOCSPCAPROP_CACERTIFICATE := "CACertificate"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_HASHALGORITHMID := "HashAlgorithmId"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_SIGNINGFLAGS := "SigningFlags"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_REMINDERDURATION := "ReminderDuration"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_SIGNINGCERTIFICATE := "SigningCertificate"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_CSPNAME := "CSPName"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_KEYSPEC := "KeySpec"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_ERRORCODE := "ErrorCode"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_PROVIDERCLSID := "ProviderCLSID"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_PROVIDERPROPERTIES := "Provider"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_LOCALREVOCATIONINFORMATION := "LocalRevocationInformation"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_SIGNINGCERTIFICATETEMPLATE := "SigningCertificateTemplate"

/**
 * @type {String}
 */
export global wszOCSPCAPROP_CACONFIG := "CAConfig"

/**
 * @type {String}
 */
export global wszOCSPPROP_LOGLEVEL := "LogLevel"

/**
 * @type {String}
 */
export global wszOCSPPROP_DEBUG := "Debug"

/**
 * @type {String}
 */
export global wszOCSPPROP_AUDITFILTER := "AuditFilter"

/**
 * @type {String}
 */
export global wszOCSPPROP_ARRAYCONTROLLER := "ArrayController"

/**
 * @type {String}
 */
export global wszOCSPPROP_ARRAYMEMBERS := "ArrayMembers"

/**
 * @type {String}
 */
export global wszOCSPPROP_ENROLLPOLLINTERVAL := "EnrollPollInterval"

/**
 * @type {String}
 */
export global wszOCSPISAPIPROP_VIRTUALROOTNAME := "VirtualRootName"

/**
 * @type {String}
 */
export global wszOCSPISAPIPROP_NUMOFTHREADS := "NumOfThreads"

/**
 * @type {String}
 */
export global wszOCSPISAPIPROP_NUMOFBACKENDCONNECTIONS := "NumOfBackendConnections"

/**
 * @type {String}
 */
export global wszOCSPISAPIPROP_REFRESHRATE := "RefreshRate"

/**
 * @type {String}
 */
export global wszOCSPISAPIPROP_MAXNUMOFCACHEENTRIES := "MaxNumOfCacheEntries"

/**
 * @type {String}
 */
export global wszOCSPISAPIPROP_MAXAGE := "MaxAge"

/**
 * @type {String}
 */
export global wszOCSPISAPIPROP_DEBUG := "ISAPIDebug"

/**
 * @type {String}
 */
export global wszOCSPCOMMONPROP_REQFLAGS := "RequestFlags"

/**
 * @type {String}
 */
export global wszOCSPCOMMONPROP_MAXINCOMINGMESSAGESIZE := "MaxIncomingMessageSize"

/**
 * @type {String}
 */
export global wszOCSPCOMMONPROP_MAXNUMOFREQUESTENTRIES := "MaxNumOfRequestEntries"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_CRLURLTIMEOUT := "CrlUrlTimeOut"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_BASECRLURLS := "BaseCrlUrls"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_SERIALNUMBERSDIRS := "IssuedSerialNumbersDirectories"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_BASECRL := "BaseCrl"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_DELTACRLURLS := "DeltaCrlUrls"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_DELTACRL := "DeltaCrl"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_REFRESHTIMEOUT := "RefreshTimeOut"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_ERRORCODE := "RevocationErrorCode"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_ALLOWUSERONLYCRLS := "AllowUserOnlyCrls"

/**
 * @type {String}
 */
export global wszOCSPREVPROP_ALLOWCAONLYCRLS := "AllowCAOnlyCrls"

/**
 * @type {String}
 */
export global szBACKUPANNOTATION := "Cert Server Backup Interface"

/**
 * @type {String}
 */
export global szRESTOREANNOTATION := "Cert Server Restore Interface"

/**
 * @type {Integer (UInt32)}
 */
export global CSBACKUP_TYPE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global CSRESTORE_TYPE_FULL := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSRESTORE_TYPE_ONLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSRESTORE_TYPE_CATCHUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global CSRESTORE_TYPE_MASK := 5

/**
 * @type {Integer (UInt32)}
 */
export global CSBACKUP_DISABLE_INCREMENTAL := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global CSBFT_DIRECTORY := 128

/**
 * @type {Integer (UInt32)}
 */
export global CSBFT_DATABASE_DIRECTORY := 64

/**
 * @type {Integer (UInt32)}
 */
export global CSBFT_LOG_DIRECTORY := 32

/**
 * @type {Integer (UInt64)}
 */
export global CSCONTROL_SHUTDOWN := 1

/**
 * @type {Integer (UInt64)}
 */
export global CSCONTROL_SUSPEND := 2

/**
 * @type {Integer (UInt64)}
 */
export global CSCONTROL_RESTART := 3

/**
 * @type {String}
 */
export global wszCONFIG_COMMONNAME := "CommonName"

/**
 * @type {String}
 */
export global wszCONFIG_ORGUNIT := "OrgUnit"

/**
 * @type {String}
 */
export global wszCONFIG_ORGANIZATION := "Organization"

/**
 * @type {String}
 */
export global wszCONFIG_LOCALITY := "Locality"

/**
 * @type {String}
 */
export global wszCONFIG_STATE := "State"

/**
 * @type {String}
 */
export global wszCONFIG_COUNTRY := "Country"

/**
 * @type {String}
 */
export global wszCONFIG_CONFIG := "Config"

/**
 * @type {String}
 */
export global wszCONFIG_EXCHANGECERTIFICATE := "ExchangeCertificate"

/**
 * @type {String}
 */
export global wszCONFIG_SIGNATURECERTIFICATE := "SignatureCertificate"

/**
 * @type {String}
 */
export global wszCONFIG_DESCRIPTION := "Description"

/**
 * @type {String}
 */
export global wszCONFIG_COMMENT := "Comment"

/**
 * @type {String}
 */
export global wszCONFIG_SERVER := "Server"

/**
 * @type {String}
 */
export global wszCONFIG_AUTHORITY := "Authority"

/**
 * @type {String}
 */
export global wszCONFIG_SANITIZEDNAME := "SanitizedName"

/**
 * @type {String}
 */
export global wszCONFIG_SHORTNAME := "ShortName"

/**
 * @type {String}
 */
export global wszCONFIG_SANITIZEDSHORTNAME := "SanitizedShortName"

/**
 * @type {String}
 */
export global wszCONFIG_FLAGS := "Flags"

/**
 * @type {String}
 */
export global wszCONFIG_WEBENROLLMENTSERVERS := "WebEnrollmentServers"

/**
 * @type {Integer (UInt32)}
 */
export global CAIF_DSENTRY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CAIF_SHAREDFOLDERENTRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global CAIF_REGISTRY := 4

/**
 * @type {Integer (UInt32)}
 */
export global CAIF_LOCAL := 8

/**
 * @type {Integer (UInt32)}
 */
export global CAIF_REGISTRYPARENT := 16

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_ENCODEANY := 255

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_ENCODEMASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_FORMATANY := 0

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_PKCS10 := 256

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_KEYGEN := 512

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_PKCS7 := 768

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_CMC := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_CHALLENGERESPONSE := 1280

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_SIGNEDCERTIFICATETIMESTAMPLIST := 1536

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_FORMATMASK := 65280

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_SCEP := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_RPC := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_HTTP := 196608

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_FULLRESPONSE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_CRLS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_MACHINE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_ROBO := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_CLIENTIDNONE := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_CONNECTONLY := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_RETURNCHALLENGE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_SCEPPOST := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_CERTIFICATETRANSPARENCY := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global CR_IN_PRESIGN := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global CR_DISP_REVOKED := 6

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_BASE64REQUESTHEADER := 3

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_HEX := 4

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_HEXASCII := 5

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_BASE64X509CRLHEADER := 9

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_HEXADDR := 10

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_HEXASCIIADDR := 11

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_HEXRAW := 12

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_ENCODEMASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_CHAIN := 256

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_CRLS := 512

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_NOCRLF := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CR_OUT_NOCR := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CR_GEMT_DEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global CR_GEMT_HRESULT_STRING := 1

/**
 * @type {Integer (UInt32)}
 */
export global CR_GEMT_HTTP_ERROR := 2

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_FILEVERSION := 1

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_PRODUCTVERSION := 2

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_EXITCOUNT := 3

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_EXITDESCRIPTION := 4

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_POLICYDESCRIPTION := 5

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CANAME := 6

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_SANITIZEDCANAME := 7

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_SHAREDFOLDER := 8

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_PARENTCA := 9

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CATYPE := 10

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CASIGCERTCOUNT := 11

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CASIGCERT := 12

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CASIGCERTCHAIN := 13

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CAXCHGCERTCOUNT := 14

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CAXCHGCERT := 15

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CAXCHGCERTCHAIN := 16

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_BASECRL := 17

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_DELTACRL := 18

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CACERTSTATE := 19

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CRLSTATE := 20

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CAPROPIDMAX := 21

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_DNSNAME := 22

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_ROLESEPARATIONENABLED := 23

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_KRACERTUSEDCOUNT := 24

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_KRACERTCOUNT := 25

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_KRACERT := 26

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_KRACERTSTATE := 27

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_ADVANCEDSERVER := 28

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_TEMPLATES := 29

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_BASECRLPUBLISHSTATUS := 30

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_DELTACRLPUBLISHSTATUS := 31

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CASIGCERTCRLCHAIN := 32

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CAXCHGCERTCRLCHAIN := 33

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CACERTSTATUSCODE := 34

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CAFORWARDCROSSCERT := 35

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CABACKWARDCROSSCERT := 36

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CAFORWARDCROSSCERTSTATE := 37

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CABACKWARDCROSSCERTSTATE := 38

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CACERTVERSION := 39

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_SANITIZEDCASHORTNAME := 40

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CERTCDPURLS := 41

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CERTAIAURLS := 42

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CERTAIAOCSPURLS := 43

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_LOCALENAME := 44

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_SUBJECTTEMPLATE_OIDS := 45

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_CRLPARTITIONCOUNT := 46

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_PARTITIONED_BASECRL := 47

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_PARTITIONED_DELTACRL := 48

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_PARTITIONED_BASECRLPUBLISHSTATUS := 49

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_PARTITIONED_DELTACRLPUBLISHSTATUS := 50

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_SCEPSERVERCERTS := 1000

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_SCEPSERVERCAPABILITIES := 1001

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_SCEPSERVERCERTSCHAIN := 1002

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_SCEPMIN := 1000

/**
 * @type {Integer (UInt32)}
 */
export global CR_PROP_SCEPMAX := 1002

/**
 * @type {Integer (UInt32)}
 */
export global FR_PROP_CLAIMCHALLENGE := 22

/**
 * @type {Integer (UInt32)}
 */
export global EAN_NAMEOBJECTID := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global EANR_SUPPRESS_IA5CONVERSION := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CERTENROLL_INDEX_BASE := 0

/**
 * @type {Integer (UInt32)}
 */
export global EXITEVENT_INVALID := 0

/**
 * @type {Integer (UInt32)}
 */
export global EXITEVENT_STARTUP := 128

/**
 * @type {Integer (UInt32)}
 */
export global EXITEVENT_CERTIMPORTED := 512

/**
 * @type {Integer (UInt32)}
 */
export global ENUMEXT_OBJECTID := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMM_REFRESHONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global CMM_READONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBG_CERTSRV := 1

/**
 * @type {String}
 */
export global wszSERVICE_NAME := "CertSvc"

/**
 * @type {String}
 */
export global wszREGKEYBASE := "SYSTEM\CurrentControlSet\Services\CertSvc"

/**
 * @type {String}
 */
export global wszREGKEYCONFIG := "Configuration"

/**
 * @type {String}
 */
export global wszREGACTIVE := "Active"

/**
 * @type {String}
 */
export global wszREGDIRECTORY := "ConfigurationDirectory"

/**
 * @type {String}
 */
export global wszREGDBDIRECTORY := "DBDirectory"

/**
 * @type {String}
 */
export global wszREGDBLOGDIRECTORY := "DBLogDirectory"

/**
 * @type {String}
 */
export global wszREGDBSYSDIRECTORY := "DBSystemDirectory"

/**
 * @type {String}
 */
export global wszREGDBTEMPDIRECTORY := "DBTempDirectory"

/**
 * @type {String}
 */
export global wszREGDBSESSIONCOUNT := "DBSessionCount"

/**
 * @type {String}
 */
export global wszREGDBMAXREADSESSIONCOUNT := "DBMaxReadSessionCount"

/**
 * @type {String}
 */
export global wszREGDBFLAGS := "DBFlags"

/**
 * @type {String}
 */
export global wszREGDBLASTFULLBACKUP := "DBLastFullBackup"

/**
 * @type {String}
 */
export global wszREGDBLASTINCREMENTALBACKUP := "DBLastIncrementalBackup"

/**
 * @type {String}
 */
export global wszREGDBLASTRECOVERY := "DBLastRecovery"

/**
 * @type {String}
 */
export global wszREGWEBCLIENTCAMACHINE := "WebClientCAMachine"

/**
 * @type {String}
 */
export global wszREGVERSION := "Version"

/**
 * @type {String}
 */
export global wszREGWEBCLIENTCANAME := "WebClientCAName"

/**
 * @type {String}
 */
export global wszREGWEBCLIENTCATYPE := "WebClientCAType"

/**
 * @type {String}
 */
export global wszREGLDAPFLAGS := "LDAPFlags"

/**
 * @type {String}
 */
export global wszREGCERTSRVDEBUG := "Debug"

/**
 * @type {Integer (UInt32)}
 */
export global DBSESSIONCOUNTDEFAULT := 100

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_READONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_CREATEIFNEEDED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_CIRCULARLOGGING := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_LAZYFLUSH := 8

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_MAXCACHESIZEX100 := 16

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_CHECKPOINTDEPTH60MB := 32

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_LOGBUFFERSLARGE := 64

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_LOGBUFFERSHUGE := 128

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_LOGFILESIZE16MB := 256

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_MULTITHREADTRANSACTIONS := 512

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_DISABLESNAPSHOTBACKUP := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DBFLAGS_ENABLEVOLATILEREQUESTS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global LDAPF_SSLENABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global LDAPF_SIGNDISABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MAJOR_WIN2K := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MINOR_WIN2K := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MAJOR_WHISTLER := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MINOR_WHISTLER_BETA2 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MINOR_WHISTLER_BETA3 := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MAJOR_LONGHORN := 3

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MINOR_LONGHORN_BETA1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MAJOR_WIN7 := 4

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MINOR_WIN7 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MAJOR_WIN8 := 5

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MINOR_WIN8 := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MAJOR_WINBLUE := 6

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MINOR_WINBLUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MAJOR_THRESHOLD := 7

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MINOR_THRESHOLD := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MAJOR := 7

/**
 * @type {Integer (UInt32)}
 */
export global CSVER_MINOR := 1

/**
 * @type {String}
 */
export global wszREGKEYRESTOREINPROGRESS := "RestoreInProgress"

/**
 * @type {String}
 */
export global wszREGKEYDBPARAMETERS := "DBParameters"

/**
 * @type {String}
 */
export global wszREGCADESCRIPTION := "CADescription"

/**
 * @type {String}
 */
export global wszREGCACERTHASH := "CACertHash"

/**
 * @type {String}
 */
export global wszREGCASERIALNUMBER := "CACertSerialNumber"

/**
 * @type {String}
 */
export global wszREGCAXCHGCERTHASH := "CAXchgCertHash"

/**
 * @type {String}
 */
export global wszREGKRACERTHASH := "KRACertHash"

/**
 * @type {String}
 */
export global wszREGKRACERTCOUNT := "KRACertCount"

/**
 * @type {String}
 */
export global wszREGKRAFLAGS := "KRAFlags"

/**
 * @type {String}
 */
export global wszREGCATYPE := "CAType"

/**
 * @type {String}
 */
export global wszREGCERTENROLLCOMPATIBLE := "CertEnrollCompatible"

/**
 * @type {String}
 */
export global wszREGENFORCEX500NAMELENGTHS := "EnforceX500NameLengths"

/**
 * @type {String}
 */
export global wszREGCOMMONNAME := "CommonName"

/**
 * @type {String}
 */
export global wszREGCLOCKSKEWMINUTES := "ClockSkewMinutes"

/**
 * @type {String}
 */
export global wszREGCRLNEXTPUBLISH := "CRLNextPublish"

/**
 * @type {String}
 */
export global wszREGCRLPERIODSTRING := "CRLPeriod"

/**
 * @type {String}
 */
export global wszREGCRLPERIODCOUNT := "CRLPeriodUnits"

/**
 * @type {String}
 */
export global wszREGCRLOVERLAPPERIODSTRING := "CRLOverlapPeriod"

/**
 * @type {String}
 */
export global wszREGCRLOVERLAPPERIODCOUNT := "CRLOverlapUnits"

/**
 * @type {String}
 */
export global wszREGCRLDELTANEXTPUBLISH := "CRLDeltaNextPublish"

/**
 * @type {String}
 */
export global wszREGCRLDELTAPERIODSTRING := "CRLDeltaPeriod"

/**
 * @type {String}
 */
export global wszREGCRLDELTAPERIODCOUNT := "CRLDeltaPeriodUnits"

/**
 * @type {String}
 */
export global wszREGCRLDELTAOVERLAPPERIODSTRING := "CRLDeltaOverlapPeriod"

/**
 * @type {String}
 */
export global wszREGCRLDELTAOVERLAPPERIODCOUNT := "CRLDeltaOverlapUnits"

/**
 * @type {String}
 */
export global wszREGCRLPUBLICATIONURLS := "CRLPublicationURLs"

/**
 * @type {String}
 */
export global wszREGCACERTPUBLICATIONURLS := "CACertPublicationURLs"

/**
 * @type {String}
 */
export global wszREGCRLMAXPARTITIONS := "CRLMaxPartitions"

/**
 * @type {String}
 */
export global wszREGCRLSUSPENDEDPARTITIONS := "CRLSuspendedPartitions"

/**
 * @type {String}
 */
export global wszREGCRLCURRENTPARTITION := "CRLCurrentPartition"

/**
 * @type {String}
 */
export global wszREGCAXCHGVALIDITYPERIODSTRING := "CAXchgValidityPeriod"

/**
 * @type {String}
 */
export global wszREGCAXCHGVALIDITYPERIODCOUNT := "CAXchgValidityPeriodUnits"

/**
 * @type {String}
 */
export global wszREGCAXCHGOVERLAPPERIODSTRING := "CAXchgOverlapPeriod"

/**
 * @type {String}
 */
export global wszREGCAXCHGOVERLAPPERIODCOUNT := "CAXchgOverlapPeriodUnits"

/**
 * @type {String}
 */
export global wszREGCRLPATH_OLD := "CRLPath"

/**
 * @type {String}
 */
export global wszREGCRLEDITFLAGS := "CRLEditFlags"

/**
 * @type {String}
 */
export global wszREGCRLFLAGS := "CRLFlags"

/**
 * @type {String}
 */
export global wszREGCRLATTEMPTREPUBLISH := "CRLAttemptRepublish"

/**
 * @type {String}
 */
export global wszREGENABLED := "Enabled"

/**
 * @type {String}
 */
export global wszREGFORCETELETEX := "ForceTeletex"

/**
 * @type {String}
 */
export global wszREGLOGLEVEL := "LogLevel"

/**
 * @type {String}
 */
export global wszREGHIGHSERIAL := "HighSerial"

/**
 * @type {String}
 */
export global wszREGPOLICYFLAGS := "PolicyFlags"

/**
 * @type {String}
 */
export global wszREGNAMESEPARATOR := "SubjectNameSeparator"

/**
 * @type {String}
 */
export global wszREGSUBJECTTEMPLATE := "SubjectTemplate"

/**
 * @type {String}
 */
export global wszREGCAUSEDS := "UseDS"

/**
 * @type {String}
 */
export global wszREGVALIDITYPERIODSTRING := "ValidityPeriod"

/**
 * @type {String}
 */
export global wszREGVALIDITYPERIODCOUNT := "ValidityPeriodUnits"

/**
 * @type {String}
 */
export global wszREGPARENTCAMACHINE := "ParentCAMachine"

/**
 * @type {String}
 */
export global wszREGPARENTCANAME := "ParentCAName"

/**
 * @type {String}
 */
export global wszREGREQUESTFILENAME := "RequestFileName"

/**
 * @type {String}
 */
export global wszREGREQUESTID := "RequestId"

/**
 * @type {String}
 */
export global wszREGREQUESTKEYCONTAINER := "RequestKeyContainer"

/**
 * @type {String}
 */
export global wszREGREQUESTKEYINDEX := "RequestKeyIndex"

/**
 * @type {String}
 */
export global wszREGCASERVERNAME := "CAServerName"

/**
 * @type {String}
 */
export global wszREGCACERTFILENAME := "CACertFileName"

/**
 * @type {String}
 */
export global wszREGCASECURITY := "Security"

/**
 * @type {String}
 */
export global wszREGAUDITFILTER := "AuditFilter"

/**
 * @type {String}
 */
export global wszREGOFFICERRIGHTS := "OfficerRights"

/**
 * @type {String}
 */
export global wszENROLLMENTAGENTRIGHTS := "EnrollmentAgentRights"

/**
 * @type {String}
 */
export global wszREGMAXINCOMINGMESSAGESIZE := "MaxIncomingMessageSize"

/**
 * @type {String}
 */
export global wszREGMAXINCOMINGALLOCSIZE := "MaxIncomingAllocSize"

/**
 * @type {String}
 */
export global wszREGROLESEPARATIONENABLED := "RoleSeparationEnabled"

/**
 * @type {String}
 */
export global wszREGALTERNATEPUBLISHDOMAINS := "AlternatePublishDomains"

/**
 * @type {String}
 */
export global wszREGSETUPSTATUS := "SetupStatus"

/**
 * @type {String}
 */
export global wszREGINTERFACEFLAGS := "InterfaceFlags"

/**
 * @type {String}
 */
export global wszREGDSCONFIGDN := "DSConfigDN"

/**
 * @type {String}
 */
export global wszREGDSDOMAINDN := "DSDomainDN"

/**
 * @type {String}
 */
export global wszREGVIEWAGEMINUTES := "ViewAgeMinutes"

/**
 * @type {String}
 */
export global wszREGVIEWIDLEMINUTES := "ViewIdleMinutes"

/**
 * @type {String}
 */
export global wszREGEKPUBLISTDIRECTORIES := "EndorsementKeyListDirectories"

/**
 * @type {String}
 */
export global wszCERTIFICATETRANSPARENCYFLAGS := "CertificateTransparencyFlags"

/**
 * @type {String}
 */
export global wszREGMAXSCTLISTSIZE := "MaxSCTListSize"

/**
 * @type {String}
 */
export global wszREGCERTIFICATETRANSPARENCYINFOOID := "CTInformationExtensionOid"

/**
 * @type {String}
 */
export global wszREGPROCESSINGFLAGS := "ProcessingFlags"

/**
 * @type {String}
 */
export global wszREGUSEDEFINEDCACERTINREQ := "UseDefinedCACertInRequest"

/**
 * @type {String}
 */
export global wszREGENABLEDEKUFORDEFINEDCACERT := "EnabledEKUForDefinedCACert"

/**
 * @type {String}
 */
export global wszREGEKUOIDSFORPUBLISHEXPIREDCERTINCRL := "EKUOIDsForPublishExpiredCertInCRL"

/**
 * @type {String}
 */
export global wszCRTFILENAMEEXT := ".crt"

/**
 * @type {String}
 */
export global wszPFXFILENAMEEXT := ".p12"

/**
 * @type {String}
 */
export global wszDATFILENAMEEXT := ".dat"

/**
 * @type {String}
 */
export global wszLOGFILENAMEEXT := ".log"

/**
 * @type {String}
 */
export global wszDBFILENAMEEXT := ".edb"

/**
 * @type {String}
 */
export global szDBBASENAMEPARM := "edb"

/**
 * @type {String}
 */
export global wszLOGPATH := "CertLog"

/**
 * @type {String}
 */
export global wszDBBACKUPSUBDIR := "DataBase"

/**
 * @type {String}
 */
export global wszDBBACKUPCERTBACKDAT := "certbkxp.dat"

/**
 * @type {Integer (UInt32)}
 */
export global CCLOCKSKEWMINUTESDEFAULT := 10

/**
 * @type {Integer (UInt32)}
 */
export global CVIEWAGEMINUTESDEFAULT := 16

/**
 * @type {Integer (UInt32)}
 */
export global dwVALIDITYPERIODCOUNTDEFAULT_ROOT := 5

/**
 * @type {Integer (UInt32)}
 */
export global dwVALIDITYPERIODCOUNTDEFAULT_ENTERPRISE := 2

/**
 * @type {Integer (UInt32)}
 */
export global dwVALIDITYPERIODCOUNTDEFAULT_STANDALONE := 1

/**
 * @type {Integer (UInt32)}
 */
export global dwCAXCHGVALIDITYPERIODCOUNTDEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global dwCAXCHGOVERLAPPERIODCOUNTDEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global dwCRLPERIODCOUNTDEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global dwCRLOVERLAPPERIODCOUNTDEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global dwCRLDELTAPERIODCOUNTDEFAULT := 1

/**
 * @type {Integer (UInt32)}
 */
export global dwCRLDELTAOVERLAPPERIODCOUNTDEFAULT := 0

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_SERVER_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_CLIENT_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_SUSPEND_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_REQUEST_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_ONLINE_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_DENIED_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_CREATEDB_FLAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_ATTEMPT_VROOT_CREATE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_FORCECRL_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_UPDATE_CAOBJECT_SVRTYPE := 512

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_SERVER_UPGRADED_FLAG := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_W2K_SECURITY_NOT_UPGRADED_FLAG := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_SECURITY_CHANGED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_DCOM_SECURITY_UPDATED_FLAG := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SETUP_SERVER_IS_UP_TO_DATE_FLAG := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_DELTA_USE_OLDEST_UNEXPIRED_BASE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_DELETE_EXPIRED_CRLS := 2

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_CRLNUMBER_CRITICAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_REVCHECK_IGNORE_OFFLINE := 8

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_IGNORE_INVALID_POLICIES := 16

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_REBUILD_MODIFIED_SUBJECT_ONLY := 32

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_SAVE_FAILED_CERTS := 64

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_IGNORE_UNKNOWN_CMC_ATTRIBUTES := 128

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_IGNORE_CROSS_CERT_TRUST_ERROR := 256

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_PUBLISH_EXPIRED_CERT_CRLS := 512

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_ENFORCE_ENROLLMENT_AGENT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_DISABLE_RDN_REORDER := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_DISABLE_ROOT_CROSS_CERTS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_LOG_FULL_RESPONSE := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_USE_XCHG_CERT_TEMPLATE := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_USE_CROSS_CERT_TEMPLATE := 32768

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_ALLOW_REQUEST_ATTRIBUTE_SUBJECT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_REVCHECK_IGNORE_NOREVCHECK := 131072

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_PRESERVE_EXPIRED_CA_CERTS := 262144

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_PRESERVE_REVOKED_CA_CERTS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_DISABLE_CHAIN_VERIFICATION := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_BUILD_ROOTCA_CRLENTRIES_BASEDONKEY := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_ENABLE_CRL_PARTITION := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_PARTITION_ZERO_EXCLUSIVE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_CONTAINS_ONLY_CACERTS := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global CRLF_CONTAINS_ONLY_USERCERTS := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global KRAF_ENABLEFOREIGN := 1

/**
 * @type {Integer (UInt32)}
 */
export global KRAF_SAVEBADREQUESTKEY := 2

/**
 * @type {Integer (UInt32)}
 */
export global KRAF_ENABLEARCHIVEALL := 4

/**
 * @type {Integer (UInt32)}
 */
export global KRAF_DISABLEUSEDEFAULTPROVIDER := 8

/**
 * @type {Integer (UInt32)}
 */
export global IF_LOCKICERTREQUEST := 1

/**
 * @type {Integer (UInt32)}
 */
export global IF_NOREMOTEICERTREQUEST := 2

/**
 * @type {Integer (UInt32)}
 */
export global IF_NOLOCALICERTREQUEST := 4

/**
 * @type {Integer (UInt32)}
 */
export global IF_NORPCICERTREQUEST := 8

/**
 * @type {Integer (UInt32)}
 */
export global IF_NOREMOTEICERTADMIN := 16

/**
 * @type {Integer (UInt32)}
 */
export global IF_NOLOCALICERTADMIN := 32

/**
 * @type {Integer (UInt32)}
 */
export global IF_NOREMOTEICERTADMINBACKUP := 64

/**
 * @type {Integer (UInt32)}
 */
export global IF_NOLOCALICERTADMINBACKUP := 128

/**
 * @type {Integer (UInt32)}
 */
export global IF_NOSNAPSHOTBACKUP := 256

/**
 * @type {Integer (UInt32)}
 */
export global IF_ENFORCEENCRYPTICERTREQUEST := 512

/**
 * @type {Integer (UInt32)}
 */
export global IF_ENFORCEENCRYPTICERTADMIN := 1024

/**
 * @type {Integer (UInt32)}
 */
export global IF_ENABLEEXITKEYRETRIEVAL := 2048

/**
 * @type {Integer (UInt32)}
 */
export global IF_ENABLEADMINASAUDITOR := 4096

/**
 * @type {Integer (UInt32)}
 */
export global IF_ENABLEPRESIGNSUPPORT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PROCFLG_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global PROCFLG_ENFORCEGOODKEYS := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSURL_SERVERPUBLISH := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSURL_ADDTOCERTCDP := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSURL_ADDTOFRESHESTCRL := 4

/**
 * @type {Integer (UInt32)}
 */
export global CSURL_ADDTOCRLCDP := 8

/**
 * @type {Integer (UInt32)}
 */
export global CSURL_PUBLISHRETRY := 16

/**
 * @type {Integer (UInt32)}
 */
export global CSURL_ADDTOCERTOCSP := 32

/**
 * @type {Integer (UInt32)}
 */
export global CSURL_SERVERPUBLISHDELTA := 64

/**
 * @type {Integer (UInt32)}
 */
export global CSURL_ADDTOIDP := 128

/**
 * @type {String}
 */
export global wszREGKEYCSP := "CSP"

/**
 * @type {String}
 */
export global wszREGKEYENCRYPTIONCSP := "EncryptionCSP"

/**
 * @type {String}
 */
export global wszREGKEYEXITMODULES := "ExitModules"

/**
 * @type {String}
 */
export global wszREGKEYPOLICYMODULES := "PolicyModules"

/**
 * @type {String}
 */
export global wszSECUREDATTRIBUTES := "SignedAttributes"

/**
 * @type {String}
 */
export global wszzDEFAULTSIGNEDATTRIBUTES := "RequesterName" Chr(0) ""

/**
 * @type {String}
 */
export global wszREGBACKUPLOGDIRECTORY := "BackupLogDirectory"

/**
 * @type {String}
 */
export global wszREGCHECKPOINTFILE := "CheckPointFile"

/**
 * @type {String}
 */
export global wszREGHIGHLOGNUMBER := "HighLogNumber"

/**
 * @type {String}
 */
export global wszREGLOWLOGNUMBER := "LowLogNumber"

/**
 * @type {String}
 */
export global wszREGLOGPATH := "LogPath"

/**
 * @type {String}
 */
export global wszREGRESTOREMAPCOUNT := "RestoreMapCount"

/**
 * @type {String}
 */
export global wszREGRESTOREMAP := "RestoreMap"

/**
 * @type {String}
 */
export global wszREGDATABASERECOVERED := "DatabaseRecovered"

/**
 * @type {String}
 */
export global wszREGRESTORESTATUS := "RestoreStatus"

/**
 * @type {String}
 */
export global wszREGB2ICERTMANAGEMODULE := "ICertManageModule"

/**
 * @type {String}
 */
export global wszREGSP4DEFAULTCONFIGURATION := "DefaultConfiguration"

/**
 * @type {String}
 */
export global wszREGSP4KEYSETNAME := "KeySetName"

/**
 * @type {String}
 */
export global wszREGSP4SUBJECTNAMESEPARATOR := "SubjectNameSeparator"

/**
 * @type {String}
 */
export global wszREGSP4NAMES := "Names"

/**
 * @type {String}
 */
export global wszREGSP4QUERIES := "Queries"

/**
 * @type {String}
 */
export global wszREGNETSCAPECERTTYPE := "NetscapeCertType"

/**
 * @type {String}
 */
export global wszNETSCAPEREVOCATIONTYPE := "Netscape"

/**
 * @type {String}
 */
export global wszREGPROVIDERTYPE := "ProviderType"

/**
 * @type {String}
 */
export global wszREGPROVIDER := "Provider"

/**
 * @type {String}
 */
export global wszHASHALGORITHM := "HashAlgorithm"

/**
 * @type {String}
 */
export global wszENCRYPTIONALGORITHM := "EncryptionAlgorithm"

/**
 * @type {String}
 */
export global wszMACHINEKEYSET := "MachineKeyset"

/**
 * @type {String}
 */
export global wszREGKEYSIZE := "KeySize"

/**
 * @type {String}
 */
export global wszREGSYMMETRICKEYSIZE := "SymmetricKeySize"

/**
 * @type {String}
 */
export global wszCNGPUBLICKEYALGORITHM := "CNGPublicKeyAlgorithm"

/**
 * @type {String}
 */
export global wszCNGHASHALGORITHM := "CNGHashAlgorithm"

/**
 * @type {String}
 */
export global wszCNGENCRYPTIONALGORITHM := "CNGEncryptionAlgorithm"

/**
 * @type {String}
 */
export global wszREGALTERNATESIGNATUREALGORITHM := "AlternateSignatureAlgorithm"

/**
 * @type {String}
 */
export global szNAMESEPARATORDEFAULT := "" Chr(10) ""

/**
 * @type {String}
 */
export global wszPERIODYEARS := "Years"

/**
 * @type {String}
 */
export global wszPERIODMONTHS := "Months"

/**
 * @type {String}
 */
export global wszPERIODWEEKS := "Weeks"

/**
 * @type {String}
 */
export global wszPERIODDAYS := "Days"

/**
 * @type {String}
 */
export global wszPERIODHOURS := "Hours"

/**
 * @type {String}
 */
export global wszPERIODMINUTES := "Minutes"

/**
 * @type {String}
 */
export global wszPERIODSECONDS := "Seconds"

/**
 * @type {String}
 */
export global wszREGISSUERCERTURLFLAGS := "IssuerCertURLFlags"

/**
 * @type {String}
 */
export global wszREGEDITFLAGS := "EditFlags"

/**
 * @type {String}
 */
export global wszREGUPNMAP := "UPNMap"

/**
 * @type {String}
 */
export global wszREGSUBJECTALTNAME := "SubjectAltName"

/**
 * @type {String}
 */
export global wszREGSUBJECTALTNAME2 := "SubjectAltName2"

/**
 * @type {String}
 */
export global wszREGREQUESTDISPOSITION := "RequestDisposition"

/**
 * @type {String}
 */
export global wszREGCAPATHLENGTH := "CAPathLength"

/**
 * @type {String}
 */
export global wszREGREVOCATIONTYPE := "RevocationType"

/**
 * @type {String}
 */
export global wszREGLDAPREVOCATIONCRLURL_OLD := "LDAPRevocationCRLURL"

/**
 * @type {String}
 */
export global wszREGREVOCATIONCRLURL_OLD := "RevocationCRLURL"

/**
 * @type {String}
 */
export global wszREGFTPREVOCATIONCRLURL_OLD := "FTPRevocationCRLURL"

/**
 * @type {String}
 */
export global wszREGFILEREVOCATIONCRLURL_OLD := "FileRevocationCRLURL"

/**
 * @type {String}
 */
export global wszREGREVOCATIONURL := "RevocationURL"

/**
 * @type {String}
 */
export global wszREGLDAPISSUERCERTURL_OLD := "LDAPIssuerCertURL"

/**
 * @type {String}
 */
export global wszREGISSUERCERTURL_OLD := "IssuerCertURL"

/**
 * @type {String}
 */
export global wszREGFTPISSUERCERTURL_OLD := "FTPIssuerCertURL"

/**
 * @type {String}
 */
export global wszREGFILEISSUERCERTURL_OLD := "FileIssuerCertURL"

/**
 * @type {String}
 */
export global wszREGENABLEREQUESTEXTENSIONLIST := "EnableRequestExtensionList"

/**
 * @type {String}
 */
export global wszREGENABLEENROLLEEREQUESTEXTENSIONLIST := "EnableEnrolleeRequestExtensionList"

/**
 * @type {String}
 */
export global wszREGDISABLEEXTENSIONLIST := "DisableExtensionList"

/**
 * @type {String}
 */
export global wszREGEKUOIDSFORVOLATILEREQUESTS := "EKUOIDsforVolatileRequests"

/**
 * @type {String}
 */
export global wszREGLDAPSESSIONOPTIONS := "LDAPSessionOptions"

/**
 * @type {String}
 */
export global wszLDAPSESSIONOPTIONVALUE := "LDAPSessionOptionValue"

/**
 * @type {String}
 */
export global wszREGDEFAULTSMIME := "DefaultSMIME"

/**
 * @type {Integer (UInt32)}
 */
export global CAPATHLENGTH_INFINITE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global REQDISP_PENDING := 0

/**
 * @type {Integer (UInt32)}
 */
export global REQDISP_ISSUE := 1

/**
 * @type {Integer (UInt32)}
 */
export global REQDISP_DENY := 2

/**
 * @type {Integer (UInt32)}
 */
export global REQDISP_USEREQUESTATTRIBUTE := 3

/**
 * @type {Integer (UInt32)}
 */
export global REQDISP_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global REQDISP_PENDINGFIRST := 256

/**
 * @type {Integer (UInt32)}
 */
export global REQDISP_DEFAULT_ENTERPRISE := 1

/**
 * @type {Integer (UInt32)}
 */
export global REVEXT_CDPLDAPURL_OLD := 1

/**
 * @type {Integer (UInt32)}
 */
export global REVEXT_CDPHTTPURL_OLD := 2

/**
 * @type {Integer (UInt32)}
 */
export global REVEXT_CDPFTPURL_OLD := 4

/**
 * @type {Integer (UInt32)}
 */
export global REVEXT_CDPFILEURL_OLD := 8

/**
 * @type {Integer (UInt32)}
 */
export global REVEXT_CDPURLMASK_OLD := 255

/**
 * @type {Integer (UInt32)}
 */
export global REVEXT_CDPENABLE := 256

/**
 * @type {Integer (UInt32)}
 */
export global REVEXT_ASPENABLE := 512

/**
 * @type {Integer (UInt32)}
 */
export global REVEXT_DEFAULT_NODS := 256

/**
 * @type {Integer (UInt32)}
 */
export global REVEXT_DEFAULT_DS := 256

/**
 * @type {Integer (UInt32)}
 */
export global ISSCERT_LDAPURL_OLD := 1

/**
 * @type {Integer (UInt32)}
 */
export global ISSCERT_HTTPURL_OLD := 2

/**
 * @type {Integer (UInt32)}
 */
export global ISSCERT_FTPURL_OLD := 4

/**
 * @type {Integer (UInt32)}
 */
export global ISSCERT_FILEURL_OLD := 8

/**
 * @type {Integer (UInt32)}
 */
export global ISSCERT_URLMASK_OLD := 255

/**
 * @type {Integer (UInt32)}
 */
export global ISSCERT_ENABLE := 256

/**
 * @type {Integer (UInt32)}
 */
export global ISSCERT_DEFAULT_NODS := 256

/**
 * @type {Integer (UInt32)}
 */
export global ISSCERT_DEFAULT_DS := 256

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLEREQUESTEXTENSIONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_REQUESTEXTENSIONLIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_DISABLEEXTENSIONLIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ADDOLDKEYUSAGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ADDOLDCERTTYPE := 16

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ATTRIBUTEENDDATE := 32

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_BASICCONSTRAINTSCRITICAL := 64

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_BASICCONSTRAINTSCA := 128

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLEAKIKEYID := 256

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ATTRIBUTECA := 512

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_IGNOREREQUESTERGROUP := 1024

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLEAKIISSUERNAME := 2048

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLEAKIISSUERSERIAL := 4096

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLEAKICRITICAL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_SERVERUPGRADED := 16384

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ATTRIBUTEEKU := 32768

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLEDEFAULTSMIME := 65536

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_EMAILOPTIONAL := 131072

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ATTRIBUTESUBJECTALTNAME2 := 262144

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLELDAPREFERRALS := 524288

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLECHASECLIENTDC := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_AUDITCERTTEMPLATELOAD := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_DISABLEOLDOSCNUPN := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_DISABLELDAPPACKAGELIST := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLEUPNMAP := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLEOCSPREVNOCHECK := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLERENEWONBEHALFOF := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global EDITF_ENABLEKEYENCIPHERMENTCACERT := 134217728

/**
 * @type {String}
 */
export global wszREGLDAPREVOCATIONDN_OLD := "LDAPRevocationDN"

/**
 * @type {String}
 */
export global wszREGLDAPREVOCATIONDNTEMPLATE_OLD := "LDAPRevocationDNTemplate"

/**
 * @type {String}
 */
export global wszCRLPUBLISHRETRYCOUNT := "CRLPublishRetryCount"

/**
 * @type {String}
 */
export global wszREGCERTPUBLISHFLAGS := "PublishCertFlags"

/**
 * @type {Integer (UInt32)}
 */
export global EXITPUB_FILE := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXITPUB_ACTIVEDIRECTORY := 2

/**
 * @type {Integer (UInt32)}
 */
export global EXITPUB_REMOVEOLDCERTS := 16

/**
 * @type {Integer (UInt32)}
 */
export global EXITPUB_DEFAULT_ENTERPRISE := 2

/**
 * @type {Integer (UInt32)}
 */
export global EXITPUB_DEFAULT_STANDALONE := 1

/**
 * @type {String}
 */
export global wszCLASS_CERTADMIN := "CertificateAuthority.Admin"

/**
 * @type {String}
 */
export global wszCLASS_CERTCONFIG := "CertificateAuthority.Config"

/**
 * @type {String}
 */
export global wszCLASS_CERTGETCONFIG := "CertificateAuthority.GetConfig"

/**
 * @type {String}
 */
export global wszCLASS_CERTENCODE := "CertificateAuthority.Encode"

/**
 * @type {String}
 */
export global wszCLASS_CERTDBMEM := "CertificateAuthority.DBMem"

/**
 * @type {String}
 */
export global wszCLASS_CERTREQUEST := "CertificateAuthority.Request"

/**
 * @type {String}
 */
export global wszCLASS_CERTSERVEREXIT := "CertificateAuthority.ServerExit"

/**
 * @type {String}
 */
export global wszCLASS_CERTSERVERPOLICY := "CertificateAuthority.ServerPolicy"

/**
 * @type {String}
 */
export global wszCLASS_CERTVIEW := "CertificateAuthority.View"

/**
 * @type {String}
 */
export global wszMICROSOFTCERTMODULE_PREFIX := "CertificateAuthority_MicrosoftDefault"

/**
 * @type {String}
 */
export global wszCERTMANAGE_SUFFIX := "Manage"

/**
 * @type {String}
 */
export global wszCERTEXITMODULE_POSTFIX := ".Exit"

/**
 * @type {String}
 */
export global wszCERTPOLICYMODULE_POSTFIX := ".Policy"

/**
 * @type {String}
 */
export global wszCAPOLICYFILE := "CAPolicy.inf"

/**
 * @type {String}
 */
export global wszINFSECTION_CDP := "CRLDistributionPoint"

/**
 * @type {String}
 */
export global wszINFSECTION_AIA := "AuthorityInformationAccess"

/**
 * @type {String}
 */
export global wszINFSECTION_EKU := "EnhancedKeyUsageExtension"

/**
 * @type {String}
 */
export global wszINFSECTION_CCDP := "CrossCertificateDistributionPointsExtension"

/**
 * @type {String}
 */
export global wszINFSECTION_CERTSERVER := "certsrv_server"

/**
 * @type {String}
 */
export global wszINFKEY_RENEWALKEYLENGTH := "RenewalKeyLength"

/**
 * @type {String}
 */
export global wszINFKEY_RENEWALVALIDITYPERIODSTRING := "RenewalValidityPeriod"

/**
 * @type {String}
 */
export global wszINFKEY_RENEWALVALIDITYPERIODCOUNT := "RenewalValidityPeriodUnits"

/**
 * @type {String}
 */
export global wszINFKEY_UTF8 := "UTF8"

/**
 * @type {String}
 */
export global wszINFKEY_CRLPERIODSTRING := "CRLPeriod"

/**
 * @type {String}
 */
export global wszINFKEY_CRLPERIODCOUNT := "CRLPeriodUnits"

/**
 * @type {String}
 */
export global wszINFKEY_CRLDELTAPERIODSTRING := "CRLDeltaPeriod"

/**
 * @type {String}
 */
export global wszINFKEY_CRLDELTAPERIODCOUNT := "CRLDeltaPeriodUnits"

/**
 * @type {String}
 */
export global wszINFKEY_LOADDEFAULTTEMPLATES := "LoadDefaultTemplates"

/**
 * @type {String}
 */
export global wszINFKEY_ENABLEKEYCOUNTING := "EnableKeyCounting"

/**
 * @type {String}
 */
export global wszINFKEY_FORCEUTF8 := "ForceUTF8"

/**
 * @type {String}
 */
export global wszINFKEY_ALTERNATESIGNATUREALGORITHM := "AlternateSignatureAlgorithm"

/**
 * @type {String}
 */
export global wszINFKEY_SHOWALLCSPS := "ShowAllCSPs"

/**
 * @type {String}
 */
export global wszINFKEY_CRITICAL := "Critical"

/**
 * @type {String}
 */
export global wszINFKEY_EMPTY := "Empty"

/**
 * @type {String}
 */
export global wszINFKEY_CCDPSYNCDELTATIME := "SyncDeltaTime"

/**
 * @type {String}
 */
export global wszINFSECTION_CAPOLICY := "CAPolicy"

/**
 * @type {String}
 */
export global wszINFSECTION_POLICYSTATEMENT := "PolicyStatementExtension"

/**
 * @type {String}
 */
export global wszINFSECTION_APPLICATIONPOLICYSTATEMENT := "ApplicationPolicyStatementExtension"

/**
 * @type {String}
 */
export global wszINFKEY_POLICIES := "Policies"

/**
 * @type {String}
 */
export global wszINFKEY_OID := "OID"

/**
 * @type {String}
 */
export global wszINFKEY_NOTICE := "Notice"

/**
 * @type {String}
 */
export global wszINFKEY_FLAGS := "Flags"

/**
 * @type {String}
 */
export global wszINFSECTION_REQUESTATTRIBUTES := "RequestAttributes"

/**
 * @type {String}
 */
export global wszINFSECTION_NAMECONSTRAINTS := "NameConstraintsExtension"

/**
 * @type {String}
 */
export global wszINFKEY_INCLUDE := "Include"

/**
 * @type {String}
 */
export global wszINFKEY_EXCLUDE := "Exclude"

/**
 * @type {String}
 */
export global wszINFKEY_SUBTREE := "SubTree"

/**
 * @type {String}
 */
export global wszINFKEY_UPN := "UPN"

/**
 * @type {String}
 */
export global wszINFKEY_EMAIL := "EMail"

/**
 * @type {String}
 */
export global wszINFKEY_DNS := "DNS"

/**
 * @type {String}
 */
export global wszINFKEY_DIRECTORYNAME := "DirectoryName"

/**
 * @type {String}
 */
export global wszINFKEY_URL := "URL"

/**
 * @type {String}
 */
export global wszINFKEY_IPADDRESS := "IPAddress"

/**
 * @type {String}
 */
export global wszINFKEY_REGISTEREDID := "RegisteredId"

/**
 * @type {String}
 */
export global wszINFKEY_OTHERNAME := "OtherName"

/**
 * @type {String}
 */
export global wszINFSECTION_POLICYMAPPINGS := "PolicyMappingsExtension"

/**
 * @type {String}
 */
export global wszINFSECTION_APPLICATIONPOLICYMAPPINGS := "ApplicationPolicyMappingsExtension"

/**
 * @type {String}
 */
export global wszINFSECTION_POLICYCONSTRAINTS := "PolicyConstraintsExtension"

/**
 * @type {String}
 */
export global wszINFSECTION_APPLICATIONPOLICYCONSTRAINTS := "ApplicationPolicyConstraintsExtension"

/**
 * @type {String}
 */
export global wszINFKEY_REQUIREEXPLICITPOLICY := "RequireExplicitPolicy"

/**
 * @type {String}
 */
export global wszINFKEY_INHIBITPOLICYMAPPING := "InhibitPolicyMapping"

/**
 * @type {String}
 */
export global wszINFSECTION_BASICCONSTRAINTS := "BasicConstraintsExtension"

/**
 * @type {String}
 */
export global wszINFKEY_PATHLENGTH := "PathLength"

/**
 * @type {String}
 */
export global wszINFSECTION_EXTENSIONS := "Extensions"

/**
 * @type {String}
 */
export global wszINFSECTION_PROPERTIES := "Properties"

/**
 * @type {String}
 */
export global wszINFKEY_CONTINUE := "_continue_"

/**
 * @type {String}
 */
export global wszINFSECTION_NEWREQUEST := "NewRequest"

/**
 * @type {String}
 */
export global wszINFKEY_SUBJECT := "Subject"

/**
 * @type {String}
 */
export global wszINFKEY_SUBJECTNAMEFLAGS := "SubjectNameFlags"

/**
 * @type {String}
 */
export global wszINFKEY_X500NAMEFLAGS := "X500NameFlags"

/**
 * @type {String}
 */
export global wszINFKEY_EXPORTABLE := "Exportable"

/**
 * @type {String}
 */
export global wszINFKEY_EXPORTABLEENCRYPTED := "ExportableEncrypted"

/**
 * @type {String}
 */
export global wszINFKEY_HASHALGORITHM := "HashAlgorithm"

/**
 * @type {String}
 */
export global wszINFKEY_KEYALGORITHM := "KeyAlgorithm"

/**
 * @type {String}
 */
export global wszINFKEY_KEYALGORITHMPARMETERS := "KeyAlgorithmParameters"

/**
 * @type {String}
 */
export global wszINFKEY_KEYCONTAINER := "KeyContainer"

/**
 * @type {String}
 */
export global wszINFKEY_READERNAME := "ReaderName"

/**
 * @type {String}
 */
export global wszINFKEY_KEYLENGTH := "KeyLength"

/**
 * @type {String}
 */
export global wszINFKEY_LEGACYKEYSPEC := "KeySpec"

/**
 * @type {String}
 */
export global wszINFKEY_KEYUSAGEEXTENSION := "KeyUsage"

/**
 * @type {String}
 */
export global wszINFKEY_KEYUSAGEPROPERTY := "KeyUsageProperty"

/**
 * @type {String}
 */
export global wszINFKEY_MACHINEKEYSET := "MachineKeySet"

/**
 * @type {String}
 */
export global wszINFKEY_PRIVATEKEYARCHIVE := "PrivateKeyArchive"

/**
 * @type {String}
 */
export global wszINFKEY_ENCRYPTIONALGORITHM := "EncryptionAlgorithm"

/**
 * @type {String}
 */
export global wszINFKEY_ENCRYPTIONLENGTH := "EncryptionLength"

/**
 * @type {String}
 */
export global wszINFKEY_PROVIDERNAME := "ProviderName"

/**
 * @type {String}
 */
export global wszINFKEY_PROVIDERTYPE := "ProviderType"

/**
 * @type {String}
 */
export global wszINFKEY_RENEWALCERT := "RenewalCert"

/**
 * @type {String}
 */
export global wszINFKEY_REQUESTTYPE := "RequestType"

/**
 * @type {String}
 */
export global wszINFKEY_SECURITYDESCRIPTOR := "SecurityDescriptor"

/**
 * @type {String}
 */
export global wszINFKEY_SILENT := "Silent"

/**
 * @type {String}
 */
export global wszINFKEY_SMIME := "SMIME"

/**
 * @type {String}
 */
export global wszINFKEY_SUPPRESSDEFAULTS := "SuppressDefaults"

/**
 * @type {String}
 */
export global wszINFKEY_USEEXISTINGKEY := "UseExistingKeySet"

/**
 * @type {String}
 */
export global wszINFKEY_USERPROTECTED := "UserProtected"

/**
 * @type {String}
 */
export global wszINFKEY_KEYPROTECTION := "KeyProtection"

/**
 * @type {String}
 */
export global wszINFKEY_UICONTEXTMESSAGE := "UIContextMessage"

/**
 * @type {String}
 */
export global wszINFKEY_FRIENDLYNAME := "FriendlyName"

/**
 * @type {String}
 */
export global wszINFKEY_NOTBEFORE := "NotBefore"

/**
 * @type {String}
 */
export global wszINFKEY_NOTAFTER := "NotAfter"

/**
 * @type {String}
 */
export global wszINFKEY_ATTESTPRIVATEKEY := "AttestPrivateKey"

/**
 * @type {String}
 */
export global wszINFKEY_PUBLICKEY := "PublicKey"

/**
 * @type {String}
 */
export global wszINFKEY_PUBLICKEYPARAMETERS := "PublicKeyParameters"

/**
 * @type {String}
 */
export global wszINFKEY_ECCKEYPARAMETERS := "EccKeyParameters"

/**
 * @type {String}
 */
export global wszINFKEY_ECCKEYPARAMETERS_P := "EccKeyParameters_P"

/**
 * @type {String}
 */
export global wszINFKEY_ECCKEYPARAMETERS_A := "EccKeyParameters_A"

/**
 * @type {String}
 */
export global wszINFKEY_ECCKEYPARAMETERS_B := "EccKeyParameters_B"

/**
 * @type {String}
 */
export global wszINFKEY_ECCKEYPARAMETERS_SEED := "EccKeyParameters_Seed"

/**
 * @type {String}
 */
export global wszINFKEY_ECCKEYPARAMETERS_BASE := "EccKeyParameters_Base"

/**
 * @type {String}
 */
export global wszINFKEY_ECCKEYPARAMETERS_ORDER := "EccKeyParameters_Order"

/**
 * @type {String}
 */
export global wszINFKEY_ECCKEYPARAMETERS_COFACTOR := "EccKeyParameters_Cofactor"

/**
 * @type {String}
 */
export global wszINFKEY_ECCKEYPARAMETERSTYPE := "EccKeyParametersType"

/**
 * @type {String}
 */
export global wszINFKEY_SERIALNUMBER := "SerialNumber"

/**
 * @type {String}
 */
export global wszINFKEY_CATHUMBPRINT := "CAThumbprint"

/**
 * @type {String}
 */
export global wszINFKEY_CACERTS := "CACerts"

/**
 * @type {String}
 */
export global wszINFKEY_CACAPABILITIES := "CACapabilities"

/**
 * @type {String}
 */
export global wszINFKEY_CHALLENGEPASSWORD := "ChallengePassword"

/**
 * @type {String}
 */
export global wszINFVALUE_REQUESTTYPE_PKCS10 := "PKCS10"

/**
 * @type {String}
 */
export global wszINFVALUE_REQUESTTYPE_PKCS7 := "PKCS7"

/**
 * @type {String}
 */
export global wszINFVALUE_REQUESTTYPE_CMC := "CMC"

/**
 * @type {String}
 */
export global wszINFVALUE_REQUESTTYPE_CERT := "Cert"

/**
 * @type {String}
 */
export global wszINFVALUE_REQUESTTYPE_SCEP := "SCEP"

/**
 * @type {String}
 */
export global wszINFVALUE_ENDORSEMENTKEY := "EndorsementKey"

/**
 * @type {String}
 */
export global wszREGEXITSMTPKEY := "SMTP"

/**
 * @type {String}
 */
export global wszREGEXITSMTPTEMPLATES := "Templates"

/**
 * @type {String}
 */
export global wszREGEXITSMTPEVENTFILTER := "EventFilter"

/**
 * @type {String}
 */
export global wszREGEXITSMTPSERVER := "SMTPServer"

/**
 * @type {String}
 */
export global wszREGEXITSMTPAUTHENTICATE := "SMTPAuthenticate"

/**
 * @type {String}
 */
export global wszREGEXITDENIEDKEY := "Denied"

/**
 * @type {String}
 */
export global wszREGEXITISSUEDKEY := "Issued"

/**
 * @type {String}
 */
export global wszREGEXITPENDINGKEY := "Pending"

/**
 * @type {String}
 */
export global wszREGEXITREVOKEDKEY := "Revoked"

/**
 * @type {String}
 */
export global wszREGEXITCRLISSUEDKEY := "CRLIssued"

/**
 * @type {String}
 */
export global wszREGEXITSHUTDOWNKEY := "Shutdown"

/**
 * @type {String}
 */
export global wszREGEXITSTARTUPKEY := "Startup"

/**
 * @type {String}
 */
export global wszREGEXITIMPORTEDKEY := "Imported"

/**
 * @type {String}
 */
export global wszREGEXITSMTPFROM := "From"

/**
 * @type {String}
 */
export global wszREGEXITSMTPTO := "To"

/**
 * @type {String}
 */
export global wszREGEXITSMTPCC := "Cc"

/**
 * @type {String}
 */
export global wszREGEXITTITLEFORMAT := "TitleFormat"

/**
 * @type {String}
 */
export global wszREGEXITTITLEARG := "TitleArg"

/**
 * @type {String}
 */
export global wszREGEXITBODYFORMAT := "BodyFormat"

/**
 * @type {String}
 */
export global wszREGEXITBODYARG := "BodyArg"

/**
 * @type {String}
 */
export global wszREGEXITPROPNOTFOUND := "???"

/**
 * @type {String}
 */
export global wszREGKEYENROLLMENT := "Software\Microsoft\Cryptography\AutoEnrollment"

/**
 * @type {String}
 */
export global wszREGKEYGROUPPOLICYENROLLMENT := "Software\Policies\Microsoft\Cryptography\AutoEnrollment"

/**
 * @type {String}
 */
export global wszREGMAXPENDINGREQUESTDAYS := "MaxPendingRequestDays"

/**
 * @type {String}
 */
export global wszREGAELOGLEVEL_OLD := "AEEventLogLevel"

/**
 * @type {String}
 */
export global wszREGENROLLFLAGS := "EnrollFlags"

/**
 * @type {String}
 */
export global wszREGVERIFYFLAGS := "VerifyFlags"

/**
 * @type {String}
 */
export global wszREGUNICODE := "Unicode"

/**
 * @type {String}
 */
export global wszREGAIKCLOUDCAURL := "AIKCloudCAURL"

/**
 * @type {String}
 */
export global wszREGAIKKEYALGORITHM := "AIKKeyAlgorithm"

/**
 * @type {String}
 */
export global wszREGAIKKEYLENGTH := "AIKKeyLength"

/**
 * @type {String}
 */
export global wszREGPRESERVESCEPDUMMYCERTS := "PreserveSCEPDummyCerts"

/**
 * @type {String}
 */
export global wszREGALLPROVIDERS := "All"

/**
 * @type {Integer (UInt32)}
 */
export global TP_MACHINEPOLICY := 1

/**
 * @type {String}
 */
export global wszREGKEYREPAIR := "KeyRepair"

/**
 * @type {Integer (UInt32)}
 */
export global KR_ENABLE_MACHINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global KR_ENABLE_USER := 2

/**
 * @type {String}
 */
export global CONFIGURATION_STATUS_PARENT_REG_PATH := "Software\Microsoft\ADCS"

/**
 * @type {String}
 */
export global CONFIGURATION_STATUS_REG_VALUE_NAME := "ConfigurationStatus"

/**
 * @type {String}
 */
export global CONFIGURATION_REG_EPTOKENCHECKVALUE := "EPTokenCheckValue"

/**
 * @type {Integer (UInt32)}
 */
export global EP_TOKENCHECK_DEFAULT_VALUE := 2

/**
 * @type {String}
 */
export global CONFIGURATION_REG_DISABLE_HTTPSONLY := "DisableHTTPSOnly"

/**
 * @type {String}
 */
export global wszPROPDISTINGUISHEDNAME := "DistinguishedName"

/**
 * @type {String}
 */
export global wszPROPRAWNAME := "RawName"

/**
 * @type {String}
 */
export global wszPROPCOUNTRY := "Country"

/**
 * @type {String}
 */
export global wszPROPORGANIZATION := "Organization"

/**
 * @type {String}
 */
export global wszPROPORGUNIT := "OrgUnit"

/**
 * @type {String}
 */
export global wszPROPCOMMONNAME := "CommonName"

/**
 * @type {String}
 */
export global wszPROPLOCALITY := "Locality"

/**
 * @type {String}
 */
export global wszPROPSTATE := "State"

/**
 * @type {String}
 */
export global wszPROPTITLE := "Title"

/**
 * @type {String}
 */
export global wszPROPGIVENNAME := "GivenName"

/**
 * @type {String}
 */
export global wszPROPINITIALS := "Initials"

/**
 * @type {String}
 */
export global wszPROPSURNAME := "SurName"

/**
 * @type {String}
 */
export global wszPROPDOMAINCOMPONENT := "DomainComponent"

/**
 * @type {String}
 */
export global wszPROPEMAIL := "EMail"

/**
 * @type {String}
 */
export global wszPROPSTREETADDRESS := "StreetAddress"

/**
 * @type {String}
 */
export global wszPROPUNSTRUCTUREDNAME := "UnstructuredName"

/**
 * @type {String}
 */
export global wszPROPUNSTRUCTUREDADDRESS := "UnstructuredAddress"

/**
 * @type {String}
 */
export global wszPROPDEVICESERIALNUMBER := "DeviceSerialNumber"

/**
 * @type {String}
 */
export global wszPROPSUBJECTDOT := "Subject."

/**
 * @type {String}
 */
export global wszPROPREQUESTDOT := "Request."

/**
 * @type {String}
 */
export global wszPROPREQUESTREQUESTID := "RequestID"

/**
 * @type {String}
 */
export global wszPROPREQUESTRAWREQUEST := "RawRequest"

/**
 * @type {String}
 */
export global wszPROPREQUESTRAWARCHIVEDKEY := "RawArchivedKey"

/**
 * @type {String}
 */
export global wszPROPREQUESTARCHIVEDKEY := "ArchivedKey"

/**
 * @type {String}
 */
export global wszPROPREQUESTKEYRECOVERYHASHES := "KeyRecoveryHashes"

/**
 * @type {String}
 */
export global wszPROPREQUESTRAWOLDCERTIFICATE := "RawOldCertificate"

/**
 * @type {String}
 */
export global wszPROPREQUESTATTRIBUTES := "RequestAttributes"

/**
 * @type {String}
 */
export global wszPROPREQUESTTYPE := "RequestType"

/**
 * @type {String}
 */
export global wszPROPREQUESTFLAGS := "RequestFlags"

/**
 * @type {String}
 */
export global wszPROPREQUESTSTATUSCODE := "StatusCode"

/**
 * @type {String}
 */
export global wszPROPREQUESTDISPOSITION := "Disposition"

/**
 * @type {String}
 */
export global wszPROPREQUESTDISPOSITIONMESSAGE := "DispositionMessage"

/**
 * @type {String}
 */
export global wszPROPREQUESTSUBMITTEDWHEN := "SubmittedWhen"

/**
 * @type {String}
 */
export global wszPROPREQUESTRESOLVEDWHEN := "ResolvedWhen"

/**
 * @type {String}
 */
export global wszPROPREQUESTREVOKEDWHEN := "RevokedWhen"

/**
 * @type {String}
 */
export global wszPROPREQUESTREVOKEDEFFECTIVEWHEN := "RevokedEffectiveWhen"

/**
 * @type {String}
 */
export global wszPROPREQUESTREVOKEDREASON := "RevokedReason"

/**
 * @type {String}
 */
export global wszPROPREQUESTERNAME := "RequesterName"

/**
 * @type {String}
 */
export global wszPROPCALLERNAME := "CallerName"

/**
 * @type {String}
 */
export global wszPROPSIGNERPOLICIES := "SignerPolicies"

/**
 * @type {String}
 */
export global wszPROPSIGNERAPPLICATIONPOLICIES := "SignerApplicationPolicies"

/**
 * @type {String}
 */
export global wszPROPOFFICER := "Officer"

/**
 * @type {String}
 */
export global wszPROPPUBLISHEXPIREDCERTINCRL := "PublishExpiredCertInCRL"

/**
 * @type {String}
 */
export global wszPROPREQUESTERNAMEFROMOLDCERTIFICATE := "RequesterNameFromOldCertificate"

/**
 * @type {String}
 */
export global wszPROPATTESTATIONCHALLENGE := "AttestationChallenge"

/**
 * @type {String}
 */
export global wszPROPENDORSEMENTKEYHASH := "EndorsementKeyHash"

/**
 * @type {String}
 */
export global wszPROPENDORSEMENTCERTIFICATEHASH := "EndorsementCertificateHash"

/**
 * @type {String}
 */
export global wszPROPRAWPRECERTIFICATE := "RawPrecertificate"

/**
 * @type {String}
 */
export global wszPROPCRLPARTITIONINDEX := "CRLPartitionIndex"

/**
 * @type {String}
 */
export global wszPROPLINTERCERTIFICATE := "LinterCertificate"

/**
 * @type {String}
 */
export global wszPROPCHALLENGE := "Challenge"

/**
 * @type {String}
 */
export global wszPROPEXPECTEDCHALLENGE := "ExpectedChallenge"

/**
 * @type {String}
 */
export global wszPROPDISPOSITION := "Disposition"

/**
 * @type {String}
 */
export global wszPROPDISPOSITIONDENY := "Deny"

/**
 * @type {String}
 */
export global wszPROPDISPOSITIONPENDING := "Pending"

/**
 * @type {String}
 */
export global wszPROPVALIDITYPERIODSTRING := "ValidityPeriod"

/**
 * @type {String}
 */
export global wszPROPVALIDITYPERIODCOUNT := "ValidityPeriodUnits"

/**
 * @type {String}
 */
export global wszPROPEXPIRATIONDATE := "ExpirationDate"

/**
 * @type {String}
 */
export global wszPROPCERTTYPE := "CertType"

/**
 * @type {String}
 */
export global wszPROPCERTTEMPLATE := "CertificateTemplate"

/**
 * @type {String}
 */
export global wszPROPCERTUSAGE := "CertificateUsage"

/**
 * @type {String}
 */
export global wszPROPREQUESTOSVERSION := "RequestOSVersion"

/**
 * @type {String}
 */
export global wszPROPREQUESTCSPPROVIDER := "RequestCSPProvider"

/**
 * @type {String}
 */
export global wszPROPEXITCERTFILE := "CertFile"

/**
 * @type {String}
 */
export global wszPROPCLIENTBROWSERMACHINE := "cbm"

/**
 * @type {String}
 */
export global wszPROPCERTCLIENTMACHINE := "ccm"

/**
 * @type {String}
 */
export global wszPROPCLIENTDCDNS := "cdc"

/**
 * @type {String}
 */
export global wszPROPREQUESTMACHINEDNS := "rmd"

/**
 * @type {String}
 */
export global wszPROPSUBJECTALTNAME2 := "san"

/**
 * @type {String}
 */
export global wszPROPDNS := "dns"

/**
 * @type {String}
 */
export global wszPROPDN := "dn"

/**
 * @type {String}
 */
export global wszPROPURL := "url"

/**
 * @type {String}
 */
export global wszPROPIPADDRESS := "ipaddress"

/**
 * @type {String}
 */
export global wszPROPGUID := "guid"

/**
 * @type {String}
 */
export global wszPROPOID := "oid"

/**
 * @type {String}
 */
export global wszPROPUPN := "upn"

/**
 * @type {String}
 */
export global szPROPASNTAG := "{asn}"

/**
 * @type {String}
 */
export global wszPROPCRITICALTAG := "{critical}"

/**
 * @type {String}
 */
export global wszPROPUTF8TAG := "{utf8}"

/**
 * @type {String}
 */
export global wszPROPOCTETTAG := "{octet}"

/**
 * @type {String}
 */
export global wszPROPHEXTAG := "{hex}"

/**
 * @type {String}
 */
export global wszPROPTEXTTAG := "{text}"

/**
 * @type {String}
 */
export global wszPROPDECIMALTAG := "{decimal}"

/**
 * @type {String}
 */
export global wszPROPFILETAG := "{file}"

/**
 * @type {String}
 */
export global wszAT_EKCERTINF := "@EKCert"

/**
 * @type {String}
 */
export global wszAT_TESTROOT := "@TestRoot"

/**
 * @type {String}
 */
export global wszPROPLINTCERTIFICATE := "LintCertificate"

/**
 * @type {String}
 */
export global wszPROPCATYPE := "CAType"

/**
 * @type {String}
 */
export global wszPROPSANITIZEDCANAME := "SanitizedCAName"

/**
 * @type {String}
 */
export global wszPROPSANITIZEDSHORTNAME := "SanitizedShortName"

/**
 * @type {String}
 */
export global wszPROPMACHINEDNSNAME := "MachineDNSName"

/**
 * @type {String}
 */
export global wszPROPMODULEREGLOC := "ModuleRegistryLocation"

/**
 * @type {String}
 */
export global wszPROPUSEDS := "fUseDS"

/**
 * @type {String}
 */
export global wszPROPDELTACRLSDISABLED := "fDeltaCRLsDisabled"

/**
 * @type {String}
 */
export global wszPROPSERVERUPGRADED := "fServerUpgraded"

/**
 * @type {String}
 */
export global wszPROPCONFIGDN := "ConfigDN"

/**
 * @type {String}
 */
export global wszPROPDOMAINDN := "DomainDN"

/**
 * @type {String}
 */
export global wszPROPLOGLEVEL := "LogLevel"

/**
 * @type {String}
 */
export global wszPROPSESSIONCOUNT := "SessionCount"

/**
 * @type {String}
 */
export global wszPROPTEMPLATECHANGESEQUENCENUMBER := "TemplateChangeSequenceNumber"

/**
 * @type {String}
 */
export global wszPROPVOLATILEMODE := "VolatileMode"

/**
 * @type {String}
 */
export global wszLOCALIZEDTIMEPERIODUNITS := "LocalizedTimePeriodUnits"

/**
 * @type {String}
 */
export global wszPROPREQUESTERCAACCESS := "RequesterCAAccess"

/**
 * @type {String}
 */
export global wszPROPUSERDN := "UserDN"

/**
 * @type {String}
 */
export global wszPROPKEYARCHIVED := "KeyArchived"

/**
 * @type {String}
 */
export global wszPROPCERTCOUNT := "CertCount"

/**
 * @type {String}
 */
export global wszPROPRAWCACERTIFICATE := "RawCACertificate"

/**
 * @type {String}
 */
export global wszPROPCERTSTATE := "CertState"

/**
 * @type {String}
 */
export global wszPROPCERTSUFFIX := "CertSuffix"

/**
 * @type {String}
 */
export global wszPROPRAWCRL := "RawCRL"

/**
 * @type {String}
 */
export global wszPROPRAWDELTACRL := "RawDeltaCRL"

/**
 * @type {String}
 */
export global wszPROPCRLINDEX := "CRLIndex"

/**
 * @type {String}
 */
export global wszPROPCRLSTATE := "CRLState"

/**
 * @type {String}
 */
export global wszPROPCRLSUFFIX := "CRLSuffix"

/**
 * @type {String}
 */
export global wszPROPEVENTLOGTERSE := "EventLogTerse"

/**
 * @type {String}
 */
export global wszPROPEVENTLOGERROR := "EventLogError"

/**
 * @type {String}
 */
export global wszPROPEVENTLOGWARNING := "EventLogWarning"

/**
 * @type {String}
 */
export global wszPROPEVENTLOGVERBOSE := "EventLogVerbose"

/**
 * @type {String}
 */
export global wszPROPEVENTLOGEXHAUSTIVE := "EventLogExhaustive"

/**
 * @type {String}
 */
export global wszPROPDCNAME := "DCName"

/**
 * @type {String}
 */
export global wszPROPCROSSFOREST := "CrossForest"

/**
 * @type {String}
 */
export global wszPROPREQUESTERSAMNAME := "RequesterSAMName"

/**
 * @type {String}
 */
export global wszPROPREQUESTERUPN := "RequesterUPN"

/**
 * @type {String}
 */
export global wszPROPREQUESTERDN := "RequesterDN"

/**
 * @type {String}
 */
export global wszPROPSEAUDITID := "SEAuditId"

/**
 * @type {String}
 */
export global wszPROPSEAUDITFILTER := "SEAuditFilter"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATEREQUESTID := "RequestID"

/**
 * @type {String}
 */
export global wszPROPRAWCERTIFICATE := "RawCertificate"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATEHASH := "CertificateHash"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATETEMPLATE := "CertificateTemplate"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATEENROLLMENTFLAGS := "EnrollmentFlags"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATEGENERALFLAGS := "GeneralFlags"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATEPRIVATEKEYFLAGS := "PrivatekeyFlags"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATESERIALNUMBER := "SerialNumber"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATENOTBEFOREDATE := "NotBefore"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATENOTAFTERDATE := "NotAfter"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATESUBJECTKEYIDENTIFIER := "SubjectKeyIdentifier"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATERAWPUBLICKEY := "RawPublicKey"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATEPUBLICKEYLENGTH := "PublicKeyLength"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATEPUBLICKEYALGORITHM := "PublicKeyAlgorithm"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATERAWPUBLICKEYALGORITHMPARAMETERS := "RawPublicKeyAlgorithmParameters"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATEUPN := "UPN"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATETYPE := "CertificateType"

/**
 * @type {String}
 */
export global wszPROPCERTIFICATERAWSMIMECAPABILITIES := "RawSMIMECapabilities"

/**
 * @type {String}
 */
export global wszPROPNAMETYPE := "NameType"

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_CRITICAL_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_DISABLE_FLAG := 2

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_DELETE_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_POLICY_MASK := 65535

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_REQUEST := 65536

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_POLICY := 131072

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_ADMIN := 196608

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_SERVER := 262144

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_RENEWALCERT := 327680

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_IMPORTEDCERT := 393216

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_PKCS7 := 458752

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_CMC := 524288

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_CACERT := 589824

/**
 * @type {Integer (UInt32)}
 */
export global EXTENSION_ORIGIN_MASK := 983040

/**
 * @type {String}
 */
export global wszPROPEXTREQUESTID := "ExtensionRequestId"

/**
 * @type {String}
 */
export global wszPROPEXTNAME := "ExtensionName"

/**
 * @type {String}
 */
export global wszPROPEXTFLAGS := "ExtensionFlags"

/**
 * @type {String}
 */
export global wszPROPEXTRAWVALUE := "ExtensionRawValue"

/**
 * @type {String}
 */
export global wszPROPATTRIBREQUESTID := "AttributeRequestId"

/**
 * @type {String}
 */
export global wszPROPATTRIBNAME := "AttributeName"

/**
 * @type {String}
 */
export global wszPROPATTRIBVALUE := "AttributeValue"

/**
 * @type {String}
 */
export global wszPROPCRLROWID := "CRLRowId"

/**
 * @type {String}
 */
export global wszPROPCRLNUMBER := "CRLNumber"

/**
 * @type {String}
 */
export global wszPROPCRLMINBASE := "CRLMinBase"

/**
 * @type {String}
 */
export global wszPROPCRLNAMEID := "CRLNameId"

/**
 * @type {String}
 */
export global wszPROPCRLCOUNT := "CRLCount"

/**
 * @type {String}
 */
export global wszPROPCRLTHISUPDATE := "CRLThisUpdate"

/**
 * @type {String}
 */
export global wszPROPCRLNEXTUPDATE := "CRLNextUpdate"

/**
 * @type {String}
 */
export global wszPROPCRLTHISPUBLISH := "CRLThisPublish"

/**
 * @type {String}
 */
export global wszPROPCRLNEXTPUBLISH := "CRLNextPublish"

/**
 * @type {String}
 */
export global wszPROPCRLEFFECTIVE := "CRLEffective"

/**
 * @type {String}
 */
export global wszPROPCRLPROPAGATIONCOMPLETE := "CRLPropagationComplete"

/**
 * @type {String}
 */
export global wszPROPCRLLASTPUBLISHED := "CRLLastPublished"

/**
 * @type {String}
 */
export global wszPROPCRLPUBLISHATTEMPTS := "CRLPublishAttempts"

/**
 * @type {String}
 */
export global wszPROPCRLPUBLISHFLAGS := "CRLPublishFlags"

/**
 * @type {String}
 */
export global wszPROPCRLPUBLISHSTATUSCODE := "CRLPublishStatusCode"

/**
 * @type {String}
 */
export global wszPROPCRLPUBLISHERROR := "CRLPublishError"

/**
 * @type {String}
 */
export global wszPROPCRLRAWCRL := "CRLRawCRL"

/**
 * @type {Integer (UInt32)}
 */
export global CPF_BASE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CPF_DELTA := 2

/**
 * @type {Integer (UInt32)}
 */
export global CPF_COMPLETE := 4

/**
 * @type {Integer (UInt32)}
 */
export global CPF_SHADOW := 8

/**
 * @type {Integer (UInt32)}
 */
export global CPF_CASTORE_ERROR := 16

/**
 * @type {Integer (UInt32)}
 */
export global CPF_BADURL_ERROR := 32

/**
 * @type {Integer (UInt32)}
 */
export global CPF_MANUAL := 64

/**
 * @type {Integer (UInt32)}
 */
export global CPF_SIGNATURE_ERROR := 128

/**
 * @type {Integer (UInt32)}
 */
export global CPF_LDAP_ERROR := 256

/**
 * @type {Integer (UInt32)}
 */
export global CPF_FILE_ERROR := 512

/**
 * @type {Integer (UInt32)}
 */
export global CPF_FTP_ERROR := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CPF_HTTP_ERROR := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CPF_POSTPONED_BASE_LDAP_ERROR := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CPF_POSTPONED_BASE_FILE_ERROR := 8192

/**
 * @type {Integer (UInt32)}
 */
export global PROPTYPE_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global PROPCALLER_SERVER := 256

/**
 * @type {Integer (UInt32)}
 */
export global PROPCALLER_POLICY := 512

/**
 * @type {Integer (UInt32)}
 */
export global PROPCALLER_EXIT := 768

/**
 * @type {Integer (UInt32)}
 */
export global PROPCALLER_ADMIN := 1024

/**
 * @type {Integer (UInt32)}
 */
export global PROPCALLER_REQUEST := 1280

/**
 * @type {Integer (UInt32)}
 */
export global PROPCALLER_MASK := 3840

/**
 * @type {Integer (UInt32)}
 */
export global PROPFLAGS_INDEXED := 65536

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_FORCETELETEX := 1

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_RENEWAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_FORCEUTF8 := 4

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_CAXCHGCERT := 8

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_ENROLLONBEHALFOF := 16

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_SUBJECTUNMODIFIED := 32

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_VALIDENCRYPTEDKEYHASH := 64

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_CACROSSCERT := 128

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_ENFORCEUTF8 := 256

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_DEFINEDCACERT := 512

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_CHALLENGEPENDING := 1024

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_CHALLENGESATISFIED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_TRUSTONUSE := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_TRUSTEKCERT := 8192

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_TRUSTEKKEY := 16384

/**
 * @type {Integer (UInt32)}
 */
export global CR_FLG_PUBLISHERROR := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_ACTIVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_PENDING := 9

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_QUEUE_MAX := 9

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_FOREIGN := 12

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_CA_CERT := 15

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_CA_CERT_CHAIN := 16

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_KRA_CERT := 17

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_LOG_MIN := 20

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_ISSUED := 20

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_REVOKED := 21

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_LOG_FAILED_MIN := 30

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_ERROR := 30

/**
 * @type {Integer (UInt32)}
 */
export global DB_DISP_DENIED := 31

/**
 * @type {Integer (UInt32)}
 */
export global VR_PENDING := 0

/**
 * @type {Integer (UInt32)}
 */
export global VR_INSTANT_OK := 1

/**
 * @type {Integer (UInt32)}
 */
export global VR_INSTANT_BAD := 2

/**
 * @type {String}
 */
export global wszCERT_TYPE := "RequestType"

/**
 * @type {String}
 */
export global wszCERT_TYPE_CLIENT := "Client"

/**
 * @type {String}
 */
export global wszCERT_TYPE_SERVER := "Server"

/**
 * @type {String}
 */
export global wszCERT_TYPE_CODESIGN := "CodeSign"

/**
 * @type {String}
 */
export global wszCERT_TYPE_CUSTOMER := "SetCustomer"

/**
 * @type {String}
 */
export global wszCERT_TYPE_MERCHANT := "SetMerchant"

/**
 * @type {String}
 */
export global wszCERT_TYPE_PAYMENT := "SetPayment"

/**
 * @type {String}
 */
export global wszCERT_VERSION := "Version"

/**
 * @type {String}
 */
export global wszCERT_VERSION_1 := "1"

/**
 * @type {String}
 */
export global wszCERT_VERSION_2 := "2"

/**
 * @type {String}
 */
export global wszCERT_VERSION_3 := "3"

/**
 * @type {Integer (UInt32)}
 */
export global CV_OUT_HEXRAW := 12

/**
 * @type {Integer (UInt32)}
 */
export global CV_OUT_ENCODEMASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global CV_OUT_NOCRLF := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global CV_OUT_NOCR := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global CVR_SEEK_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CVR_SEEK_MASK := 255

/**
 * @type {Integer (UInt32)}
 */
export global CVR_SEEK_NODELTA := 4096

/**
 * @type {Integer (UInt32)}
 */
export global CVR_SORT_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global CVR_SORT_ASCEND := 1

/**
 * @type {Integer (UInt32)}
 */
export global CVR_SORT_DESCEND := 2

/**
 * @type {Integer (Int32)}
 */
export global CV_COLUMN_EXTENSION_DEFAULT := -4

/**
 * @type {Integer (Int32)}
 */
export global CV_COLUMN_ATTRIBUTE_DEFAULT := -5

/**
 * @type {Integer (Int32)}
 */
export global CV_COLUMN_CRL_DEFAULT := -6

/**
 * @type {Integer (Int32)}
 */
export global CV_COLUMN_LOG_REVOKED_DEFAULT := -7

/**
 * @type {Integer (UInt32)}
 */
export global CVRC_TABLE_MASK := 61440

/**
 * @type {Integer (UInt32)}
 */
export global CVRC_TABLE_SHIFT := 12

/**
 * @type {Integer (UInt32)}
 */
export global CRYPT_ENUM_ALL_PROVIDERS := 1

/**
 * @type {Integer (Int32)}
 */
export global XEPR_ENUM_FIRST := -1

/**
 * @type {Integer (UInt32)}
 */
export global XEPR_DATE := 5

/**
 * @type {Integer (UInt32)}
 */
export global XEPR_TEMPLATENAME := 6

/**
 * @type {Integer (UInt32)}
 */
export global XEPR_VERSION := 7

/**
 * @type {Integer (UInt32)}
 */
export global XEPR_V1TEMPLATENAME := 9

/**
 * @type {Integer (UInt32)}
 */
export global XEPR_V2TEMPLATEOID := 16

/**
 * @type {Integer (UInt32)}
 */
export global XEKL_KEYSIZE_DEFAULT := 4

/**
 * @type {Integer (UInt32)}
 */
export global XECP_STRING_PROPERTY := 1

/**
 * @type {Integer (UInt32)}
 */
export global XECI_DISABLE := 0

/**
 * @type {Integer (UInt32)}
 */
export global XECI_XENROLL := 1

/**
 * @type {Integer (UInt32)}
 */
export global XECI_AUTOENROLL := 2

/**
 * @type {Integer (UInt32)}
 */
export global XECI_REQWIZARD := 3

/**
 * @type {Integer (UInt32)}
 */
export global XECI_CERTREQ := 4

/**
 * @type {String}
 */
export global wszCMM_PROP_NAME := "Name"

/**
 * @type {String}
 */
export global wszCMM_PROP_DESCRIPTION := "Description"

/**
 * @type {String}
 */
export global wszCMM_PROP_COPYRIGHT := "Copyright"

/**
 * @type {String}
 */
export global wszCMM_PROP_FILEVER := "File Version"

/**
 * @type {String}
 */
export global wszCMM_PROP_PRODUCTVER := "Product Version"

/**
 * @type {String}
 */
export global wszCMM_PROP_DISPLAY_HWND := "HWND"

/**
 * @type {String}
 */
export global wszCMM_PROP_ISMULTITHREADED := "IsMultiThreaded"
;@endregion Constants
