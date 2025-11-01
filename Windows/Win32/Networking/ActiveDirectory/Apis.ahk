#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\UI\WindowsAndMessaging\HICON.ahk

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class ActiveDirectory {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static WM_ADSPROP_NOTIFY_PAGEINIT => 2125

    /**
     * @type {Integer (UInt32)}
     */
    static WM_ADSPROP_NOTIFY_PAGEHWND => 2126

    /**
     * @type {Integer (UInt32)}
     */
    static WM_ADSPROP_NOTIFY_CHANGE => 2127

    /**
     * @type {Integer (UInt32)}
     */
    static WM_ADSPROP_NOTIFY_APPLY => 2128

    /**
     * @type {Integer (UInt32)}
     */
    static WM_ADSPROP_NOTIFY_SETFOCUS => 2129

    /**
     * @type {Integer (UInt32)}
     */
    static WM_ADSPROP_NOTIFY_FOREGROUND => 2130

    /**
     * @type {Integer (UInt32)}
     */
    static WM_ADSPROP_NOTIFY_EXIT => 2131

    /**
     * @type {Integer (UInt32)}
     */
    static WM_ADSPROP_NOTIFY_ERROR => 2134

    /**
     * @type {String}
     */
    static CLSID_CommonQuery => "{83bc5ec0-6f2a-11d0-a1c4-00aa00c16e65}"

    /**
     * @type {Integer (UInt64)}
     */
    static QUERYFORM_CHANGESFORMLIST => 1

    /**
     * @type {Integer (UInt64)}
     */
    static QUERYFORM_CHANGESOPTFORMLIST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CQFF_NOGLOBALPAGES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CQFF_ISOPTIONAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CQPM_INITIALIZE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CQPM_RELEASE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CQPM_ENABLE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static CQPM_GETPARAMETERS => 5

    /**
     * @type {Integer (UInt32)}
     */
    static CQPM_CLEARFORM => 6

    /**
     * @type {Integer (UInt32)}
     */
    static CQPM_PERSIST => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CQPM_HELP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static CQPM_SETDEFAULTPARAMETERS => 9

    /**
     * @type {Integer (UInt32)}
     */
    static CQPM_HANDLERSPECIFIC => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_OKCANCEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_DEFAULTFORM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_SINGLESELECT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_LOADQUERY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_REMOVESCOPES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_REMOVEFORMS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_ISSUEONOPEN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_SHOWOPTIONAL => 128

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_SAVEQUERYONOK => 512

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_HIDEMENUS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_HIDESEARCHUI => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static OQWF_PARAMISPROPERTYBAG => 2147483648

    /**
     * @type {String}
     */
    static CLSID_DsAdminCreateObj => "{e301a009-f901-11d2-82b9-00c04f68928b}"

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NEWOBJ_CTX_PRECOMMIT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NEWOBJ_CTX_COMMIT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NEWOBJ_CTX_POSTCOMMIT => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NEWOBJ_CTX_CLEANUP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NOTIFY_DEL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NOTIFY_REN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NOTIFY_MOV => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NOTIFY_PROP => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NOTIFY_FLAG_ADDITIONAL_DATA => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSA_NOTIFY_FLAG_FORCE_ADDITIONAL_DATA => 1

    /**
     * @type {String}
     */
    static CLSID_MicrosoftDS => "{fe1290f0-cfbd-11cf-a330-00aa00c16e65}"

    /**
     * @type {String}
     */
    static CLSID_DsPropertyPages => "{0d45d530-764b-11d0-a1ca-00aa00c16e65}"

    /**
     * @type {String}
     */
    static CLSID_DsDomainTreeBrowser => "{1698790a-e2b4-11d0-b0b1-00c04fd8dca6}"

    /**
     * @type {String}
     */
    static CLSID_DsDisplaySpecifier => "{1ab4a8c0-6a0b-11d2-ad49-00c04fa31a86}"

    /**
     * @type {String}
     */
    static CLSID_DsFolderProperties => "{9e51e0d0-6e0f-11d2-9601-00c04fa31a86}"

    /**
     * @type {Integer (UInt32)}
     */
    static DSOBJECT_ISCONTAINER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSOBJECT_READONLYPAGES => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DSPROVIDER_UNUSED_0 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSPROVIDER_UNUSED_1 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSPROVIDER_UNUSED_2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSPROVIDER_UNUSED_3 => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSPROVIDER_ADVANCED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSPROVIDER_AD_LDS => 32

    /**
     * @type {String}
     */
    static CFSTR_DSOBJECTNAMES => "DsObjectNames"

    /**
     * @type {String}
     */
    static CFSTR_DS_DISPLAY_SPEC_OPTIONS => "DsDisplaySpecOptions"

    /**
     * @type {String}
     */
    static CFSTR_DSDISPLAYSPECOPTIONS => "DsDisplaySpecOptions"

    /**
     * @type {String}
     */
    static DS_PROP_SHELL_PREFIX => "shell"

    /**
     * @type {String}
     */
    static DS_PROP_ADMIN_PREFIX => "admin"

    /**
     * @type {Integer (UInt32)}
     */
    static DSDSOF_HASUSERANDSERVERINFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSDSOF_SIMPLEAUTHENTICATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSDSOF_DONTSIGNSEAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSDSOF_DSAVAILABLE => 1073741824

    /**
     * @type {String}
     */
    static CFSTR_DSPROPERTYPAGEINFO => "DsPropPageInfo"

    /**
     * @type {String}
     */
    static DSPROP_ATTRCHANGED_MSG => "DsPropAttrChanged"

    /**
     * @type {Integer (UInt32)}
     */
    static DBDTF_RETURNFQDN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DBDTF_RETURNMIXEDDOMAINS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DBDTF_RETURNEXTERNAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DBDTF_RETURNINBOUND => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DBDTF_RETURNINOUTBOUND => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSSSF_SIMPLEAUTHENTICATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSSSF_DONTSIGNSEAL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSSSF_DSAVAILABLE => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DSGIF_ISNORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DSGIF_ISOPEN => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSGIF_ISDISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSGIF_ISMASK => 15

    /**
     * @type {Integer (UInt32)}
     */
    static DSGIF_GETDEFAULTICON => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSGIF_DEFAULTISCONTAINER => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSICCF_IGNORETREATASLEAF => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSECAF_NOTLISTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSCCIF_HASWIZARDDIALOG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSCCIF_HASWIZARDPRIMARYPAGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_NOBUTTONS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_NOLINES => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_NOLINESATROOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_CHECKBOXES => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_NOROOT => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_INCLUDEHIDDEN => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_EXPANDONOPEN => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_ENTIREDIRECTORY => 589824

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_RETURN_FORMAT => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_HASCREDENTIALS => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_IGNORETREATASLEAF => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_SIMPLEAUTHENTICATE => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_RETURNOBJECTCLASS => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DSBI_DONTSIGNSEAL => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DSB_MAX_DISPLAYNAME_CHARS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DSBF_STATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBF_ICONLOCATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSBF_DISPLAYNAME => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSBS_CHECKED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSBS_HIDDEN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSBS_ROOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSBM_QUERYINSERTW => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DSBM_QUERYINSERTA => 101

    /**
     * @type {Integer (UInt32)}
     */
    static DSBM_QUERYINSERT => 100

    /**
     * @type {Integer (UInt32)}
     */
    static DSBM_CHANGEIMAGESTATE => 102

    /**
     * @type {Integer (UInt32)}
     */
    static DSBM_HELP => 103

    /**
     * @type {Integer (UInt32)}
     */
    static DSBM_CONTEXTMENU => 104

    /**
     * @type {Integer (UInt32)}
     */
    static DSBID_BANNER => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DSBID_CONTAINERLIST => 257

    /**
     * @type {Integer (UInt32)}
     */
    static DS_FORCE_REDISCOVERY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DIRECTORY_SERVICE_REQUIRED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DIRECTORY_SERVICE_PREFERRED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DS_GC_SERVER_REQUIRED => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DS_PDC_REQUIRED => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BACKGROUND_ONLY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DS_IP_REQUIRED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DS_KDC_REQUIRED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DS_TIMESERV_REQUIRED => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DS_WRITABLE_REQUIRED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DS_GOOD_TIMESERV_PREFERRED => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DS_AVOID_SELF => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DS_ONLY_LDAP_NEEDED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DS_IS_FLAT_NAME => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DS_IS_DNS_NAME => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DS_TRY_NEXTCLOSEST_SITE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DIRECTORY_SERVICE_6_REQUIRED => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DS_WEB_SERVICE_REQUIRED => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DIRECTORY_SERVICE_8_REQUIRED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DIRECTORY_SERVICE_9_REQUIRED => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DIRECTORY_SERVICE_10_REQUIRED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DS_KEY_LIST_SUPPORT_REQUIRED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DIRECTORY_SERVICE_13_REQUIRED => 33554432

    /**
     * @type {Integer (UInt32)}
     */
    static DS_RETURN_DNS_NAME => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DS_RETURN_FLAT_NAME => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DS_PDC_FLAG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_GC_FLAG => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_LDAP_FLAG => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DS_FLAG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_KDC_FLAG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DS_TIMESERV_FLAG => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DS_CLOSEST_FLAG => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DS_WRITABLE_FLAG => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DS_GOOD_TIMESERV_FLAG => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DS_NDNC_FLAG => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DS_SELECT_SECRET_DOMAIN_6_FLAG => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DS_FULL_SECRET_DOMAIN_6_FLAG => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DS_WS_FLAG => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DS_8_FLAG => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DS_9_FLAG => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DS_10_FLAG => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DS_KEY_LIST_FLAG => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DS_13_FLAG => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DS_PING_FLAGS => 1048575

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DNS_CONTROLLER_FLAG => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DNS_DOMAIN_FLAG => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DNS_FOREST_FLAG => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_IN_FOREST => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_DIRECT_OUTBOUND => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_TREE_ROOT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_PRIMARY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_NATIVE_MODE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_DOMAIN_DIRECT_INBOUND => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DS_GFTI_UPDATE_TDO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_GFTI_VALID_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_ONLY_DO_SITE_NAME => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_NOTIFY_AFTER_SITE_RECORDS => 2

    /**
     * @type {String}
     */
    static CLSID_DsQuery => "{8a23e65e-31c2-11d0-891c-00a024ab2dbb}"

    /**
     * @type {String}
     */
    static CLSID_DsFindObjects => "{83ee3fe1-57d9-11d0-b932-00a024ab2dbb}"

    /**
     * @type {String}
     */
    static CLSID_DsFindPeople => "{83ee3fe2-57d9-11d0-b932-00a024ab2dbb}"

    /**
     * @type {String}
     */
    static CLSID_DsFindPrinter => "{b577f070-7ee2-11d0-913f-00aa00c16e65}"

    /**
     * @type {String}
     */
    static CLSID_DsFindComputer => "{16006700-87ad-11d0-9140-00aa00c16e65}"

    /**
     * @type {String}
     */
    static CLSID_DsFindVolume => "{c1b3cbf1-886a-11d0-9140-00aa00c16e65}"

    /**
     * @type {String}
     */
    static CLSID_DsFindContainer => "{c1b3cbf2-886a-11d0-9140-00aa00c16e65}"

    /**
     * @type {String}
     */
    static CLSID_DsFindAdvanced => "{83ee3fe3-57d9-11d0-b932-00a024ab2dbb}"

    /**
     * @type {String}
     */
    static CLSID_DsFindDomainController => "{538c7b7e-d25e-11d0-9742-00a0c906af45}"

    /**
     * @type {String}
     */
    static CLSID_DsFindWriteableDomainController => "{7cbef079-aa84-444b-bc70-68e41283eabc}"

    /**
     * @type {String}
     */
    static CLSID_DsFindFrsMembers => "{94ce4b18-b3d3-11d1-b9b4-00c04fd8d5b0}"

    /**
     * @type {Integer (UInt32)}
     */
    static DSQPF_NOSAVE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSQPF_SAVELOCATION => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSQPF_SHOWHIDDENOBJECTS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSQPF_ENABLEADMINFEATURES => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSQPF_ENABLEADVANCEDFEATURES => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSQPF_HASCREDENTIALS => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSQPF_NOCHOOSECOLUMNS => 64

    /**
     * @type {String}
     */
    static CFSTR_DSQUERYPARAMS => "DsQueryParameters"

    /**
     * @type {String}
     */
    static CFSTR_DSQUERYSCOPE => "DsQueryScope"

    /**
     * @type {Integer (UInt32)}
     */
    static DSQPM_GETCLASSLIST => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DSQPM_HELPTOPICS => 268435457

    /**
     * @type {Integer (UInt32)}
     */
    static DSROLE_PRIMARY_DS_RUNNING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSROLE_PRIMARY_DS_MIXED_MODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSROLE_UPGRADE_IN_PROGRESS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSROLE_PRIMARY_DS_READONLY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSROLE_PRIMARY_DOMAIN_GUID_PRESENT => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static ADS_ATTR_CLEAR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ADS_ATTR_UPDATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ADS_ATTR_APPEND => 3

    /**
     * @type {Integer (UInt32)}
     */
    static ADS_ATTR_DELETE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ADS_EXT_MINEXTDISPID => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ADS_EXT_MAXEXTDISPID => 16777215

    /**
     * @type {Integer (UInt32)}
     */
    static ADS_EXT_INITCREDENTIALS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ADS_EXT_INITIALIZE_COMPLETE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN2000 => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN2003_WITH_MIXED_DOMAINS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN2003 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN2008 => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN2008R2 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN2012 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN2012R2 => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN2016 => 7

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN2025 => 10

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_LONGHORN => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN7 => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WIN8 => 5

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WINBLUE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static DS_BEHAVIOR_WINTHRESHOLD => 7

    /**
     * @type {String}
     */
    static DS_SYNCED_EVENT_NAME => "NTDSInitialSyncsCompleted"

    /**
     * @type {String}
     */
    static DS_SYNCED_EVENT_NAME_W => "NTDSInitialSyncsCompleted"

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_OPEN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_CREATE_CHILD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_DELETE_CHILD => 2

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_LIST => 4

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_SELF => 8

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_READ_PROP => 16

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_WRITE_PROP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_DELETE_TREE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_LIST_OBJECT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static ACTRL_DS_CONTROL_ACCESS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSAPI_BIND_ALLOW_DELEGATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSAPI_BIND_FIND_BINDING => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSAPI_BIND_FORCE_KERBEROS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_ASYNCHRONOUS_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_WRITEABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_PERIODIC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_INTERSITE_MESSAGING => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_FULL => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_URGENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_NO_DISCARD => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_FORCE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_ADD_REFERENCE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_NEVER_COMPLETED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_TWO_WAY => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_NEVER_NOTIFY => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_INITIAL => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_USE_COMPRESSION => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_ABANDONED => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_SELECT_SECRETS => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_INITIAL_IN_PROGRESS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_PARTIAL_ATTRIBUTE_SET => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_REQUEUE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_NOTIFICATION => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_ASYNCHRONOUS_REPLICA => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_CRITICAL => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_FULL_IN_PROGRESS => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_PREEMPTED => 8388608

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNC_NONGC_RO_REPLICA => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_ASYNCHRONOUS_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_WRITEABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_INITIAL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_PERIODIC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_INTERSITE_MESSAGING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_ASYNCHRONOUS_REPLICA => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_DISABLE_NOTIFICATION => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_DISABLE_PERIODIC => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_USE_COMPRESSION => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_NEVER_NOTIFY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_TWO_WAY => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_CRITICAL => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_SELECT_SECRETS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPADD_NONGC_RO_REPLICA => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPDEL_ASYNCHRONOUS_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPDEL_WRITEABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPDEL_INTERSITE_MESSAGING => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPDEL_IGNORE_ERRORS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPDEL_LOCAL_ONLY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPDEL_NO_SOURCE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPDEL_REF_OK => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPMOD_ASYNCHRONOUS_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPMOD_WRITEABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPMOD_UPDATE_FLAGS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPMOD_UPDATE_INSTANCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPMOD_UPDATE_ADDRESS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPMOD_UPDATE_SCHEDULE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPMOD_UPDATE_RESULT => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPMOD_UPDATE_TRANSPORT => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPUPD_ASYNCHRONOUS_OPERATION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPUPD_WRITEABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPUPD_ADD_REFERENCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPUPD_DELETE_REFERENCE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPUPD_REFERENCE_GCSPN => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_INSTANCETYPE_IS_NC_HEAD => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_INSTANCETYPE_NC_IS_WRITEABLE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_INSTANCETYPE_NC_COMING => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_INSTANCETYPE_NC_GOING => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSDSA_OPT_IS_GC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSDSA_OPT_DISABLE_INBOUND_REPL => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSDSA_OPT_DISABLE_OUTBOUND_REPL => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSDSA_OPT_DISABLE_NTDSCONN_XLATE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSDSA_OPT_DISABLE_SPN_REGISTRATION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSDSA_OPT_GENERATE_OWN_TOPO => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSDSA_OPT_BLOCK_RPC => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_OPT_IS_GENERATED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_OPT_TWOWAY_SYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_OPT_OVERRIDE_NOTIFY_DEFAULT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_OPT_USE_NOTIFY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_OPT_DISABLE_INTERSITE_COMPRESSION => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_OPT_USER_OWNED_SCHEDULE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_OPT_RODC_TOPOLOGY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_NO_REASON => 0

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_GC_TOPOLOGY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_RING_TOPOLOGY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_MINIMIZE_HOPS_TOPOLOGY => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_STALE_SERVERS_TOPOLOGY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_OSCILLATING_CONNECTION_TOPOLOGY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_INTERSITE_GC_TOPOLOGY => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_INTERSITE_TOPOLOGY => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_SERVER_FAILOVER_TOPOLOGY => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_SITE_FAILOVER_TOPOLOGY => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_KCC_REDUNDANT_SERVER_TOPOLOGY => 512

    /**
     * @type {Integer (UInt32)}
     */
    static FRSCONN_PRIORITY_MASK => 1879048192

    /**
     * @type {Integer (UInt32)}
     */
    static FRSCONN_MAX_PRIORITY => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSCONN_OPT_IGNORE_SCHEDULE_MASK => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_IS_AUTO_TOPOLOGY_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_IS_TOPL_CLEANUP_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_IS_TOPL_MIN_HOPS_DISABLED => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_IS_TOPL_DETECT_STALE_DISABLED => 8

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_IS_INTER_SITE_AUTO_TOPOLOGY_DISABLED => 16

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_IS_GROUP_CACHING_ENABLED => 32

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_FORCE_KCC_WHISTLER_BEHAVIOR => 64

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_FORCE_KCC_W2K_ELECTION => 128

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_IS_RAND_BH_SELECTION_DISABLED => 256

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_IS_SCHEDULE_HASHING_ENABLED => 512

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_IS_REDUNDANT_SERVER_TOPOLOGY_ENABLED => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_W2K3_IGNORE_SCHEDULES => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_OPT_W2K3_BRIDGES_REQUIRED => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSETTINGS_DEFAULT_SERVER_REDUNDANCY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSTRANSPORT_OPT_IGNORE_SCHEDULES => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSTRANSPORT_OPT_BRIDGES_REQUIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSITECONN_OPT_USE_NOTIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSITECONN_OPT_TWOWAY_SYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSITECONN_OPT_DISABLE_COMPRESSION => 4

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSITELINK_OPT_USE_NOTIFY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSITELINK_OPT_TWOWAY_SYNC => 2

    /**
     * @type {Integer (UInt32)}
     */
    static NTDSSITELINK_OPT_DISABLE_COMPRESSION => 4

    /**
     * @type {String}
     */
    static GUID_USERS_CONTAINER_A => "a9d1ca15768811d1aded00c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_COMPUTRS_CONTAINER_A => "aa312825768811d1aded00c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_SYSTEMS_CONTAINER_A => "ab1d30f3768811d1aded00c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_DOMAIN_CONTROLLERS_CONTAINER_A => "a361b2ffffd211d1aa4b00c04fd7d83a"

    /**
     * @type {String}
     */
    static GUID_INFRASTRUCTURE_CONTAINER_A => "2fbac1870ade11d297c400c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_DELETED_OBJECTS_CONTAINER_A => "18e2ea80684f11d2b9aa00c04f79f805"

    /**
     * @type {String}
     */
    static GUID_LOSTANDFOUND_CONTAINER_A => "ab8153b7768811d1aded00c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_FOREIGNSECURITYPRINCIPALS_CONTAINER_A => "22b70c67d56e4efb91e9300fca3dc1aa"

    /**
     * @type {String}
     */
    static GUID_PROGRAM_DATA_CONTAINER_A => "09460c08ae1e4a4ea0f64aee7daa1e5a"

    /**
     * @type {String}
     */
    static GUID_MICROSOFT_PROGRAM_DATA_CONTAINER_A => "f4be92a4c777485e878e9421d53087db"

    /**
     * @type {String}
     */
    static GUID_NTDS_QUOTAS_CONTAINER_A => "6227f0af1fc2410d8e3bb10615bb5b0f"

    /**
     * @type {String}
     */
    static GUID_USERS_CONTAINER_W => "a9d1ca15768811d1aded00c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_COMPUTRS_CONTAINER_W => "aa312825768811d1aded00c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_SYSTEMS_CONTAINER_W => "ab1d30f3768811d1aded00c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_DOMAIN_CONTROLLERS_CONTAINER_W => "a361b2ffffd211d1aa4b00c04fd7d83a"

    /**
     * @type {String}
     */
    static GUID_INFRASTRUCTURE_CONTAINER_W => "2fbac1870ade11d297c400c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_DELETED_OBJECTS_CONTAINER_W => "18e2ea80684f11d2b9aa00c04f79f805"

    /**
     * @type {String}
     */
    static GUID_LOSTANDFOUND_CONTAINER_W => "ab8153b7768811d1aded00c04fd8d5cd"

    /**
     * @type {String}
     */
    static GUID_FOREIGNSECURITYPRINCIPALS_CONTAINER_W => "22b70c67d56e4efb91e9300fca3dc1aa"

    /**
     * @type {String}
     */
    static GUID_PROGRAM_DATA_CONTAINER_W => "09460c08ae1e4a4ea0f64aee7daa1e5a"

    /**
     * @type {String}
     */
    static GUID_MICROSOFT_PROGRAM_DATA_CONTAINER_W => "f4be92a4c777485e878e9421d53087db"

    /**
     * @type {String}
     */
    static GUID_NTDS_QUOTAS_CONTAINER_W => "6227f0af1fc2410d8e3bb10615bb5b0f"

    /**
     * @type {String}
     */
    static GUID_MANAGED_SERVICE_ACCOUNTS_CONTAINER_W => "1EB93889E40C45DF9F0C64D23BBB6237"

    /**
     * @type {String}
     */
    static GUID_KEYS_CONTAINER_W => "683A24E2E8164BD3AF86AC3C2CF3F981"

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNCALL_NO_OPTIONS => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNCALL_ABORT_IF_SERVER_UNAVAILABLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNCALL_SYNC_ADJACENT_SERVERS_ONLY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNCALL_ID_SERVERS_BY_DN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNCALL_DO_NOT_SYNC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNCALL_SKIP_INITIAL_CHECK => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNCALL_PUSH_CHANGES_OUTWARD => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPSYNCALL_CROSS_SITE_BOUNDARIES => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DS_LIST_DSA_OBJECT_FOR_SERVER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DS_LIST_DNS_HOST_NAME_FOR_SERVER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_LIST_ACCOUNT_OBJECT_FOR_SERVER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_ROLE_SCHEMA_OWNER => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DS_ROLE_DOMAIN_OWNER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_ROLE_PDC_OWNER => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_ROLE_RID_OWNER => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DS_ROLE_INFRASTRUCTURE_OWNER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_SCHEMA_GUID_NOT_FOUND => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DS_SCHEMA_GUID_ATTR => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_SCHEMA_GUID_ATTR_SET => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_SCHEMA_GUID_CLASS => 3

    /**
     * @type {Integer (UInt32)}
     */
    static DS_SCHEMA_GUID_CONTROL_RIGHT => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DS_KCC_FLAG_ASYNC_OP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_KCC_FLAG_DAMPED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DS_EXIST_ADVISORY_MODE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_INFO_FLAG_IMPROVE_LINKED_ATTRS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_WRITEABLE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_SYNC_ON_STARTUP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_DO_SCHEDULED_SYNCS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_USE_ASYNC_INTERSITE_TRANSPORT => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_TWO_WAY_SYNC => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_NONGC_RO_REPLICA => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_RETURN_OBJECT_PARENTS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_SELECT_SECRETS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_FULL_SYNC_IN_PROGRESS => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_FULL_SYNC_NEXT_PACKET => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_GCSPN => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_NEVER_SYNCED => 2097152

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_PREEMPTED => 16777216

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_IGNORE_CHANGE_NOTIFICATIONS => 67108864

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_DISABLE_SCHEDULED_SYNC => 134217728

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_COMPRESS_CHANGES => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_NO_CHANGE_NOTIFICATIONS => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static DS_REPL_NBR_PARTIAL_ATTRIBUTE_SET => 1073741824

    /**
     * @type {String}
     */
    static ADAM_SCP_SITE_NAME_STRING => "site:"

    /**
     * @type {String}
     */
    static ADAM_SCP_SITE_NAME_STRING_W => "site:"

    /**
     * @type {String}
     */
    static ADAM_SCP_PARTITION_STRING => "partition:"

    /**
     * @type {String}
     */
    static ADAM_SCP_PARTITION_STRING_W => "partition:"

    /**
     * @type {String}
     */
    static ADAM_SCP_INSTANCE_NAME_STRING => "instance:"

    /**
     * @type {String}
     */
    static ADAM_SCP_INSTANCE_NAME_STRING_W => "instance:"

    /**
     * @type {String}
     */
    static ADAM_SCP_FSMO_STRING => "fsmo:"

    /**
     * @type {String}
     */
    static ADAM_SCP_FSMO_STRING_W => "fsmo:"

    /**
     * @type {String}
     */
    static ADAM_SCP_FSMO_NAMING_STRING => "naming"

    /**
     * @type {String}
     */
    static ADAM_SCP_FSMO_NAMING_STRING_W => "naming"

    /**
     * @type {String}
     */
    static ADAM_SCP_FSMO_SCHEMA_STRING => "schema"

    /**
     * @type {String}
     */
    static ADAM_SCP_FSMO_SCHEMA_STRING_W => "schema"

    /**
     * @type {Integer (UInt32)}
     */
    static ADAM_REPL_AUTHENTICATION_MODE_NEGOTIATE_PASS_THROUGH => 0

    /**
     * @type {Integer (UInt32)}
     */
    static ADAM_REPL_AUTHENTICATION_MODE_NEGOTIATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static ADAM_REPL_AUTHENTICATION_MODE_MUTUAL_AUTH_REQUIRED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_FOREST_OPTIONAL_FEATURE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_DOMAIN_OPTIONAL_FEATURE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_DISABLABLE_OPTIONAL_FEATURE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static FLAG_SERVER_OPTIONAL_FEATURE => 8

    /**
     * @type {String}
     */
    static GUID_RECYCLE_BIN_OPTIONAL_FEATURE_A => "d8dc6d76d0ac5e44f3b9a7f9b6744f2a"

    /**
     * @type {String}
     */
    static GUID_RECYCLE_BIN_OPTIONAL_FEATURE_W => "d8dc6d76d0ac5e44f3b9a7f9b6744f2a"

    /**
     * @type {String}
     */
    static GUID_PRIVILEGED_ACCESS_MANAGEMENT_OPTIONAL_FEATURE_A => "73e843ece8cc4046b4ab07ffe4ab5bcd"

    /**
     * @type {String}
     */
    static GUID_PRIVILEGED_ACCESS_MANAGEMENT_OPTIONAL_FEATURE_W => "73e843ece8cc4046b4ab07ffe4ab5bcd"

    /**
     * @type {String}
     */
    static GUID_DATABASE_32K_PAGES_OPTIONAL_FEATURE_A => "c62a9852731e4f75ae2473ae2775aab8"

    /**
     * @type {String}
     */
    static GUID_DATABASE_32K_PAGES_OPTIONAL_FEATURE_W => "c62a9852731e4f75ae2473ae2775aab8"

    /**
     * @type {String}
     */
    static GUID_DATABASE_32K_PAGES_OPTIONAL_FEATURE_BYTE => "Æ*\u0098Rs\u001eOu®$s®'uª¸"

    /**
     * @type {String}
     */
    static CFSTR_DSOP_DS_SELECTION_LIST => "CFSTR_DSOP_DS_SELECTION_LIST"

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_TARGET_COMPUTER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_UPLEVEL_JOINED_DOMAIN => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_DOWNLEVEL_JOINED_DOMAIN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_ENTERPRISE_DOMAIN => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_GLOBAL_CATALOG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_EXTERNAL_UPLEVEL_DOMAIN => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_EXTERNAL_DOWNLEVEL_DOMAIN => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_WORKGROUP => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_USER_ENTERED_UPLEVEL_SCOPE => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_TYPE_USER_ENTERED_DOWNLEVEL_SCOPE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_STARTING_SCOPE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_WANT_PROVIDER_WINNT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_WANT_PROVIDER_LDAP => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_WANT_PROVIDER_GC => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_WANT_SID_PATH => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_WANT_DOWNLEVEL_BUILTIN_PATH => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_DEFAULT_FILTER_USERS => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_DEFAULT_FILTER_GROUPS => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_DEFAULT_FILTER_COMPUTERS => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_DEFAULT_FILTER_CONTACTS => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_DEFAULT_FILTER_SERVICE_ACCOUNTS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_SCOPE_FLAG_DEFAULT_FILTER_PASSWORDSETTINGS_OBJECTS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_INCLUDE_ADVANCED_VIEW => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_USERS => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_BUILTIN_GROUPS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_WELL_KNOWN_PRINCIPALS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_UNIVERSAL_GROUPS_DL => 16

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_UNIVERSAL_GROUPS_SE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_GLOBAL_GROUPS_DL => 64

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_GLOBAL_GROUPS_SE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_DOMAIN_LOCAL_GROUPS_DL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_DOMAIN_LOCAL_GROUPS_SE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_CONTACTS => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_COMPUTERS => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_SERVICE_ACCOUNTS => 4096

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FILTER_PASSWORDSETTINGS_OBJECTS => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_USERS => 2147483649

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_LOCAL_GROUPS => 2147483650

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_GLOBAL_GROUPS => 2147483652

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_COMPUTERS => 2147483656

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_WORLD => 2147483664

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_AUTHENTICATED_USER => 2147483680

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_ANONYMOUS => 2147483712

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_BATCH => 2147483776

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_CREATOR_OWNER => 2147483904

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_CREATOR_GROUP => 2147484160

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_DIALUP => 2147484672

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_INTERACTIVE => 2147485696

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_NETWORK => 2147487744

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_SERVICE => 2147491840

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_SYSTEM => 2147500032

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_EXCLUDE_BUILTIN_GROUPS => 2147516416

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_TERMINAL_SERVER => 2147549184

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_ALL_WELLKNOWN_SIDS => 2147614720

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_LOCAL_SERVICE => 2147745792

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_NETWORK_SERVICE => 2148007936

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_REMOTE_LOGON => 2148532224

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_INTERNET_USER => 2149580800

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_OWNER_RIGHTS => 2151677952

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_SERVICES => 2155872256

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_LOCAL_LOGON => 2164260864

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_THIS_ORG_CERT => 2181038080

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_IIS_APP_POOL => 2214592512

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_ALL_APP_PACKAGES => 2281701376

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_DOWNLEVEL_FILTER_LOCAL_ACCOUNTS => 2415919104

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FLAG_MULTISELECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DSOP_FLAG_SKIP_TARGET_COMPUTER_DC_CHECK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SCHEDULE_INTERVAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SCHEDULE_BANDWIDTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SCHEDULE_PRIORITY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_NTDSB => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_BACKUP => 2047

    /**
     * @type {Integer (UInt32)}
     */
    static FACILITY_SYSTEM => 0

    /**
     * @type {Integer (Int32)}
     */
    static hrNone => 0

    /**
     * @type {Integer (Int32)}
     */
    static hrNyi => -1073741823

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidParam => -939589631

    /**
     * @type {Integer (Int32)}
     */
    static hrError => -939589630

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidHandle => -939589629

    /**
     * @type {Integer (Int32)}
     */
    static hrRestoreInProgress => -939589628

    /**
     * @type {Integer (Int32)}
     */
    static hrAlreadyOpen => -939589627

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidRecips => -939589626

    /**
     * @type {Integer (Int32)}
     */
    static hrCouldNotConnect => -939589625

    /**
     * @type {Integer (Int32)}
     */
    static hrRestoreMapExists => -939589624

    /**
     * @type {Integer (Int32)}
     */
    static hrIncrementalBackupDisabled => -939589623

    /**
     * @type {Integer (Int32)}
     */
    static hrLogFileNotFound => -939589622

    /**
     * @type {Integer (Int32)}
     */
    static hrCircularLogging => -939589621

    /**
     * @type {Integer (Int32)}
     */
    static hrNoFullRestore => -939589620

    /**
     * @type {Integer (Int32)}
     */
    static hrCommunicationError => -939589619

    /**
     * @type {Integer (Int32)}
     */
    static hrFullBackupNotTaken => -939589618

    /**
     * @type {Integer (Int32)}
     */
    static hrMissingExpiryToken => -939589617

    /**
     * @type {Integer (Int32)}
     */
    static hrUnknownExpiryTokenFormat => -939589616

    /**
     * @type {Integer (Int32)}
     */
    static hrContentsExpired => -939589615

    /**
     * @type {Integer (Int32)}
     */
    static hrFileClose => -939523994

    /**
     * @type {Integer (Int32)}
     */
    static hrOutOfThreads => -939523993

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManyIO => -939523991

    /**
     * @type {Integer (Int32)}
     */
    static hrBFNotSynchronous => -2013265720

    /**
     * @type {Integer (Int32)}
     */
    static hrBFPageNotFound => -2013265719

    /**
     * @type {Integer (Int32)}
     */
    static hrBFInUse => -939523894

    /**
     * @type {Integer (Int32)}
     */
    static hrPMRecDeleted => -939523794

    /**
     * @type {Integer (Int32)}
     */
    static hrRemainingVersions => -2013265599

    /**
     * @type {Integer (Int32)}
     */
    static hrFLDKeyTooBig => -2013265520

    /**
     * @type {Integer (Int32)}
     */
    static hrFLDTooManySegments => -939523695

    /**
     * @type {Integer (Int32)}
     */
    static hrFLDNullKey => -2013265518

    /**
     * @type {Integer (Int32)}
     */
    static hrLogFileCorrupt => -939523595

    /**
     * @type {Integer (Int32)}
     */
    static hrNoBackupDirectory => -939523593

    /**
     * @type {Integer (Int32)}
     */
    static hrBackupDirectoryNotEmpty => -939523592

    /**
     * @type {Integer (Int32)}
     */
    static hrBackupInProgress => -939523591

    /**
     * @type {Integer (Int32)}
     */
    static hrMissingPreviousLogFile => -939523587

    /**
     * @type {Integer (Int32)}
     */
    static hrLogWriteFail => -939523586

    /**
     * @type {Integer (Int32)}
     */
    static hrBadLogVersion => -939523582

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidLogSequence => -939523581

    /**
     * @type {Integer (Int32)}
     */
    static hrLoggingDisabled => -939523580

    /**
     * @type {Integer (Int32)}
     */
    static hrLogBufferTooSmall => -939523579

    /**
     * @type {Integer (Int32)}
     */
    static hrLogSequenceEnd => -939523577

    /**
     * @type {Integer (Int32)}
     */
    static hrNoBackup => -939523576

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidBackupSequence => -939523575

    /**
     * @type {Integer (Int32)}
     */
    static hrBackupNotAllowedYet => -939523573

    /**
     * @type {Integer (Int32)}
     */
    static hrDeleteBackupFileFail => -939523572

    /**
     * @type {Integer (Int32)}
     */
    static hrMakeBackupDirectoryFail => -939523571

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidBackup => -939523570

    /**
     * @type {Integer (Int32)}
     */
    static hrRecoveredWithErrors => -939523569

    /**
     * @type {Integer (Int32)}
     */
    static hrMissingLogFile => -939523568

    /**
     * @type {Integer (Int32)}
     */
    static hrLogDiskFull => -939523567

    /**
     * @type {Integer (Int32)}
     */
    static hrBadLogSignature => -939523566

    /**
     * @type {Integer (Int32)}
     */
    static hrBadDbSignature => -939523565

    /**
     * @type {Integer (Int32)}
     */
    static hrBadCheckpointSignature => -939523564

    /**
     * @type {Integer (Int32)}
     */
    static hrCheckpointCorrupt => -939523563

    /**
     * @type {Integer (Int32)}
     */
    static hrDatabaseInconsistent => -939523546

    /**
     * @type {Integer (Int32)}
     */
    static hrConsistentTimeMismatch => -939523545

    /**
     * @type {Integer (Int32)}
     */
    static hrPatchFileMismatch => -939523544

    /**
     * @type {Integer (Int32)}
     */
    static hrRestoreLogTooLow => -939523543

    /**
     * @type {Integer (Int32)}
     */
    static hrRestoreLogTooHigh => -939523542

    /**
     * @type {Integer (Int32)}
     */
    static hrGivenLogFileHasBadSignature => -939523541

    /**
     * @type {Integer (Int32)}
     */
    static hrGivenLogFileIsNotContiguous => -939523540

    /**
     * @type {Integer (Int32)}
     */
    static hrMissingRestoreLogFiles => -939523539

    /**
     * @type {Integer (Int32)}
     */
    static hrExistingLogFileHasBadSignature => -2013265362

    /**
     * @type {Integer (Int32)}
     */
    static hrExistingLogFileIsNotContiguous => -2013265361

    /**
     * @type {Integer (Int32)}
     */
    static hrMissingFullBackup => -939523536

    /**
     * @type {Integer (Int32)}
     */
    static hrBadBackupDatabaseSize => -939523535

    /**
     * @type {Integer (Int32)}
     */
    static hrTermInProgress => -939523096

    /**
     * @type {Integer (Int32)}
     */
    static hrFeatureNotAvailable => -939523095

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidName => -939523094

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidParameter => -939523093

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnNull => -2013264916

    /**
     * @type {Integer (Int32)}
     */
    static hrBufferTruncated => -2013264914

    /**
     * @type {Integer (Int32)}
     */
    static hrDatabaseAttached => -2013264913

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidDatabaseId => -939523086

    /**
     * @type {Integer (Int32)}
     */
    static hrOutOfMemory => -939523085

    /**
     * @type {Integer (Int32)}
     */
    static hrOutOfDatabaseSpace => -939523084

    /**
     * @type {Integer (Int32)}
     */
    static hrOutOfCursors => -939523083

    /**
     * @type {Integer (Int32)}
     */
    static hrOutOfBuffers => -939523082

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManyIndexes => -939523081

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManyKeys => -939523080

    /**
     * @type {Integer (Int32)}
     */
    static hrRecordDeleted => -939523079

    /**
     * @type {Integer (Int32)}
     */
    static hrReadVerifyFailure => -939523078

    /**
     * @type {Integer (Int32)}
     */
    static hrOutOfFileHandles => -939523076

    /**
     * @type {Integer (Int32)}
     */
    static hrDiskIO => -939523074

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidPath => -939523073

    /**
     * @type {Integer (Int32)}
     */
    static hrRecordTooBig => -939523070

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManyOpenDatabases => -939523069

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidDatabase => -939523068

    /**
     * @type {Integer (Int32)}
     */
    static hrNotInitialized => -939523067

    /**
     * @type {Integer (Int32)}
     */
    static hrAlreadyInitialized => -939523066

    /**
     * @type {Integer (Int32)}
     */
    static hrFileAccessDenied => -939523064

    /**
     * @type {Integer (Int32)}
     */
    static hrBufferTooSmall => -939523058

    /**
     * @type {Integer (Int32)}
     */
    static hrSeekNotEqual => -2013264881

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManyColumns => -939523056

    /**
     * @type {Integer (Int32)}
     */
    static hrContainerNotEmpty => -939523053

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidFilename => -939523052

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidBookmark => -939523051

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnInUse => -939523050

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidBufferSize => -939523049

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnNotUpdatable => -939523048

    /**
     * @type {Integer (Int32)}
     */
    static hrIndexInUse => -939523045

    /**
     * @type {Integer (Int32)}
     */
    static hrNullKeyDisallowed => -939523043

    /**
     * @type {Integer (Int32)}
     */
    static hrNotInTransaction => -939523042

    /**
     * @type {Integer (Int32)}
     */
    static hrNoIdleActivity => -2013264862

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManyActiveUsers => -939523037

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidCountry => -939523035

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidLanguageId => -939523034

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidCodePage => -939523033

    /**
     * @type {Integer (Int32)}
     */
    static hrNoWriteLock => -2013264853

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnSetNull => -2013264852

    /**
     * @type {Integer (Int32)}
     */
    static hrVersionStoreOutOfMemory => -939523027

    /**
     * @type {Integer (Int32)}
     */
    static hrCurrencyStackOutOfMemory => -939523026

    /**
     * @type {Integer (Int32)}
     */
    static hrOutOfSessions => -939522995

    /**
     * @type {Integer (Int32)}
     */
    static hrWriteConflict => -939522994

    /**
     * @type {Integer (Int32)}
     */
    static hrTransTooDeep => -939522993

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidSesid => -939522992

    /**
     * @type {Integer (Int32)}
     */
    static hrSessionWriteConflict => -939522989

    /**
     * @type {Integer (Int32)}
     */
    static hrInTransaction => -939522988

    /**
     * @type {Integer (Int32)}
     */
    static hrDatabaseDuplicate => -939522895

    /**
     * @type {Integer (Int32)}
     */
    static hrDatabaseInUse => -939522894

    /**
     * @type {Integer (Int32)}
     */
    static hrDatabaseNotFound => -939522893

    /**
     * @type {Integer (Int32)}
     */
    static hrDatabaseInvalidName => -939522892

    /**
     * @type {Integer (Int32)}
     */
    static hrDatabaseInvalidPages => -939522891

    /**
     * @type {Integer (Int32)}
     */
    static hrDatabaseCorrupted => -939522890

    /**
     * @type {Integer (Int32)}
     */
    static hrDatabaseLocked => -939522889

    /**
     * @type {Integer (Int32)}
     */
    static hrTableEmpty => -2013264619

    /**
     * @type {Integer (Int32)}
     */
    static hrTableLocked => -939522794

    /**
     * @type {Integer (Int32)}
     */
    static hrTableDuplicate => -939522793

    /**
     * @type {Integer (Int32)}
     */
    static hrTableInUse => -939522792

    /**
     * @type {Integer (Int32)}
     */
    static hrObjectNotFound => -939522791

    /**
     * @type {Integer (Int32)}
     */
    static hrCannotRename => -939522790

    /**
     * @type {Integer (Int32)}
     */
    static hrDensityInvalid => -939522789

    /**
     * @type {Integer (Int32)}
     */
    static hrTableNotEmpty => -939522788

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidTableId => -939522786

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManyOpenTables => -939522785

    /**
     * @type {Integer (Int32)}
     */
    static hrIllegalOperation => -939522784

    /**
     * @type {Integer (Int32)}
     */
    static hrObjectDuplicate => -939522782

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidObject => -939522780

    /**
     * @type {Integer (Int32)}
     */
    static hrIndexCantBuild => -939522695

    /**
     * @type {Integer (Int32)}
     */
    static hrIndexHasPrimary => -939522694

    /**
     * @type {Integer (Int32)}
     */
    static hrIndexDuplicate => -939522693

    /**
     * @type {Integer (Int32)}
     */
    static hrIndexNotFound => -939522692

    /**
     * @type {Integer (Int32)}
     */
    static hrIndexMustStay => -939522691

    /**
     * @type {Integer (Int32)}
     */
    static hrIndexInvalidDef => -939522690

    /**
     * @type {Integer (Int32)}
     */
    static hrIndexHasClustered => -939522688

    /**
     * @type {Integer (Int32)}
     */
    static hrCreateIndexFailed => -2013264511

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManyOpenIndexes => -939522686

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnLong => -939522595

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnDoesNotFit => -939522593

    /**
     * @type {Integer (Int32)}
     */
    static hrNullInvalid => -939522592

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnIndexed => -939522591

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnTooBig => -939522590

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnNotFound => -939522589

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnDuplicate => -939522588

    /**
     * @type {Integer (Int32)}
     */
    static hrColumn2ndSysMaint => -939522586

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidColumnType => -939522585

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnMaxTruncated => -2013264408

    /**
     * @type {Integer (Int32)}
     */
    static hrColumnCannotIndex => -939522583

    /**
     * @type {Integer (Int32)}
     */
    static hrTaggedNotNULL => -939522582

    /**
     * @type {Integer (Int32)}
     */
    static hrNoCurrentIndex => -939522581

    /**
     * @type {Integer (Int32)}
     */
    static hrKeyIsMade => -939522580

    /**
     * @type {Integer (Int32)}
     */
    static hrBadColumnId => -939522579

    /**
     * @type {Integer (Int32)}
     */
    static hrBadItagSequence => -939522578

    /**
     * @type {Integer (Int32)}
     */
    static hrCannotBeTagged => -939522575

    /**
     * @type {Integer (Int32)}
     */
    static hrRecordNotFound => -939522495

    /**
     * @type {Integer (Int32)}
     */
    static hrNoCurrentRecord => -939522493

    /**
     * @type {Integer (Int32)}
     */
    static hrRecordClusteredChanged => -939522492

    /**
     * @type {Integer (Int32)}
     */
    static hrKeyDuplicate => -939522491

    /**
     * @type {Integer (Int32)}
     */
    static hrAlreadyPrepared => -939522489

    /**
     * @type {Integer (Int32)}
     */
    static hrKeyNotMade => -939522488

    /**
     * @type {Integer (Int32)}
     */
    static hrUpdateNotPrepared => -939522487

    /**
     * @type {Integer (Int32)}
     */
    static hrwrnDataHasChanged => -2013264310

    /**
     * @type {Integer (Int32)}
     */
    static hrerrDataHasChanged => -939522485

    /**
     * @type {Integer (Int32)}
     */
    static hrKeyChanged => -2013264302

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManySorts => -939522395

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidOnSort => -939522394

    /**
     * @type {Integer (Int32)}
     */
    static hrTempFileOpenError => -939522293

    /**
     * @type {Integer (Int32)}
     */
    static hrTooManyAttachedDatabases => -939522291

    /**
     * @type {Integer (Int32)}
     */
    static hrDiskFull => -939522288

    /**
     * @type {Integer (Int32)}
     */
    static hrPermissionDenied => -939522287

    /**
     * @type {Integer (Int32)}
     */
    static hrFileNotFound => -939522285

    /**
     * @type {Integer (Int32)}
     */
    static hrFileOpenReadOnly => -2013264107

    /**
     * @type {Integer (Int32)}
     */
    static hrAfterInitialization => -939522246

    /**
     * @type {Integer (Int32)}
     */
    static hrLogCorrupted => -939522244

    /**
     * @type {Integer (Int32)}
     */
    static hrInvalidOperation => -939522190

    /**
     * @type {Integer (Int32)}
     */
    static hrAccessDenied => -939522189

    /**
     * @type {String}
     */
    static CLSID_DsObjectPicker => "{17d6ccd8-3b7b-11d2-b9e0-00c04fd8dbf7}"
;@endregion Constants

;@region Methods
    /**
     * Binds to an object given its path and a specified interface identifier.
     * @param {PWSTR} lpszPathName Type: <b>LPCWSTR</b>
     * 
     * The null-terminated Unicode string that specifies the path  used to bind to the object in the underlying directory service. For more information and code examples for binding strings for this parameter, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/ldap-adspath">LDAP ADsPath</a> and  <a href="https://docs.microsoft.com/windows/desktop/ADSI/winnt-adspath">WinNT ADsPath</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Interface identifier for a specified interface on this object.
     * @param {Pointer<Pointer<Void>>} ppObject Type: <b>VOID**</b>
     * 
     * Pointer to a pointer to the requested Interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard <b>HRESULT</b> return values, as well as the following.
     * 
     * For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adsgetobject
     * @since windows6.0.6000
     */
    static ADsGetObject(lpszPathName, riid, ppObject) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName

        result := DllCall("ACTIVEDS.dll\ADsGetObject", "ptr", lpszPathName, "ptr", riid, "ptr*", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ADsBuildEnumerator function creates an enumerator object for the specified ADSI container object.
     * @param {IADsContainer} pADsContainer Type: <b>IADsContainer*</b>
     * 
     * Pointer to the  <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadscontainer">IADsContainer</a> interface for the object to enumerate.
     * @param {Pointer<IEnumVARIANT>} ppEnumVariant Type: <b>IEnumVARIANT**</b>
     * 
     * Pointer to an <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface pointer that receives the enumerator object created for the specified container object.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard <b>HRESULT</b> return values, including <b>S_OK</b> for a successful operation. For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adsbuildenumerator
     * @since windows6.0.6000
     */
    static ADsBuildEnumerator(pADsContainer, ppEnumVariant) {
        result := DllCall("ACTIVEDS.dll\ADsBuildEnumerator", "ptr", pADsContainer, "ptr*", ppEnumVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Frees an enumerator object created with the ADsBuildEnumerator function.
     * @param {IEnumVARIANT} pEnumVariant Type: <b>IEnumVARIANT*</b>
     * 
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface on the enumerator object to be freed.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports standard return values, as well as the following.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adsfreeenumerator
     * @since windows6.0.6000
     */
    static ADsFreeEnumerator(pEnumVariant) {
        result := DllCall("ACTIVEDS.dll\ADsFreeEnumerator", "ptr", pEnumVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ADsEnumerateNext function enumerates through a specified number of elements from the current cursor position of the enumerator.
     * @param {IEnumVARIANT} pEnumVariant Type: <b>IEnumVARIANT*</b>
     * 
     * Pointer to the  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oaidl/nn-oaidl-ienumvariant">IEnumVARIANT</a> interface on the enumerator object.
     * @param {Integer} cElements Type: <b>ULONG</b>
     * 
     * Number of elements requested.
     * @param {Pointer<VARIANT>} pvar Type: <b>VARIANT*</b>
     * 
     * Pointer to the array of elements retrieved.
     * @param {Pointer<Integer>} pcElementsFetched Type: <b>ULONG*</b>
     * 
     * Actual number of elements retrieved, which can be smaller than the number of elements requested.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values.
     * 
     * For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adsenumeratenext
     * @since windows6.0.6000
     */
    static ADsEnumerateNext(pEnumVariant, cElements, pvar, pcElementsFetched) {
        result := DllCall("ACTIVEDS.dll\ADsEnumerateNext", "ptr", pEnumVariant, "uint", cElements, "ptr", pvar, "uint*", pcElementsFetched, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ADsBuildVarArrayStr function builds a variant array from an array of Unicode strings.
     * @param {Pointer<PWSTR>} lppPathNames Type: <b>LPWSTR*</b>
     * 
     * Array of null-terminated Unicode strings.
     * @param {Integer} dwPathNames Type: <b>DWORD</b>
     * 
     * Number of Unicode entries in the given array.
     * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
     * 
     * Pointer to the resulting variant array.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values, as well as the following.
     * 
     * For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adsbuildvararraystr
     * @since windows6.0.6000
     */
    static ADsBuildVarArrayStr(lppPathNames, dwPathNames, pVar) {
        result := DllCall("ACTIVEDS.dll\ADsBuildVarArrayStr", "ptr", lppPathNames, "uint", dwPathNames, "ptr", pVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ADsBuildVarArrayInt function builds a variant array of integers from an array of DWORD values.
     * @param {Pointer<Integer>} lpdwObjectTypes Type: <b>LPDWORD</b>
     * 
     * Array of <b>DWORD</b> values.
     * @param {Integer} dwObjectTypes Type: <b>DWORD</b>
     * 
     * Number of <b>DWORD</b> entries in the given array.
     * @param {Pointer<VARIANT>} pVar Type: <b>VARIANT*</b>
     * 
     * Pointer to the resulting variant array of integers.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports standard return values.
     * 
     * For more information about other return values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adsbuildvararrayint
     * @since windows6.0.6000
     */
    static ADsBuildVarArrayInt(lpdwObjectTypes, dwObjectTypes, pVar) {
        result := DllCall("ACTIVEDS.dll\ADsBuildVarArrayInt", "uint*", lpdwObjectTypes, "uint", dwObjectTypes, "ptr", pVar, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Binds to an ADSI object using explicit user name and password credentials.
     * @param {PWSTR} lpszPathName Type: <b>LPCWSTR</b>
     * 
     * The null-terminated Unicode string that specifies the ADsPath of the ADSI object. For more information and code examples of binding strings for this parameter, see  <a href="https://docs.microsoft.com/windows/desktop/ADSI/ldap-adspath">LDAP ADsPath</a> and  <a href="https://docs.microsoft.com/windows/desktop/ADSI/winnt-adspath">WinNT ADsPath</a>.
     * @param {PWSTR} lpszUserName Type: <b>LPCWSTR</b>
     * 
     * The null-terminated Unicode string that specifies the user name to supply to the directory service to use for credentials. This string should always be in the format "&lt;domain&gt;\&lt;user name&gt;" to avoid ambiguity. For example, if DomainA and DomainB have a trust relationship and both domains have a user with the name "user1", it is not possible to predict which domain <b>ADsOpenObject</b> will use to validate "user1".
     * @param {PWSTR} lpszPassword Type: <b>LPCWSTR</b>
     * 
     * The null-terminated Unicode string that specifies the password to supply to the directory service to use for credentials.
     * @param {Integer} dwReserved Type: <b>DWORD</b>
     * 
     * Provider-specific authentication flags used to define the binding options. For more information, see  <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum">ADS_AUTHENTICATION_ENUM</a>.
     * @param {Pointer<Guid>} riid Type: <b>REFIID</b>
     * 
     * Interface identifier for the requested interface on this object.
     * @param {Pointer<Pointer<Void>>} ppObject Type: <b>VOID**</b>
     * 
     * Pointer to a  pointer to the requested interface.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard <b>HRESULT</b> return values, including the following.
     * 
     * For more information, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adsopenobject
     * @since windows6.0.6000
     */
    static ADsOpenObject(lpszPathName, lpszUserName, lpszPassword, dwReserved, riid, ppObject) {
        lpszPathName := lpszPathName is String ? StrPtr(lpszPathName) : lpszPathName
        lpszUserName := lpszUserName is String ? StrPtr(lpszUserName) : lpszUserName
        lpszPassword := lpszPassword is String ? StrPtr(lpszPassword) : lpszPassword

        result := DllCall("ACTIVEDS.dll\ADsOpenObject", "ptr", lpszPathName, "ptr", lpszUserName, "ptr", lpszPassword, "uint", dwReserved, "ptr", riid, "ptr*", ppObject, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ADsGetLastError function retrieves the calling thread's last-error code value.
     * @param {Pointer<Integer>} lpError Type: <b>LPDWORD</b>
     * 
     * Pointer to the location that receives the error code.
     * @param {PWSTR} lpErrorBuf Type: <b>LPWSTR</b>
     * 
     * Pointer to the location that receives the null-terminated Unicode string that describes the error.
     * @param {Integer} dwErrorBufLen Type: <b>DWORD</b>
     * 
     * Size, in characters, of the <i>lpErrorBuf</i> buffer. If the buffer is too small to receive the error string, the string is truncated, but still null-terminated. A buffer, of at least 256 bytes, is recommended.
     * @param {PWSTR} lpNameBuf Type: <b>LPWSTR</b>
     * 
     * Pointer to the location that receives the null-terminated Unicode string that describes the name of the provider that raised the error.
     * @param {Integer} dwNameBufLen Type: <b>DWORD</b>
     * 
     * Size, in characters, of the <i>lpNameBuf</i> buffer. If the buffer is too small to receive the name of the provider, the string is truncated, but still null-terminated.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports standard return values, as well as the following.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adsgetlasterror
     * @since windows6.0.6000
     */
    static ADsGetLastError(lpError, lpErrorBuf, dwErrorBufLen, lpNameBuf, dwNameBufLen) {
        lpErrorBuf := lpErrorBuf is String ? StrPtr(lpErrorBuf) : lpErrorBuf
        lpNameBuf := lpNameBuf is String ? StrPtr(lpNameBuf) : lpNameBuf

        A_LastError := 0

        result := DllCall("ACTIVEDS.dll\ADsGetLastError", "uint*", lpError, "ptr", lpErrorBuf, "uint", dwErrorBufLen, "ptr", lpNameBuf, "uint", dwNameBufLen, "int")
        if(A_LastError)
            throw OSError()

        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ADsSetLastError sets the last-error code value for the calling thread.
     * @remarks
     * 
     * In a custom implementation of an ADSI provider, for example, an LDAP provider, you can set an operation error message as follows.
     * 
     * 
     * ```cpp
     * ADsSetLastError(HRESULT_FROM_WIN32(ERROR_DS_OPERATIONS_ERROR),
     *                 L"ERROR_DS_OPERATIONS_ERROR",
     *                 L"LDAP Provider");
     * ```
     * 
     * 
     * The user can use the following code example to examine this operation code.
     * 
     * 
     * ```cpp
     * DWORD dwLastError;
     * WCHAR szErrorBuf[MAX_PATH];
     * WCHAR szNameBuf[MAX_PATH];
     * // Get extended error value.
     * HRESULT hr_return =S_OK;
     * hr_return = ADsGetLastError( &dwLastError,
     *                                szErrorBuf,
     *                                MAX_PATH,
     *                                szNameBuf,
     *                                MAX_PATH);
     * if (SUCCEEDED(hr_return))
     * {
     *     wprintf(L"Error Code: %d\n Error Text: %ws\n Provider: %ws\n", dwLastError, szErrorBuf, szNameBuf);
     * }
     * ```
     * 
     * 
     * The previous code example produces the following output for the operations error code set above.
     * 
     * 
     * ```cpp
     * Error value: 80072020
     * Error Text: ERROR_DS_OPERATIONS_ERROR
     * Provider: LDAP Provider
     * ```
     * 
     * 
     * If you use <b>ERROR_DS_OPERATIONS_ERROR</b> without invoking the HRESULT_FROM_WIN32 macro when setting the error, the following output is returned.
     * 
     * 
     * ```cpp
     * Error value: 2020
     * Error Text: ERROR_DS_OPERATIONS_ERROR
     * Provider: LDAP Provider
     * ```
     * 
     * 
     * @param {Integer} dwErr Type: <b>DWORD</b>
     * 
     * The error code that occurred. If this is an error defined by Windows, <i>pszError</i> is ignored. If this is ERROR_EXTENDED_ERROR, it indicates the provider has a network-specific error to report.
     * @param {PWSTR} pszError Type: <b>LPWSTR</b>
     * 
     * The null-terminated Unicode string that describes the network-specific error.
     * @param {PWSTR} pszProvider Type: <b>LPWSTR</b>
     * 
     * The null-terminated Unicode string that names the ADSI provider that raised the error.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adssetlasterror
     * @since windows6.0.6000
     */
    static ADsSetLastError(dwErr, pszError, pszProvider) {
        pszError := pszError is String ? StrPtr(pszError) : pszError
        pszProvider := pszProvider is String ? StrPtr(pszProvider) : pszProvider

        DllCall("ACTIVEDS.dll\ADsSetLastError", "uint", dwErr, "ptr", pszError, "ptr", pszProvider)
    }

    /**
     * Allocates a block of memory of the specified size.
     * @param {Integer} cb Type: <b>DWORD</b>
     * 
     * Contains the size, in bytes, to be allocated.
     * @returns {Pointer<Void>} Type: <b>LPVOID</b>
     * 
     * When successful, the function returns a non-<b>NULL</b> pointer to the allocated memory. The caller must free this memory when it is no longer required by passing the returned pointer to <a href="/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a>.
     * 
     * Returns <b>NULL</b> if not successful. Call  <a href="/windows/desktop/api/adshlp/nf-adshlp-adsgetlasterror">ADsGetLastError</a> to obtain extended error status. For more information about error code values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-allocadsmem
     * @since windows6.0.6000
     */
    static AllocADsMem(cb) {
        result := DllCall("ACTIVEDS.dll\AllocADsMem", "uint", cb, "ptr")
        return result
    }

    /**
     * Frees the memory allocated by AllocADsMem or ReallocADsMem.
     * @param {Pointer<Void>} pMem Type: <b>LPVOID</b>
     * 
     * Pointer to the memory to be freed. This memory must have been allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsmem">AllocADsMem</a> or <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsmem">ReallocADsMem</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The function returns <b>TRUE</b> if successful, otherwise it returns <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-freeadsmem
     * @since windows6.0.6000
     */
    static FreeADsMem(pMem) {
        result := DllCall("ACTIVEDS.dll\FreeADsMem", "ptr", pMem, "int")
        return result
    }

    /**
     * Reallocates and copies an existing memory block.
     * @param {Pointer<Void>} pOldMem Type: <b>LPVOID</b>
     * 
     * Pointer to the memory to copy. <b>ReallocADsMem</b> will free this memory with <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a> after it has been copied. If additional memory cannot be allocated, this memory is not freed. This memory must have been allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsmem">AllocADsMem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsstr">AllocADsStr</a>, <b>ReallocADsMem</b>, or <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsstr">ReallocADsStr</a> function.
     * 
     * The caller must  free this memory when it is no longer required by passing this pointer to <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a>.
     * @param {Integer} cbOld Type: <b>DWORD</b>
     * 
     * Size, in bytes, of the memory to copy.
     * @param {Integer} cbNew Type: <b>DWORD</b>
     * 
     * Size, in bytes, of the memory to allocate.
     * @returns {Pointer<Void>} Type: <b>LPVOID</b>
     * 
     * When successful, the function returns a pointer to the new allocated memory. Otherwise it returns <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-reallocadsmem
     * @since windows6.0.6000
     */
    static ReallocADsMem(pOldMem, cbOld, cbNew) {
        result := DllCall("ACTIVEDS.dll\ReallocADsMem", "ptr", pOldMem, "uint", cbOld, "uint", cbNew, "ptr")
        return result
    }

    /**
     * Allocates memory for and copies a specified string.
     * @param {PWSTR} pStr Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string to be copied.
     * @returns {PWSTR} Type: <b>LPWSTR</b>
     * 
     * When successful, the function returns a non-<b>NULL</b> pointer to the allocated memory. The string in <i>pStr</i> is copied to this buffer and null-terminated. The caller must  free this memory when it is no longer required by passing the returned pointer to <a href="/windows/desktop/api/adshlp/nf-adshlp-freeadsstr">FreeADsStr</a>.
     * 
     * Returns <b>NULL</b> if not successful. Call  <a href="/windows/desktop/api/adshlp/nf-adshlp-adsgetlasterror">ADsGetLastError</a> to obtain the extended error status. For more information about error code values, see  <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-allocadsstr
     * @since windows6.0.6000
     */
    static AllocADsStr(pStr) {
        pStr := pStr is String ? StrPtr(pStr) : pStr

        result := DllCall("ACTIVEDS.dll\AllocADsStr", "ptr", pStr, "char*")
        return result
    }

    /**
     * Frees the memory of a string allocated by AllocADsStr or ReallocADsStr.
     * @param {PWSTR} pStr Type: <b>LPWSTR</b>
     * 
     * Pointer to the string to be freed. This string must have been allocated with the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsstr">AllocADsStr</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsstr">ReallocADsStr</a> function.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The function returns <b>TRUE</b> if the memory is freed. Otherwise, it returns 
     *       <b>FALSE</b>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-freeadsstr
     * @since windows6.0.6000
     */
    static FreeADsStr(pStr) {
        pStr := pStr is String ? StrPtr(pStr) : pStr

        result := DllCall("ACTIVEDS.dll\FreeADsStr", "ptr", pStr, "int")
        return result
    }

    /**
     * Creates a copy of a Unicode string.
     * @param {Pointer<PWSTR>} ppStr Type: <b>LPWSTR*</b>
     * 
     * Pointer to null-terminated Unicode string pointer that receives the allocated string. <b>ReallocADsStr</b> will attempt to free this memory with <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsstr">FreeADsStr</a> before reallocating the string, so this parameter should be initialized to <b>NULL</b> if the memory should not be freed or was not allocated with the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsmem">AllocADsMem</a>, <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-allocadsstr">AllocADsStr</a>, <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-reallocadsmem">ReallocADsMem</a> or <b>ReallocADsStr</b> function.
     * 
     * The caller must free this memory when it is no longer required by passing this pointer to <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsstr">FreeADsStr</a>.
     * @param {PWSTR} pStr Type: <b>LPWSTR</b>
     * 
     * Pointer to a null-terminated Unicode string that contains the string to copy.
     * @returns {BOOL} Type: <b>BOOL</b>
     * 
     * The function returns <b>TRUE</b> if  successful, otherwise <b>FALSE</b> is returned.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-reallocadsstr
     * @since windows6.0.6000
     */
    static ReallocADsStr(ppStr, pStr) {
        pStr := pStr is String ? StrPtr(pStr) : pStr

        result := DllCall("ACTIVEDS.dll\ReallocADsStr", "ptr", ppStr, "ptr", pStr, "int")
        return result
    }

    /**
     * The ADsEncodeBinaryData function converts a binary large object (BLOB) to the Unicode format suitable to be embedded in a search filter.
     * @param {Pointer<Integer>} pbSrcData Type: <b>PBYTE</b>
     * 
     * BLOB to be converted.
     * @param {Integer} dwSrcLen Type: <b>DWORD</b>
     * 
     * Size, in bytes, of the BLOB.
     * @param {Pointer<PWSTR>} ppszDestData Type: <b>LPWSTR*</b>
     * 
     * Pointer to a null-terminated Unicode string that receives the converted data.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values, as well as the following.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-adsencodebinarydata
     * @since windows6.0.6000
     */
    static ADsEncodeBinaryData(pbSrcData, dwSrcLen, ppszDestData) {
        result := DllCall("ACTIVEDS.dll\ADsEncodeBinaryData", "char*", pbSrcData, "uint", dwSrcLen, "ptr", ppszDestData, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {PWSTR} szSrcData 
     * @param {Pointer<Pointer<Integer>>} ppbDestData 
     * @param {Pointer<Integer>} pdwDestLen 
     * @returns {HRESULT} 
     */
    static ADsDecodeBinaryData(szSrcData, ppbDestData, pdwDestLen) {
        szSrcData := szSrcData is String ? StrPtr(szSrcData) : szSrcData

        result := DllCall("ACTIVEDS.dll\ADsDecodeBinaryData", "ptr", szSrcData, "ptr*", ppbDestData, "uint*", pdwDestLen, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<VARIANT>} pVariant 
     * @param {Integer} dwNumVariant 
     * @param {Pointer<Pointer<ADSVALUE>>} ppAdsValues 
     * @param {Pointer<Integer>} pdwNumValues 
     * @returns {HRESULT} 
     */
    static PropVariantToAdsType(pVariant, dwNumVariant, ppAdsValues, pdwNumValues) {
        result := DllCall("ACTIVEDS.dll\PropVariantToAdsType", "ptr", pVariant, "uint", dwNumVariant, "ptr*", ppAdsValues, "uint*", pdwNumValues, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ADSVALUE>} pAdsValues 
     * @param {Integer} dwNumValues 
     * @param {Pointer<VARIANT>} pVariant 
     * @returns {HRESULT} 
     */
    static AdsTypeToPropVariant(pAdsValues, dwNumValues, pVariant) {
        result := DllCall("ACTIVEDS.dll\AdsTypeToPropVariant", "ptr", pAdsValues, "uint", dwNumValues, "ptr", pVariant, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * 
     * @param {Pointer<ADSVALUE>} pAdsValues 
     * @param {Integer} dwNumValues 
     * @returns {String} Nothing - always returns an empty string
     */
    static AdsFreeAdsValues(pAdsValues, dwNumValues) {
        DllCall("ACTIVEDS.dll\AdsFreeAdsValues", "ptr", pAdsValues, "uint", dwNumValues)
    }

    /**
     * Converts a binary security descriptor to an IADsSecurityDescriptor object.
     * @param {PSECURITY_DESCRIPTOR} pSecurityDescriptor Type: <b>PSECURITY_DESCRIPTOR</b>
     * 
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure to convert.
     * @param {Pointer<VARIANT>} pVarsec Type: <b>VARIANT*</b>
     * 
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that receives the object. The <b>VARIANT</b> contains a <b>VT_DISPATCH</b> object that can be queried for the <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecuritydescriptor">IADsSecurityDescriptor</a> interface. The caller must release this <b>VARIANT</b> by passing the <b>VARIANT</b> to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/oleauto/nf-oleauto-variantclear">VariantClear</a> function.
     * @param {PWSTR} pszServerName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string that provides the name of the server that the security descriptor was retrieved from. This parameter is optional and can be <b>NULL</b>.
     * @param {PWSTR} userName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string that provides the user name to be associated with the security descriptor. This parameter is optional and can be <b>NULL</b>.
     * @param {PWSTR} passWord Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string that provides the password to be associated with the security descriptor. This parameter is optional and can be <b>NULL</b>.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Contains authentication flags for the conversion. This can be zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum">ADS_AUTHENTICATION_ENUM</a> enumeration values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports  standard return values, as well as the following:
     * 
     * If the operation fails, an ADSI error code is returned. For more information, see <a href="/windows/desktop/ADSI/adsi-error-codes">ADSI Error Codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-binarysdtosecuritydescriptor
     * @since windows6.0.6000
     */
    static BinarySDToSecurityDescriptor(pSecurityDescriptor, pVarsec, pszServerName, userName, passWord, dwFlags) {
        pSecurityDescriptor := pSecurityDescriptor is Win32Handle ? NumGet(pSecurityDescriptor, "ptr") : pSecurityDescriptor
        pszServerName := pszServerName is String ? StrPtr(pszServerName) : pszServerName
        userName := userName is String ? StrPtr(userName) : userName
        passWord := passWord is String ? StrPtr(passWord) : passWord

        result := DllCall("ACTIVEDS.dll\BinarySDToSecurityDescriptor", "ptr", pSecurityDescriptor, "ptr", pVarsec, "ptr", pszServerName, "ptr", userName, "ptr", passWord, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Converts an IADsSecurityDescriptor object to the binary security descriptor format.
     * @param {VARIANT} vVarSecDes Type: <b>VARIANT</b>
     * 
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/oaidl/ns-oaidl-variant">VARIANT</a> that contains the security descriptor to convert. The <b>VARIANT</b> must contain a <b>VT_DISPATCH</b> that contains an <a href="https://docs.microsoft.com/windows/desktop/api/iads/nn-iads-iadssecuritydescriptor">IADsSecurityDescriptor</a> object.
     * @param {Pointer<PSECURITY_DESCRIPTOR>} ppSecurityDescriptor Type: <b>PSECURITY_DESCRIPTOR*</b>
     * 
     * Address of a <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> pointer that receives the binary security descriptor data. The caller must free this memory by passing this pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/adshlp/nf-adshlp-freeadsmem">FreeADsMem</a> function.
     * @param {Pointer<Integer>} pdwSDLength Type: <b>PDWORD</b>
     * 
     * Address of a <b>DWORD</b> value that receives the length, in bytes of the binary security descriptor data.
     * @param {PWSTR} pszServerName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string that specifies the name of the server where the security descriptor is placed. This parameter is optional and can be <b>NULL</b>.
     * @param {PWSTR} userName Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string that contains the user name that the security descriptor is associated to. This parameter is optional and can be <b>NULL</b>.
     * @param {PWSTR} passWord Type: <b>LPCWSTR</b>
     * 
     * A null-terminated Unicode string that contains the password that the security descriptor is associated. This parameter is optional and can be <b>NULL</b>.
     * @param {Integer} dwFlags Type: <b>DWORD</b>
     * 
     * Contains authentication flags for the conversion. This can be zero or a combination of one or more of the <a href="https://docs.microsoft.com/windows/win32/api/iads/ne-iads-ads_authentication_enum">ADS_AUTHENTICATION_ENUM</a> enumeration values.
     * @returns {HRESULT} Type: <b>HRESULT</b>
     * 
     * This method supports the standard return values, as well as the following.
     * @see https://docs.microsoft.com/windows/win32/api//adshlp/nf-adshlp-securitydescriptortobinarysd
     * @since windows6.0.6000
     */
    static SecurityDescriptorToBinarySD(vVarSecDes, ppSecurityDescriptor, pdwSDLength, pszServerName, userName, passWord, dwFlags) {
        pszServerName := pszServerName is String ? StrPtr(pszServerName) : pszServerName
        userName := userName is String ? StrPtr(userName) : userName
        passWord := passWord is String ? StrPtr(passWord) : passWord

        result := DllCall("ACTIVEDS.dll\SecurityDescriptorToBinarySD", "ptr", vVarSecDes, "ptr", ppSecurityDescriptor, "uint*", pdwSDLength, "ptr", pszServerName, "ptr", userName, "ptr", passWord, "uint", dwFlags, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Displays a dialog box used to browse for container objects in Active Directory Domain Services.
     * @param {Pointer<DSBROWSEINFOW>} pInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsbrowseinfoa">DSBROWSEINFO</a> structure that contains data about  initializing the container browser dialog and receives data about the selected object.
     * @returns {Integer} The function returns one of the following values.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-dsbrowseforcontainerw
     * @since windows6.0.6000
     */
    static DsBrowseForContainerW(pInfo) {
        result := DllCall("dsuiext.dll\DsBrowseForContainerW", "ptr", pInfo, "int")
        return result
    }

    /**
     * Displays a dialog box used to browse for container objects in Active Directory Domain Services.
     * @param {Pointer<DSBROWSEINFOA>} pInfo Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dsclient/ns-dsclient-dsbrowseinfoa">DSBROWSEINFO</a> structure that contains data about  initializing the container browser dialog and receives data about the selected object.
     * @returns {Integer} The function returns one of the following values.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-dsbrowseforcontainera
     * @since windows6.0.6000
     */
    static DsBrowseForContainerA(pInfo) {
        result := DllCall("dsuiext.dll\DsBrowseForContainerA", "ptr", pInfo, "int")
        return result
    }

    /**
     * Obtains the icon for a given object class.
     * @param {Integer} dwFlags 
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to retrieve the icon for. Examples of the object class name are "user" and "container".
     * @param {Integer} cxImage Contains the desired width, in pixels, of the icon. This function retrieves the icon that most closely matches this width.
     * @param {Integer} cyImage Contains the desired height, in pixels, of the icon. This function retrieves the icon that most closely matches this height.
     * @returns {HICON} Returns a handle to the icon if successful or <b>NULL</b> otherwise. The caller must destroy this icon when it is no longer required by passing this handle to <a href="/windows/desktop/api/winuser/nf-winuser-destroyicon">DestroyIcon</a>.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-dsgeticon
     * @since windows6.0.6000
     */
    static DsGetIcon(dwFlags, pszObjectClass, cxImage, cyImage) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass

        result := DllCall("dsuiext.dll\DsGetIcon", "uint", dwFlags, "ptr", pszObjectClass, "int", cxImage, "int", cyImage, "ptr")
        return HICON({Value: result}, True)
    }

    /**
     * Retrieves the localized name for an object class.
     * @param {PWSTR} pszObjectClass Pointer to a null-terminated Unicode string that contains the name of the object class to obtain the name of. Examples of the object class name are "user" and "container".
     * @param {PWSTR} pszBuffer Pointer to a wide character buffer that receives the name string. This buffer must be at least <i>cchBuffer</i> wide characters in length.
     * @param {Integer} cchBuffer Contains the size of the <i>pszBuffer</i> buffer, in wide characters, including the terminating <b>NULL</b> character. If the name exceeds this number of characters, the name is truncated.
     * @returns {HRESULT} Returns a standard  <b>HRESULT</b> value, including the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsclient/nf-dsclient-dsgetfriendlyclassname
     * @since windows6.0.6000
     */
    static DsGetFriendlyClassName(pszObjectClass, pszBuffer, cchBuffer) {
        pszObjectClass := pszObjectClass is String ? StrPtr(pszObjectClass) : pszObjectClass
        pszBuffer := pszBuffer is String ? StrPtr(pszBuffer) : pszBuffer

        result := DllCall("dsuiext.dll\DsGetFriendlyClassName", "ptr", pszObjectClass, "ptr", pszBuffer, "uint", cchBuffer, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * The ADsPropCreateNotifyObj function is used to create, or obtain, a notification object for use by an Active Directory Domain Services property sheet extension.
     * @param {IDataObject} pAppThdDataObj A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> object that represents the directory object that the property page applies to. This is the <b>IDataObject</b> passed to the property page <a href="https://docs.microsoft.com/windows/desktop/api/shobjidl_core/nf-shobjidl_core-ishellextinit-initialize">IShellExtInit::Initialize</a> method.
     * @param {PWSTR} pwzADsObjName The Active Directory Domain Services object name obtained by calling the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nf-objidl-idataobject-getdata">IDataObject::GetData</a> method for the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/mmc/cfstr-dsobjectnames-clipboard-format">CFSTR_DSOBJECTNAMES</a> clipboard format on the <a href="https://docs.microsoft.com/windows/desktop/api/objidl/nn-objidl-idataobject">IDataObject</a> represented by <i>pAppThdDataObj</i>.
     * @param {Pointer<HWND>} phNotifyObj Pointer to an <b>HWND</b> value that receives the handle of the notification object.
     * @returns {HRESULT} Returns <b>S_OK</b> if successful, or an OLE-defined error value otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//adsprop/nf-adsprop-adspropcreatenotifyobj
     * @since windows6.0.6000
     */
    static ADsPropCreateNotifyObj(pAppThdDataObj, pwzADsObjName, phNotifyObj) {
        pwzADsObjName := pwzADsObjName is String ? StrPtr(pwzADsObjName) : pwzADsObjName

        result := DllCall("dsprop.dll\ADsPropCreateNotifyObj", "ptr", pAppThdDataObj, "ptr", pwzADsObjName, "ptr", phNotifyObj, "int")
        if(result != 0)
            throw OSError(result)

        return result
    }

    /**
     * Used to obtain directory object data that an Active Directory Domain Services property sheet extension applies to.
     * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
     * @param {Pointer<ADSPROPINITPARAMS>} pInitParams Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/ns-adsprop-adspropinitparams">ADSPROPINITPARAMS</a> structure that receives the directory object data. The <b>dwSize</b> member of this structure must be entered before calling this function.
     * @returns {BOOL} Returns nonzero if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//adsprop/nf-adsprop-adspropgetinitinfo
     * @since windows6.0.6000
     */
    static ADsPropGetInitInfo(hNotifyObj, pInitParams) {
        hNotifyObj := hNotifyObj is Win32Handle ? NumGet(hNotifyObj, "ptr") : hNotifyObj

        result := DllCall("dsprop.dll\ADsPropGetInitInfo", "ptr", hNotifyObj, "ptr", pInitParams, "int")
        return result
    }

    /**
     * Used to notify the notification object of the property page window handle.
     * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
     * @param {HWND} hPage A window handle of the property page.
     * @param {Pointer<Integer>} ptzTitle Pointer to a NULL-terminated string that contains the property page title.
     * @returns {BOOL} Returns zero if the notification object does not exist or nonzero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//adsprop/nf-adsprop-adspropsethwndwithtitle
     * @since windows6.0.6000
     */
    static ADsPropSetHwndWithTitle(hNotifyObj, hPage, ptzTitle) {
        hNotifyObj := hNotifyObj is Win32Handle ? NumGet(hNotifyObj, "ptr") : hNotifyObj
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := DllCall("dsprop.dll\ADsPropSetHwndWithTitle", "ptr", hNotifyObj, "ptr", hPage, "char*", ptzTitle, "int")
        return result
    }

    /**
     * Used to notify the notification object of the property page window handle.
     * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
     * @param {HWND} hPage A window handle of the property page.
     * @returns {BOOL} Returns zero if the notification object does not exist or nonzero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//adsprop/nf-adsprop-adspropsethwnd
     * @since windows6.0.6000
     */
    static ADsPropSetHwnd(hNotifyObj, hPage) {
        hNotifyObj := hNotifyObj is Win32Handle ? NumGet(hNotifyObj, "ptr") : hNotifyObj
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := DllCall("dsprop.dll\ADsPropSetHwnd", "ptr", hNotifyObj, "ptr", hPage, "int")
        return result
    }

    /**
     * The ADsPropCheckIfWritable function determines if an attribute can be written.
     * @param {PWSTR} pwzAttr Pointer to a NULL-terminated <b>WCHAR</b> buffer that contains the name of the attribute.
     * @param {Pointer<ADS_ATTR_INFO>} pWritableAttrs Pointer to the array of <a href="https://docs.microsoft.com/windows/desktop/api/iads/ns-iads-ads_attr_info">ADS_ATTR_INFO</a> structures returned by <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropgetinitinfo">ADsPropGetInitInfo</a>.
     * @returns {BOOL} Returns nonzero if the attribute is found in the writable-attribute list or zero otherwise. Also returns zero if <i>pWritableAttrs</i> is <b>NULL</b>.
     * @see https://docs.microsoft.com/windows/win32/api//adsprop/nf-adsprop-adspropcheckifwritable
     * @since windows6.0.6000
     */
    static ADsPropCheckIfWritable(pwzAttr, pWritableAttrs) {
        pwzAttr := pwzAttr is String ? StrPtr(pwzAttr) : pwzAttr

        result := DllCall("dsprop.dll\ADsPropCheckIfWritable", "ptr", pwzAttr, "ptr", pWritableAttrs, "int")
        return result
    }

    /**
     * The ADsPropSendErrorMessage function adds an error message to a list of error messages displayed by calling the ADsPropShowErrorDialog function.
     * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
     * @param {Pointer<ADSPROPERROR>} pError Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/ns-adsprop-adsproperror">ADSPROPERROR</a> structure which contains data about the error message.
     * @returns {BOOL} Returns nonzero if successful or zero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//adsprop/nf-adsprop-adspropsenderrormessage
     * @since windows6.0.6000
     */
    static ADsPropSendErrorMessage(hNotifyObj, pError) {
        hNotifyObj := hNotifyObj is Win32Handle ? NumGet(hNotifyObj, "ptr") : hNotifyObj

        result := DllCall("dsprop.dll\ADsPropSendErrorMessage", "ptr", hNotifyObj, "ptr", pError, "int")
        return result
    }

    /**
     * The ADsPropShowErrorDialog function displays a dialog box that contains the error messages accumulated through calls to the ADsPropSendErrorMessage function or the WM_ADSPROP_NOTIFY_ERROR.
     * @param {HWND} hNotifyObj The handle of the notification object. To obtain this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/adsprop/nf-adsprop-adspropcreatenotifyobj">ADsPropCreateNotifyObj</a>.
     * @param {HWND} hPage The window handle of the property page.
     * @returns {BOOL} Returns zero if the notification object does not exist or nonzero otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//adsprop/nf-adsprop-adspropshowerrordialog
     * @since windows6.0.6000
     */
    static ADsPropShowErrorDialog(hNotifyObj, hPage) {
        hNotifyObj := hNotifyObj is Win32Handle ? NumGet(hNotifyObj, "ptr") : hNotifyObj
        hPage := hPage is Win32Handle ? NumGet(hPage, "ptr") : hPage

        result := DllCall("dsprop.dll\ADsPropShowErrorDialog", "ptr", hNotifyObj, "ptr", hPage, "int")
        return result
    }

    /**
     * Constructs a service principal name (SPN) that identifies a service instance.
     * @param {PWSTR} ServiceClass Pointer to a constant null-terminated string that specifies the class of the service. This parameter can be any string unique to that service; either the protocol name, for example, ldap, or the string form of a GUID are acceptable.
     * @param {PWSTR} ServiceName Pointer to a constant null-terminated string that specifies the DNS name, NetBIOS name, or distinguished name (DN). This parameter must be non-<b>NULL</b>.
     * 
     * For more information about how the <i>ServiceName</i>, <i>InstanceName</i> and <i>InstancePort</i> parameters are used to compose an SPN, see the following Remarks section.
     * @param {PWSTR} InstanceName Pointer to a constant null-terminated string that specifies the DNS name or IP address of the host for an instance of the service.
     * 
     * If <i>ServiceName</i> specifies the DNS or NetBIOS name of the service host computer, the <i>InstanceName</i> parameter must be <b>NULL</b>.
     * 
     * If <i>ServiceName</i> specifies a DNS domain name, the name of a DNS SRV record, or a distinguished name, such as the DN of a service connection point, the <i>InstanceName</i> parameter must specify the DNS or NetBIOS name of the service host computer.
     * @param {Integer} InstancePort Port number for an instance of the service. Use 0 for the default port. If this parameter is zero, the SPN does not include a port number.
     * @param {PWSTR} Referrer Pointer to a constant null-terminated string that specifies the DNS name of the host that gave an IP address referral. This parameter is ignored unless the <i>ServiceName</i> parameter specifies an IP address.
     * @param {Pointer<Integer>} pcSpnLength Pointer to a variable that contains the length, in characters, of the buffer that will receive the new constructed SPN. This value may be 0 to request the final buffer size in advance.
     * 
     * The <i>pcSpnLength</i> parameter also receives the actual length of the SPN created, including the terminating null character.
     * @param {PWSTR} pszSpn Pointer to a null-terminated string that receives the constructed SPN. This buffer should be the length specified by <i>pcSpnLength</i>. The <i>pszSpn</i> parameter may be <b>NULL</b> to request the final buffer size in advance.
     * @returns {Integer} If the function returns an SPN, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsmakespnw
     * @since windows6.0.6000
     */
    static DsMakeSpnW(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, pcSpnLength, pszSpn) {
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName
        Referrer := Referrer is String ? StrPtr(Referrer) : Referrer
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn

        result := DllCall("DSPARSE.dll\DsMakeSpnW", "ptr", ServiceClass, "ptr", ServiceName, "ptr", InstanceName, "ushort", InstancePort, "ptr", Referrer, "uint*", pcSpnLength, "ptr", pszSpn, "uint")
        return result
    }

    /**
     * Constructs a service principal name (SPN) that identifies a service instance.
     * @param {PSTR} ServiceClass Pointer to a constant null-terminated string that specifies the class of the service. This parameter can be any string unique to that service; either the protocol name, for example, ldap, or the string form of a GUID are acceptable.
     * @param {PSTR} ServiceName Pointer to a constant null-terminated string that specifies the DNS name, NetBIOS name, or distinguished name (DN). This parameter must be non-<b>NULL</b>.
     * 
     * For more information about how the <i>ServiceName</i>, <i>InstanceName</i> and <i>InstancePort</i> parameters are used to compose an SPN, see the following Remarks section.
     * @param {PSTR} InstanceName Pointer to a constant null-terminated string that specifies the DNS name or IP address of the host for an instance of the service.
     * 
     * If <i>ServiceName</i> specifies the DNS or NetBIOS name of the service host computer, the <i>InstanceName</i> parameter must be <b>NULL</b>.
     * 
     * If <i>ServiceName</i> specifies a DNS domain name, the name of a DNS SRV record, or a distinguished name, such as the DN of a service connection point, the <i>InstanceName</i> parameter must specify the DNS or NetBIOS name of the service host computer.
     * @param {Integer} InstancePort Port number for an instance of the service. Use 0 for the default port. If this parameter is zero, the SPN does not include a port number.
     * @param {PSTR} Referrer Pointer to a constant null-terminated string that specifies the DNS name of the host that gave an IP address referral. This parameter is ignored unless the <i>ServiceName</i> parameter specifies an IP address.
     * @param {Pointer<Integer>} pcSpnLength Pointer to a variable that contains the length, in characters, of the buffer that will receive the new constructed SPN. This value may be 0 to request the final buffer size in advance.
     * 
     * The <i>pcSpnLength</i> parameter also receives the actual length of the SPN created, including the terminating null character.
     * @param {PSTR} pszSpn Pointer to a null-terminated string that receives the constructed SPN. This buffer should be the length specified by <i>pcSpnLength</i>. The <i>pszSpn</i> parameter may be <b>NULL</b> to request the final buffer size in advance.
     * @returns {Integer} If the function returns an SPN, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsmakespna
     * @since windows6.0.6000
     */
    static DsMakeSpnA(ServiceClass, ServiceName, InstanceName, InstancePort, Referrer, pcSpnLength, pszSpn) {
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName
        Referrer := Referrer is String ? StrPtr(Referrer) : Referrer
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn

        result := DllCall("DSPARSE.dll\DsMakeSpnA", "ptr", ServiceClass, "ptr", ServiceName, "ptr", InstanceName, "ushort", InstancePort, "ptr", Referrer, "uint*", pcSpnLength, "ptr", pszSpn, "uint")
        return result
    }

    /**
     * Parses a service principal name (SPN) into its component strings.
     * @param {PSTR} pszSpn Pointer to a constant null-terminated string that contains the SPN to parse. The SPN has the following format, in which the &lt;service class&gt; and &lt;instance name&gt; components must be present and the &lt;port number&gt; and &lt;service name&gt; components are optional. The &lt;port number&gt; component must be a numeric string value.
     * 
     * 
     * ```cpp
     * <service class>/<instance name>:<port number>/<service name>
     * ```
     * @param {Pointer<Integer>} pcServiceClass Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>ServiceClass</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>ServiceClass</i> string, including the terminating null character.
     * 
     * If this parameter is <b>NULL</b>, contains zero, or <i>ServiceClass</i> is <b>NULL</b>, this parameter and  <i>ServiceClass</i> are ignored.
     * 
     * To obtain the number of characters required for the <i>ServiceClass</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>ServiceClass</i> and this parameter set to 1.
     * @param {PSTR} ServiceClass Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;service class&gt; component of the SPN. This buffer must be at least <i>*pcServiceClass </i><b>TCHARs</b> in size. This parameter may be  <b>NULL</b> if the service class is not required.
     * @param {Pointer<Integer>} pcServiceName Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>ServiceName</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>ServiceName</i> string, including the terminating null character.
     * 
     * If this parameter is <b>NULL</b>, contains zero, or <i>ServiceName</i> is <b>NULL</b>, this parameter and  <i>ServiceName</i> are ignored.
     * 
     * To obtain the number of characters required for the <i>ServiceName</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>ServiceName</i> and this parameter set to 1.
     * @param {PSTR} ServiceName Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;service name&gt; component of the SPN. This buffer must be at least <i>*pcServiceName </i><b>TCHARs</b> in size. If the &lt;service name&gt; component is not present in the SPN, this buffer  receives the &lt;instance name&gt; component. This parameter may be <b>NULL</b> if the service name is not required.
     * @param {Pointer<Integer>} pcInstanceName Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>InstanceName</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>InstanceName</i> string, including the terminating null character.
     * 
     * If this parameter is <b>NULL</b>, contains zero, or <i>InstanceName</i> is <b>NULL</b>, this parameter and <i>InstanceName</i> are ignored.
     * 
     * To obtain the number of characters required for the <i>InstanceName</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>InstanceName</i> and this parameter set to 1.
     * @param {PSTR} InstanceName Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;instance name&gt; component of the SPN. This buffer must be at least <i>*pcInstanceName </i> <b>TCHARs</b> in size. This parameter may be  <b>NULL</b> if the instance name is not required.
     * @param {Pointer<Integer>} pInstancePort Pointer to a <b>DWORD</b> value that receives the integer value of the &lt;port number&gt; component of the SPN. If the SPN does not contain a &lt;port number&gt; component, this parameter receives zero. This parameter may be  <b>NULL</b> if the port number is not required.
     * @returns {Integer} Returns a Win32 error code, including the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dscrackspna
     * @since windows6.0.6000
     */
    static DsCrackSpnA(pszSpn, pcServiceClass, ServiceClass, pcServiceName, ServiceName, pcInstanceName, InstanceName, pInstancePort) {
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("DSPARSE.dll\DsCrackSpnA", "ptr", pszSpn, "uint*", pcServiceClass, "ptr", ServiceClass, "uint*", pcServiceName, "ptr", ServiceName, "uint*", pcInstanceName, "ptr", InstanceName, "ushort*", pInstancePort, "uint")
        return result
    }

    /**
     * Parses a service principal name (SPN) into its component strings.
     * @param {PWSTR} pszSpn Pointer to a constant null-terminated string that contains the SPN to parse. The SPN has the following format, in which the &lt;service class&gt; and &lt;instance name&gt; components must be present and the &lt;port number&gt; and &lt;service name&gt; components are optional. The &lt;port number&gt; component must be a numeric string value.
     * 
     * 
     * ```cpp
     * <service class>/<instance name>:<port number>/<service name>
     * ```
     * @param {Pointer<Integer>} pcServiceClass Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>ServiceClass</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>ServiceClass</i> string, including the terminating null character.
     * 
     * If this parameter is <b>NULL</b>, contains zero, or <i>ServiceClass</i> is <b>NULL</b>, this parameter and  <i>ServiceClass</i> are ignored.
     * 
     * To obtain the number of characters required for the <i>ServiceClass</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>ServiceClass</i> and this parameter set to 1.
     * @param {PWSTR} ServiceClass Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;service class&gt; component of the SPN. This buffer must be at least <i>*pcServiceClass </i><b>TCHARs</b> in size. This parameter may be  <b>NULL</b> if the service class is not required.
     * @param {Pointer<Integer>} pcServiceName Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>ServiceName</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>ServiceName</i> string, including the terminating null character.
     * 
     * If this parameter is <b>NULL</b>, contains zero, or <i>ServiceName</i> is <b>NULL</b>, this parameter and  <i>ServiceName</i> are ignored.
     * 
     * To obtain the number of characters required for the <i>ServiceName</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>ServiceName</i> and this parameter set to 1.
     * @param {PWSTR} ServiceName Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;service name&gt; component of the SPN. This buffer must be at least <i>*pcServiceName </i><b>TCHARs</b> in size. If the &lt;service name&gt; component is not present in the SPN, this buffer  receives the &lt;instance name&gt; component. This parameter may be <b>NULL</b> if the service name is not required.
     * @param {Pointer<Integer>} pcInstanceName Pointer to a <b>DWORD</b> value that, on entry, contains the size, in <b>TCHARs</b>, of the <i>InstanceName</i> buffer, including the terminating null character. On exit, this parameter contains the number of <b>TCHARs</b> in the <i>InstanceName</i> string, including the terminating null character.
     * 
     * If this parameter is <b>NULL</b>, contains zero, or <i>InstanceName</i> is <b>NULL</b>, this parameter and <i>InstanceName</i> are ignored.
     * 
     * To obtain the number of characters required for the <i>InstanceName</i> string, including the null terminator, call this function with a valid SPN, a non-<b>NULL</b> <i>InstanceName</i> and this parameter set to 1.
     * @param {PWSTR} InstanceName Pointer to a <b>TCHAR</b> buffer that receives a null-terminated string containing the &lt;instance name&gt; component of the SPN. This buffer must be at least <i>*pcInstanceName </i> <b>TCHARs</b> in size. This parameter may be  <b>NULL</b> if the instance name is not required.
     * @param {Pointer<Integer>} pInstancePort Pointer to a <b>DWORD</b> value that receives the integer value of the &lt;port number&gt; component of the SPN. If the SPN does not contain a &lt;port number&gt; component, this parameter receives zero. This parameter may be  <b>NULL</b> if the port number is not required.
     * @returns {Integer} Returns a Win32 error code, including the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dscrackspnw
     * @since windows6.0.6000
     */
    static DsCrackSpnW(pszSpn, pcServiceClass, ServiceClass, pcServiceName, ServiceName, pcInstanceName, InstanceName, pInstancePort) {
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("DSPARSE.dll\DsCrackSpnW", "ptr", pszSpn, "uint*", pcServiceClass, "ptr", ServiceClass, "uint*", pcServiceName, "ptr", ServiceName, "uint*", pcInstanceName, "ptr", InstanceName, "ushort*", pInstancePort, "uint")
        return result
    }

    /**
     * Converts an RDN into a quoted RDN value, if the RDN value contains characters that require quotes.
     * @param {Integer} cUnquotedRdnValueLength The number of characters in the <i>psUnquotedRdnValue</i> string.
     * @param {PWSTR} psUnquotedRdnValue The string that specifies the unquoted RDN value.
     * @param {Pointer<Integer>} pcQuotedRdnValueLength The maximum number of characters in the <i>psQuotedRdnValue</i> string.
     * 
     * The following flags are the output for this parameter.
     * @param {PWSTR} psQuotedRdnValue The string that receives the converted, and perhaps quoted, RDN value.
     * @returns {Integer} The following list contains the possible values  returned for the <b>DsQuoteRdnValue</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsquoterdnvaluew
     * @since windows6.0.6000
     */
    static DsQuoteRdnValueW(cUnquotedRdnValueLength, psUnquotedRdnValue, pcQuotedRdnValueLength, psQuotedRdnValue) {
        psUnquotedRdnValue := psUnquotedRdnValue is String ? StrPtr(psUnquotedRdnValue) : psUnquotedRdnValue
        psQuotedRdnValue := psQuotedRdnValue is String ? StrPtr(psQuotedRdnValue) : psQuotedRdnValue

        result := DllCall("DSPARSE.dll\DsQuoteRdnValueW", "uint", cUnquotedRdnValueLength, "ptr", psUnquotedRdnValue, "uint*", pcQuotedRdnValueLength, "ptr", psQuotedRdnValue, "uint")
        return result
    }

    /**
     * Converts an RDN into a quoted RDN value, if the RDN value contains characters that require quotes.
     * @param {Integer} cUnquotedRdnValueLength The number of characters in the <i>psUnquotedRdnValue</i> string.
     * @param {PSTR} psUnquotedRdnValue The string that specifies the unquoted RDN value.
     * @param {Pointer<Integer>} pcQuotedRdnValueLength The maximum number of characters in the <i>psQuotedRdnValue</i> string.
     * 
     * The following flags are the output for this parameter.
     * @param {PSTR} psQuotedRdnValue The string that receives the converted, and perhaps quoted, RDN value.
     * @returns {Integer} The following list contains the possible values  returned for the <b>DsQuoteRdnValue</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsquoterdnvaluea
     * @since windows6.0.6000
     */
    static DsQuoteRdnValueA(cUnquotedRdnValueLength, psUnquotedRdnValue, pcQuotedRdnValueLength, psQuotedRdnValue) {
        psUnquotedRdnValue := psUnquotedRdnValue is String ? StrPtr(psUnquotedRdnValue) : psUnquotedRdnValue
        psQuotedRdnValue := psQuotedRdnValue is String ? StrPtr(psQuotedRdnValue) : psQuotedRdnValue

        result := DllCall("DSPARSE.dll\DsQuoteRdnValueA", "uint", cUnquotedRdnValueLength, "ptr", psUnquotedRdnValue, "uint*", pcQuotedRdnValueLength, "ptr", psQuotedRdnValue, "uint")
        return result
    }

    /**
     * The DsUnquoteRdnValue function is a client call that converts a quoted RDN value back to an unquoted RDN value.
     * @param {Integer} cQuotedRdnValueLength The number of characters in the <i>psQuotedRdnValue</i> string.
     * @param {PWSTR} psQuotedRdnValue The RDN value that may be quoted and escaped.
     * @param {Pointer<Integer>} pcUnquotedRdnValueLength The input value for this argument is the maximum length, in characters, of <i>psQuotedRdnValue</i>.
     * 
     * The output value for this argument includes the following flags.
     * @param {PWSTR} psUnquotedRdnValue The converted, unquoted RDN value.
     * @returns {Integer} The following list contains the possible values that are returned for the <b>DsUnquoteRdnValue</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsunquoterdnvaluew
     * @since windows6.0.6000
     */
    static DsUnquoteRdnValueW(cQuotedRdnValueLength, psQuotedRdnValue, pcUnquotedRdnValueLength, psUnquotedRdnValue) {
        psQuotedRdnValue := psQuotedRdnValue is String ? StrPtr(psQuotedRdnValue) : psQuotedRdnValue
        psUnquotedRdnValue := psUnquotedRdnValue is String ? StrPtr(psUnquotedRdnValue) : psUnquotedRdnValue

        result := DllCall("DSPARSE.dll\DsUnquoteRdnValueW", "uint", cQuotedRdnValueLength, "ptr", psQuotedRdnValue, "uint*", pcUnquotedRdnValueLength, "ptr", psUnquotedRdnValue, "uint")
        return result
    }

    /**
     * The DsUnquoteRdnValue function is a client call that converts a quoted RDN value back to an unquoted RDN value.
     * @param {Integer} cQuotedRdnValueLength The number of characters in the <i>psQuotedRdnValue</i> string.
     * @param {PSTR} psQuotedRdnValue The RDN value that may be quoted and escaped.
     * @param {Pointer<Integer>} pcUnquotedRdnValueLength The input value for this argument is the maximum length, in characters, of <i>psQuotedRdnValue</i>.
     * 
     * The output value for this argument includes the following flags.
     * @param {PSTR} psUnquotedRdnValue The converted, unquoted RDN value.
     * @returns {Integer} The following list contains the possible values that are returned for the <b>DsUnquoteRdnValue</b> function.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsunquoterdnvaluea
     * @since windows6.0.6000
     */
    static DsUnquoteRdnValueA(cQuotedRdnValueLength, psQuotedRdnValue, pcUnquotedRdnValueLength, psUnquotedRdnValue) {
        psQuotedRdnValue := psQuotedRdnValue is String ? StrPtr(psQuotedRdnValue) : psQuotedRdnValue
        psUnquotedRdnValue := psUnquotedRdnValue is String ? StrPtr(psUnquotedRdnValue) : psUnquotedRdnValue

        result := DllCall("DSPARSE.dll\DsUnquoteRdnValueA", "uint", cQuotedRdnValueLength, "ptr", psQuotedRdnValue, "uint*", pcUnquotedRdnValueLength, "ptr", psUnquotedRdnValue, "uint")
        return result
    }

    /**
     * Retrieves the key and value of the first relative distinguished name and a pointer to the next relative distinguished name from a distinguished name string.
     * @param {Pointer<PWSTR>} ppDN Address of a Unicode string pointer that, on entry, contains the distinguished name string to be parsed. The length of this string is specified in the <i>pcDN</i> parameter. If the function succeeds, this parameter is adjusted to point to the remainder of the distinguished name exclusive of current relative distinguished name. For example, if this parameter points to the string "dc=corp,dc=fabrikam,dc=com", after the function is complete this parameter points to the string ",dc=fabrikam,dc=com".
     * @param {Pointer<Integer>} pcDN Pointer to a <b>DWORD</b> value that, on entry, contains the number of characters in the <i>ppDN</i> string. If the function succeeds, this parameter receives the number of characters in the remainder of the distinguished name. These values do not include the null-terminated character.
     * @param {Pointer<PWSTR>} ppKey Pointer to a <b>LPCWCH</b> value that, if the function succeeds, receives a pointer to the key in the relative distinguished name string. This pointer is within the <i>ppDN</i> string and is not null-terminated. The <i>pcKey</i> parameter receives the number of characters in the key. This parameter is undefined if <i>pcKey</i> receives zero.
     * @param {Pointer<Integer>} pcKey Pointer to a <b>DWORD</b> value that, if the function succeeds, receives the number of characters in the key string represented by the <i>ppKey</i> parameter. If this parameter receives zero, <i>ppKey</i> is undefined.
     * @param {Pointer<PWSTR>} ppVal Pointer to a <b>LPCWCH</b> value that, if the function is successful, receives a pointer to the value in the relative distinguished name string. This pointer is within the <i>ppDN</i> string and is not null-terminated. The <i>pcVal</i> parameter receives the number of characters in the value. This parameter is undefined if <i>pcVal</i> receives zero.
     * @param {Pointer<Integer>} pcVal Pointer to a <b>DWORD</b> value that, if the function succeeds, receives the number of characters in the value string represented by the <i>ppVal</i> parameter. If this parameter receives zero, <i>ppVal</i> is undefined.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error code otherwise. Possible error codes include the following values.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsgetrdnw
     * @since windows6.0.6000
     */
    static DsGetRdnW(ppDN, pcDN, ppKey, pcKey, ppVal, pcVal) {
        result := DllCall("DSPARSE.dll\DsGetRdnW", "ptr", ppDN, "uint*", pcDN, "ptr", ppKey, "uint*", pcKey, "ptr", ppVal, "uint*", pcVal, "uint")
        return result
    }

    /**
     * The DsCrackUnquotedMangledRdn function unmangles (unencodes) a given relative distinguished name and returns both the decoded GUID and the mangling type used.
     * @param {PWSTR} pszRDN Pointer to a string that contains the relative distinguished name (RDN) to translate. This string length is specified by the <i>cchRDN</i> parameter, so this string is not required to be null-terminated. This string must be in unquoted form. For more information about unquoted relative distinguished names, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/nf-dsparse-dsunquoterdnvaluea">DsUnquoteRdnValue</a>.
     * @param {Integer} cchRDN Contains the length, in characters, of the <i>pszRDN</i> string.
     * @param {Pointer<Guid>} pGuid Pointer to <b>GUID</b> value that receives the GUID of the unmangled relative distinguished name.  This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} peDsMangleFor Pointer 
     * to a <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> value that receives the type of mangling used in the mangled relative distinguished name.  This parameter can be <b>NULL</b>.
     * @returns {BOOL} This function returns <b>TRUE</b> if the relative distinguished name is mangled or <b>FALSE</b> otherwise. If this function returns <b>FALSE</b>, neither <i>pGuid</i> or <i>peDsMangleFor</i> receive any data.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dscrackunquotedmangledrdnw
     * @since windows6.0.6000
     */
    static DsCrackUnquotedMangledRdnW(pszRDN, cchRDN, pGuid, peDsMangleFor) {
        pszRDN := pszRDN is String ? StrPtr(pszRDN) : pszRDN

        result := DllCall("DSPARSE.dll\DsCrackUnquotedMangledRdnW", "ptr", pszRDN, "uint", cchRDN, "ptr", pGuid, "int*", peDsMangleFor, "int")
        return result
    }

    /**
     * The DsCrackUnquotedMangledRdn function unmangles (unencodes) a given relative distinguished name and returns both the decoded GUID and the mangling type used.
     * @param {PSTR} pszRDN Pointer to a string that contains the relative distinguished name (RDN) to translate. This string length is specified by the <i>cchRDN</i> parameter, so this string is not required to be null-terminated. This string must be in unquoted form. For more information about unquoted relative distinguished names, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/nf-dsparse-dsunquoterdnvaluea">DsUnquoteRdnValue</a>.
     * @param {Integer} cchRDN Contains the length, in characters, of the <i>pszRDN</i> string.
     * @param {Pointer<Guid>} pGuid Pointer to <b>GUID</b> value that receives the GUID of the unmangled relative distinguished name.  This parameter can be <b>NULL</b>.
     * @param {Pointer<Integer>} peDsMangleFor Pointer 
     * to a <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> value that receives the type of mangling used in the mangled relative distinguished name.  This parameter can be <b>NULL</b>.
     * @returns {BOOL} This function returns <b>TRUE</b> if the relative distinguished name is mangled or <b>FALSE</b> otherwise. If this function returns <b>FALSE</b>, neither <i>pGuid</i> or <i>peDsMangleFor</i> receive any data.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dscrackunquotedmangledrdna
     * @since windows6.0.6000
     */
    static DsCrackUnquotedMangledRdnA(pszRDN, cchRDN, pGuid, peDsMangleFor) {
        pszRDN := pszRDN is String ? StrPtr(pszRDN) : pszRDN

        result := DllCall("DSPARSE.dll\DsCrackUnquotedMangledRdnA", "ptr", pszRDN, "uint", cchRDN, "ptr", pGuid, "int*", peDsMangleFor, "int")
        return result
    }

    /**
     * Determines if a given relative distinguished name value is a mangled name of the given type.
     * @param {PWSTR} pszRdn Pointer to a null-terminated string that contains  the relative distinguished name  to determine if it is mangled. The <i>cRdn</i> parameter contains the number of characters in this string.
     * @param {Integer} cRdn Contains the number of characters in the <i>pszRdn</i> string.
     * @param {Integer} eDsMangleForDesired Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> values that specifies the type of name mangling to search for.
     * @returns {BOOL} Returns <b>TRUE</b> if the  relative distinguished name is mangled and the mangle type is the same as specified. Returns <b>FALSE</b> if the relative distinguished name is not mangled or the  mangle type is different than specified.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsismangledrdnvaluew
     * @since windows6.0.6000
     */
    static DsIsMangledRdnValueW(pszRdn, cRdn, eDsMangleForDesired) {
        pszRdn := pszRdn is String ? StrPtr(pszRdn) : pszRdn

        result := DllCall("DSPARSE.dll\DsIsMangledRdnValueW", "ptr", pszRdn, "uint", cRdn, "int", eDsMangleForDesired, "int")
        return result
    }

    /**
     * Determines if a given relative distinguished name value is a mangled name of the given type.
     * @param {PSTR} pszRdn Pointer to a null-terminated string that contains  the relative distinguished name  to determine if it is mangled. The <i>cRdn</i> parameter contains the number of characters in this string.
     * @param {Integer} cRdn Contains the number of characters in the <i>pszRdn</i> string.
     * @param {Integer} eDsMangleForDesired Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> values that specifies the type of name mangling to search for.
     * @returns {BOOL} Returns <b>TRUE</b> if the  relative distinguished name is mangled and the mangle type is the same as specified. Returns <b>FALSE</b> if the relative distinguished name is not mangled or the  mangle type is different than specified.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsismangledrdnvaluea
     * @since windows6.0.6000
     */
    static DsIsMangledRdnValueA(pszRdn, cRdn, eDsMangleForDesired) {
        pszRdn := pszRdn is String ? StrPtr(pszRdn) : pszRdn

        result := DllCall("DSPARSE.dll\DsIsMangledRdnValueA", "ptr", pszRdn, "uint", cRdn, "int", eDsMangleForDesired, "int")
        return result
    }

    /**
     * The DsIsMangledDn function determines if the first relative distinguished name (RDN) in a distinguished name (DN) is a mangled name of a given type.
     * @param {PSTR} pszDn Pointer to a null-terminated string that contains the  distinguished name to retrieve the relative distinguished name from. This can also be a quoted distinguished name  as returned by other directory service functions.
     * @param {Integer} eDsMangleFor Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> values that specifies the type of name mangling to look for.
     * @returns {BOOL} Returns <b>TRUE</b> if the first relative distinguished name in <i>pszDn</i> is mangled in the manner specified by <i>eDsMangleFor</i> or <b>FALSE</b>  otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsismangleddna
     * @since windows6.0.6000
     */
    static DsIsMangledDnA(pszDn, eDsMangleFor) {
        pszDn := pszDn is String ? StrPtr(pszDn) : pszDn

        result := DllCall("DSPARSE.dll\DsIsMangledDnA", "ptr", pszDn, "int", eDsMangleFor, "int")
        return result
    }

    /**
     * The DsIsMangledDn function determines if the first relative distinguished name (RDN) in a distinguished name (DN) is a mangled name of a given type.
     * @param {PWSTR} pszDn Pointer to a null-terminated string that contains the  distinguished name to retrieve the relative distinguished name from. This can also be a quoted distinguished name  as returned by other directory service functions.
     * @param {Integer} eDsMangleFor Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsparse/ne-dsparse-ds_mangle_for">DS_MANGLE_FOR</a> values that specifies the type of name mangling to look for.
     * @returns {BOOL} Returns <b>TRUE</b> if the first relative distinguished name in <i>pszDn</i> is mangled in the manner specified by <i>eDsMangleFor</i> or <b>FALSE</b>  otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//dsparse/nf-dsparse-dsismangleddnw
     * @since windows6.0.6000
     */
    static DsIsMangledDnW(pszDn, eDsMangleFor) {
        pszDn := pszDn is String ? StrPtr(pszDn) : pszDn

        result := DllCall("DSPARSE.dll\DsIsMangledDnW", "ptr", pszDn, "int", eDsMangleFor, "int")
        return result
    }

    /**
     * 
     * @param {PSTR} pszSpn 
     * @param {Integer} cSpn 
     * @param {Pointer<Integer>} pcServiceClass 
     * @param {PSTR} ServiceClass 
     * @param {Pointer<Integer>} pcServiceName 
     * @param {PSTR} ServiceName 
     * @param {Pointer<Integer>} pcInstanceName 
     * @param {PSTR} InstanceName 
     * @param {Pointer<Integer>} pInstancePort 
     * @returns {Integer} 
     */
    static DsCrackSpn2A(pszSpn, cSpn, pcServiceClass, ServiceClass, pcServiceName, ServiceName, pcInstanceName, InstanceName, pInstancePort) {
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("DSPARSE.dll\DsCrackSpn2A", "ptr", pszSpn, "uint", cSpn, "uint*", pcServiceClass, "ptr", ServiceClass, "uint*", pcServiceName, "ptr", ServiceName, "uint*", pcInstanceName, "ptr", InstanceName, "ushort*", pInstancePort, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSpn 
     * @param {Integer} cSpn 
     * @param {Pointer<Integer>} pcServiceClass 
     * @param {PWSTR} ServiceClass 
     * @param {Pointer<Integer>} pcServiceName 
     * @param {PWSTR} ServiceName 
     * @param {Pointer<Integer>} pcInstanceName 
     * @param {PWSTR} InstanceName 
     * @param {Pointer<Integer>} pInstancePort 
     * @returns {Integer} 
     */
    static DsCrackSpn2W(pszSpn, cSpn, pcServiceClass, ServiceClass, pcServiceName, ServiceName, pcInstanceName, InstanceName, pInstancePort) {
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName

        result := DllCall("DSPARSE.dll\DsCrackSpn2W", "ptr", pszSpn, "uint", cSpn, "uint*", pcServiceClass, "ptr", ServiceClass, "uint*", pcServiceName, "ptr", ServiceName, "uint*", pcInstanceName, "ptr", InstanceName, "ushort*", pInstancePort, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSpn 
     * @param {Integer} cSpn 
     * @param {Pointer<Integer>} pcHostName 
     * @param {PWSTR} HostName 
     * @param {Pointer<Integer>} pcInstanceName 
     * @param {PWSTR} InstanceName 
     * @param {Pointer<Integer>} pPortNumber 
     * @param {Pointer<Integer>} pcDomainName 
     * @param {PWSTR} DomainName 
     * @param {Pointer<Integer>} pcRealmName 
     * @param {PWSTR} RealmName 
     * @returns {Integer} 
     */
    static DsCrackSpn3W(pszSpn, cSpn, pcHostName, HostName, pcInstanceName, InstanceName, pPortNumber, pcDomainName, DomainName, pcRealmName, RealmName) {
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
        HostName := HostName is String ? StrPtr(HostName) : HostName
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        RealmName := RealmName is String ? StrPtr(RealmName) : RealmName

        result := DllCall("DSPARSE.dll\DsCrackSpn3W", "ptr", pszSpn, "uint", cSpn, "uint*", pcHostName, "ptr", HostName, "uint*", pcInstanceName, "ptr", InstanceName, "ushort*", pPortNumber, "uint*", pcDomainName, "ptr", DomainName, "uint*", pcRealmName, "ptr", RealmName, "uint")
        return result
    }

    /**
     * 
     * @param {PWSTR} pszSpn 
     * @param {Integer} cSpn 
     * @param {Pointer<Integer>} pcHostName 
     * @param {PWSTR} HostName 
     * @param {Pointer<Integer>} pcInstanceName 
     * @param {PWSTR} InstanceName 
     * @param {Pointer<Integer>} pcPortName 
     * @param {PWSTR} PortName 
     * @param {Pointer<Integer>} pcDomainName 
     * @param {PWSTR} DomainName 
     * @param {Pointer<Integer>} pcRealmName 
     * @param {PWSTR} RealmName 
     * @returns {Integer} 
     */
    static DsCrackSpn4W(pszSpn, cSpn, pcHostName, HostName, pcInstanceName, InstanceName, pcPortName, PortName, pcDomainName, DomainName, pcRealmName, RealmName) {
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn
        HostName := HostName is String ? StrPtr(HostName) : HostName
        InstanceName := InstanceName is String ? StrPtr(InstanceName) : InstanceName
        PortName := PortName is String ? StrPtr(PortName) : PortName
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        RealmName := RealmName is String ? StrPtr(RealmName) : RealmName

        result := DllCall("DSPARSE.dll\DsCrackSpn4W", "ptr", pszSpn, "uint", cSpn, "uint*", pcHostName, "ptr", HostName, "uint*", pcInstanceName, "ptr", InstanceName, "uint*", pcPortName, "ptr", PortName, "uint*", pcDomainName, "ptr", DomainName, "uint*", pcRealmName, "ptr", RealmName, "uint")
        return result
    }

    /**
     * Binds to a domain controller.
     * @param {PWSTR} DomainControllerName Pointer to a null-terminated string that contains the name of the domain controller to bind to. This name can be the name of the domain controller or the fully qualified DNS name of the domain controller. Either name type can, optionally, be preceded by two backslash characters. All of the following examples represent correctly formatted domain controller names:
     * 
     * <ul>
     * <li>"FAB-DC-01"</li>
     * <li>"\\FAB-DC-01"</li>
     * <li>"FAB-DC-01.fabrikam.com"</li>
     * <li>"\\FAB-DC-01.fabrikam.com"</li>
     * </ul>
     * This parameter can be <b>NULL</b>. For more information, see Remarks.
     * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. This parameter can be <b>NULL</b>. For more  information, see Remarks.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindw
     * @since windows6.0.6000
     */
    static DsBindW(DomainControllerName, DnsDomainName, phDS) {
        DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName

        result := DllCall("NTDSAPI.dll\DsBindW", "ptr", DomainControllerName, "ptr", DnsDomainName, "ptr", phDS, "uint")
        return result
    }

    /**
     * Binds to a domain controller.
     * @param {PSTR} DomainControllerName Pointer to a null-terminated string that contains the name of the domain controller to bind to. This name can be the name of the domain controller or the fully qualified DNS name of the domain controller. Either name type can, optionally, be preceded by two backslash characters. All of the following examples represent correctly formatted domain controller names:
     * 
     * <ul>
     * <li>"FAB-DC-01"</li>
     * <li>"\\FAB-DC-01"</li>
     * <li>"FAB-DC-01.fabrikam.com"</li>
     * <li>"\\FAB-DC-01.fabrikam.com"</li>
     * </ul>
     * This parameter can be <b>NULL</b>. For more information, see Remarks.
     * @param {PSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. This parameter can be <b>NULL</b>. For more  information, see Remarks.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbinda
     * @since windows6.0.6000
     */
    static DsBindA(DomainControllerName, DnsDomainName, phDS) {
        DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName

        result := DllCall("NTDSAPI.dll\DsBindA", "ptr", DomainControllerName, "ptr", DnsDomainName, "ptr", phDS, "uint")
        return result
    }

    /**
     * Binds to a domain controller using the specified credentials.
     * @param {PWSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information about this parameter, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information about this parameter, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * 
     * This parameter is required to secure a Kerberos authentication.
     * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
     *     
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>function is used to obtain this value. If this parameter is <b>NULL</b>,
     *     the credentials of the calling thread are used.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindwithcredw
     * @since windows6.0.6000
     */
    static DsBindWithCredW(DomainControllerName, DnsDomainName, AuthIdentity, phDS) {
        DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName

        result := DllCall("NTDSAPI.dll\DsBindWithCredW", "ptr", DomainControllerName, "ptr", DnsDomainName, "ptr", AuthIdentity, "ptr", phDS, "uint")
        return result
    }

    /**
     * Binds to a domain controller using the specified credentials.
     * @param {PSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information about this parameter, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {PSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information about this parameter, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * 
     * This parameter is required to secure a Kerberos authentication.
     * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
     *     
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>function is used to obtain this value. If this parameter is <b>NULL</b>,
     *     the credentials of the calling thread are used.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindwithcreda
     * @since windows6.0.6000
     */
    static DsBindWithCredA(DomainControllerName, DnsDomainName, AuthIdentity, phDS) {
        DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName

        result := DllCall("NTDSAPI.dll\DsBindWithCredA", "ptr", DomainControllerName, "ptr", DnsDomainName, "ptr", AuthIdentity, "ptr", phDS, "uint")
        return result
    }

    /**
     * Binds to a domain controller using the specified credentials and a specific service principal name (SPN) for mutual authentication.
     * @param {PWSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
     *     
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>function is used to obtain this value. If this parameter is <b>NULL</b>,
     *     the credentials of the calling thread are used.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
     * @param {PWSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindwithspnw
     * @since windows6.0.6000
     */
    static DsBindWithSpnW(DomainControllerName, DnsDomainName, AuthIdentity, ServicePrincipalName, phDS) {
        DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
        ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

        result := DllCall("NTDSAPI.dll\DsBindWithSpnW", "ptr", DomainControllerName, "ptr", DnsDomainName, "ptr", AuthIdentity, "ptr", ServicePrincipalName, "ptr", phDS, "uint")
        return result
    }

    /**
     * Binds to a domain controller using the specified credentials and a specific service principal name (SPN) for mutual authentication.
     * @param {PSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {PSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind to. For more information, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
     *     
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>function is used to obtain this value. If this parameter is <b>NULL</b>,
     *     the credentials of the calling thread are used.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
     * @param {PSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following are the most common error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindwithspna
     * @since windows6.0.6000
     */
    static DsBindWithSpnA(DomainControllerName, DnsDomainName, AuthIdentity, ServicePrincipalName, phDS) {
        DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
        ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

        result := DllCall("NTDSAPI.dll\DsBindWithSpnA", "ptr", DomainControllerName, "ptr", DnsDomainName, "ptr", AuthIdentity, "ptr", ServicePrincipalName, "ptr", phDS, "uint")
        return result
    }

    /**
     * Binds to a domain controller using the specified credentials and a specific service principal name (SPN) for mutual authentication.
     * @param {PWSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
     *     
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>function is used to obtain this value. If this parameter is <b>NULL</b>,
     *     the credentials of the calling thread are used.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
     * @param {PWSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
     * @param {Integer} BindFlags Contains a set of flags that define the behavior of this function. This parameter can contain zero or a combination of the values listed in the following list.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following list lists common error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindwithspnexw
     * @since windows6.0.6000
     */
    static DsBindWithSpnExW(DomainControllerName, DnsDomainName, AuthIdentity, ServicePrincipalName, BindFlags, phDS) {
        DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
        ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

        result := DllCall("NTDSAPI.dll\DsBindWithSpnExW", "ptr", DomainControllerName, "ptr", DnsDomainName, "ptr", AuthIdentity, "ptr", ServicePrincipalName, "uint", BindFlags, "ptr", phDS, "uint")
        return result
    }

    /**
     * Binds to a domain controller using the specified credentials and a specific service principal name (SPN) for mutual authentication.
     * @param {PSTR} DomainControllerName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information, see the <i>DomainControllerName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {PSTR} DnsDomainName Pointer to a null-terminated string that contains the fully qualified DNS name of the domain to bind. For more information, see the <i>DnsDomainName</i> description in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a> topic.
     * @param {Pointer<Void>} AuthIdentity Contains an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that represents the credentials to be used for the bind. The 
     *     
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>function is used to obtain this value. If this parameter is <b>NULL</b>,
     *     the credentials of the calling thread are used.
     * 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> must be called before freeing this handle with the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function.
     * @param {PSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
     * @param {Integer} BindFlags Contains a set of flags that define the behavior of this function. This parameter can contain zero or a combination of the values listed in the following list.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the binding handle. To close this handle, pass it to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a> function.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Windows or RPC error code otherwise. The following list lists common error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindwithspnexa
     * @since windows6.0.6000
     */
    static DsBindWithSpnExA(DomainControllerName, DnsDomainName, AuthIdentity, ServicePrincipalName, BindFlags, phDS) {
        DomainControllerName := DomainControllerName is String ? StrPtr(DomainControllerName) : DomainControllerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
        ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

        result := DllCall("NTDSAPI.dll\DsBindWithSpnExA", "ptr", DomainControllerName, "ptr", DnsDomainName, "ptr", AuthIdentity, "ptr", ServicePrincipalName, "uint", BindFlags, "ptr", phDS, "uint")
        return result
    }

    /**
     * Explicitly binds to any AD LDS or Active Directory instance.
     * @param {PWSTR} ServerName Pointer to a null-terminated string that specifies the name of the instance. This parameter is required to 
     *       bind to an AD LDS instance. If this parameter is <b>NULL</b> when binding to an Active 
     *       Directory instance, then the <i>DnsDomainName</i> parameter must contain a value. If this 
     *       parameter and the <i>DnsDomainName</i> parameter are both <b>NULL</b>, the 
     *       function fails with the return value <b>ERROR_INVALID_PARAMETER</b> (87).
     * @param {PWSTR} Annotation Pointer to a null-terminated string that specifies the port number of the AD LDS instance or 
     *        <b>NULL</b> when binding to an Active Directory instance. For example, 
     *        "389".
     * 
     * If this parameter is <b>NULL</b> when binding by domain to an Active Directory instance, 
     *        then the <i>DnsDomainName</i> parameter must be specified. If this parameter is 
     *        <b>NULL</b> when binding to an AD LDS instance, then the 
     *        <i>InstanceGuid</i> parameter must be specified.
     * @param {Pointer<Guid>} InstanceGuid Pointer to a <b>GUID</b> value that contains the <b>GUID</b> of the AD LDS instance. The <b>GUID</b> value is the 
     *       <b>objectGUID</b> property of the <b>nTDSDSA</b> object of the 
     *       instance. If this parameter is <b>NULL</b> when binding to an AD LDS instance, the 
     *       <i>Annotation</i> parameter must be specified.
     * @param {PWSTR} DnsDomainName Pointer to a null-terminated string that specifies the DNS name of the domain when binding to an Active 
     *       Directory instance by domain. Set this parameter to <b>NULL</b> to bind to an Active 
     *       Directory instance by server or to an AD LDS instance.
     * @param {Pointer<Void>} AuthIdentity Handle to the credentials used to start the RPC session. Use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function to create 
     *       a structure suitable for <i>AuthIdentity</i>.
     * @param {PWSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. 
     *       Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call 
     *       to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
     * @param {Integer} BindFlags Contains a set of flags that define the behavior of this function. This parameter can contain zero or a
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the bind handle. To close this handle, 
     *       call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a>.
     * @returns {Integer} Returns <b>NO_ERROR</b> if successful or an RPC or Win32 error otherwise. Possible error codes include those 
     *       listed in the  following list.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindbyinstancew
     * @since windows6.0.6000
     */
    static DsBindByInstanceW(ServerName, Annotation, InstanceGuid, DnsDomainName, AuthIdentity, ServicePrincipalName, BindFlags, phDS) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        Annotation := Annotation is String ? StrPtr(Annotation) : Annotation
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
        ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

        result := DllCall("NTDSAPI.dll\DsBindByInstanceW", "ptr", ServerName, "ptr", Annotation, "ptr", InstanceGuid, "ptr", DnsDomainName, "ptr", AuthIdentity, "ptr", ServicePrincipalName, "uint", BindFlags, "ptr", phDS, "uint")
        return result
    }

    /**
     * Explicitly binds to any AD LDS or Active Directory instance.
     * @param {PSTR} ServerName Pointer to a null-terminated string that specifies the name of the instance. This parameter is required to 
     *       bind to an AD LDS instance. If this parameter is <b>NULL</b> when binding to an Active 
     *       Directory instance, then the <i>DnsDomainName</i> parameter must contain a value. If this 
     *       parameter and the <i>DnsDomainName</i> parameter are both <b>NULL</b>, the 
     *       function fails with the return value <b>ERROR_INVALID_PARAMETER</b> (87).
     * @param {PSTR} Annotation Pointer to a null-terminated string that specifies the port number of the AD LDS instance or 
     *        <b>NULL</b> when binding to an Active Directory instance. For example, 
     *        "389".
     * 
     * If this parameter is <b>NULL</b> when binding by domain to an Active Directory instance, 
     *        then the <i>DnsDomainName</i> parameter must be specified. If this parameter is 
     *        <b>NULL</b> when binding to an AD LDS instance, then the 
     *        <i>InstanceGuid</i> parameter must be specified.
     * @param {Pointer<Guid>} InstanceGuid Pointer to a <b>GUID</b> value that contains the <b>GUID</b> of the AD LDS instance. The <b>GUID</b> value is the 
     *       <b>objectGUID</b> property of the <b>nTDSDSA</b> object of the 
     *       instance. If this parameter is <b>NULL</b> when binding to an AD LDS instance, the 
     *       <i>Annotation</i> parameter must be specified.
     * @param {PSTR} DnsDomainName Pointer to a null-terminated string that specifies the DNS name of the domain when binding to an Active 
     *       Directory instance by domain. Set this parameter to <b>NULL</b> to bind to an Active 
     *       Directory instance by server or to an AD LDS instance.
     * @param {Pointer<Void>} AuthIdentity Handle to the credentials used to start the RPC session. Use the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a> function to create 
     *       a structure suitable for <i>AuthIdentity</i>.
     * @param {PSTR} ServicePrincipalName Pointer to a null-terminated string that specifies the Service Principal Name to assign to the client. 
     *       Passing <b>NULL</b> in <i>ServicePrincipalName</i> is equivalent to a call 
     *       to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a> function.
     * @param {Integer} BindFlags Contains a set of flags that define the behavior of this function. This parameter can contain zero or a
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the bind handle. To close this handle, 
     *       call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a>.
     * @returns {Integer} Returns <b>NO_ERROR</b> if successful or an RPC or Win32 error otherwise. Possible error codes include those 
     *       listed in the  following list.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindbyinstancea
     * @since windows6.0.6000
     */
    static DsBindByInstanceA(ServerName, Annotation, InstanceGuid, DnsDomainName, AuthIdentity, ServicePrincipalName, BindFlags, phDS) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        Annotation := Annotation is String ? StrPtr(Annotation) : Annotation
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
        ServicePrincipalName := ServicePrincipalName is String ? StrPtr(ServicePrincipalName) : ServicePrincipalName

        result := DllCall("NTDSAPI.dll\DsBindByInstanceA", "ptr", ServerName, "ptr", Annotation, "ptr", InstanceGuid, "ptr", DnsDomainName, "ptr", AuthIdentity, "ptr", ServicePrincipalName, "uint", BindFlags, "ptr", phDS, "uint")
        return result
    }

    /**
     * Binds to the computer that holds the Inter-Site Topology Generator (ISTG) role in the domain of the local computer.
     * @param {PWSTR} SiteName Pointer to a null-terminated string that contains the site name used when binding. If this parameter is <b>NULL</b>, the site of the nearest domain controller is used.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the bind handle. To close this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise.
     *        The following are possible error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindtoistgw
     * @since windows6.0.6000
     */
    static DsBindToISTGW(SiteName, phDS) {
        SiteName := SiteName is String ? StrPtr(SiteName) : SiteName

        result := DllCall("NTDSAPI.dll\DsBindToISTGW", "ptr", SiteName, "ptr", phDS, "uint")
        return result
    }

    /**
     * Binds to the computer that holds the Inter-Site Topology Generator (ISTG) role in the domain of the local computer.
     * @param {PSTR} SiteName Pointer to a null-terminated string that contains the site name used when binding. If this parameter is <b>NULL</b>, the site of the nearest domain controller is used.
     * @param {Pointer<HANDLE>} phDS Address of a <b>HANDLE</b> value that receives the bind handle. To close this handle, call <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsunbinda">DsUnBind</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise.
     *        The following are possible error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindtoistga
     * @since windows6.0.6000
     */
    static DsBindToISTGA(SiteName, phDS) {
        SiteName := SiteName is String ? StrPtr(SiteName) : SiteName

        result := DllCall("NTDSAPI.dll\DsBindToISTGA", "ptr", SiteName, "ptr", phDS, "uint")
        return result
    }

    /**
     * The DsBindingSetTimeout function sets the timeout value that is honored by all RPC calls that use the specified binding handle. RPC calls that required more time than the timeout value are canceled.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Integer} cTimeoutSecs Contains the new timeout value, in seconds.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise. The following is a  possible error code.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsbindingsettimeout
     * @since windows6.0.6000
     */
    static DsBindingSetTimeout(hDS, cTimeoutSecs) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS

        result := DllCall("NTDSAPI.dll\DsBindingSetTimeout", "ptr", hDS, "uint", cTimeoutSecs, "uint")
        return result
    }

    /**
     * The DsUnBind function finds an RPC session with a domain controller and unbinds a handle to the directory service (DS).
     * @param {Pointer<HANDLE>} phDS Pointer to a bind handle to the directory service. This handle is provided by a call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a>.
     * @returns {Integer} <b>NO_ERROR</b>
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsunbindw
     * @since windows6.0.6000
     */
    static DsUnBindW(phDS) {
        result := DllCall("NTDSAPI.dll\DsUnBindW", "ptr", phDS, "uint")
        return result
    }

    /**
     * The DsUnBind function finds an RPC session with a domain controller and unbinds a handle to the directory service (DS).
     * @param {Pointer<HANDLE>} phDS Pointer to a bind handle to the directory service. This handle is provided by a call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DsBind</a>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a>.
     * @returns {Integer} <b>NO_ERROR</b>
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsunbinda
     * @since windows6.0.6000
     */
    static DsUnBindA(phDS) {
        result := DllCall("NTDSAPI.dll\DsUnBindA", "ptr", phDS, "uint")
        return result
    }

    /**
     * Constructs a credential handle suitable for use with the DsBindWithCred function.
     * @param {PWSTR} User Pointer to a null-terminated string that contains the user name to use for the credentials.
     * @param {PWSTR} Domain Pointer to a null-terminated string that contains the domain that the user is a member of.
     * @param {PWSTR} Password Pointer to a null-terminated string that contains the password to use for the credentials.
     * @param {Pointer<Pointer<Void>>} pAuthIdentity Pointer to an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that receives the credential handle. This handle is used in a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>.   This handle must be freed with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function when it is no longer required.
     * @returns {Integer} Returns a Windows error code, including the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsw
     * @since windows6.0.6000
     */
    static DsMakePasswordCredentialsW(User, Domain, Password, pAuthIdentity) {
        User := User is String ? StrPtr(User) : User
        Domain := Domain is String ? StrPtr(Domain) : Domain
        Password := Password is String ? StrPtr(Password) : Password

        result := DllCall("NTDSAPI.dll\DsMakePasswordCredentialsW", "ptr", User, "ptr", Domain, "ptr", Password, "ptr*", pAuthIdentity, "uint")
        return result
    }

    /**
     * Constructs a credential handle suitable for use with the DsBindWithCred function.
     * @param {PSTR} User Pointer to a null-terminated string that contains the user name to use for the credentials.
     * @param {PSTR} Domain Pointer to a null-terminated string that contains the domain that the user is a member of.
     * @param {PSTR} Password Pointer to a null-terminated string that contains the password to use for the credentials.
     * @param {Pointer<Pointer<Void>>} pAuthIdentity Pointer to an <a href="https://docs.microsoft.com/windows/desktop/Rpc/rpc-auth-identity-handle">RPC_AUTH_IDENTITY_HANDLE</a> value that receives the credential handle. This handle is used in a subsequent call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DsBindWithCred</a>.   This handle must be freed with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreepasswordcredentials">DsFreePasswordCredentials</a> function when it is no longer required.
     * @returns {Integer} Returns a Windows error code, including the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa
     * @since windows6.0.6000
     */
    static DsMakePasswordCredentialsA(User, Domain, Password, pAuthIdentity) {
        User := User is String ? StrPtr(User) : User
        Domain := Domain is String ? StrPtr(Domain) : Domain
        Password := Password is String ? StrPtr(Password) : Password

        result := DllCall("NTDSAPI.dll\DsMakePasswordCredentialsA", "ptr", User, "ptr", Domain, "ptr", Password, "ptr*", pAuthIdentity, "uint")
        return result
    }

    /**
     * Frees memory allocated for a credentials structure by the DsMakePasswordCredentials function.
     * @param {Pointer<Void>} AuthIdentity Handle of the credential structure to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsfreepasswordcredentials
     * @since windows6.0.6000
     */
    static DsFreePasswordCredentials(AuthIdentity) {
        DllCall("NTDSAPI.dll\DsFreePasswordCredentials", "ptr", AuthIdentity)
    }

    /**
     * Converts an array of directory service object names from one format to another.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function. If <i>flags</i> contains
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_flags">DS_NAME_FLAG_SYNTACTICAL_ONLY</a>, <i>hDS</i> can be
     *     <b>NULL</b>.
     * @param {Integer} flags Contains one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_flags">DS_NAME_FLAGS</a> values used to determine how the name syntax will be cracked.
     * @param {Integer} formatOffered Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_NAME_FORMAT</a> values that identifies the format of the input names.
     * 
     * The <b>DS_LIST_NCS</b> value can also be passed for this parameter. This causes <b>DsCrackNames</b> to return the distinguished names of all naming contexts in the current forest. The <i>formatDesired</i> parameter is ignored. <i>cNames</i> must be at least one and all strings in <i>rpNames</i> must have a length greater than zero characters. The contents of the <i>rpNames</i> strings is ignored.
     * 
     * <div class="alert"><b>Note</b>  <b>DS_LIST_NCS</b> is not defined in a published header file. To use this value, define it in the exact format shown below.</div>
     * <div> </div>
     * 
     * ```cpp
     * @param {Integer} formatDesired Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_NAME_FORMAT</a> values that identifies the format of the output names. The <b>DS_SID_OR_SID_HISTORY_NAME</b> value is not supported.
     * @param {Integer} cNames Contains the number of elements in the <i>rpNames</i> array.
     * @param {Pointer<PWSTR>} rpNames Pointer to an array of pointers to null-terminated strings that contain names to be converted.
     * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppResult Pointer to a <b>PDS_NAME_RESULT</b> value that receives a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure
     *     that contains the converted names. The caller must free this memory, when it is no longer required, by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
     * @returns {Integer} Returns a Win32 error value, an RPC error value, or one of the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dscracknamesw
     * @since windows6.0.6000
     */
    static DsCrackNamesW(hDS, flags, formatOffered, formatDesired, cNames, rpNames, ppResult) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS

        result := DllCall("NTDSAPI.dll\DsCrackNamesW", "ptr", hDS, "int", flags, "int", formatOffered, "int", formatDesired, "uint", cNames, "ptr", rpNames, "ptr*", ppResult, "uint")
        return result
    }

    /**
     * Converts an array of directory service object names from one format to another.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function. If <i>flags</i> contains
     *     <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_flags">DS_NAME_FLAG_SYNTACTICAL_ONLY</a>, <i>hDS</i> can be
     *     <b>NULL</b>.
     * @param {Integer} flags Contains one or more of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_flags">DS_NAME_FLAGS</a> values used to determine how the name syntax will be cracked.
     * @param {Integer} formatOffered Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_NAME_FORMAT</a> values that identifies the format of the input names.
     * 
     * The <b>DS_LIST_NCS</b> value can also be passed for this parameter. This causes <b>DsCrackNames</b> to return the distinguished names of all naming contexts in the current forest. The <i>formatDesired</i> parameter is ignored. <i>cNames</i> must be at least one and all strings in <i>rpNames</i> must have a length greater than zero characters. The contents of the <i>rpNames</i> strings is ignored.
     * 
     * <div class="alert"><b>Note</b>  <b>DS_LIST_NCS</b> is not defined in a published header file. To use this value, define it in the exact format shown below.</div>
     * <div> </div>
     * 
     * ```cpp
     * @param {Integer} formatDesired Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_name_format">DS_NAME_FORMAT</a> values that identifies the format of the output names. The <b>DS_SID_OR_SID_HISTORY_NAME</b> value is not supported.
     * @param {Integer} cNames Contains the number of elements in the <i>rpNames</i> array.
     * @param {Pointer<PSTR>} rpNames Pointer to an array of pointers to null-terminated strings that contain names to be converted.
     * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppResult Pointer to a <b>PDS_NAME_RESULT</b> value that receives a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure
     *     that contains the converted names. The caller must free this memory, when it is no longer required, by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
     * @returns {Integer} Returns a Win32 error value, an RPC error value, or one of the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dscracknamesa
     * @since windows6.0.6000
     */
    static DsCrackNamesA(hDS, flags, formatOffered, formatDesired, cNames, rpNames, ppResult) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS

        result := DllCall("NTDSAPI.dll\DsCrackNamesA", "ptr", hDS, "int", flags, "int", formatOffered, "int", formatDesired, "uint", cNames, "ptr", rpNames, "ptr*", ppResult, "uint")
        return result
    }

    /**
     * Frees the memory held by a DS_NAME_RESULT structure.
     * @remarks
     * 
     * > [!NOTE]
     * > The ntdsapi.h header defines DsFreeNameResult as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * 
     * @param {Pointer<DS_NAME_RESULTW>} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsfreenameresultw
     * @since windows6.0.6000
     */
    static DsFreeNameResultW(pResult) {
        DllCall("NTDSAPI.dll\DsFreeNameResultW", "ptr", pResult)
    }

    /**
     * Frees the memory held by a DS_NAME_RESULT structure.
     * @remarks
     * 
     * > [!NOTE]
     * > The ntdsapi.h header defines DsFreeNameResult as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * 
     * @param {Pointer<DS_NAME_RESULTA>} pResult Pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsfreenameresulta
     * @since windows6.0.6000
     */
    static DsFreeNameResultA(pResult) {
        DllCall("NTDSAPI.dll\DsFreeNameResultA", "ptr", pResult)
    }

    /**
     * The DsGetSpn function constructs an array of one or more service principal names (SPNs). Each name in the array identifies an instance of a service. These SPNs may be registered with the directory service (DS) using the DsWriteAccountSpn function.
     * @param {Integer} ServiceType 
     * @param {PSTR} ServiceClass Pointer to a constant null-terminated string that specifies the class of the service; for example, http. Generally, this can be any string that is unique to the service.
     * @param {PSTR} ServiceName Pointer to a constant null-terminated string that specifies the DNS name or distinguished name (DN) of the service. <i>ServiceName</i> is not required for a host-based service. For more information, see the description of the <i>ServiceType</i> parameter for the possible values of <i>ServiceName</i>.
     * @param {Integer} InstancePort Specifies the port number of the service instance. If this value is zero, the SPN does not include a port number.
     * @param {Integer} cInstanceNames Specifies the number of elements in the <i>pInstanceNames</i> and <i>pInstancePorts</i> arrays. If this value is zero, <i>pInstanceNames</i> must point to an array of <i>cInstanceNames</i> strings, and <i>pInstancePorts</i> can be either <b>NULL</b> or a pointer to an array of <i>cInstanceNames</i> port numbers. If this value is zero, <b>DsGetSpn</b> returns only one SPN in the <i>prpszSpn</i> array and <i>pInstanceNames</i> and <i>pInstancePorts</i> are ignored.
     * @param {Pointer<PSTR>} pInstanceNames Pointer to an array of null-terminated strings that specify extra instance names (not used for host names). This parameter is ignored if <i>cInstanceNames</i> is zero. In that case, the <i>InstanceName</i> component of the SPN defaults to the fully qualified DNS name of the local computer or the NetBIOS name if <b>DS_SPN_NB_HOST</b> or <b>DS_SPN_NB_DOMAIN</b> is specified.
     * @param {Pointer<Integer>} pInstancePorts Pointer to an array of extra instance ports. If this value is non-<b>NULL</b>, it must point to an array of <i>cInstanceNames</i> port numbers. If this value is <b>NULL</b>, the SPNs do not include a port number. This parameter is ignored if <i>cInstanceNames</i> is zero.
     * @param {Pointer<Integer>} pcSpn Pointer to a variable that receives the number of SPNs contained in <i>prpszSpn</i>.
     * @param {Pointer<Pointer<PSTR>>} prpszSpn Pointer to a variable that receives a pointer to an array of SPNs. This array must be freed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreespnarraya">DsFreeSpnArray</a>.
     * @returns {Integer} If the function returns an array of SPNs, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsgetspna
     * @since windows6.0.6000
     */
    static DsGetSpnA(ServiceType, ServiceClass, ServiceName, InstancePort, cInstanceNames, pInstanceNames, pInstancePorts, pcSpn, prpszSpn) {
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName

        result := DllCall("NTDSAPI.dll\DsGetSpnA", "int", ServiceType, "ptr", ServiceClass, "ptr", ServiceName, "ushort", InstancePort, "ushort", cInstanceNames, "ptr", pInstanceNames, "ushort*", pInstancePorts, "uint*", pcSpn, "ptr*", prpszSpn, "uint")
        return result
    }

    /**
     * The DsGetSpn function constructs an array of one or more service principal names (SPNs). Each name in the array identifies an instance of a service. These SPNs may be registered with the directory service (DS) using the DsWriteAccountSpn function.
     * @param {Integer} ServiceType 
     * @param {PWSTR} ServiceClass Pointer to a constant null-terminated string that specifies the class of the service; for example, http. Generally, this can be any string that is unique to the service.
     * @param {PWSTR} ServiceName Pointer to a constant null-terminated string that specifies the DNS name or distinguished name (DN) of the service. <i>ServiceName</i> is not required for a host-based service. For more information, see the description of the <i>ServiceType</i> parameter for the possible values of <i>ServiceName</i>.
     * @param {Integer} InstancePort Specifies the port number of the service instance. If this value is zero, the SPN does not include a port number.
     * @param {Integer} cInstanceNames Specifies the number of elements in the <i>pInstanceNames</i> and <i>pInstancePorts</i> arrays. If this value is zero, <i>pInstanceNames</i> must point to an array of <i>cInstanceNames</i> strings, and <i>pInstancePorts</i> can be either <b>NULL</b> or a pointer to an array of <i>cInstanceNames</i> port numbers. If this value is zero, <b>DsGetSpn</b> returns only one SPN in the <i>prpszSpn</i> array and <i>pInstanceNames</i> and <i>pInstancePorts</i> are ignored.
     * @param {Pointer<PWSTR>} pInstanceNames Pointer to an array of null-terminated strings that specify extra instance names (not used for host names). This parameter is ignored if <i>cInstanceNames</i> is zero. In that case, the <i>InstanceName</i> component of the SPN defaults to the fully qualified DNS name of the local computer or the NetBIOS name if <b>DS_SPN_NB_HOST</b> or <b>DS_SPN_NB_DOMAIN</b> is specified.
     * @param {Pointer<Integer>} pInstancePorts Pointer to an array of extra instance ports. If this value is non-<b>NULL</b>, it must point to an array of <i>cInstanceNames</i> port numbers. If this value is <b>NULL</b>, the SPNs do not include a port number. This parameter is ignored if <i>cInstanceNames</i> is zero.
     * @param {Pointer<Integer>} pcSpn Pointer to a variable that receives the number of SPNs contained in <i>prpszSpn</i>.
     * @param {Pointer<Pointer<PWSTR>>} prpszSpn Pointer to a variable that receives a pointer to an array of SPNs. This array must be freed with 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreespnarraya">DsFreeSpnArray</a>.
     * @returns {Integer} If the function returns an array of SPNs, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsgetspnw
     * @since windows6.0.6000
     */
    static DsGetSpnW(ServiceType, ServiceClass, ServiceName, InstancePort, cInstanceNames, pInstanceNames, pInstancePorts, pcSpn, prpszSpn) {
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName

        result := DllCall("NTDSAPI.dll\DsGetSpnW", "int", ServiceType, "ptr", ServiceClass, "ptr", ServiceName, "ushort", InstancePort, "ushort", cInstanceNames, "ptr", pInstanceNames, "ushort*", pInstancePorts, "uint*", pcSpn, "ptr*", prpszSpn, "uint")
        return result
    }

    /**
     * Frees an array returned from the DsGetSpn function.
     * @remarks
     * 
     * > [!NOTE]
     * > The ntdsapi.h header defines DsFreeSpnArray as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * 
     * @param {Integer} cSpn Specifies the number of elements contained in <i>rpszSpn</i>.
     * @param {Pointer<PSTR>} rpszSpn Pointer to an array returned from <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetspna">DsGetSpn</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsfreespnarraya
     * @since windows6.0.6000
     */
    static DsFreeSpnArrayA(cSpn, rpszSpn) {
        DllCall("NTDSAPI.dll\DsFreeSpnArrayA", "uint", cSpn, "ptr", rpszSpn)
    }

    /**
     * Frees an array returned from the DsGetSpn function.
     * @remarks
     * 
     * > [!NOTE]
     * > The ntdsapi.h header defines DsFreeSpnArray as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * 
     * @param {Integer} cSpn Specifies the number of elements contained in <i>rpszSpn</i>.
     * @param {Pointer<PWSTR>} rpszSpn Pointer to an array returned from <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetspna">DsGetSpn</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsfreespnarrayw
     * @since windows6.0.6000
     */
    static DsFreeSpnArrayW(cSpn, rpszSpn) {
        DllCall("NTDSAPI.dll\DsFreeSpnArrayW", "uint", cSpn, "ptr", rpszSpn)
    }

    /**
     * Writes an array of service principal names (SPNs) to the servicePrincipalName attribute of a specified user or computer account object in Active Directory Domain Services.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Integer} Operation Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_spn_write_op">DS_SPN_WRITE_OP</a> values that specifies the operation that <b>DsWriteAccountSpn</b> will perform.
     * @param {PSTR} pszAccount Pointer to a constant null-terminated string that specifies the distinguished name of a user or computer object in Active Directory Domain Services. The caller must have write access to the <b>servicePrincipalName</b> property of this object.
     * @param {Integer} cSpn Specifies the number of SPNs in <i>rpszSpn</i>. If this value is zero, and <i>Operation</i> contains <b>DS_SPN_REPLACE_SPN_OP</b>, the function removes all values from the <b>servicePrincipalName</b> attribute of the specified account.
     * @param {Pointer<PSTR>} rpszSpn Pointer to an array of constant null-terminated strings that specify the SPNs to be added to or removed from the  account identified by the <i>pszAccount</i> parameter. The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetspna">DsGetSpn</a> function is used to compose SPNs for a service.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32, RPC or directory service error if unsuccessful.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dswriteaccountspna
     * @since windows6.0.6000
     */
    static DsWriteAccountSpnA(hDS, Operation, pszAccount, cSpn, rpszSpn) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        pszAccount := pszAccount is String ? StrPtr(pszAccount) : pszAccount

        result := DllCall("NTDSAPI.dll\DsWriteAccountSpnA", "ptr", hDS, "int", Operation, "ptr", pszAccount, "uint", cSpn, "ptr", rpszSpn, "uint")
        return result
    }

    /**
     * Writes an array of service principal names (SPNs) to the servicePrincipalName attribute of a specified user or computer account object in Active Directory Domain Services.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Integer} Operation Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_spn_write_op">DS_SPN_WRITE_OP</a> values that specifies the operation that <b>DsWriteAccountSpn</b> will perform.
     * @param {PWSTR} pszAccount Pointer to a constant null-terminated string that specifies the distinguished name of a user or computer object in Active Directory Domain Services. The caller must have write access to the <b>servicePrincipalName</b> property of this object.
     * @param {Integer} cSpn Specifies the number of SPNs in <i>rpszSpn</i>. If this value is zero, and <i>Operation</i> contains <b>DS_SPN_REPLACE_SPN_OP</b>, the function removes all values from the <b>servicePrincipalName</b> attribute of the specified account.
     * @param {Pointer<PWSTR>} rpszSpn Pointer to an array of constant null-terminated strings that specify the SPNs to be added to or removed from the  account identified by the <i>pszAccount</i> parameter. The <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsgetspna">DsGetSpn</a> function is used to compose SPNs for a service.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32, RPC or directory service error if unsuccessful.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dswriteaccountspnw
     * @since windows6.0.6000
     */
    static DsWriteAccountSpnW(hDS, Operation, pszAccount, cSpn, rpszSpn) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        pszAccount := pszAccount is String ? StrPtr(pszAccount) : pszAccount

        result := DllCall("NTDSAPI.dll\DsWriteAccountSpnW", "ptr", hDS, "int", Operation, "ptr", pszAccount, "uint", cSpn, "ptr", rpszSpn, "uint")
        return result
    }

    /**
     * Constructs a service principal name (SPN) that identifies a specific server to use for authentication.
     * @param {PWSTR} ServiceClass Pointer to a null-terminated string that contains the class of the service as defined by the service. This can be any string unique to the service.
     * @param {PWSTR} ServiceName Pointer to a null-terminated string that contains the distinguished name service (DNS) host name. This can either be a fully qualified name or an IP address in the Internet standard  format.
     * 
     * Use of an IP address for <i>ServiceName</i> is not recommended because this can create a security issue. Before the SPN is constructed, the IP address must be translated to a computer name through DNS name resolution. It is possible for the DNS name resolution to be spoofed, replacing the  intended computer name with an unauthorized computer name.
     * @param {Pointer<Integer>} pcSpnLength Pointer to a <b>DWORD</b> value that, on entry, contains the size of the <i>pszSpn</i> buffer, in characters. On output, this parameter receives the number of characters copied to the  <i>pszSpn</i> buffer, including the terminating <b>NULL</b>.
     * @param {PWSTR} pszSpn Pointer to a string buffer that receives the SPN.
     * @returns {Integer} This function returns standard Windows error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsclientmakespnfortargetserverw
     * @since windows6.0.6000
     */
    static DsClientMakeSpnForTargetServerW(ServiceClass, ServiceName, pcSpnLength, pszSpn) {
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn

        result := DllCall("NTDSAPI.dll\DsClientMakeSpnForTargetServerW", "ptr", ServiceClass, "ptr", ServiceName, "uint*", pcSpnLength, "ptr", pszSpn, "uint")
        return result
    }

    /**
     * Constructs a service principal name (SPN) that identifies a specific server to use for authentication.
     * @param {PSTR} ServiceClass Pointer to a null-terminated string that contains the class of the service as defined by the service. This can be any string unique to the service.
     * @param {PSTR} ServiceName Pointer to a null-terminated string that contains the distinguished name service (DNS) host name. This can either be a fully qualified name or an IP address in the Internet standard  format.
     * 
     * Use of an IP address for <i>ServiceName</i> is not recommended because this can create a security issue. Before the SPN is constructed, the IP address must be translated to a computer name through DNS name resolution. It is possible for the DNS name resolution to be spoofed, replacing the  intended computer name with an unauthorized computer name.
     * @param {Pointer<Integer>} pcSpnLength Pointer to a <b>DWORD</b> value that, on entry, contains the size of the <i>pszSpn</i> buffer, in characters. On output, this parameter receives the number of characters copied to the  <i>pszSpn</i> buffer, including the terminating <b>NULL</b>.
     * @param {PSTR} pszSpn Pointer to a string buffer that receives the SPN.
     * @returns {Integer} This function returns standard Windows error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsclientmakespnfortargetservera
     * @since windows6.0.6000
     */
    static DsClientMakeSpnForTargetServerA(ServiceClass, ServiceName, pcSpnLength, pszSpn) {
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        ServiceName := ServiceName is String ? StrPtr(ServiceName) : ServiceName
        pszSpn := pszSpn is String ? StrPtr(pszSpn) : pszSpn

        result := DllCall("NTDSAPI.dll\DsClientMakeSpnForTargetServerA", "ptr", ServiceClass, "ptr", ServiceName, "uint*", pcSpnLength, "ptr", pszSpn, "uint")
        return result
    }

    /**
     * The DsServerRegisterSpn function composes two SPNs for a host-based service.
     * @param {Integer} Operation 
     * @param {PSTR} ServiceClass Pointer to a constant null-terminated string specifying the class of the service. This parameter may be any string unique to that service; either the protocol name (for example, ldap) or the string form of a GUID will work.
     * @param {PSTR} UserObjectDN Pointer to a constant null-terminated string specifying the distinguished name of a user or computer account object to write the SPNs to. If this parameter is <b>NULL</b>, <b>DsServerRegisterSpn</b> writes to the account object of the primary or impersonated user associated with the calling thread. If the thread is running in the security context of the LocalSystem account, the function writes to the account object of the local computer.
     * @returns {Integer} If the function successfully registers one or more SPNs, it returns <b>ERROR_SUCCESS</b>. Modification is performed permissively, so that adding a value that already exists does not return an error.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsserverregisterspna
     * @since windows6.0.6000
     */
    static DsServerRegisterSpnA(Operation, ServiceClass, UserObjectDN) {
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        UserObjectDN := UserObjectDN is String ? StrPtr(UserObjectDN) : UserObjectDN

        result := DllCall("NTDSAPI.dll\DsServerRegisterSpnA", "int", Operation, "ptr", ServiceClass, "ptr", UserObjectDN, "uint")
        return result
    }

    /**
     * The DsServerRegisterSpn function composes two SPNs for a host-based service.
     * @param {Integer} Operation 
     * @param {PWSTR} ServiceClass Pointer to a constant null-terminated string specifying the class of the service. This parameter may be any string unique to that service; either the protocol name (for example, ldap) or the string form of a GUID will work.
     * @param {PWSTR} UserObjectDN Pointer to a constant null-terminated string specifying the distinguished name of a user or computer account object to write the SPNs to. If this parameter is <b>NULL</b>, <b>DsServerRegisterSpn</b> writes to the account object of the primary or impersonated user associated with the calling thread. If the thread is running in the security context of the LocalSystem account, the function writes to the account object of the local computer.
     * @returns {Integer} If the function successfully registers one or more SPNs, it returns <b>ERROR_SUCCESS</b>. Modification is performed permissively, so that adding a value that already exists does not return an error.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsserverregisterspnw
     * @since windows6.0.6000
     */
    static DsServerRegisterSpnW(Operation, ServiceClass, UserObjectDN) {
        ServiceClass := ServiceClass is String ? StrPtr(ServiceClass) : ServiceClass
        UserObjectDN := UserObjectDN is String ? StrPtr(UserObjectDN) : UserObjectDN

        result := DllCall("NTDSAPI.dll\DsServerRegisterSpnW", "int", Operation, "ptr", ServiceClass, "ptr", UserObjectDN, "uint")
        return result
    }

    /**
     * Synchronizes a destination naming context (NC) with one of its sources.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name of the destination NC.
     * @param {Pointer<Guid>} pUuidDsaSrc Pointer to the UUID of a source that replicates to the destination NC.
     * @param {Integer} Options 
     * @returns {Integer} If the function performs its operation successfully, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the standard Win32 API errors.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicasynca
     * @since windows6.0.6000
     */
    static DsReplicaSyncA(hDS, NameContext, pUuidDsaSrc, Options) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext

        result := DllCall("NTDSAPI.dll\DsReplicaSyncA", "ptr", hDS, "ptr", NameContext, "ptr", pUuidDsaSrc, "uint", Options, "uint")
        return result
    }

    /**
     * Synchronizes a destination naming context (NC) with one of its sources.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name of the destination NC.
     * @param {Pointer<Guid>} pUuidDsaSrc Pointer to the UUID of a source that replicates to the destination NC.
     * @param {Integer} Options 
     * @returns {Integer} If the function performs its operation successfully, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is one of the standard Win32 API errors.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicasyncw
     * @since windows6.0.6000
     */
    static DsReplicaSyncW(hDS, NameContext, pUuidDsaSrc, Options) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext

        result := DllCall("NTDSAPI.dll\DsReplicaSyncW", "ptr", hDS, "ptr", NameContext, "ptr", pUuidDsaSrc, "uint", Options, "uint")
        return result
    }

    /**
     * Adds a replication source reference to a destination naming context.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} NameContext The null-terminated string that specifies the distinguished name (DN) of the destination naming context (NC)  for which to add the replica. The destination NC record must exist locally as either an object, instantiated or not, or a reference phantom, for example, a phantom with a GUID.
     * @param {PSTR} SourceDsaDn The null-terminated string that specifies the DN of the <b>NTDS-DSA</b> object for the source directory system agent. This parameter is required if <i>Options</i> includes <b>DS_REPADD_ASYNCHRONOUS_REPLICA</b>; otherwise, it is ignored.
     * @param {PSTR} TransportDn The null-terminated string that specifies the DN of the <b>interSiteTransport</b> object that represents the transport used for communication with the source server. This parameter is required if <i>Options</i> includes <b>DS_REPADD_INTERSITE_MESSAGING</b>; otherwise, it is ignored.
     * @param {PSTR} SourceDsaAddress The null-terminated string that specifies the transport-specific address of the source DSA. This source server is identified by a string name, not by its UUID. A string name appropriate for <i>SourceDsaAddress</i> is usually a DNS name based on a GUID, where the GUID part of the name is the GUID of the <b>NTDS-DSA</b> object for the source server.
     * @param {Pointer<SCHEDULE>} pSchedule Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure that contains the  replication schedule data for the replication source. This parameter is optional and can be <b>NULL</b> if not used.
     * @param {Integer} Options 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicaadda
     * @since windows6.0.6000
     */
    static DsReplicaAddA(hDS, NameContext, SourceDsaDn, TransportDn, SourceDsaAddress, pSchedule, Options) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
        SourceDsaDn := SourceDsaDn is String ? StrPtr(SourceDsaDn) : SourceDsaDn
        TransportDn := TransportDn is String ? StrPtr(TransportDn) : TransportDn
        SourceDsaAddress := SourceDsaAddress is String ? StrPtr(SourceDsaAddress) : SourceDsaAddress

        result := DllCall("NTDSAPI.dll\DsReplicaAddA", "ptr", hDS, "ptr", NameContext, "ptr", SourceDsaDn, "ptr", TransportDn, "ptr", SourceDsaAddress, "ptr", pSchedule, "uint", Options, "uint")
        return result
    }

    /**
     * Adds a replication source reference to a destination naming context.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} NameContext The null-terminated string that specifies the distinguished name (DN) of the destination naming context (NC)  for which to add the replica. The destination NC record must exist locally as either an object, instantiated or not, or a reference phantom, for example, a phantom with a GUID.
     * @param {PWSTR} SourceDsaDn The null-terminated string that specifies the DN of the <b>NTDS-DSA</b> object for the source directory system agent. This parameter is required if <i>Options</i> includes <b>DS_REPADD_ASYNCHRONOUS_REPLICA</b>; otherwise, it is ignored.
     * @param {PWSTR} TransportDn The null-terminated string that specifies the DN of the <b>interSiteTransport</b> object that represents the transport used for communication with the source server. This parameter is required if <i>Options</i> includes <b>DS_REPADD_INTERSITE_MESSAGING</b>; otherwise, it is ignored.
     * @param {PWSTR} SourceDsaAddress The null-terminated string that specifies the transport-specific address of the source DSA. This source server is identified by a string name, not by its UUID. A string name appropriate for <i>SourceDsaAddress</i> is usually a DNS name based on a GUID, where the GUID part of the name is the GUID of the <b>NTDS-DSA</b> object for the source server.
     * @param {Pointer<SCHEDULE>} pSchedule Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure that contains the  replication schedule data for the replication source. This parameter is optional and can be <b>NULL</b> if not used.
     * @param {Integer} Options 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicaaddw
     * @since windows6.0.6000
     */
    static DsReplicaAddW(hDS, NameContext, SourceDsaDn, TransportDn, SourceDsaAddress, pSchedule, Options) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
        SourceDsaDn := SourceDsaDn is String ? StrPtr(SourceDsaDn) : SourceDsaDn
        TransportDn := TransportDn is String ? StrPtr(TransportDn) : TransportDn
        SourceDsaAddress := SourceDsaAddress is String ? StrPtr(SourceDsaAddress) : SourceDsaAddress

        result := DllCall("NTDSAPI.dll\DsReplicaAddW", "ptr", hDS, "ptr", NameContext, "ptr", SourceDsaDn, "ptr", TransportDn, "ptr", SourceDsaAddress, "ptr", pSchedule, "uint", Options, "uint")
        return result
    }

    /**
     * Removes a replication source reference from a destination naming context (NC).
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name (DN) of the destination NC from which to remove the replica. The destination NC record must exist locally as either an object, instantiated or not, or a reference phantom, for example, a phantom with a GUID.
     * @param {PSTR} DsaSrc Pointer to a constant null-terminated Unicode string that specifies the transport-specific address of the source directory system agent (DSA). This source server is identified by a string name, not by its <b>UUID</b>. A string name appropriate for <i>DsaSrc</i> is usually a DNS name that is based on a <b>GUID</b>, where the <b>GUID</b> part of the name is the <b>GUID</b> of the nTDSDSA object for the source server.
     * @param {Integer} Options 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is a standard Win32 API error or <b>ERROR_INVALID_PARAMETER</b> if a parameter is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicadela
     * @since windows6.0.6000
     */
    static DsReplicaDelA(hDS, NameContext, DsaSrc, Options) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
        DsaSrc := DsaSrc is String ? StrPtr(DsaSrc) : DsaSrc

        result := DllCall("NTDSAPI.dll\DsReplicaDelA", "ptr", hDS, "ptr", NameContext, "ptr", DsaSrc, "uint", Options, "uint")
        return result
    }

    /**
     * Removes a replication source reference from a destination naming context (NC).
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name (DN) of the destination NC from which to remove the replica. The destination NC record must exist locally as either an object, instantiated or not, or a reference phantom, for example, a phantom with a GUID.
     * @param {PWSTR} DsaSrc Pointer to a constant null-terminated Unicode string that specifies the transport-specific address of the source directory system agent (DSA). This source server is identified by a string name, not by its <b>UUID</b>. A string name appropriate for <i>DsaSrc</i> is usually a DNS name that is based on a <b>GUID</b>, where the <b>GUID</b> part of the name is the <b>GUID</b> of the nTDSDSA object for the source server.
     * @param {Integer} Options 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is a standard Win32 API error or <b>ERROR_INVALID_PARAMETER</b> if a parameter is invalid.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicadelw
     * @since windows6.0.6000
     */
    static DsReplicaDelW(hDS, NameContext, DsaSrc, Options) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
        DsaSrc := DsaSrc is String ? StrPtr(DsaSrc) : DsaSrc

        result := DllCall("NTDSAPI.dll\DsReplicaDelW", "ptr", hDS, "ptr", NameContext, "ptr", DsaSrc, "uint", Options, "uint")
        return result
    }

    /**
     * Modifies an existing replication source reference for a destination naming context.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name (DN) of the destination naming context (NC).
     * @param {Pointer<Guid>} pUuidSourceDsa Pointer to the UUID of the source directory system agent (DSA). This parameter may be null if <i>ModifyFields</i> does not include <b>DS_REPMOD_UPDATE_ADDRESS</b> and <i>SourceDsaAddress</i> is not <b>NULL</b>.
     * @param {PSTR} SourceDsaAddress Pointer to a constant null-terminated Unicode string that specifies the transport-specific address of the source DSA. This parameter is ignored if <i>pUuidSourceDsa</i> is not <b>NULL</b> and <i>ModifyFields</i> does not include <b>DS_REPMOD_UPDATE_ADDRESS</b>.
     * @param {Pointer<SCHEDULE>} pSchedule Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure that contains the  replication schedule data for the replication source. This parameter is optional and can be <b>NULL</b> if not used. This parameter is required if <i>ModifyFields</i> contains the  <b>DS_REPMOD_UPDATE_SCHEDULE</b> flag.
     * @param {Integer} ModifyFields 
     * @param {Integer} Options 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicamodifya
     * @since windows6.0.6000
     */
    static DsReplicaModifyA(hDS, NameContext, pUuidSourceDsa, SourceDsaAddress, pSchedule, ModifyFields, Options) {
        static TransportDn := 0, ReplicaFlags := 0 ;Reserved parameters must always be NULL

        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
        TransportDn := TransportDn is String ? StrPtr(TransportDn) : TransportDn
        SourceDsaAddress := SourceDsaAddress is String ? StrPtr(SourceDsaAddress) : SourceDsaAddress

        result := DllCall("NTDSAPI.dll\DsReplicaModifyA", "ptr", hDS, "ptr", NameContext, "ptr", pUuidSourceDsa, "ptr", TransportDn, "ptr", SourceDsaAddress, "ptr", pSchedule, "uint", ReplicaFlags, "uint", ModifyFields, "uint", Options, "uint")
        return result
    }

    /**
     * Modifies an existing replication source reference for a destination naming context.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name (DN) of the destination naming context (NC).
     * @param {Pointer<Guid>} pUuidSourceDsa Pointer to the UUID of the source directory system agent (DSA). This parameter may be null if <i>ModifyFields</i> does not include <b>DS_REPMOD_UPDATE_ADDRESS</b> and <i>SourceDsaAddress</i> is not <b>NULL</b>.
     * @param {PWSTR} SourceDsaAddress Pointer to a constant null-terminated Unicode string that specifies the transport-specific address of the source DSA. This parameter is ignored if <i>pUuidSourceDsa</i> is not <b>NULL</b> and <i>ModifyFields</i> does not include <b>DS_REPMOD_UPDATE_ADDRESS</b>.
     * @param {Pointer<SCHEDULE>} pSchedule Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/schedule/ns-schedule-schedule">SCHEDULE</a> structure that contains the  replication schedule data for the replication source. This parameter is optional and can be <b>NULL</b> if not used. This parameter is required if <i>ModifyFields</i> contains the  <b>DS_REPMOD_UPDATE_SCHEDULE</b> flag.
     * @param {Integer} ReplicaFlags This parameter is used to control replication behavior and can take the following values.
     * @param {Integer} ModifyFields 
     * @param {Integer} Options 
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicamodifyw
     * @since windows6.0.6000
     */
    static DsReplicaModifyW(hDS, NameContext, pUuidSourceDsa, SourceDsaAddress, pSchedule, ReplicaFlags, ModifyFields, Options) {
        static TransportDn := 0 ;Reserved parameters must always be NULL

        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
        TransportDn := TransportDn is String ? StrPtr(TransportDn) : TransportDn
        SourceDsaAddress := SourceDsaAddress is String ? StrPtr(SourceDsaAddress) : SourceDsaAddress

        result := DllCall("NTDSAPI.dll\DsReplicaModifyW", "ptr", hDS, "ptr", NameContext, "ptr", pUuidSourceDsa, "ptr", TransportDn, "ptr", SourceDsaAddress, "ptr", pSchedule, "uint", ReplicaFlags, "uint", ModifyFields, "uint", Options, "uint")
        return result
    }

    /**
     * Adds or removes a replication reference for a destination from a source naming context.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name of the source naming context.
     * @param {PSTR} DsaDest Pointer to a constant null-terminated string that specifies the transport-specific address of the destination directory system agent.
     * @param {Pointer<Guid>} pUuidDsaDest Pointer to a <b>UUID</b> value that contains the destination directory system agent.
     * @param {Integer} Options 
     * @returns {Integer} If the function succeeds,  <b>ERROR_SUCCESS</b> is returned.
     * 
     * If the function fails, the return value can be one of the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicaupdaterefsa
     * @since windows6.0.6000
     */
    static DsReplicaUpdateRefsA(hDS, NameContext, DsaDest, pUuidDsaDest, Options) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
        DsaDest := DsaDest is String ? StrPtr(DsaDest) : DsaDest

        result := DllCall("NTDSAPI.dll\DsReplicaUpdateRefsA", "ptr", hDS, "ptr", NameContext, "ptr", DsaDest, "ptr", pUuidDsaDest, "uint", Options, "uint")
        return result
    }

    /**
     * Adds or removes a replication reference for a destination from a source naming context.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} NameContext Pointer to a constant null-terminated string that specifies the distinguished name of the source naming context.
     * @param {PWSTR} DsaDest Pointer to a constant null-terminated string that specifies the transport-specific address of the destination directory system agent.
     * @param {Pointer<Guid>} pUuidDsaDest Pointer to a <b>UUID</b> value that contains the destination directory system agent.
     * @param {Integer} Options 
     * @returns {Integer} If the function succeeds,  <b>ERROR_SUCCESS</b> is returned.
     * 
     * If the function fails, the return value can be one of the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicaupdaterefsw
     * @since windows6.0.6000
     */
    static DsReplicaUpdateRefsW(hDS, NameContext, DsaDest, pUuidDsaDest, Options) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext
        DsaDest := DsaDest is String ? StrPtr(DsaDest) : DsaDest

        result := DllCall("NTDSAPI.dll\DsReplicaUpdateRefsW", "ptr", hDS, "ptr", NameContext, "ptr", DsaDest, "ptr", pUuidDsaDest, "uint", Options, "uint")
        return result
    }

    /**
     * Synchronizes a server with all other servers, using transitive replication, as necessary.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} pszNameContext Pointer to a null-terminated string that specifies the distinguished name of the naming context to synchronize. The <i>pszNameContext</i> parameter is optional; if its value is <b>NULL</b>, the configuration naming context is replicated.
     * @param {Integer} ulFlags 
     * @param {Pointer} pFnCallBack Pointer to an application-defined <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms677968(v=vs.85)">SyncUpdateProc</a> function called by the <b>DsReplicaSyncAll</b> function when it encounters an error, initiates synchronization of two servers, completes synchronization of two servers, or finishes synchronization of all the servers in the site.
     * @param {Pointer<Void>} pCallbackData Pointer to application-defined data passed as the first argument of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms677968(v=vs.85)">SyncUpdateProc</a> callback function pointed to by the <i>pFnCallBack</i> parameter.
     * @param {Pointer<Pointer<Pointer<DS_REPSYNCALL_ERRINFOA>>>} pErrors A NULL-terminated array of pointers to  
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_errinfoa">DS_REPSYNCALL_ERRINFO</a> structures that contain errors that occurred during synchronization. The memory used to hold both the array of pointers and the MsCS\mscs\clusctl_resource_type_get_private_property_fmts.xml data is allocated as a single block of memory and should be freed when no longer required  by a single call to <b>LocalFree</b> with the pointer value returned in <i>pErrors</i> used as the argument.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is as follows.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicasyncalla
     * @since windows6.0.6000
     */
    static DsReplicaSyncAllA(hDS, pszNameContext, ulFlags, pFnCallBack, pCallbackData, pErrors) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        pszNameContext := pszNameContext is String ? StrPtr(pszNameContext) : pszNameContext

        result := DllCall("NTDSAPI.dll\DsReplicaSyncAllA", "ptr", hDS, "ptr", pszNameContext, "uint", ulFlags, "ptr", pFnCallBack, "ptr", pCallbackData, "ptr*", pErrors, "uint")
        return result
    }

    /**
     * Synchronizes a server with all other servers, using transitive replication, as necessary.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} pszNameContext Pointer to a null-terminated string that specifies the distinguished name of the naming context to synchronize. The <i>pszNameContext</i> parameter is optional; if its value is <b>NULL</b>, the configuration naming context is replicated.
     * @param {Integer} ulFlags 
     * @param {Pointer} pFnCallBack Pointer to an application-defined <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms677968(v=vs.85)">SyncUpdateProc</a> function called by the <b>DsReplicaSyncAll</b> function when it encounters an error, initiates synchronization of two servers, completes synchronization of two servers, or finishes synchronization of all the servers in the site.
     * @param {Pointer<Void>} pCallbackData Pointer to application-defined data passed as the first argument of the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/ms677968(v=vs.85)">SyncUpdateProc</a> callback function pointed to by the <i>pFnCallBack</i> parameter.
     * @param {Pointer<Pointer<Pointer<DS_REPSYNCALL_ERRINFOW>>>} pErrors A NULL-terminated array of pointers to  
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_repsyncall_errinfoa">DS_REPSYNCALL_ERRINFO</a> structures that contain errors that occurred during synchronization. The memory used to hold both the array of pointers and the MsCS\mscs\clusctl_resource_type_get_private_property_fmts.xml data is allocated as a single block of memory and should be freed when no longer required  by a single call to <b>LocalFree</b> with the pointer value returned in <i>pErrors</i> used as the argument.
     * @returns {Integer} If the function succeeds, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value is as follows.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicasyncallw
     * @since windows6.0.6000
     */
    static DsReplicaSyncAllW(hDS, pszNameContext, ulFlags, pFnCallBack, pCallbackData, pErrors) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        pszNameContext := pszNameContext is String ? StrPtr(pszNameContext) : pszNameContext

        result := DllCall("NTDSAPI.dll\DsReplicaSyncAllW", "ptr", hDS, "ptr", pszNameContext, "uint", ulFlags, "ptr", pFnCallBack, "ptr", pCallbackData, "ptr*", pErrors, "uint")
        return result
    }

    /**
     * The DsRemoveDsServer function removes all traces of a directory service agent (DSA) from the global area of the directory service.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} ServerDN Pointer to a null-terminated string that specifies the fully qualified distinguished name of the domain controller to remove.
     * @param {PWSTR} DomainDN Pointer to a null-terminated string that specifies a domain hosted by <i>ServerDN</i>. If this parameter is <b>NULL</b>, no verification is performed to ensure that <i>ServerDN</i> is the last domain controller in <i>DomainDN</i>.
     * @param {Pointer<BOOL>} fLastDcInDomain Pointer to a Boolean value that receives <b>TRUE</b> if <i>ServerDN</i> is the last DC in <i>DomainDN</i> or <b>FALSE</b> otherwise. This parameter receives <b>FALSE</b> if <i>DomainDN</i> is <b>NULL</b>.
     * @param {BOOL} fCommit Contains a Boolean value that specifies if the domain controller should actually be removed. If this parameter is nonzero, <i>ServerDN</i> is removed. If this parameter is zero, the existence of <i>ServerDN</i> is checked and <i>fLastDcInDomain</i> is written, but the domain controller is not removed.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful  or a Win32 or RPC error code if unsuccessful. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsremovedsserverw
     * @since windows6.0.6000
     */
    static DsRemoveDsServerW(hDs, ServerDN, DomainDN, fLastDcInDomain, fCommit) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        ServerDN := ServerDN is String ? StrPtr(ServerDN) : ServerDN
        DomainDN := DomainDN is String ? StrPtr(DomainDN) : DomainDN

        result := DllCall("NTDSAPI.dll\DsRemoveDsServerW", "ptr", hDs, "ptr", ServerDN, "ptr", DomainDN, "ptr", fLastDcInDomain, "int", fCommit, "uint")
        return result
    }

    /**
     * The DsRemoveDsServer function removes all traces of a directory service agent (DSA) from the global area of the directory service.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} ServerDN Pointer to a null-terminated string that specifies the fully qualified distinguished name of the domain controller to remove.
     * @param {PSTR} DomainDN Pointer to a null-terminated string that specifies a domain hosted by <i>ServerDN</i>. If this parameter is <b>NULL</b>, no verification is performed to ensure that <i>ServerDN</i> is the last domain controller in <i>DomainDN</i>.
     * @param {Pointer<BOOL>} fLastDcInDomain Pointer to a Boolean value that receives <b>TRUE</b> if <i>ServerDN</i> is the last DC in <i>DomainDN</i> or <b>FALSE</b> otherwise. This parameter receives <b>FALSE</b> if <i>DomainDN</i> is <b>NULL</b>.
     * @param {BOOL} fCommit Contains a Boolean value that specifies if the domain controller should actually be removed. If this parameter is nonzero, <i>ServerDN</i> is removed. If this parameter is zero, the existence of <i>ServerDN</i> is checked and <i>fLastDcInDomain</i> is written, but the domain controller is not removed.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful  or a Win32 or RPC error code if unsuccessful. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsremovedsservera
     * @since windows6.0.6000
     */
    static DsRemoveDsServerA(hDs, ServerDN, DomainDN, fLastDcInDomain, fCommit) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        ServerDN := ServerDN is String ? StrPtr(ServerDN) : ServerDN
        DomainDN := DomainDN is String ? StrPtr(DomainDN) : DomainDN

        result := DllCall("NTDSAPI.dll\DsRemoveDsServerA", "ptr", hDs, "ptr", ServerDN, "ptr", DomainDN, "ptr", fLastDcInDomain, "int", fCommit, "uint")
        return result
    }

    /**
     * Removes all traces of a domain naming context from the global area of the directory service.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} DomainDN Pointer to a null-terminated string that specifies the distinguished name of the naming context to remove from the directory service.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful  or a Win32 or RPC error code if unsuccessful. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsremovedsdomainw
     * @since windows6.0.6000
     */
    static DsRemoveDsDomainW(hDs, DomainDN) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        DomainDN := DomainDN is String ? StrPtr(DomainDN) : DomainDN

        result := DllCall("NTDSAPI.dll\DsRemoveDsDomainW", "ptr", hDs, "ptr", DomainDN, "uint")
        return result
    }

    /**
     * Removes all traces of a domain naming context from the global area of the directory service.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} DomainDN Pointer to a null-terminated string that specifies the distinguished name of the naming context to remove from the directory service.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful  or a Win32 or RPC error code if unsuccessful. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsremovedsdomaina
     * @since windows6.0.6000
     */
    static DsRemoveDsDomainA(hDs, DomainDN) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        DomainDN := DomainDN is String ? StrPtr(DomainDN) : DomainDN

        result := DllCall("NTDSAPI.dll\DsRemoveDsDomainA", "ptr", hDs, "ptr", DomainDN, "uint")
        return result
    }

    /**
     * Lists all the sites in the enterprise forest.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppSites Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of sites in the enterprise. The site name is returned in the distinguished name (DN) format. The returned structure must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
     * @returns {Integer} If the function returns a list of sites, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistsitesa
     * @since windows6.0.6000
     */
    static DsListSitesA(hDs, ppSites) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs

        result := DllCall("NTDSAPI.dll\DsListSitesA", "ptr", hDs, "ptr*", ppSites, "uint")
        return result
    }

    /**
     * Lists all the sites in the enterprise forest.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppSites Pointer to a pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of sites in the enterprise. The site name is returned in the distinguished name (DN) format. The returned structure must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
     * @returns {Integer} If the function returns a list of sites, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistsitesw
     * @since windows6.0.6000
     */
    static DsListSitesW(hDs, ppSites) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs

        result := DllCall("NTDSAPI.dll\DsListSitesW", "ptr", hDs, "ptr*", ppSites, "uint")
        return result
    }

    /**
     * Lists all the servers in a site.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} site Pointer to a null-terminated string that specifies the site name. The site name uses a distinguished name format. It is taken from the list of sites returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppServers Pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of servers in the site. The returned structure must be freed using 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
     * @returns {Integer} If the function returns a list of servers, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistserversinsitea
     * @since windows6.0.6000
     */
    static DsListServersInSiteA(hDs, site, ppServers) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        site := site is String ? StrPtr(site) : site

        result := DllCall("NTDSAPI.dll\DsListServersInSiteA", "ptr", hDs, "ptr", site, "ptr*", ppServers, "uint")
        return result
    }

    /**
     * Lists all the servers in a site.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} site Pointer to a null-terminated string that specifies the site name. The site name uses a distinguished name format. It is taken from the list of sites returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppServers Pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of servers in the site. The returned structure must be freed using 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
     * @returns {Integer} If the function returns a list of servers, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistserversinsitew
     * @since windows6.0.6000
     */
    static DsListServersInSiteW(hDs, site, ppServers) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        site := site is String ? StrPtr(site) : site

        result := DllCall("NTDSAPI.dll\DsListServersInSiteW", "ptr", hDs, "ptr", site, "ptr*", ppServers, "uint")
        return result
    }

    /**
     * Lists all the domains in a site.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} site Pointer to a null-terminated string that specifies the site name. This string is taken from the list of site names returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppDomains Pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of domains in the site. To free the returned structure, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
     * @returns {Integer} If the function returns a list of domains, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistdomainsinsitea
     * @since windows6.0.6000
     */
    static DsListDomainsInSiteA(hDs, site, ppDomains) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        site := site is String ? StrPtr(site) : site

        result := DllCall("NTDSAPI.dll\DsListDomainsInSiteA", "ptr", hDs, "ptr", site, "ptr*", ppDomains, "uint")
        return result
    }

    /**
     * Lists all the domains in a site.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} site Pointer to a null-terminated string that specifies the site name. This string is taken from the list of site names returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppDomains Pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of domains in the site. To free the returned structure, call 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
     * @returns {Integer} If the function returns a list of domains, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistdomainsinsitew
     * @since windows6.0.6000
     */
    static DsListDomainsInSiteW(hDs, site, ppDomains) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        site := site is String ? StrPtr(site) : site

        result := DllCall("NTDSAPI.dll\DsListDomainsInSiteW", "ptr", hDs, "ptr", site, "ptr*", ppDomains, "uint")
        return result
    }

    /**
     * Lists all the servers in a domain in a site.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} domain Pointer to a null-terminated string that specifies the domain name. This string must be the same as one of the strings returned by <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistdomainsinsitea">DsListDomainsInSite</a> function.
     * @param {PSTR} site Pointer to a null-terminated string that specifies the site name. This string is taken from the list of site names returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppServers Pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of servers in the domain. The returned structure must be freed using 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
     * @returns {Integer} If the function returns a list of servers, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistserversfordomaininsitea
     * @since windows6.0.6000
     */
    static DsListServersForDomainInSiteA(hDs, domain, site, ppServers) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        domain := domain is String ? StrPtr(domain) : domain
        site := site is String ? StrPtr(site) : site

        result := DllCall("NTDSAPI.dll\DsListServersForDomainInSiteA", "ptr", hDs, "ptr", domain, "ptr", site, "ptr*", ppServers, "uint")
        return result
    }

    /**
     * Lists all the servers in a domain in a site.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} domain Pointer to a null-terminated string that specifies the domain name. This string must be the same as one of the strings returned by <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistdomainsinsitea">DsListDomainsInSite</a> function.
     * @param {PWSTR} site Pointer to a null-terminated string that specifies the site name. This string is taken from the list of site names returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistsitesa">DsListSites</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppServers Pointer to a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that receives the list of servers in the domain. The returned structure must be freed using 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a> function.
     * @returns {Integer} If the function returns a list of servers, the return value is <b>NO_ERROR</b>. If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistserversfordomaininsitew
     * @since windows6.0.6000
     */
    static DsListServersForDomainInSiteW(hDs, domain, site, ppServers) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        domain := domain is String ? StrPtr(domain) : domain
        site := site is String ? StrPtr(site) : site

        result := DllCall("NTDSAPI.dll\DsListServersForDomainInSiteW", "ptr", hDs, "ptr", domain, "ptr", site, "ptr*", ppServers, "uint")
        return result
    }

    /**
     * The DsListInfoForServer function lists miscellaneous data for a server.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} server Pointer to a null-terminated string that specifies the server name. This name must be the same as one of the strings returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistserversfordomaininsitea">DsListServersForDomainInSite</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistserversinsitea">DsListServersInSite</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppInfo Pointer to a variable that receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that contains the server data. The returned structure must be deallocated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
     * 
     * The indexes of the array in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure indicate what data are contained by each array element. The following constants may be used to specify the desired index for a particular piece of data.
     * @returns {Integer} If the function returns server data, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistinfoforservera
     * @since windows6.0.6000
     */
    static DsListInfoForServerA(hDs, server, ppInfo) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        server := server is String ? StrPtr(server) : server

        result := DllCall("NTDSAPI.dll\DsListInfoForServerA", "ptr", hDs, "ptr", server, "ptr*", ppInfo, "uint")
        return result
    }

    /**
     * The DsListInfoForServer function lists miscellaneous data for a server.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} server Pointer to a null-terminated string that specifies the server name. This name must be the same as one of the strings returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistserversfordomaininsitea">DsListServersForDomainInSite</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dslistserversinsitea">DsListServersInSite</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppInfo Pointer to a variable that receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure that contains the server data. The returned structure must be deallocated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
     * 
     * The indexes of the array in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure indicate what data are contained by each array element. The following constants may be used to specify the desired index for a particular piece of data.
     * @returns {Integer} If the function returns server data, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistinfoforserverw
     * @since windows6.0.6000
     */
    static DsListInfoForServerW(hDs, server, ppInfo) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        server := server is String ? StrPtr(server) : server

        result := DllCall("NTDSAPI.dll\DsListInfoForServerW", "ptr", hDs, "ptr", server, "ptr*", ppInfo, "uint")
        return result
    }

    /**
     * The DsListRoles function lists roles recognized by the server.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTA>>} ppRoles Pointer to a variable that receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure containing the roles the server recognizes. The returned structure must be deallocated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
     * 
     * The indexes of the array in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure indicate what data are contained by each array element. The following constants may be used to specify the desired index for a particular piece of data.
     * @returns {Integer} If the function returns a list of roles, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * Individual name conversion errors are reported in the returned <a href="/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistrolesa
     * @since windows6.0.6000
     */
    static DsListRolesA(hDs, ppRoles) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs

        result := DllCall("NTDSAPI.dll\DsListRolesA", "ptr", hDs, "ptr*", ppRoles, "uint")
        return result
    }

    /**
     * The DsListRoles function lists roles recognized by the server.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Pointer<Pointer<DS_NAME_RESULTW>>} ppRoles Pointer to a variable that receives a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure containing the roles the server recognizes. The returned structure must be deallocated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreenameresulta">DsFreeNameResult</a>.
     * 
     * The indexes of the array in the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure indicate what data are contained by each array element. The following constants may be used to specify the desired index for a particular piece of data.
     * @returns {Integer} If the function returns a list of roles, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * 
     * Individual name conversion errors are reported in the returned <a href="/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_name_resulta">DS_NAME_RESULT</a> structure.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dslistrolesw
     * @since windows6.0.6000
     */
    static DsListRolesW(hDs, ppRoles) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs

        result := DllCall("NTDSAPI.dll\DsListRolesW", "ptr", hDs, "ptr*", ppRoles, "uint")
        return result
    }

    /**
     * Gets the communication cost between one site and one or more other sites.
     * @param {HANDLE} hDS A directory service handle.
     * @param {PWSTR} pwszFromSite Pointer to a null-terminated string that contains the relative distinguished name of the site the costs are measured from.
     * @param {Pointer<PWSTR>} rgwszToSites Contains an array of null-terminated string pointers that contain the relative distinguished names of the sites the costs are measured to.
     * @param {Integer} cToSites Contains the number of elements in the <i>rgwszToSites</i> array.
     * @param {Pointer<Pointer<DS_SITE_COST_INFO>>} prgSiteInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_site_cost_info">DS_SITE_COST_INFO</a> structures that receives the cost data. Each element in this array contains the cost data between the site identified by the <i>pwszFromSite</i> parameter and the site identified by the corresponding <i>rgwszToSites</i> element.
     * 
     * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsquerysitesfree">DsQuerySitesFree</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise.
     *        Possible error codes include values listed in the following list.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsquerysitesbycostw
     * @since windows6.0.6000
     */
    static DsQuerySitesByCostW(hDS, pwszFromSite, rgwszToSites, cToSites, prgSiteInfo) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        pwszFromSite := pwszFromSite is String ? StrPtr(pwszFromSite) : pwszFromSite

        result := DllCall("NTDSAPI.dll\DsQuerySitesByCostW", "ptr", hDS, "ptr", pwszFromSite, "ptr", rgwszToSites, "uint", cToSites, "uint", dwFlags, "ptr*", prgSiteInfo, "uint")
        return result
    }

    /**
     * Gets the communication cost between one site and one or more other sites.
     * @param {HANDLE} hDS A directory service handle.
     * @param {PSTR} pszFromSite Pointer to a null-terminated string that contains the relative distinguished name of the site the costs are measured from.
     * @param {Pointer<PSTR>} rgszToSites Contains an array of null-terminated string pointers that contain the relative distinguished names of the sites the costs are measured to.
     * @param {Integer} cToSites Contains the number of elements in the <i>rgwszToSites</i> array.
     * @param {Pointer<Pointer<DS_SITE_COST_INFO>>} prgSiteInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_site_cost_info">DS_SITE_COST_INFO</a> structures that receives the cost data. Each element in this array contains the cost data between the site identified by the <i>pwszFromSite</i> parameter and the site identified by the corresponding <i>rgwszToSites</i> element.
     * 
     * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsquerysitesfree">DsQuerySitesFree</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error code otherwise.
     *        Possible error codes include values listed in the following list.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsquerysitesbycosta
     * @since windows6.0.6000
     */
    static DsQuerySitesByCostA(hDS, pszFromSite, rgszToSites, cToSites, prgSiteInfo) {
        static dwFlags := 0 ;Reserved parameters must always be NULL

        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        pszFromSite := pszFromSite is String ? StrPtr(pszFromSite) : pszFromSite

        result := DllCall("NTDSAPI.dll\DsQuerySitesByCostA", "ptr", hDS, "ptr", pszFromSite, "ptr", rgszToSites, "uint", cToSites, "uint", dwFlags, "ptr*", prgSiteInfo, "uint")
        return result
    }

    /**
     * Frees the memory allocated by the DsQuerySitesByCost function.
     * @param {Pointer<DS_SITE_COST_INFO>} rgSiteInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_site_cost_info">DS_SITE_COST_INFO</a> structures allocated by a call to <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsquerysitesbycosta">DsQuerySitesByCost</a>.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsquerysitesfree
     * @since windows6.0.6000
     */
    static DsQuerySitesFree(rgSiteInfo) {
        DllCall("NTDSAPI.dll\DsQuerySitesFree", "ptr", rgSiteInfo)
    }

    /**
     * Converts GUIDs of directory service schema objects to their display names.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Integer} cGuids Indicates the number of elements in <i>rGuids</i>.
     * @param {Pointer<Guid>} rGuids Pointer to an array of <b>GUID</b> values for the objects to be mapped.
     * @param {Pointer<Pointer<DS_SCHEMA_GUID_MAPA>>} ppGuidMap Pointer to a variable that receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapa">DS_SCHEMA_GUID_MAP</a> structures that contain the display names of the objects in <i>rGuids</i>. This array must be deallocated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreeschemaguidmapa">DsFreeSchemaGuidMap</a>.
     * @returns {Integer} Returns a standard error code that includes the following values.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsmapschemaguidsa
     * @since windows6.0.6000
     */
    static DsMapSchemaGuidsA(hDs, cGuids, rGuids, ppGuidMap) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs

        result := DllCall("NTDSAPI.dll\DsMapSchemaGuidsA", "ptr", hDs, "uint", cGuids, "ptr", rGuids, "ptr*", ppGuidMap, "uint")
        return result
    }

    /**
     * Frees memory that the DsMapSchemaGuids function has allocated for a DS_SCHEMA_GUID_MAP structure.
     * @param {Pointer<DS_SCHEMA_GUID_MAPA>} pGuidMap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapa">DS_SCHEMA_GUID_MAP</a> structure to deallocate.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsfreeschemaguidmapa
     * @since windows6.0.6000
     */
    static DsFreeSchemaGuidMapA(pGuidMap) {
        DllCall("NTDSAPI.dll\DsFreeSchemaGuidMapA", "ptr", pGuidMap)
    }

    /**
     * Converts GUIDs of directory service schema objects to their display names.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Integer} cGuids Indicates the number of elements in <i>rGuids</i>.
     * @param {Pointer<Guid>} rGuids Pointer to an array of <b>GUID</b> values for the objects to be mapped.
     * @param {Pointer<Pointer<DS_SCHEMA_GUID_MAPW>>} ppGuidMap Pointer to a variable that receives a pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapa">DS_SCHEMA_GUID_MAP</a> structures that contain the display names of the objects in <i>rGuids</i>. This array must be deallocated using 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreeschemaguidmapa">DsFreeSchemaGuidMap</a>.
     * @returns {Integer} Returns a standard error code that includes the following values.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsmapschemaguidsw
     * @since windows6.0.6000
     */
    static DsMapSchemaGuidsW(hDs, cGuids, rGuids, ppGuidMap) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs

        result := DllCall("NTDSAPI.dll\DsMapSchemaGuidsW", "ptr", hDs, "uint", cGuids, "ptr", rGuids, "ptr*", ppGuidMap, "uint")
        return result
    }

    /**
     * Frees memory that the DsMapSchemaGuids function has allocated for a DS_SCHEMA_GUID_MAP structure.
     * @param {Pointer<DS_SCHEMA_GUID_MAPW>} pGuidMap Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_schema_guid_mapa">DS_SCHEMA_GUID_MAP</a> structure to deallocate.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsfreeschemaguidmapw
     * @since windows6.0.6000
     */
    static DsFreeSchemaGuidMapW(pGuidMap) {
        DllCall("NTDSAPI.dll\DsFreeSchemaGuidMapW", "ptr", pGuidMap)
    }

    /**
     * Retrieves data about the domain controllers in a domain.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} DomainName Pointer to a null-terminated string that specifies the domain name.
     * @param {Integer} InfoLevel 
     * @param {Pointer<Integer>} pcOut Pointer to a <b>DWORD</b> variable that receives the number of items returned in <i>ppInfo</i> array.
     * @param {Pointer<Pointer<Void>>} ppInfo Pointer to a pointer variable that receives an array of  <b>DS_DOMAIN_CONTROLLER_INFO_*</b> structures. The type of structures in this array is defined by the <i>InfoLevel</i> parameter. The caller must free this array, when it is no longer required, by using 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreedomaincontrollerinfoa">DsFreeDomainControllerInfo</a> function.
     * @returns {Integer} If the function returns domain controller data, the return value is <b>ERROR_SUCCESS</b>. If the caller does not have the privileges to access the server objects, the return value is <b>ERROR_SUCCESS</b>, but the <b>DS_DOMAIN_CONTROLLER_INFO</b> structures could be empty.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfoa
     * @since windows6.0.6000
     */
    static DsGetDomainControllerInfoA(hDs, DomainName, InfoLevel, pcOut, ppInfo) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName

        result := DllCall("NTDSAPI.dll\DsGetDomainControllerInfoA", "ptr", hDs, "ptr", DomainName, "uint", InfoLevel, "uint*", pcOut, "ptr*", ppInfo, "uint")
        return result
    }

    /**
     * Retrieves data about the domain controllers in a domain.
     * @param {HANDLE} hDs Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} DomainName Pointer to a null-terminated string that specifies the domain name.
     * @param {Integer} InfoLevel 
     * @param {Pointer<Integer>} pcOut Pointer to a <b>DWORD</b> variable that receives the number of items returned in <i>ppInfo</i> array.
     * @param {Pointer<Pointer<Void>>} ppInfo Pointer to a pointer variable that receives an array of  <b>DS_DOMAIN_CONTROLLER_INFO_*</b> structures. The type of structures in this array is defined by the <i>InfoLevel</i> parameter. The caller must free this array, when it is no longer required, by using 
     * the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsfreedomaincontrollerinfoa">DsFreeDomainControllerInfo</a> function.
     * @returns {Integer} If the function returns domain controller data, the return value is <b>ERROR_SUCCESS</b>. If the caller does not have the privileges to access the server objects, the return value is <b>ERROR_SUCCESS</b>, but the <b>DS_DOMAIN_CONTROLLER_INFO</b> structures could be empty.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsgetdomaincontrollerinfow
     * @since windows6.0.6000
     */
    static DsGetDomainControllerInfoW(hDs, DomainName, InfoLevel, pcOut, ppInfo) {
        hDs := hDs is Win32Handle ? NumGet(hDs, "ptr") : hDs
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName

        result := DllCall("NTDSAPI.dll\DsGetDomainControllerInfoW", "ptr", hDs, "ptr", DomainName, "uint", InfoLevel, "uint*", pcOut, "ptr*", ppInfo, "uint")
        return result
    }

    /**
     * The DsFreeDomainControllerInfo function frees memory that is allocated by DsGetDomainControllerInfo for data about the domain controllers in a domain.
     * @param {Integer} InfoLevel 
     * @param {Integer} cInfo Indicates the number of items in <i>pInfo</i>.
     * @param {Pointer<Void>} pInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_domain_controller_info_1a">DS_DOMAIN_CONTROLLER_INFO</a> structures to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsfreedomaincontrollerinfoa
     * @since windows6.0.6000
     */
    static DsFreeDomainControllerInfoA(InfoLevel, cInfo, pInfo) {
        DllCall("NTDSAPI.dll\DsFreeDomainControllerInfoA", "uint", InfoLevel, "uint", cInfo, "ptr", pInfo)
    }

    /**
     * The DsFreeDomainControllerInfo function frees memory that is allocated by DsGetDomainControllerInfo for data about the domain controllers in a domain.
     * @param {Integer} InfoLevel 
     * @param {Integer} cInfo Indicates the number of items in <i>pInfo</i>.
     * @param {Pointer<Void>} pInfo Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ns-ntdsapi-ds_domain_controller_info_1a">DS_DOMAIN_CONTROLLER_INFO</a> structures to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsfreedomaincontrollerinfow
     * @since windows6.0.6000
     */
    static DsFreeDomainControllerInfoW(InfoLevel, cInfo, pInfo) {
        DllCall("NTDSAPI.dll\DsFreeDomainControllerInfoW", "uint", InfoLevel, "uint", cInfo, "ptr", pInfo)
    }

    /**
     * Invokes the Knowledge Consistency Checker (KCC) to verify the replication topology.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a> function.
     * @param {Integer} TaskID Identifies the task that the KCC should execute. <b>DS_KCC_TASKID_UPDATE_TOPOLOGY</b> is the only currently supported value.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function performs its operation successfully, the return value is <b>ERROR_SUCCESS</b>. If the function fails, the return value can be one of the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicaconsistencycheck
     * @since windows6.0.6000
     */
    static DsReplicaConsistencyCheck(hDS, TaskID, dwFlags) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS

        result := DllCall("NTDSAPI.dll\DsReplicaConsistencyCheck", "ptr", hDS, "int", TaskID, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Verifies all objects for a naming context with a source.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a> function.
     * @param {PWSTR} NameContext Pointer to a null-terminated string that contains the distinguished name of the naming context.
     * @param {Pointer<Guid>} pUuidDsaSrc Pointer to a <b>UUID</b> value that contains the <b>objectGuid</b> of the directory system agent object.
     * @param {Integer} ulOptions Contains a set of flags that modify the behavior of the function. This can be zero or the following value.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error otherwise. Possible error values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicaverifyobjectsw
     * @since windows6.0.6000
     */
    static DsReplicaVerifyObjectsW(hDS, NameContext, pUuidDsaSrc, ulOptions) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext

        result := DllCall("NTDSAPI.dll\DsReplicaVerifyObjectsW", "ptr", hDS, "ptr", NameContext, "ptr", pUuidDsaSrc, "uint", ulOptions, "uint")
        return result
    }

    /**
     * Verifies all objects for a naming context with a source.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithspna">DsBindWithSpn</a> function.
     * @param {PSTR} NameContext Pointer to a null-terminated string that contains the distinguished name of the naming context.
     * @param {Pointer<Guid>} pUuidDsaSrc Pointer to a <b>UUID</b> value that contains the <b>objectGuid</b> of the directory system agent object.
     * @param {Integer} ulOptions Contains a set of flags that modify the behavior of the function. This can be zero or the following value.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error otherwise. Possible error values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicaverifyobjectsa
     * @since windows6.0.6000
     */
    static DsReplicaVerifyObjectsA(hDS, NameContext, pUuidDsaSrc, ulOptions) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        NameContext := NameContext is String ? StrPtr(NameContext) : NameContext

        result := DllCall("NTDSAPI.dll\DsReplicaVerifyObjectsA", "ptr", hDS, "ptr", NameContext, "ptr", pUuidDsaSrc, "uint", ulOptions, "uint")
        return result
    }

    /**
     * Retrieves replication state data from the directory service.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Integer} InfoType Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a> values that specifies the type of replication data to retrieve. This value also determines which type of structure is returned in <i>ppInfo</i>.
     * 
     * Only the following values are supported for this function. If other data types are required, the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> function must be used.
     * 
     * <a id="DS_REPL_INFO_NEIGHBORS"></a>
     * <a id="ds_repl_info_neighbors"></a>
     * @param {PWSTR} pszObject Pointer to a constant null-terminated Unicode string that identifies the object to retrieve replication data for. The meaning of this parameter depends on the value of the <i>InfoType</i> parameter. The following are possible value codes.
     * @param {Pointer<Guid>} puuidForSourceDsaObjGuid Pointer to a <b>GUID</b> value that identifies a specific replication source. If this parameter is not <b>NULL</b> and the <i>InfoType</i> parameter contains <b>DS_REPL_INFO_NEIGHBORS</b>, only neighbor data for the source corresponding to the nTDSDSA object with the given <b>objectGuid</b> in the directory is returned. This parameter is ignored if <b>NULL</b> or if the <i>InfoType</i> parameter is anything other than <b>DS_REPL_INFO_NEIGHBORS</b>.
     * @param {Pointer<Pointer<Void>>} ppInfo Address of a structure pointer that receives the requested data. The value of the <i>InfoType</i> parameter determines the format of this structure. For more information and list of possible <i>InfoType</i> values and the corresponding structure types, see <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a>.
     * 
     * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicafreeinfo">DsReplicaFreeInfo</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise.
     *       The following are possible error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicagetinfow
     * @since windows6.0.6000
     */
    static DsReplicaGetInfoW(hDS, InfoType, pszObject, puuidForSourceDsaObjGuid, ppInfo) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        pszObject := pszObject is String ? StrPtr(pszObject) : pszObject

        result := DllCall("NTDSAPI.dll\DsReplicaGetInfoW", "ptr", hDS, "int", InfoType, "ptr", pszObject, "ptr", puuidForSourceDsaObjGuid, "ptr*", ppInfo, "uint")
        return result
    }

    /**
     * Retrieves replication state data from the directory service. This function allows paging of results in cases where there are more than 1000 entries to retrieve.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {Integer} InfoType Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a> values that specifies the type of replication data to retrieve. This value also determines which type of structure is returned in <i>ppInfo</i>.
     * @param {PWSTR} pszObject Pointer to a constant null-terminated Unicode string that identifies the object to retrieve replication data for. The meaning of this parameter depends on the value of the <i>InfoType</i> parameter. The following are possible value codes.
     * @param {Pointer<Guid>} puuidForSourceDsaObjGuid Pointer to a <b>GUID</b> value that identifies a specific replication source. If this parameter is not <b>NULL</b> and the <i>InfoType</i> parameter contains <b>DS_REPL_INFO_NEIGHBORS</b>, only neighbor data for the source corresponding to the nTDSDSA object with the given <b>objectGuid</b> in the directory is returned. This parameter is ignored if <b>NULL</b> or if the <i>InfoType</i> parameter is anything other than <b>DS_REPL_INFO_NEIGHBORS</b>.
     * @param {PWSTR} pszAttributeName Pointer to a null-terminated Unicode string that contains the name of the specific attribute to retrieve replication data for.
     * @param {PWSTR} pszValue Pointer to a null-terminated Unicode string that contains the distinguished name value to match. If the requested attribute is a distinguished name type value, this function return the attributes that contain the specified value.
     * @param {Integer} dwFlags Contains a set of flags that modify the behavior of the function. This parameter can be zero or the following value.
     * @param {Integer} dwEnumerationContext Contains the index of the next entry to retrieve.  This parameter must be set to zero the first time this function is called.
     * @param {Pointer<Pointer<Void>>} ppInfo Address of a structure pointer that receives the requested data. The value of the <i>InfoType</i> parameter determines the format of this structure. For more information and a list of possible <i>InfoType</i> values and the corresponding structure types, see <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a>.
     * 
     * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicafreeinfo">DsReplicaFreeInfo</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise.
     *       The following are possible error codes.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicagetinfo2w
     * @since windows6.0.6000
     */
    static DsReplicaGetInfo2W(hDS, InfoType, pszObject, puuidForSourceDsaObjGuid, pszAttributeName, pszValue, dwFlags, dwEnumerationContext, ppInfo) {
        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        pszObject := pszObject is String ? StrPtr(pszObject) : pszObject
        pszAttributeName := pszAttributeName is String ? StrPtr(pszAttributeName) : pszAttributeName
        pszValue := pszValue is String ? StrPtr(pszValue) : pszValue

        result := DllCall("NTDSAPI.dll\DsReplicaGetInfo2W", "ptr", hDS, "int", InfoType, "ptr", pszObject, "ptr", puuidForSourceDsaObjGuid, "ptr", pszAttributeName, "ptr", pszValue, "uint", dwFlags, "uint", dwEnumerationContext, "ptr*", ppInfo, "uint")
        return result
    }

    /**
     * Frees the replication state data structure allocated by the DsReplicaGetInfo or DsReplicaGetInfo2 functions.
     * @param {Integer} InfoType Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/ne-ntdsapi-ds_repl_info_type">DS_REPL_INFO_TYPE</a> values that specifies the type of replication data structure  contained in <i>pInfo</i>. This must be the same value passed to the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow">DsReplicaGetInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> function when the structure was allocated.
     * @param {Pointer<Void>} pInfo Pointer to the replication data structure allocated by the <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfow">DsReplicaGetInfo</a> or <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsreplicagetinfo2w">DsReplicaGetInfo2</a> functions.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsreplicafreeinfo
     * @since windows6.0.6000
     */
    static DsReplicaFreeInfo(InfoType, pInfo) {
        DllCall("NTDSAPI.dll\DsReplicaFreeInfo", "int", InfoType, "ptr", pInfo)
    }

    /**
     * Retrieves the primary account security identifier (SID) of a security principal from one domain and adds it to the sIDHistory attribute of a security principal in another domain in a different forest.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} SrcDomain Pointer to a null-terminated string that specifies the name of the domain to query for the SID of <i>SrcPrincipal</i>.
     * 
     * If the source domain runs on  Windows Server operating systems, <i>SrcDomain</i> can be either a domain name system (DNS) name, for example, fabrikam.com, or a flat NetBIOS, for example, Fabrikam, name. DNS names should be used when possible.
     * @param {PWSTR} SrcPrincipal Pointer to a null-terminated string that specifies the name of a security principal, user or group, in the source domain. This name is a domain-relative Security Account Manager (SAM) name, for example: evacorets.
     * @param {PWSTR} SrcDomainController Pointer to a null-terminated string that specifies the name of the primary domain controller (PDC) Emulator in the source domain to use for secure retrieval of the source principal SID and audit generation. 
     * 
     * 
     * If this parameter is <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> will select the primary domain controller.
     * 
     * <i>SrcDomainController</i> can be either a DNS name or a flat NetBIOS name. DNS names should be used when possible.
     * @param {Pointer<Void>} SrcDomainCreds Contains an identity handle that represents the identity and credentials of a user with administrative rights in the source domain. To obtain this handle, call  <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>. This user must be a member of either the Administrators or the Domain Administrators group. If this call is made from a remote computer to the destination DC, then both the remote computer and the destination DC must support 128-bit encryption to privacy-protect the credentials. If 128-bit encryption is unavailable and <i>SrcDomainCreds</i> are provided, then the call must be made on the destination DC.
     * 
     * If this parameter is <b>NULL</b>, the credentials of the caller are used for access to the source domain.
     * @param {PWSTR} DstDomain Pointer to a null-terminated string that specifies the name of the destination domain in which <i>DstPrincipal</i> resides. This name can either be a DNS name, for example, fabrikam.com, or a NetBIOS name, for example, Fabrikam. The destination domain must run Windows 2000 native mode.
     * @param {PWSTR} DstPrincipal Pointer to a null-terminated string that specifies the name of a security principal, user or group, in the destination domain. This domain-relative SAM name identifies the principal whose <b>sIDHistory</b> attribute is updated with the SID of the <i>SrcPrincipal</i>.
     * @returns {Integer} Returns a Win32 error codes including the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsaddsidhistoryw
     * @since windows6.0.6000
     */
    static DsAddSidHistoryW(hDS, SrcDomain, SrcPrincipal, SrcDomainController, SrcDomainCreds, DstDomain, DstPrincipal) {
        static Flags := 0 ;Reserved parameters must always be NULL

        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        SrcDomain := SrcDomain is String ? StrPtr(SrcDomain) : SrcDomain
        SrcPrincipal := SrcPrincipal is String ? StrPtr(SrcPrincipal) : SrcPrincipal
        SrcDomainController := SrcDomainController is String ? StrPtr(SrcDomainController) : SrcDomainController
        DstDomain := DstDomain is String ? StrPtr(DstDomain) : DstDomain
        DstPrincipal := DstPrincipal is String ? StrPtr(DstPrincipal) : DstPrincipal

        result := DllCall("NTDSAPI.dll\DsAddSidHistoryW", "ptr", hDS, "uint", Flags, "ptr", SrcDomain, "ptr", SrcPrincipal, "ptr", SrcDomainController, "ptr", SrcDomainCreds, "ptr", DstDomain, "ptr", DstPrincipal, "uint")
        return result
    }

    /**
     * Retrieves the primary account security identifier (SID) of a security principal from one domain and adds it to the sIDHistory attribute of a security principal in another domain in a different forest.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} SrcDomain Pointer to a null-terminated string that specifies the name of the domain to query for the SID of <i>SrcPrincipal</i>.
     * 
     * If the source domain runs on  Windows Server operating systems, <i>SrcDomain</i> can be either a domain name system (DNS) name, for example, fabrikam.com, or a flat NetBIOS, for example, Fabrikam, name. DNS names should be used when possible.
     * @param {PSTR} SrcPrincipal Pointer to a null-terminated string that specifies the name of a security principal, user or group, in the source domain. This name is a domain-relative Security Account Manager (SAM) name, for example: evacorets.
     * @param {PSTR} SrcDomainController Pointer to a null-terminated string that specifies the name of the primary domain controller (PDC) Emulator in the source domain to use for secure retrieval of the source principal SID and audit generation. 
     * 
     * 
     * If this parameter is <b>NULL</b>, <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> will select the primary domain controller.
     * 
     * <i>SrcDomainController</i> can be either a DNS name or a flat NetBIOS name. DNS names should be used when possible.
     * @param {Pointer<Void>} SrcDomainCreds Contains an identity handle that represents the identity and credentials of a user with administrative rights in the source domain. To obtain this handle, call  <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsmakepasswordcredentialsa">DsMakePasswordCredentials</a>. This user must be a member of either the Administrators or the Domain Administrators group. If this call is made from a remote computer to the destination DC, then both the remote computer and the destination DC must support 128-bit encryption to privacy-protect the credentials. If 128-bit encryption is unavailable and <i>SrcDomainCreds</i> are provided, then the call must be made on the destination DC.
     * 
     * If this parameter is <b>NULL</b>, the credentials of the caller are used for access to the source domain.
     * @param {PSTR} DstDomain Pointer to a null-terminated string that specifies the name of the destination domain in which <i>DstPrincipal</i> resides. This name can either be a DNS name, for example, fabrikam.com, or a NetBIOS name, for example, Fabrikam. The destination domain must run Windows 2000 native mode.
     * @param {PSTR} DstPrincipal Pointer to a null-terminated string that specifies the name of a security principal, user or group, in the destination domain. This domain-relative SAM name identifies the principal whose <b>sIDHistory</b> attribute is updated with the SID of the <i>SrcPrincipal</i>.
     * @returns {Integer} Returns a Win32 error codes including the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsaddsidhistorya
     * @since windows6.0.6000
     */
    static DsAddSidHistoryA(hDS, SrcDomain, SrcPrincipal, SrcDomainController, SrcDomainCreds, DstDomain, DstPrincipal) {
        static Flags := 0 ;Reserved parameters must always be NULL

        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        SrcDomain := SrcDomain is String ? StrPtr(SrcDomain) : SrcDomain
        SrcPrincipal := SrcPrincipal is String ? StrPtr(SrcPrincipal) : SrcPrincipal
        SrcDomainController := SrcDomainController is String ? StrPtr(SrcDomainController) : SrcDomainController
        DstDomain := DstDomain is String ? StrPtr(DstDomain) : DstDomain
        DstPrincipal := DstPrincipal is String ? StrPtr(DstPrincipal) : DstPrincipal

        result := DllCall("NTDSAPI.dll\DsAddSidHistoryA", "ptr", hDS, "uint", Flags, "ptr", SrcDomain, "ptr", SrcPrincipal, "ptr", SrcDomainController, "ptr", SrcDomainCreds, "ptr", DstDomain, "ptr", DstPrincipal, "uint")
        return result
    }

    /**
     * Appends the objectSid and sidHistory attributes of SrcPrincipal to the sidHistory of DstPrincipal and then deletes SrcPrincipal, all in a single transaction.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PWSTR} SrcPrincipal Pointer to a null-terminated string that specifies the name of a security principal (user or group) in the source domain. This name is a domain-relative SAM name.
     * @param {PWSTR} DstPrincipal Pointer to a null-terminated string that specifies the name of a security principal (user or group) in the destination domain. This domain-relative SAM name identifies the principal whose <b>sidHistory</b> attribute will be updated with the SID of <i>SrcPrincipal</i>.
     * @returns {Integer} Returns a system or RPC error code including the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsinheritsecurityidentityw
     * @since windows6.0.6000
     */
    static DsInheritSecurityIdentityW(hDS, SrcPrincipal, DstPrincipal) {
        static Flags := 0 ;Reserved parameters must always be NULL

        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        SrcPrincipal := SrcPrincipal is String ? StrPtr(SrcPrincipal) : SrcPrincipal
        DstPrincipal := DstPrincipal is String ? StrPtr(DstPrincipal) : DstPrincipal

        result := DllCall("NTDSAPI.dll\DsInheritSecurityIdentityW", "ptr", hDS, "uint", Flags, "ptr", SrcPrincipal, "ptr", DstPrincipal, "uint")
        return result
    }

    /**
     * Appends the objectSid and sidHistory attributes of SrcPrincipal to the sidHistory of DstPrincipal and then deletes SrcPrincipal, all in a single transaction.
     * @param {HANDLE} hDS Contains a directory service handle obtained from either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbinda">DSBind</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/ntdsapi/nf-ntdsapi-dsbindwithcreda">DSBindWithCred</a> function.
     * @param {PSTR} SrcPrincipal Pointer to a null-terminated string that specifies the name of a security principal (user or group) in the source domain. This name is a domain-relative SAM name.
     * @param {PSTR} DstPrincipal Pointer to a null-terminated string that specifies the name of a security principal (user or group) in the destination domain. This domain-relative SAM name identifies the principal whose <b>sidHistory</b> attribute will be updated with the SID of <i>SrcPrincipal</i>.
     * @returns {Integer} Returns a system or RPC error code including the following.
     * @see https://docs.microsoft.com/windows/win32/api//ntdsapi/nf-ntdsapi-dsinheritsecurityidentitya
     * @since windows6.0.6000
     */
    static DsInheritSecurityIdentityA(hDS, SrcPrincipal, DstPrincipal) {
        static Flags := 0 ;Reserved parameters must always be NULL

        hDS := hDS is Win32Handle ? NumGet(hDS, "ptr") : hDS
        SrcPrincipal := SrcPrincipal is String ? StrPtr(SrcPrincipal) : SrcPrincipal
        DstPrincipal := DstPrincipal is String ? StrPtr(DstPrincipal) : DstPrincipal

        result := DllCall("NTDSAPI.dll\DsInheritSecurityIdentityA", "ptr", hDS, "uint", Flags, "ptr", SrcPrincipal, "ptr", DstPrincipal, "uint")
        return result
    }

    /**
     * Retrieves state data for the computer.
     * @param {PWSTR} lpServer Pointer to null-terminated Unicode string that contains the name of the computer on which to call the function. If this parameter is <b>NULL</b>, the local computer is used.
     * @param {Integer} InfoLevel Contains one of the <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/ne-dsrole-dsrole_primary_domain_info_level">DSROLE_PRIMARY_DOMAIN_INFO_LEVEL</a> values that specify the type of data to retrieve. This parameter also determines the format of the data supplied in <i>Buffer</i>.
     * @param {Pointer<Pointer<Integer>>} Buffer Pointer to the address of a buffer that receives the requested data. The format of this data depends on the value of the <i>InfoLevel</i> parameter.
     * 
     * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/dsrole/nf-dsrole-dsrolefreememory">DsRoleFreeMemory</a>.
     * @returns {Integer} If the function is successful, the return value is <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following values.
     * @see https://docs.microsoft.com/windows/win32/api//dsrole/nf-dsrole-dsrolegetprimarydomaininformation
     * @since windows6.0.6000
     */
    static DsRoleGetPrimaryDomainInformation(lpServer, InfoLevel, Buffer) {
        lpServer := lpServer is String ? StrPtr(lpServer) : lpServer

        result := DllCall("NETAPI32.dll\DsRoleGetPrimaryDomainInformation", "ptr", lpServer, "int", InfoLevel, "ptr*", Buffer, "uint")
        return result
    }

    /**
     * Frees memory allocated by the DsRoleGetPrimaryDomainInformation function.
     * @param {Pointer<Void>} Buffer Pointer to the buffer to be freed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dsrole/nf-dsrole-dsrolefreememory
     * @since windows6.0.6000
     */
    static DsRoleFreeMemory(Buffer) {
        DllCall("NETAPI32.dll\DsRoleFreeMemory", "ptr", Buffer)
    }

    /**
     * Returns the name of a domain controller in a specified domain.
     * @param {PSTR} ComputerName Pointer to a null-terminated string that specifies the name of the server to process this function. 
     *       Typically, this parameter is <b>NULL</b>, which indicates that the local computer is 
     *       used.
     * @param {PSTR} DomainName Pointer to a null-terminated string that specifies the name of the domain or application partition to 
     *        query. This name can either be a DNS style name, for example, fabrikam.com, or a flat-style name, for example, 
     *        Fabrikam. If a DNS style name is specified, the name may be specified with or without a trailing period.
     * 
     * If the <i>Flags</i> parameter contains the <b>DS_GC_SERVER_REQUIRED</b> 
     *        flag, <i>DomainName</i> must be the name of the forest. In this case, 
     *        <b>DsGetDcName</b> fails if <i>DomainName</i> 
     *        specifies a name that is not the forest root.
     * 
     * If the <i>Flags</i> parameter contains 
     *        the <b>DS_GC_SERVER_REQUIRED</b> flag and <i>DomainName</i> is 
     *        <b>NULL</b>, <b>DsGetDcName</b> attempts to 
     *        find a global catalog in the forest of the computer identified by <i>ComputerName</i>, which 
     *        is the local computer if <i>ComputerName</i> is <b>NULL</b>.
     * 
     * If <i>DomainName</i> is <b>NULL</b> and the 
     *        <i>Flags</i> parameter does not contain the <b>DS_GC_SERVER_REQUIRED</b> 
     *        flag, <i>ComputerName</i> is set to the default domain name of the primary domain of the 
     *        computer identified by <i>ComputerName</i>.
     * @param {Pointer<Guid>} DomainGuid Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that specifies the 
     *     <b>GUID</b> of the domain queried. If <i>DomainGuid</i> is not 
     *   <b>NULL</b> and the domain specified by <i>DomainName</i> or 
     *   <i>ComputerName</i> cannot be found, 
     *   <b>DsGetDcName</b> attempts to locate a domain controller in the 
     *       domain having the GUID specified by <i>DomainGuid</i>.
     * @param {PSTR} SiteName Pointer to a null-terminated string that specifies the name of the site where the returned domain 
     *       controller should physically exist. If this parameter is <b>NULL</b>, 
     *       <b>DsGetDcName</b> attempts to return a domain controller in the 
     *       site closest to the site of the computer specified by <i>ComputerName</i>. This parameter 
     *       should be <b>NULL</b>, by default.
     * @param {Integer} Flags Contains a set of flags that provide additional data used to process the request. This parameter can be a
     * @param {Pointer<Pointer<DOMAIN_CONTROLLER_INFOA>>} DomainControllerInfo Pointer to a <b>PDOMAIN_CONTROLLER_INFO</b> value that receives a pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/ns-dsgetdc-domain_controller_infoa">DOMAIN_CONTROLLER_INFO</a> structure that contains 
     *       data  about the domain controller selected. This structure is allocated by 
     *       <b>DsGetDcName</b>. The caller must free the structure using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function when it is no longer 
     *       required.
     * @returns {Integer} If the function returns domain controller data, the return value is 
     *        <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetdcnamea
     * @since windows6.0.6000
     */
    static DsGetDcNameA(ComputerName, DomainName, DomainGuid, SiteName, Flags, DomainControllerInfo) {
        ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        SiteName := SiteName is String ? StrPtr(SiteName) : SiteName

        result := DllCall("NETAPI32.dll\DsGetDcNameA", "ptr", ComputerName, "ptr", DomainName, "ptr", DomainGuid, "ptr", SiteName, "uint", Flags, "ptr*", DomainControllerInfo, "uint")
        return result
    }

    /**
     * Returns the name of a domain controller in a specified domain.
     * @param {PWSTR} ComputerName Pointer to a null-terminated string that specifies the name of the server to process this function. 
     *       Typically, this parameter is <b>NULL</b>, which indicates that the local computer is 
     *       used.
     * @param {PWSTR} DomainName Pointer to a null-terminated string that specifies the name of the domain or application partition to 
     *        query. This name can either be a DNS style name, for example, fabrikam.com, or a flat-style name, for example, 
     *        Fabrikam. If a DNS style name is specified, the name may be specified with or without a trailing period.
     * 
     * If the <i>Flags</i> parameter contains the <b>DS_GC_SERVER_REQUIRED</b> 
     *        flag, <i>DomainName</i> must be the name of the forest. In this case, 
     *        <b>DsGetDcName</b> fails if <i>DomainName</i> 
     *        specifies a name that is not the forest root.
     * 
     * If the <i>Flags</i> parameter contains 
     *        the <b>DS_GC_SERVER_REQUIRED</b> flag and <i>DomainName</i> is 
     *        <b>NULL</b>, <b>DsGetDcName</b> attempts to 
     *        find a global catalog in the forest of the computer identified by <i>ComputerName</i>, which 
     *        is the local computer if <i>ComputerName</i> is <b>NULL</b>.
     * 
     * If <i>DomainName</i> is <b>NULL</b> and the 
     *        <i>Flags</i> parameter does not contain the <b>DS_GC_SERVER_REQUIRED</b> 
     *        flag, <i>ComputerName</i> is set to the default domain name of the primary domain of the 
     *        computer identified by <i>ComputerName</i>.
     * @param {Pointer<Guid>} DomainGuid Pointer to a <a href="https://docs.microsoft.com/windows/win32/api/guiddef/ns-guiddef-guid">GUID</a> structure that specifies the 
     *     <b>GUID</b> of the domain queried. If <i>DomainGuid</i> is not 
     *   <b>NULL</b> and the domain specified by <i>DomainName</i> or 
     *   <i>ComputerName</i> cannot be found, 
     *   <b>DsGetDcName</b> attempts to locate a domain controller in the 
     *       domain having the GUID specified by <i>DomainGuid</i>.
     * @param {PWSTR} SiteName Pointer to a null-terminated string that specifies the name of the site where the returned domain 
     *       controller should physically exist. If this parameter is <b>NULL</b>, 
     *       <b>DsGetDcName</b> attempts to return a domain controller in the 
     *       site closest to the site of the computer specified by <i>ComputerName</i>. This parameter 
     *       should be <b>NULL</b>, by default.
     * @param {Integer} Flags Contains a set of flags that provide additional data used to process the request. This parameter can be a
     * @param {Pointer<Pointer<DOMAIN_CONTROLLER_INFOW>>} DomainControllerInfo Pointer to a <b>PDOMAIN_CONTROLLER_INFO</b> value that receives a pointer to a 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/ns-dsgetdc-domain_controller_infoa">DOMAIN_CONTROLLER_INFO</a> structure that contains 
     *       data  about the domain controller selected. This structure is allocated by 
     *       <b>DsGetDcName</b>. The caller must free the structure using the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function when it is no longer 
     *       required.
     * @returns {Integer} If the function returns domain controller data, the return value is 
     *        <b>ERROR_SUCCESS</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetdcnamew
     * @since windows6.0.6000
     */
    static DsGetDcNameW(ComputerName, DomainName, DomainGuid, SiteName, Flags, DomainControllerInfo) {
        ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName
        SiteName := SiteName is String ? StrPtr(SiteName) : SiteName

        result := DllCall("NETAPI32.dll\DsGetDcNameW", "ptr", ComputerName, "ptr", DomainName, "ptr", DomainGuid, "ptr", SiteName, "uint", Flags, "ptr*", DomainControllerInfo, "uint")
        return result
    }

    /**
     * The DsGetSiteName function returns the name of the site where a computer resides.
     * @param {PSTR} ComputerName Pointer to a null-terminated string that specifies the name of the server to send this function. A <b>NULL</b> implies the local computer.
     * @param {Pointer<PSTR>} SiteName Pointer to a variable that receives a pointer to a null-terminated string specifying the site location of this computer. This string is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @returns {Integer} If the function returns account information, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetsitenamea
     * @since windows6.0.6000
     */
    static DsGetSiteNameA(ComputerName, SiteName) {
        ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

        result := DllCall("NETAPI32.dll\DsGetSiteNameA", "ptr", ComputerName, "ptr", SiteName, "uint")
        return result
    }

    /**
     * The DsGetSiteName function returns the name of the site where a computer resides.
     * @param {PWSTR} ComputerName Pointer to a null-terminated string that specifies the name of the server to send this function. A <b>NULL</b> implies the local computer.
     * @param {Pointer<PWSTR>} SiteName Pointer to a variable that receives a pointer to a null-terminated string specifying the site location of this computer. This string is allocated by the system and must be freed using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @returns {Integer} If the function returns account information, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value can be one of the following error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetsitenamew
     * @since windows6.0.6000
     */
    static DsGetSiteNameW(ComputerName, SiteName) {
        ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

        result := DllCall("NETAPI32.dll\DsGetSiteNameW", "ptr", ComputerName, "ptr", SiteName, "uint")
        return result
    }

    /**
     * The DsValidateSubnetName function validates a subnet name in the form xxx.xxx.xxx.xxx/YY.
     * @param {PWSTR} SubnetName Pointer to a null-terminated string that specifies the name of the subnet to validate.
     * @returns {Integer} If the function returns account information, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is the following error code.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsvalidatesubnetnamew
     * @since windows6.0.6000
     */
    static DsValidateSubnetNameW(SubnetName) {
        SubnetName := SubnetName is String ? StrPtr(SubnetName) : SubnetName

        result := DllCall("NETAPI32.dll\DsValidateSubnetNameW", "ptr", SubnetName, "uint")
        return result
    }

    /**
     * The DsValidateSubnetName function validates a subnet name in the form xxx.xxx.xxx.xxx/YY.
     * @param {PSTR} SubnetName Pointer to a null-terminated string that specifies the name of the subnet to validate.
     * @returns {Integer} If the function returns account information, the return value is <b>NO_ERROR</b>.
     * 
     * If the function fails, the return value is the following error code.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsvalidatesubnetnamea
     * @since windows6.0.6000
     */
    static DsValidateSubnetNameA(SubnetName) {
        SubnetName := SubnetName is String ? StrPtr(SubnetName) : SubnetName

        result := DllCall("NETAPI32.dll\DsValidateSubnetNameA", "ptr", SubnetName, "uint")
        return result
    }

    /**
     * Obtains the site names corresponding to the specified addresses.
     * @param {PWSTR} ComputerName Pointer to a null-terminated string that specifies the name of the remote server to process this function. This parameter must be the name of a domain controller. A non-domain controller can call this function by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to find the domain controller.
     * @param {Integer} EntryCount Contains the number of elements in the <i>SocketAddresses</i> array.
     * @param {Pointer<SOCKET_ADDRESS>} SocketAddresses Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that contain the addresses to convert. Each address in this array must be of the type <b>AF_INET</b>. <i>EntryCount</i> contains the number of elements in this array.
     * @param {Pointer<Pointer<PWSTR>>} SiteNames Receives an array of null-terminated string pointers that contain the site names for the addresses. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address does not map to any known site or if the address entry is not of the proper form. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 or RPC error otherwise. The following list lists possible error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsaddresstositenamesw
     * @since windows6.0.6000
     */
    static DsAddressToSiteNamesW(ComputerName, EntryCount, SocketAddresses, SiteNames) {
        ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

        result := DllCall("NETAPI32.dll\DsAddressToSiteNamesW", "ptr", ComputerName, "uint", EntryCount, "ptr", SocketAddresses, "ptr*", SiteNames, "uint")
        return result
    }

    /**
     * Obtains the site names corresponding to the specified addresses.
     * @param {PSTR} ComputerName Pointer to a null-terminated string that specifies the name of the remote server to process this function. This parameter must be the name of a domain controller. A non-domain controller can call this function by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to find the domain controller.
     * @param {Integer} EntryCount Contains the number of elements in the <i>SocketAddresses</i> array.
     * @param {Pointer<SOCKET_ADDRESS>} SocketAddresses Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that contain the addresses to convert. Each address in this array must be of the type <b>AF_INET</b>. <i>EntryCount</i> contains the number of elements in this array.
     * @param {Pointer<Pointer<PSTR>>} SiteNames Receives an array of null-terminated string pointers that contain the site names for the addresses. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address does not map to any known site or if the address entry is not of the proper form. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 or RPC error otherwise. The following list lists possible error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsaddresstositenamesa
     * @since windows6.0.6000
     */
    static DsAddressToSiteNamesA(ComputerName, EntryCount, SocketAddresses, SiteNames) {
        ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

        result := DllCall("NETAPI32.dll\DsAddressToSiteNamesA", "ptr", ComputerName, "uint", EntryCount, "ptr", SocketAddresses, "ptr*", SiteNames, "uint")
        return result
    }

    /**
     * Obtains the site and subnet names corresponding to the addresses specified.
     * @param {PWSTR} ComputerName Pointer to a null-terminated string that specifies the name of the remote server to process this function. This parameter must be the name of a domain controller. A non-domain controller can call this function by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to find the domain controller.
     * @param {Integer} EntryCount Contains the number of elements in the <i>SocketAddresses</i> array.
     * @param {Pointer<SOCKET_ADDRESS>} SocketAddresses Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that contain the addresses to convert. Each address in this array must be of the type <b>AF_INET</b>. <i>EntryCount</i> contains the number of elements in this array.
     * @param {Pointer<Pointer<PWSTR>>} SiteNames Receives an array of null-terminated string pointers that contain the site names for the addresses. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address does not map to any known site or if the address entry is not of the proper form. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @param {Pointer<Pointer<PWSTR>>} SubnetNames Receives an array of null-terminated string pointers that contain the subnet names used to perform the address to site name mappings. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address to site name mapping was not determined or if no subnet was used to perform the
     *         corresponding address to site mapping. The latter will be the case when there is exactly
     *         one site in the enterprise with no subnet objects mapped to it. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 or RPC error otherwise. The following are possible error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsaddresstositenamesexw
     * @since windows6.0.6000
     */
    static DsAddressToSiteNamesExW(ComputerName, EntryCount, SocketAddresses, SiteNames, SubnetNames) {
        ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

        result := DllCall("NETAPI32.dll\DsAddressToSiteNamesExW", "ptr", ComputerName, "uint", EntryCount, "ptr", SocketAddresses, "ptr*", SiteNames, "ptr*", SubnetNames, "uint")
        return result
    }

    /**
     * Obtains the site and subnet names corresponding to the addresses specified.
     * @param {PSTR} ComputerName Pointer to a null-terminated string that specifies the name of the remote server to process this function. This parameter must be the name of a domain controller. A non-domain controller can call this function by calling 
     * <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnamea">DsGetDcName</a> to find the domain controller.
     * @param {Integer} EntryCount Contains the number of elements in the <i>SocketAddresses</i> array.
     * @param {Pointer<SOCKET_ADDRESS>} SocketAddresses Contains an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that contain the addresses to convert. Each address in this array must be of the type <b>AF_INET</b>. <i>EntryCount</i> contains the number of elements in this array.
     * @param {Pointer<Pointer<PSTR>>} SiteNames Receives an array of null-terminated string pointers that contain the site names for the addresses. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address does not map to any known site or if the address entry is not of the proper form. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @param {Pointer<Pointer<PSTR>>} SubnetNames Receives an array of null-terminated string pointers that contain the subnet names used to perform the address to site name mappings. Each element in this array corresponds to the same element in the <i>SocketAddresses</i> array. An element is <b>NULL</b> if the corresponding address to site name mapping was not determined or if no subnet was used to perform the
     *         corresponding address to site mapping. The latter will be the case when there is exactly
     *         one site in the enterprise with no subnet objects mapped to it. The caller must free this array when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 or RPC error otherwise. The following are possible error codes.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsaddresstositenamesexa
     * @since windows6.0.6000
     */
    static DsAddressToSiteNamesExA(ComputerName, EntryCount, SocketAddresses, SiteNames, SubnetNames) {
        ComputerName := ComputerName is String ? StrPtr(ComputerName) : ComputerName

        result := DllCall("NETAPI32.dll\DsAddressToSiteNamesExA", "ptr", ComputerName, "uint", EntryCount, "ptr", SocketAddresses, "ptr*", SiteNames, "ptr*", SubnetNames, "uint")
        return result
    }

    /**
     * Obtains domain trust data for a specified domain.
     * @param {PWSTR} ServerName Pointer to a null-terminated string that specifies the name of a computer in the domain to obtain the trust information for. If this parameter is <b>NULL</b>, the name of the local computer is used. The caller must be an authenticated user in this domain.
     * 
     * If this computer is a domain controller, this function returns the trust data immediately. If this computer is not a domain controller, this function  obtains the trust data  from cached data if the cached data is not expired. If the cached data is expired, this function obtains the trust data from a domain controller in the domain that this computer is a member of and updates the cache. The cached data automatically expires after five minutes.
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<DS_DOMAIN_TRUSTSW>>} Domains Pointer to a <b>PDS_DOMAIN_TRUSTS</b> value that receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/ns-dsgetdc-ds_domain_trustsa">DS_DOMAIN_TRUSTS</a> structures. Each structure in this array contains trust data about a domain. The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @param {Pointer<Integer>} DomainCount Pointer to a <b>ULONG</b> value that receives the number of elements returned in the <i>Domains</i> array.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error code otherwise. Possible error codes include those listed in the following list.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsw
     * @since windows6.0.6000
     */
    static DsEnumerateDomainTrustsW(ServerName, Flags, Domains, DomainCount) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

        result := DllCall("NETAPI32.dll\DsEnumerateDomainTrustsW", "ptr", ServerName, "uint", Flags, "ptr*", Domains, "uint*", DomainCount, "uint")
        return result
    }

    /**
     * Obtains domain trust data for a specified domain.
     * @param {PSTR} ServerName Pointer to a null-terminated string that specifies the name of a computer in the domain to obtain the trust information for. If this parameter is <b>NULL</b>, the name of the local computer is used. The caller must be an authenticated user in this domain.
     * 
     * If this computer is a domain controller, this function returns the trust data immediately. If this computer is not a domain controller, this function  obtains the trust data  from cached data if the cached data is not expired. If the cached data is expired, this function obtains the trust data from a domain controller in the domain that this computer is a member of and updates the cache. The cached data automatically expires after five minutes.
     * @param {Integer} Flags 
     * @param {Pointer<Pointer<DS_DOMAIN_TRUSTSA>>} Domains Pointer to a <b>PDS_DOMAIN_TRUSTS</b> value that receives an array of <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/ns-dsgetdc-ds_domain_trustsa">DS_DOMAIN_TRUSTS</a> structures. Each structure in this array contains trust data about a domain. The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @param {Pointer<Integer>} DomainCount Pointer to a <b>ULONG</b> value that receives the number of elements returned in the <i>Domains</i> array.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 error code otherwise. Possible error codes include those listed in the following list.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsenumeratedomaintrustsa
     * @since windows6.0.6000
     */
    static DsEnumerateDomainTrustsA(ServerName, Flags, Domains, DomainCount) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

        result := DllCall("NETAPI32.dll\DsEnumerateDomainTrustsA", "ptr", ServerName, "uint", Flags, "ptr*", Domains, "uint*", DomainCount, "uint")
        return result
    }

    /**
     * Obtains forest trust data for a specified domain.
     * @param {PWSTR} ServerName Contains the name of the domain controller that <b>DsGetForestTrustInformationW</b> is connected to remotely.
     *         The caller must be an authenticated user on this server.
     *         If this parameter is <b>NULL</b>, the local server is used.
     * @param {PWSTR} TrustedDomainName Contains the NETBIOS or DNS name of the trusted domain that the forest trust data
     *         is to be retrieved for.  This domain must have  the
     *         <b>TRUST_ATTRIBUTE_FOREST_TRANSITIVE</b> trust attribute. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-trusted_domain_information_ex">TRUSTED_DOMAIN_INFORMATION_EX</a>.
     * 
     * If this parameter is <b>NULL</b>, the forest trust
     *         data for the domain hosted by <i>ServerName</i> is retrieved.
     * @param {Integer} Flags Contains a set of flags that modify the behavior of this function. This can be zero or the following value.
     * @param {Pointer<Pointer<LSA_FOREST_TRUST_INFORMATION>>} ForestTrustInfo Pointer to an <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/ns-ntsecapi-lsa_forest_trust_information">LSA_FOREST_TRUST_INFORMATION</a> structure pointer that receives the forest trust data that describes the namespaces claimed by the
     *         domain specified by <i>TrustedDomainName</i>. The <b>Time</b>member of all returned records will be zero.
     * 
     * The caller must free this structure when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Win32 error code otherwise. Possible error codes include the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetforesttrustinformationw
     * @since windows6.0.6000
     */
    static DsGetForestTrustInformationW(ServerName, TrustedDomainName, Flags, ForestTrustInfo) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        TrustedDomainName := TrustedDomainName is String ? StrPtr(TrustedDomainName) : TrustedDomainName

        result := DllCall("NETAPI32.dll\DsGetForestTrustInformationW", "ptr", ServerName, "ptr", TrustedDomainName, "uint", Flags, "ptr*", ForestTrustInfo, "uint")
        return result
    }

    /**
     * Merges the changes from a new forest trust data structure with an old forest trust data structure.
     * @param {PWSTR} DomainName Pointer to a null-terminated Unicode string that specifies the trusted domain to  update.
     * @param {Pointer<LSA_FOREST_TRUST_INFORMATION>} NewForestTrustInfo Pointer to an <b>LSA_FOREST_TRUST_INFORMATION</b> structure that contains the new forest trust data to be merged.
     *         The <b>Flags</b> and <b>Time</b> members of the entries are ignored.
     * @param {Pointer<LSA_FOREST_TRUST_INFORMATION>} OldForestTrustInfo Pointer to an <b>LSA_FOREST_TRUST_INFORMATION</b> structure that contains the old forest trust data to be merged.
     *         This parameter may be <b>NULL</b> if no records exist.
     * @param {Pointer<Pointer<LSA_FOREST_TRUST_INFORMATION>>} MergedForestTrustInfo Pointer to an <b>LSA_FOREST_TRUST_INFORMATION</b> structure pointer that receives the merged forest trust data.
     * 
     * The caller must free this structure when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @returns {Integer} Returns <b>NO_ERROR</b> if successful or a Windows error code otherwise.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsmergeforesttrustinformationw
     * @since windows6.0.6000
     */
    static DsMergeForestTrustInformationW(DomainName, NewForestTrustInfo, OldForestTrustInfo, MergedForestTrustInfo) {
        DomainName := DomainName is String ? StrPtr(DomainName) : DomainName

        result := DllCall("NETAPI32.dll\DsMergeForestTrustInformationW", "ptr", DomainName, "ptr", NewForestTrustInfo, "ptr", OldForestTrustInfo, "ptr*", MergedForestTrustInfo, "uint")
        return result
    }

    /**
     * The DsGetDcSiteCoverage function returns the site names of all sites covered by a domain controller.
     * @param {PWSTR} ServerName The null-terminated string value that specifies the name of the remote domain controller.
     * @param {Pointer<Integer>} EntryCount Pointer to a <b>ULONG</b> value that receives  the number of sites covered by the domain controller.
     * @param {Pointer<Pointer<PWSTR>>} SiteNames Pointer to an array of pointers to null-terminated strings that receives the site names. To free the returned buffer, call the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @returns {Integer} This function returns DSGETDCAPI DWORD.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetdcsitecoveragew
     * @since windows6.0.6000
     */
    static DsGetDcSiteCoverageW(ServerName, EntryCount, SiteNames) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

        result := DllCall("NETAPI32.dll\DsGetDcSiteCoverageW", "ptr", ServerName, "uint*", EntryCount, "ptr*", SiteNames, "uint")
        return result
    }

    /**
     * The DsGetDcSiteCoverage function returns the site names of all sites covered by a domain controller.
     * @param {PSTR} ServerName The null-terminated string value that specifies the name of the remote domain controller.
     * @param {Pointer<Integer>} EntryCount Pointer to a <b>ULONG</b> value that receives  the number of sites covered by the domain controller.
     * @param {Pointer<Pointer<PSTR>>} SiteNames Pointer to an array of pointers to null-terminated strings that receives the site names. To free the returned buffer, call the <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a> function.
     * @returns {Integer} This function returns DSGETDCAPI DWORD.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetdcsitecoveragea
     * @since windows6.0.6000
     */
    static DsGetDcSiteCoverageA(ServerName, EntryCount, SiteNames) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName

        result := DllCall("NETAPI32.dll\DsGetDcSiteCoverageA", "ptr", ServerName, "uint*", EntryCount, "ptr*", SiteNames, "uint")
        return result
    }

    /**
     * The DsDeregisterDnsHostRecords function deletes DNS entries, except for type A records registered by a domain controller. Only an administrator, account operator, or server operator may call this function.
     * @param {PWSTR} ServerName The null-terminated string that specifies the name of the remote domain controller. Can be set to <b>NULL</b> if the calling application is running on the domain controller being updated.
     * @param {PWSTR} DnsDomainName The null-terminated string that specifies the DNS domain name of the domain occupied by the domain controller. It is unnecessary for this to be a domain hosted by this domain controller. If <b>NULL</b>, the <i>DnsHostName</i> with the leftmost label removed is specified.
     * @param {Pointer<Guid>} DomainGuid Pointer to the Domain GUID of the domain. If <b>NULL</b>, GUID specific names are not removed.
     * @param {Pointer<Guid>} DsaGuid Pointer to the GUID of the <b>NTDS-DSA</b> object to be deleted. If <b>NULL</b>, <b>NTDS-DSA</b> specific names are not removed.
     * @param {PWSTR} DnsHostName Pointer to the null-terminated string that specifies the DNS host name of the domain controller whose DNS records are being deleted.
     * @returns {Integer} This function returns DSGETDCAPI DWORD.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsderegisterdnshostrecordsw
     * @since windows6.0.6000
     */
    static DsDeregisterDnsHostRecordsW(ServerName, DnsDomainName, DomainGuid, DsaGuid, DnsHostName) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
        DnsHostName := DnsHostName is String ? StrPtr(DnsHostName) : DnsHostName

        result := DllCall("NETAPI32.dll\DsDeregisterDnsHostRecordsW", "ptr", ServerName, "ptr", DnsDomainName, "ptr", DomainGuid, "ptr", DsaGuid, "ptr", DnsHostName, "uint")
        return result
    }

    /**
     * The DsDeregisterDnsHostRecords function deletes DNS entries, except for type A records registered by a domain controller. Only an administrator, account operator, or server operator may call this function.
     * @param {PSTR} ServerName The null-terminated string that specifies the name of the remote domain controller. Can be set to <b>NULL</b> if the calling application is running on the domain controller being updated.
     * @param {PSTR} DnsDomainName The null-terminated string that specifies the DNS domain name of the domain occupied by the domain controller. It is unnecessary for this to be a domain hosted by this domain controller. If <b>NULL</b>, the <i>DnsHostName</i> with the leftmost label removed is specified.
     * @param {Pointer<Guid>} DomainGuid Pointer to the Domain GUID of the domain. If <b>NULL</b>, GUID specific names are not removed.
     * @param {Pointer<Guid>} DsaGuid Pointer to the GUID of the <b>NTDS-DSA</b> object to be deleted. If <b>NULL</b>, <b>NTDS-DSA</b> specific names are not removed.
     * @param {PSTR} DnsHostName Pointer to the null-terminated string that specifies the DNS host name of the domain controller whose DNS records are being deleted.
     * @returns {Integer} This function returns DSGETDCAPI DWORD.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsderegisterdnshostrecordsa
     * @since windows6.0.6000
     */
    static DsDeregisterDnsHostRecordsA(ServerName, DnsDomainName, DomainGuid, DsaGuid, DnsHostName) {
        ServerName := ServerName is String ? StrPtr(ServerName) : ServerName
        DnsDomainName := DnsDomainName is String ? StrPtr(DnsDomainName) : DnsDomainName
        DnsHostName := DnsHostName is String ? StrPtr(DnsHostName) : DnsHostName

        result := DllCall("NETAPI32.dll\DsDeregisterDnsHostRecordsA", "ptr", ServerName, "ptr", DnsDomainName, "ptr", DomainGuid, "ptr", DsaGuid, "ptr", DnsHostName, "uint")
        return result
    }

    /**
     * Opens a new domain controller enumeration operation.
     * @param {PWSTR} DnsName Pointer to a null-terminated string that contains the domain naming system (DNS) name of the domain to enumerate the domain controllers for. This parameter cannot be <b>NULL</b>.
     * @param {Integer} OptionFlags 
     * @param {PWSTR} SiteName Pointer to a null-terminated string that contains the name of site the client is in. This parameter is optional and may be <b>NULL</b>.
     * @param {Pointer<Guid>} DomainGuid Pointer to a <b>GUID</b> value that contains the identifier of the domain specified by <i>DnsName</i>.
     *         This identifier is used to handle the case of a renamed domain.  If this
     *         value is specified and the domain specified in <i>DnsName</i> is renamed, this function attempts to enumerate domain controllers in the domain that contains the specified identifier. This parameter is optional and may be <b>NULL</b>.
     * @param {PWSTR} DnsForestName Pointer to a null-terminated string that contains the name of the forest that contains the <i>DnsName</i> domain.  This value is used in conjunction with <i>DomainGuid</i>to enumerate the domain controllers if the  domain has been renamed. This parameter is optional and may be <b>NULL</b>.
     * @param {Integer} DcFlags 
     * @param {Pointer<HANDLE>} RetGetDcContext Pointer to a <b>HANDLE</b> value that receives the domain controller enumeration context handle. This handle is used with the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnexta">DsGetDcNext</a> function to identify the domain controller enumeration operation. This handle is passed to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcclosew">DsGetDcClose</a> to close the domain controller enumeration operation.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise. Possible error values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetdcopenw
     * @since windows6.0.6000
     */
    static DsGetDcOpenW(DnsName, OptionFlags, SiteName, DomainGuid, DnsForestName, DcFlags, RetGetDcContext) {
        DnsName := DnsName is String ? StrPtr(DnsName) : DnsName
        SiteName := SiteName is String ? StrPtr(SiteName) : SiteName
        DnsForestName := DnsForestName is String ? StrPtr(DnsForestName) : DnsForestName

        result := DllCall("NETAPI32.dll\DsGetDcOpenW", "ptr", DnsName, "uint", OptionFlags, "ptr", SiteName, "ptr", DomainGuid, "ptr", DnsForestName, "uint", DcFlags, "ptr", RetGetDcContext, "uint")
        return result
    }

    /**
     * Opens a new domain controller enumeration operation.
     * @param {PSTR} DnsName Pointer to a null-terminated string that contains the domain naming system (DNS) name of the domain to enumerate the domain controllers for. This parameter cannot be <b>NULL</b>.
     * @param {Integer} OptionFlags 
     * @param {PSTR} SiteName Pointer to a null-terminated string that contains the name of site the client is in. This parameter is optional and may be <b>NULL</b>.
     * @param {Pointer<Guid>} DomainGuid Pointer to a <b>GUID</b> value that contains the identifier of the domain specified by <i>DnsName</i>.
     *         This identifier is used to handle the case of a renamed domain.  If this
     *         value is specified and the domain specified in <i>DnsName</i> is renamed, this function attempts to enumerate domain controllers in the domain that contains the specified identifier. This parameter is optional and may be <b>NULL</b>.
     * @param {PSTR} DnsForestName Pointer to a null-terminated string that contains the name of the forest that contains the <i>DnsName</i> domain.  This value is used in conjunction with <i>DomainGuid</i>to enumerate the domain controllers if the  domain has been renamed. This parameter is optional and may be <b>NULL</b>.
     * @param {Integer} DcFlags 
     * @param {Pointer<HANDLE>} RetGetDcContext Pointer to a <b>HANDLE</b> value that receives the domain controller enumeration context handle. This handle is used with the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcnexta">DsGetDcNext</a> function to identify the domain controller enumeration operation. This handle is passed to <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcclosew">DsGetDcClose</a> to close the domain controller enumeration operation.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise. Possible error values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetdcopena
     * @since windows6.0.6000
     */
    static DsGetDcOpenA(DnsName, OptionFlags, SiteName, DomainGuid, DnsForestName, DcFlags, RetGetDcContext) {
        DnsName := DnsName is String ? StrPtr(DnsName) : DnsName
        SiteName := SiteName is String ? StrPtr(SiteName) : SiteName
        DnsForestName := DnsForestName is String ? StrPtr(DnsForestName) : DnsForestName

        result := DllCall("NETAPI32.dll\DsGetDcOpenA", "ptr", DnsName, "uint", OptionFlags, "ptr", SiteName, "ptr", DomainGuid, "ptr", DnsForestName, "uint", DcFlags, "ptr", RetGetDcContext, "uint")
        return result
    }

    /**
     * Retrieves the next domain controller in a domain controller enumeration operation.
     * @param {HANDLE} GetDcContextHandle Contains the domain controller enumeration context handle provided by the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> function.
     * @param {Pointer<Integer>} SockAddressCount Pointer to a <b>ULONG</b> value that receives the number of elements in the <i>SockAddresses</i> array.
     *         If this parameter is <b>NULL</b>, socket addresses are not retrieved.
     * @param {Pointer<Pointer<SOCKET_ADDRESS>>} SockAddresses Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that receives the socket address data for the domain controller. <i>SockAddressCount</i> receives the number of elements in this array.
     * 
     * All returned addresses will be of type <b>AF_INET</b> or <b>AF_INET6</b>.
     *         The <b>sin_port</b> member contains the port from the server record.
     *             A port of 0 indicates no port is available from DNS.
     * 
     * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * 
     * This parameter is ignored if <i>SockAddressCount</i> is <b>NULL</b>.
     * @param {Pointer<PWSTR>} DnsHostName Pointer to a string pointer that receives the DNS name of the domain controller.
     *         This parameter receives <b>NULL</b> if no host name is known. The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise. Possible error values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetdcnextw
     * @since windows6.0.6000
     */
    static DsGetDcNextW(GetDcContextHandle, SockAddressCount, SockAddresses, DnsHostName) {
        GetDcContextHandle := GetDcContextHandle is Win32Handle ? NumGet(GetDcContextHandle, "ptr") : GetDcContextHandle

        result := DllCall("NETAPI32.dll\DsGetDcNextW", "ptr", GetDcContextHandle, "uint*", SockAddressCount, "ptr*", SockAddresses, "ptr", DnsHostName, "uint")
        return result
    }

    /**
     * Retrieves the next domain controller in a domain controller enumeration operation.
     * @param {HANDLE} GetDcContextHandle Contains the domain controller enumeration context handle provided by the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> function.
     * @param {Pointer<Integer>} SockAddressCount Pointer to a <b>ULONG</b> value that receives the number of elements in the <i>SockAddresses</i> array.
     *         If this parameter is <b>NULL</b>, socket addresses are not retrieved.
     * @param {Pointer<Pointer<SOCKET_ADDRESS>>} SockAddresses Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/ws2def/ns-ws2def-socket_address">SOCKET_ADDRESS</a> structures that receives the socket address data for the domain controller. <i>SockAddressCount</i> receives the number of elements in this array.
     * 
     * All returned addresses will be of type <b>AF_INET</b> or <b>AF_INET6</b>.
     *         The <b>sin_port</b> member contains the port from the server record.
     *             A port of 0 indicates no port is available from DNS.
     * 
     * The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a>.
     * 
     * This parameter is ignored if <i>SockAddressCount</i> is <b>NULL</b>.
     * @param {Pointer<PSTR>} DnsHostName Pointer to a string pointer that receives the DNS name of the domain controller.
     *         This parameter receives <b>NULL</b> if no host name is known. The caller must free this memory when it is no longer required by calling <a href="https://docs.microsoft.com/windows/desktop/api/lmapibuf/nf-lmapibuf-netapibufferfree">NetApiBufferFree</a>.
     * @returns {Integer} Returns <b>ERROR_SUCCESS</b> if successful or a Win32 or RPC error otherwise. Possible error values include the following.
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetdcnexta
     * @since windows6.0.6000
     */
    static DsGetDcNextA(GetDcContextHandle, SockAddressCount, SockAddresses, DnsHostName) {
        GetDcContextHandle := GetDcContextHandle is Win32Handle ? NumGet(GetDcContextHandle, "ptr") : GetDcContextHandle

        result := DllCall("NETAPI32.dll\DsGetDcNextA", "ptr", GetDcContextHandle, "uint*", SockAddressCount, "ptr*", SockAddresses, "ptr", DnsHostName, "uint")
        return result
    }

    /**
     * Closes a domain controller enumeration operation.
     * @param {HANDLE} GetDcContextHandle Contains the domain controller enumeration context handle provided by the <a href="https://docs.microsoft.com/windows/desktop/api/dsgetdc/nf-dsgetdc-dsgetdcopena">DsGetDcOpen</a> function.
     * @returns {String} Nothing - always returns an empty string
     * @see https://docs.microsoft.com/windows/win32/api//dsgetdc/nf-dsgetdc-dsgetdcclosew
     * @since windows6.0.6000
     */
    static DsGetDcCloseW(GetDcContextHandle) {
        GetDcContextHandle := GetDcContextHandle is Win32Handle ? NumGet(GetDcContextHandle, "ptr") : GetDcContextHandle

        DllCall("NETAPI32.dll\DsGetDcCloseW", "ptr", GetDcContextHandle)
    }

;@endregion Methods
}
