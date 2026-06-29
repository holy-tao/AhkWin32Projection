#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Networking.ActiveDirectory
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global WM_ADSPROP_NOTIFY_PAGEINIT := 2125

/**
 * @type {Integer (UInt32)}
 */
export global WM_ADSPROP_NOTIFY_PAGEHWND := 2126

/**
 * @type {Integer (UInt32)}
 */
export global WM_ADSPROP_NOTIFY_CHANGE := 2127

/**
 * @type {Integer (UInt32)}
 */
export global WM_ADSPROP_NOTIFY_APPLY := 2128

/**
 * @type {Integer (UInt32)}
 */
export global WM_ADSPROP_NOTIFY_SETFOCUS := 2129

/**
 * @type {Integer (UInt32)}
 */
export global WM_ADSPROP_NOTIFY_FOREGROUND := 2130

/**
 * @type {Integer (UInt32)}
 */
export global WM_ADSPROP_NOTIFY_EXIT := 2131

/**
 * @type {Integer (UInt32)}
 */
export global WM_ADSPROP_NOTIFY_ERROR := 2134

/**
 * @type {Guid}
 */
export global CLSID_CommonQuery := Guid("{83bc5ec0-6f2a-11d0-a1c4-00aa00c16e65}")

/**
 * @type {Integer (UInt64)}
 */
export global QUERYFORM_CHANGESFORMLIST := 1

/**
 * @type {Integer (UInt64)}
 */
export global QUERYFORM_CHANGESOPTFORMLIST := 2

/**
 * @type {Integer (UInt32)}
 */
export global CQFF_NOGLOBALPAGES := 1

/**
 * @type {Integer (UInt32)}
 */
export global CQFF_ISOPTIONAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global CQPM_INITIALIZE := 1

/**
 * @type {Integer (UInt32)}
 */
export global CQPM_RELEASE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CQPM_ENABLE := 3

/**
 * @type {Integer (UInt32)}
 */
export global CQPM_GETPARAMETERS := 5

/**
 * @type {Integer (UInt32)}
 */
export global CQPM_CLEARFORM := 6

/**
 * @type {Integer (UInt32)}
 */
export global CQPM_PERSIST := 7

/**
 * @type {Integer (UInt32)}
 */
export global CQPM_HELP := 8

/**
 * @type {Integer (UInt32)}
 */
export global CQPM_SETDEFAULTPARAMETERS := 9

/**
 * @type {Integer (UInt32)}
 */
export global CQPM_HANDLERSPECIFIC := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_OKCANCEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_DEFAULTFORM := 2

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_SINGLESELECT := 4

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_LOADQUERY := 8

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_REMOVESCOPES := 16

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_REMOVEFORMS := 32

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_ISSUEONOPEN := 64

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_SHOWOPTIONAL := 128

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_SAVEQUERYONOK := 512

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_HIDEMENUS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_HIDESEARCHUI := 2048

/**
 * @type {Integer (UInt32)}
 */
export global OQWF_PARAMISPROPERTYBAG := 2147483648

/**
 * @type {Guid}
 */
export global CLSID_DsAdminCreateObj := Guid("{e301a009-f901-11d2-82b9-00c04f68928b}")

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NEWOBJ_CTX_PRECOMMIT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NEWOBJ_CTX_COMMIT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NEWOBJ_CTX_POSTCOMMIT := 3

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NEWOBJ_CTX_CLEANUP := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NOTIFY_DEL := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NOTIFY_REN := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NOTIFY_MOV := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NOTIFY_PROP := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NOTIFY_FLAG_ADDITIONAL_DATA := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSA_NOTIFY_FLAG_FORCE_ADDITIONAL_DATA := 1

/**
 * @type {Guid}
 */
export global CLSID_MicrosoftDS := Guid("{fe1290f0-cfbd-11cf-a330-00aa00c16e65}")

/**
 * @type {Guid}
 */
export global CLSID_DsPropertyPages := Guid("{0d45d530-764b-11d0-a1ca-00aa00c16e65}")

/**
 * @type {Guid}
 */
export global CLSID_DsDomainTreeBrowser := Guid("{1698790a-e2b4-11d0-b0b1-00c04fd8dca6}")

/**
 * @type {Guid}
 */
export global CLSID_DsDisplaySpecifier := Guid("{1ab4a8c0-6a0b-11d2-ad49-00c04fa31a86}")

/**
 * @type {Guid}
 */
export global CLSID_DsFolderProperties := Guid("{9e51e0d0-6e0f-11d2-9601-00c04fa31a86}")

/**
 * @type {Integer (UInt32)}
 */
export global DSOBJECT_ISCONTAINER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSOBJECT_READONLYPAGES := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DSPROVIDER_UNUSED_0 := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSPROVIDER_UNUSED_1 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSPROVIDER_UNUSED_2 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSPROVIDER_UNUSED_3 := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSPROVIDER_ADVANCED := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSPROVIDER_AD_LDS := 32

/**
 * @type {String}
 */
export global CFSTR_DSOBJECTNAMES := "DsObjectNames"

/**
 * @type {String}
 */
export global CFSTR_DS_DISPLAY_SPEC_OPTIONS := "DsDisplaySpecOptions"

/**
 * @type {String}
 */
export global CFSTR_DSDISPLAYSPECOPTIONS := "DsDisplaySpecOptions"

/**
 * @type {String}
 */
export global DS_PROP_SHELL_PREFIX := "shell"

/**
 * @type {String}
 */
export global DS_PROP_ADMIN_PREFIX := "admin"

/**
 * @type {Integer (UInt32)}
 */
export global DSDSOF_HASUSERANDSERVERINFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSDSOF_SIMPLEAUTHENTICATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSDSOF_DONTSIGNSEAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSDSOF_DSAVAILABLE := 1073741824

/**
 * @type {String}
 */
export global CFSTR_DSPROPERTYPAGEINFO := "DsPropPageInfo"

/**
 * @type {String}
 */
export global DSPROP_ATTRCHANGED_MSG := "DsPropAttrChanged"

/**
 * @type {Integer (UInt32)}
 */
export global DBDTF_RETURNFQDN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DBDTF_RETURNMIXEDDOMAINS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DBDTF_RETURNEXTERNAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global DBDTF_RETURNINBOUND := 8

/**
 * @type {Integer (UInt32)}
 */
export global DBDTF_RETURNINOUTBOUND := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSSSF_SIMPLEAUTHENTICATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSSSF_DONTSIGNSEAL := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSSSF_DSAVAILABLE := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DSGIF_ISNORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global DSGIF_ISOPEN := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSGIF_ISDISABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSGIF_ISMASK := 15

/**
 * @type {Integer (UInt32)}
 */
export global DSGIF_GETDEFAULTICON := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSGIF_DEFAULTISCONTAINER := 32

/**
 * @type {Integer (UInt32)}
 */
export global DSICCF_IGNORETREATASLEAF := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSECAF_NOTLISTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSCCIF_HASWIZARDDIALOG := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSCCIF_HASWIZARDPRIMARYPAGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_NOBUTTONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_NOLINES := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_NOLINESATROOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_CHECKBOXES := 256

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_NOROOT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_INCLUDEHIDDEN := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_EXPANDONOPEN := 262144

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_ENTIREDIRECTORY := 589824

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_RETURN_FORMAT := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_HASCREDENTIALS := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_IGNORETREATASLEAF := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_SIMPLEAUTHENTICATE := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_RETURNOBJECTCLASS := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global DSBI_DONTSIGNSEAL := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global DSB_MAX_DISPLAYNAME_CHARS := 64

/**
 * @type {Integer (UInt32)}
 */
export global DSBF_STATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSBF_ICONLOCATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSBF_DISPLAYNAME := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSBS_CHECKED := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSBS_HIDDEN := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSBS_ROOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSBM_QUERYINSERTW := 100

/**
 * @type {Integer (UInt32)}
 */
export global DSBM_QUERYINSERTA := 101

/**
 * @type {Integer (UInt32)}
 */
export global DSBM_QUERYINSERT := 100

/**
 * @type {Integer (UInt32)}
 */
export global DSBM_CHANGEIMAGESTATE := 102

/**
 * @type {Integer (UInt32)}
 */
export global DSBM_HELP := 103

/**
 * @type {Integer (UInt32)}
 */
export global DSBM_CONTEXTMENU := 104

/**
 * @type {Integer (UInt32)}
 */
export global DSBID_BANNER := 256

/**
 * @type {Integer (UInt32)}
 */
export global DSBID_CONTAINERLIST := 257

/**
 * @type {Integer (UInt32)}
 */
export global DS_FORCE_REDISCOVERY := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_DIRECTORY_SERVICE_REQUIRED := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_DIRECTORY_SERVICE_PREFERRED := 32

/**
 * @type {Integer (UInt32)}
 */
export global DS_GC_SERVER_REQUIRED := 64

/**
 * @type {Integer (UInt32)}
 */
export global DS_PDC_REQUIRED := 128

/**
 * @type {Integer (UInt32)}
 */
export global DS_BACKGROUND_ONLY := 256

/**
 * @type {Integer (UInt32)}
 */
export global DS_IP_REQUIRED := 512

/**
 * @type {Integer (UInt32)}
 */
export global DS_KDC_REQUIRED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DS_TIMESERV_REQUIRED := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DS_WRITABLE_REQUIRED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DS_GOOD_TIMESERV_PREFERRED := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DS_AVOID_SELF := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DS_ONLY_LDAP_NEEDED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DS_IS_FLAT_NAME := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DS_IS_DNS_NAME := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DS_TRY_NEXTCLOSEST_SITE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global DS_DIRECTORY_SERVICE_6_REQUIRED := 524288

/**
 * @type {Integer (UInt32)}
 */
export global DS_WEB_SERVICE_REQUIRED := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global DS_DIRECTORY_SERVICE_8_REQUIRED := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global DS_DIRECTORY_SERVICE_9_REQUIRED := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global DS_DIRECTORY_SERVICE_10_REQUIRED := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global DS_KEY_LIST_SUPPORT_REQUIRED := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global DS_DIRECTORY_SERVICE_13_REQUIRED := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global DS_RETURN_DNS_NAME := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global DS_RETURN_FLAT_NAME := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DS_PDC_FLAG := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_GC_FLAG := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_LDAP_FLAG := 8

/**
 * @type {Integer (UInt32)}
 */
export global DS_DS_FLAG := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_KDC_FLAG := 32

/**
 * @type {Integer (UInt32)}
 */
export global DS_TIMESERV_FLAG := 64

/**
 * @type {Integer (UInt32)}
 */
export global DS_CLOSEST_FLAG := 128

/**
 * @type {Integer (UInt32)}
 */
export global DS_WRITABLE_FLAG := 256

/**
 * @type {Integer (UInt32)}
 */
export global DS_GOOD_TIMESERV_FLAG := 512

/**
 * @type {Integer (UInt32)}
 */
export global DS_NDNC_FLAG := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DS_SELECT_SECRET_DOMAIN_6_FLAG := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DS_FULL_SECRET_DOMAIN_6_FLAG := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DS_WS_FLAG := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DS_DS_8_FLAG := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DS_DS_9_FLAG := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DS_DS_10_FLAG := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DS_KEY_LIST_FLAG := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DS_DS_13_FLAG := 262144

/**
 * @type {Integer (UInt32)}
 */
export global DS_PING_FLAGS := 1048575

/**
 * @type {Integer (UInt32)}
 */
export global DS_DNS_CONTROLLER_FLAG := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global DS_DNS_DOMAIN_FLAG := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global DS_DNS_FOREST_FLAG := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global DS_DOMAIN_IN_FOREST := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_DOMAIN_DIRECT_OUTBOUND := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_DOMAIN_TREE_ROOT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_DOMAIN_PRIMARY := 8

/**
 * @type {Integer (UInt32)}
 */
export global DS_DOMAIN_NATIVE_MODE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_DOMAIN_DIRECT_INBOUND := 32

/**
 * @type {Integer (UInt32)}
 */
export global DS_GFTI_UPDATE_TDO := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_GFTI_VALID_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_ONLY_DO_SITE_NAME := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_NOTIFY_AFTER_SITE_RECORDS := 2

/**
 * @type {Guid}
 */
export global CLSID_DsQuery := Guid("{8a23e65e-31c2-11d0-891c-00a024ab2dbb}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindObjects := Guid("{83ee3fe1-57d9-11d0-b932-00a024ab2dbb}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindPeople := Guid("{83ee3fe2-57d9-11d0-b932-00a024ab2dbb}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindPrinter := Guid("{b577f070-7ee2-11d0-913f-00aa00c16e65}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindComputer := Guid("{16006700-87ad-11d0-9140-00aa00c16e65}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindVolume := Guid("{c1b3cbf1-886a-11d0-9140-00aa00c16e65}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindContainer := Guid("{c1b3cbf2-886a-11d0-9140-00aa00c16e65}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindAdvanced := Guid("{83ee3fe3-57d9-11d0-b932-00a024ab2dbb}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindDomainController := Guid("{538c7b7e-d25e-11d0-9742-00a0c906af45}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindWriteableDomainController := Guid("{7cbef079-aa84-444b-bc70-68e41283eabc}")

/**
 * @type {Guid}
 */
export global CLSID_DsFindFrsMembers := Guid("{94ce4b18-b3d3-11d1-b9b4-00c04fd8d5b0}")

/**
 * @type {Integer (UInt32)}
 */
export global DSQPF_NOSAVE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSQPF_SAVELOCATION := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSQPF_SHOWHIDDENOBJECTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSQPF_ENABLEADMINFEATURES := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSQPF_ENABLEADVANCEDFEATURES := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSQPF_HASCREDENTIALS := 32

/**
 * @type {Integer (UInt32)}
 */
export global DSQPF_NOCHOOSECOLUMNS := 64

/**
 * @type {String}
 */
export global CFSTR_DSQUERYPARAMS := "DsQueryParameters"

/**
 * @type {String}
 */
export global CFSTR_DSQUERYSCOPE := "DsQueryScope"

/**
 * @type {Integer (UInt32)}
 */
export global DSQPM_GETCLASSLIST := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global DSQPM_HELPTOPICS := 268435457

/**
 * @type {Integer (UInt32)}
 */
export global DSROLE_PRIMARY_DS_RUNNING := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSROLE_PRIMARY_DS_MIXED_MODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSROLE_UPGRADE_IN_PROGRESS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSROLE_PRIMARY_DS_READONLY := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSROLE_PRIMARY_DOMAIN_GUID_PRESENT := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global ADS_ATTR_CLEAR := 1

/**
 * @type {Integer (UInt32)}
 */
export global ADS_ATTR_UPDATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global ADS_ATTR_APPEND := 3

/**
 * @type {Integer (UInt32)}
 */
export global ADS_ATTR_DELETE := 4

/**
 * @type {Integer (UInt32)}
 */
export global ADS_EXT_MINEXTDISPID := 1

/**
 * @type {Integer (UInt32)}
 */
export global ADS_EXT_MAXEXTDISPID := 16777215

/**
 * @type {Integer (UInt32)}
 */
export global ADS_EXT_INITCREDENTIALS := 1

/**
 * @type {Integer (UInt32)}
 */
export global ADS_EXT_INITIALIZE_COMPLETE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN2000 := 0

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN2003_WITH_MIXED_DOMAINS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN2003 := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN2008 := 3

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN2008R2 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN2012 := 5

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN2012R2 := 6

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN2016 := 7

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN2025 := 10

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_LONGHORN := 3

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN7 := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WIN8 := 5

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WINBLUE := 6

/**
 * @type {Integer (UInt32)}
 */
export global DS_BEHAVIOR_WINTHRESHOLD := 7

/**
 * @type {String}
 */
export global DS_SYNCED_EVENT_NAME := "NTDSInitialSyncsCompleted"

/**
 * @type {String}
 */
export global DS_SYNCED_EVENT_NAME_W := "NTDSInitialSyncsCompleted"

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_OPEN := 0

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_CREATE_CHILD := 1

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_DELETE_CHILD := 2

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_LIST := 4

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_SELF := 8

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_READ_PROP := 16

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_WRITE_PROP := 32

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_DELETE_TREE := 64

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_LIST_OBJECT := 128

/**
 * @type {Integer (UInt32)}
 */
export global ACTRL_DS_CONTROL_ACCESS := 256

/**
 * @type {Integer (UInt32)}
 */
export global NTDSAPI_BIND_ALLOW_DELEGATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global NTDSAPI_BIND_FIND_BINDING := 2

/**
 * @type {Integer (UInt32)}
 */
export global NTDSAPI_BIND_FORCE_KERBEROS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_ASYNCHRONOUS_OPERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_WRITEABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_PERIODIC := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_INTERSITE_MESSAGING := 8

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_FULL := 32

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_URGENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_NO_DISCARD := 128

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_FORCE := 256

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_ADD_REFERENCE := 512

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_NEVER_COMPLETED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_TWO_WAY := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_NEVER_NOTIFY := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_INITIAL := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_USE_COMPRESSION := 16384

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_ABANDONED := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_SELECT_SECRETS := 32768

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_INITIAL_IN_PROGRESS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_PARTIAL_ATTRIBUTE_SET := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_REQUEUE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_NOTIFICATION := 524288

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_ASYNCHRONOUS_REPLICA := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_CRITICAL := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_FULL_IN_PROGRESS := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_PREEMPTED := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNC_NONGC_RO_REPLICA := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_ASYNCHRONOUS_OPERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_WRITEABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_INITIAL := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_PERIODIC := 8

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_INTERSITE_MESSAGING := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_ASYNCHRONOUS_REPLICA := 32

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_DISABLE_NOTIFICATION := 64

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_DISABLE_PERIODIC := 128

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_USE_COMPRESSION := 256

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_NEVER_NOTIFY := 512

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_TWO_WAY := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_CRITICAL := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_SELECT_SECRETS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPADD_NONGC_RO_REPLICA := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPDEL_ASYNCHRONOUS_OPERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPDEL_WRITEABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPDEL_INTERSITE_MESSAGING := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPDEL_IGNORE_ERRORS := 8

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPDEL_LOCAL_ONLY := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPDEL_NO_SOURCE := 32

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPDEL_REF_OK := 64

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPMOD_ASYNCHRONOUS_OPERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPMOD_WRITEABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPMOD_UPDATE_FLAGS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPMOD_UPDATE_INSTANCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPMOD_UPDATE_ADDRESS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPMOD_UPDATE_SCHEDULE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPMOD_UPDATE_RESULT := 8

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPMOD_UPDATE_TRANSPORT := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPUPD_ASYNCHRONOUS_OPERATION := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPUPD_WRITEABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPUPD_ADD_REFERENCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPUPD_DELETE_REFERENCE := 8

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPUPD_REFERENCE_GCSPN := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_INSTANCETYPE_IS_NC_HEAD := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_INSTANCETYPE_NC_IS_WRITEABLE := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_INSTANCETYPE_NC_COMING := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_INSTANCETYPE_NC_GOING := 32

/**
 * @type {Integer (UInt32)}
 */
export global NTDSDSA_OPT_IS_GC := 1

/**
 * @type {Integer (UInt32)}
 */
export global NTDSDSA_OPT_DISABLE_INBOUND_REPL := 2

/**
 * @type {Integer (UInt32)}
 */
export global NTDSDSA_OPT_DISABLE_OUTBOUND_REPL := 4

/**
 * @type {Integer (UInt32)}
 */
export global NTDSDSA_OPT_DISABLE_NTDSCONN_XLATE := 8

/**
 * @type {Integer (UInt32)}
 */
export global NTDSDSA_OPT_DISABLE_SPN_REGISTRATION := 16

/**
 * @type {Integer (UInt32)}
 */
export global NTDSDSA_OPT_GENERATE_OWN_TOPO := 32

/**
 * @type {Integer (UInt32)}
 */
export global NTDSDSA_OPT_BLOCK_RPC := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_OPT_IS_GENERATED := 1

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_OPT_TWOWAY_SYNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_OPT_OVERRIDE_NOTIFY_DEFAULT := 4

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_OPT_USE_NOTIFY := 8

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_OPT_DISABLE_INTERSITE_COMPRESSION := 16

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_OPT_USER_OWNED_SCHEDULE := 32

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_OPT_RODC_TOPOLOGY := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_NO_REASON := 0

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_GC_TOPOLOGY := 1

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_RING_TOPOLOGY := 2

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_MINIMIZE_HOPS_TOPOLOGY := 4

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_STALE_SERVERS_TOPOLOGY := 8

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_OSCILLATING_CONNECTION_TOPOLOGY := 16

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_INTERSITE_GC_TOPOLOGY := 32

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_INTERSITE_TOPOLOGY := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_SERVER_FAILOVER_TOPOLOGY := 128

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_SITE_FAILOVER_TOPOLOGY := 256

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_KCC_REDUNDANT_SERVER_TOPOLOGY := 512

/**
 * @type {Integer (UInt32)}
 */
export global FRSCONN_PRIORITY_MASK := 1879048192

/**
 * @type {Integer (UInt32)}
 */
export global FRSCONN_MAX_PRIORITY := 8

/**
 * @type {Integer (UInt32)}
 */
export global NTDSCONN_OPT_IGNORE_SCHEDULE_MASK := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_IS_AUTO_TOPOLOGY_DISABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_IS_TOPL_CLEANUP_DISABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_IS_TOPL_MIN_HOPS_DISABLED := 4

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_IS_TOPL_DETECT_STALE_DISABLED := 8

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_IS_INTER_SITE_AUTO_TOPOLOGY_DISABLED := 16

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_IS_GROUP_CACHING_ENABLED := 32

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_FORCE_KCC_WHISTLER_BEHAVIOR := 64

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_FORCE_KCC_W2K_ELECTION := 128

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_IS_RAND_BH_SELECTION_DISABLED := 256

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_IS_SCHEDULE_HASHING_ENABLED := 512

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_IS_REDUNDANT_SERVER_TOPOLOGY_ENABLED := 1024

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_W2K3_IGNORE_SCHEDULES := 2048

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_OPT_W2K3_BRIDGES_REQUIRED := 4096

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSETTINGS_DEFAULT_SERVER_REDUNDANCY := 2

/**
 * @type {Integer (UInt32)}
 */
export global NTDSTRANSPORT_OPT_IGNORE_SCHEDULES := 1

/**
 * @type {Integer (UInt32)}
 */
export global NTDSTRANSPORT_OPT_BRIDGES_REQUIRED := 2

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSITECONN_OPT_USE_NOTIFY := 1

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSITECONN_OPT_TWOWAY_SYNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSITECONN_OPT_DISABLE_COMPRESSION := 4

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSITELINK_OPT_USE_NOTIFY := 1

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSITELINK_OPT_TWOWAY_SYNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global NTDSSITELINK_OPT_DISABLE_COMPRESSION := 4

/**
 * @type {String}
 */
export global GUID_USERS_CONTAINER_A := "a9d1ca15768811d1aded00c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_COMPUTRS_CONTAINER_A := "aa312825768811d1aded00c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_SYSTEMS_CONTAINER_A := "ab1d30f3768811d1aded00c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_DOMAIN_CONTROLLERS_CONTAINER_A := "a361b2ffffd211d1aa4b00c04fd7d83a"

/**
 * @type {String}
 */
export global GUID_INFRASTRUCTURE_CONTAINER_A := "2fbac1870ade11d297c400c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_DELETED_OBJECTS_CONTAINER_A := "18e2ea80684f11d2b9aa00c04f79f805"

/**
 * @type {String}
 */
export global GUID_LOSTANDFOUND_CONTAINER_A := "ab8153b7768811d1aded00c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_FOREIGNSECURITYPRINCIPALS_CONTAINER_A := "22b70c67d56e4efb91e9300fca3dc1aa"

/**
 * @type {String}
 */
export global GUID_PROGRAM_DATA_CONTAINER_A := "09460c08ae1e4a4ea0f64aee7daa1e5a"

/**
 * @type {String}
 */
export global GUID_MICROSOFT_PROGRAM_DATA_CONTAINER_A := "f4be92a4c777485e878e9421d53087db"

/**
 * @type {String}
 */
export global GUID_NTDS_QUOTAS_CONTAINER_A := "6227f0af1fc2410d8e3bb10615bb5b0f"

/**
 * @type {String}
 */
export global GUID_USERS_CONTAINER_W := "a9d1ca15768811d1aded00c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_COMPUTRS_CONTAINER_W := "aa312825768811d1aded00c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_SYSTEMS_CONTAINER_W := "ab1d30f3768811d1aded00c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_DOMAIN_CONTROLLERS_CONTAINER_W := "a361b2ffffd211d1aa4b00c04fd7d83a"

/**
 * @type {String}
 */
export global GUID_INFRASTRUCTURE_CONTAINER_W := "2fbac1870ade11d297c400c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_DELETED_OBJECTS_CONTAINER_W := "18e2ea80684f11d2b9aa00c04f79f805"

/**
 * @type {String}
 */
export global GUID_LOSTANDFOUND_CONTAINER_W := "ab8153b7768811d1aded00c04fd8d5cd"

/**
 * @type {String}
 */
export global GUID_FOREIGNSECURITYPRINCIPALS_CONTAINER_W := "22b70c67d56e4efb91e9300fca3dc1aa"

/**
 * @type {String}
 */
export global GUID_PROGRAM_DATA_CONTAINER_W := "09460c08ae1e4a4ea0f64aee7daa1e5a"

/**
 * @type {String}
 */
export global GUID_MICROSOFT_PROGRAM_DATA_CONTAINER_W := "f4be92a4c777485e878e9421d53087db"

/**
 * @type {String}
 */
export global GUID_NTDS_QUOTAS_CONTAINER_W := "6227f0af1fc2410d8e3bb10615bb5b0f"

/**
 * @type {String}
 */
export global GUID_MANAGED_SERVICE_ACCOUNTS_CONTAINER_W := "1EB93889E40C45DF9F0C64D23BBB6237"

/**
 * @type {String}
 */
export global GUID_KEYS_CONTAINER_W := "683A24E2E8164BD3AF86AC3C2CF3F981"

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNCALL_NO_OPTIONS := 0

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNCALL_ABORT_IF_SERVER_UNAVAILABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNCALL_SYNC_ADJACENT_SERVERS_ONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNCALL_ID_SERVERS_BY_DN := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNCALL_DO_NOT_SYNC := 8

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNCALL_SKIP_INITIAL_CHECK := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNCALL_PUSH_CHANGES_OUTWARD := 32

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPSYNCALL_CROSS_SITE_BOUNDARIES := 64

/**
 * @type {Integer (UInt32)}
 */
export global DS_LIST_DSA_OBJECT_FOR_SERVER := 0

/**
 * @type {Integer (UInt32)}
 */
export global DS_LIST_DNS_HOST_NAME_FOR_SERVER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_LIST_ACCOUNT_OBJECT_FOR_SERVER := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_ROLE_SCHEMA_OWNER := 0

/**
 * @type {Integer (UInt32)}
 */
export global DS_ROLE_DOMAIN_OWNER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_ROLE_PDC_OWNER := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_ROLE_RID_OWNER := 3

/**
 * @type {Integer (UInt32)}
 */
export global DS_ROLE_INFRASTRUCTURE_OWNER := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_SCHEMA_GUID_NOT_FOUND := 0

/**
 * @type {Integer (UInt32)}
 */
export global DS_SCHEMA_GUID_ATTR := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_SCHEMA_GUID_ATTR_SET := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_SCHEMA_GUID_CLASS := 3

/**
 * @type {Integer (UInt32)}
 */
export global DS_SCHEMA_GUID_CONTROL_RIGHT := 4

/**
 * @type {Integer (UInt32)}
 */
export global DS_KCC_FLAG_ASYNC_OP := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_KCC_FLAG_DAMPED := 2

/**
 * @type {Integer (UInt32)}
 */
export global DS_EXIST_ADVISORY_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_INFO_FLAG_IMPROVE_LINKED_ATTRS := 1

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_WRITEABLE := 16

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_SYNC_ON_STARTUP := 32

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_DO_SCHEDULED_SYNCS := 64

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_USE_ASYNC_INTERSITE_TRANSPORT := 128

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_TWO_WAY_SYNC := 512

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_NONGC_RO_REPLICA := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_RETURN_OBJECT_PARENTS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_SELECT_SECRETS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_FULL_SYNC_IN_PROGRESS := 65536

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_FULL_SYNC_NEXT_PACKET := 131072

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_GCSPN := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_NEVER_SYNCED := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_PREEMPTED := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_IGNORE_CHANGE_NOTIFICATIONS := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_DISABLE_SCHEDULED_SYNC := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_COMPRESS_CHANGES := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_NO_CHANGE_NOTIFICATIONS := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global DS_REPL_NBR_PARTIAL_ATTRIBUTE_SET := 1073741824

/**
 * @type {String}
 */
export global ADAM_SCP_SITE_NAME_STRING := "site:"

/**
 * @type {String}
 */
export global ADAM_SCP_SITE_NAME_STRING_W := "site:"

/**
 * @type {String}
 */
export global ADAM_SCP_PARTITION_STRING := "partition:"

/**
 * @type {String}
 */
export global ADAM_SCP_PARTITION_STRING_W := "partition:"

/**
 * @type {String}
 */
export global ADAM_SCP_INSTANCE_NAME_STRING := "instance:"

/**
 * @type {String}
 */
export global ADAM_SCP_INSTANCE_NAME_STRING_W := "instance:"

/**
 * @type {String}
 */
export global ADAM_SCP_FSMO_STRING := "fsmo:"

/**
 * @type {String}
 */
export global ADAM_SCP_FSMO_STRING_W := "fsmo:"

/**
 * @type {String}
 */
export global ADAM_SCP_FSMO_NAMING_STRING := "naming"

/**
 * @type {String}
 */
export global ADAM_SCP_FSMO_NAMING_STRING_W := "naming"

/**
 * @type {String}
 */
export global ADAM_SCP_FSMO_SCHEMA_STRING := "schema"

/**
 * @type {String}
 */
export global ADAM_SCP_FSMO_SCHEMA_STRING_W := "schema"

/**
 * @type {Integer (UInt32)}
 */
export global ADAM_REPL_AUTHENTICATION_MODE_NEGOTIATE_PASS_THROUGH := 0

/**
 * @type {Integer (UInt32)}
 */
export global ADAM_REPL_AUTHENTICATION_MODE_NEGOTIATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global ADAM_REPL_AUTHENTICATION_MODE_MUTUAL_AUTH_REQUIRED := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_FOREST_OPTIONAL_FEATURE := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_DOMAIN_OPTIONAL_FEATURE := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_DISABLABLE_OPTIONAL_FEATURE := 4

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_SERVER_OPTIONAL_FEATURE := 8

/**
 * @type {String}
 */
export global GUID_RECYCLE_BIN_OPTIONAL_FEATURE_A := "d8dc6d76d0ac5e44f3b9a7f9b6744f2a"

/**
 * @type {String}
 */
export global GUID_RECYCLE_BIN_OPTIONAL_FEATURE_W := "d8dc6d76d0ac5e44f3b9a7f9b6744f2a"

/**
 * @type {String}
 */
export global GUID_PRIVILEGED_ACCESS_MANAGEMENT_OPTIONAL_FEATURE_A := "73e843ece8cc4046b4ab07ffe4ab5bcd"

/**
 * @type {String}
 */
export global GUID_PRIVILEGED_ACCESS_MANAGEMENT_OPTIONAL_FEATURE_W := "73e843ece8cc4046b4ab07ffe4ab5bcd"

/**
 * @type {String}
 */
export global GUID_DATABASE_32K_PAGES_OPTIONAL_FEATURE_A := "c62a9852731e4f75ae2473ae2775aab8"

/**
 * @type {String}
 */
export global GUID_DATABASE_32K_PAGES_OPTIONAL_FEATURE_W := "c62a9852731e4f75ae2473ae2775aab8"

/**
 * @type {String}
 */
export global GUID_DATABASE_32K_PAGES_OPTIONAL_FEATURE_BYTE := "Æ*" Chr(152) "Rs" Chr(30) "Ou®$s®'uª¸"

/**
 * @type {String}
 */
export global CFSTR_DSOP_DS_SELECTION_LIST := "CFSTR_DSOP_DS_SELECTION_LIST"

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_TARGET_COMPUTER := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_UPLEVEL_JOINED_DOMAIN := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_DOWNLEVEL_JOINED_DOMAIN := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_ENTERPRISE_DOMAIN := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_GLOBAL_CATALOG := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_EXTERNAL_UPLEVEL_DOMAIN := 32

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_EXTERNAL_DOWNLEVEL_DOMAIN := 64

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_WORKGROUP := 128

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_USER_ENTERED_UPLEVEL_SCOPE := 256

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_TYPE_USER_ENTERED_DOWNLEVEL_SCOPE := 512

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_STARTING_SCOPE := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_WANT_PROVIDER_WINNT := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_WANT_PROVIDER_LDAP := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_WANT_PROVIDER_GC := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_WANT_SID_PATH := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_WANT_DOWNLEVEL_BUILTIN_PATH := 32

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_DEFAULT_FILTER_USERS := 64

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_DEFAULT_FILTER_GROUPS := 128

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_DEFAULT_FILTER_COMPUTERS := 256

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_DEFAULT_FILTER_CONTACTS := 512

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_DEFAULT_FILTER_SERVICE_ACCOUNTS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_SCOPE_FLAG_DEFAULT_FILTER_PASSWORDSETTINGS_OBJECTS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_INCLUDE_ADVANCED_VIEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_USERS := 2

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_BUILTIN_GROUPS := 4

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_WELL_KNOWN_PRINCIPALS := 8

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_UNIVERSAL_GROUPS_DL := 16

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_UNIVERSAL_GROUPS_SE := 32

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_GLOBAL_GROUPS_DL := 64

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_GLOBAL_GROUPS_SE := 128

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_DOMAIN_LOCAL_GROUPS_DL := 256

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_DOMAIN_LOCAL_GROUPS_SE := 512

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_CONTACTS := 1024

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_COMPUTERS := 2048

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_SERVICE_ACCOUNTS := 4096

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FILTER_PASSWORDSETTINGS_OBJECTS := 8192

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_USERS := 2147483649

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_LOCAL_GROUPS := 2147483650

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_GLOBAL_GROUPS := 2147483652

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_COMPUTERS := 2147483656

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_WORLD := 2147483664

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_AUTHENTICATED_USER := 2147483680

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_ANONYMOUS := 2147483712

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_BATCH := 2147483776

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_CREATOR_OWNER := 2147483904

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_CREATOR_GROUP := 2147484160

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_DIALUP := 2147484672

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_INTERACTIVE := 2147485696

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_NETWORK := 2147487744

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_SERVICE := 2147491840

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_SYSTEM := 2147500032

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_EXCLUDE_BUILTIN_GROUPS := 2147516416

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_TERMINAL_SERVER := 2147549184

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_ALL_WELLKNOWN_SIDS := 2147614720

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_LOCAL_SERVICE := 2147745792

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_NETWORK_SERVICE := 2148007936

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_REMOTE_LOGON := 2148532224

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_INTERNET_USER := 2149580800

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_OWNER_RIGHTS := 2151677952

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_SERVICES := 2155872256

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_LOCAL_LOGON := 2164260864

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_THIS_ORG_CERT := 2181038080

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_IIS_APP_POOL := 2214592512

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_ALL_APP_PACKAGES := 2281701376

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_DOWNLEVEL_FILTER_LOCAL_ACCOUNTS := 2415919104

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FLAG_MULTISELECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global DSOP_FLAG_SKIP_TARGET_COMPUTER_DC_CHECK := 2

/**
 * @type {Integer (UInt32)}
 */
export global SCHEDULE_INTERVAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global SCHEDULE_BANDWIDTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global SCHEDULE_PRIORITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_NTDSB := 2048

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_BACKUP := 2047

/**
 * @type {Integer (UInt32)}
 */
export global FACILITY_SYSTEM := 0

/**
 * @type {Integer (Int32)}
 */
export global hrNone := 0

/**
 * @type {Integer (Int32)}
 */
export global hrNyi := -1073741823

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidParam := -939589631

/**
 * @type {Integer (Int32)}
 */
export global hrError := -939589630

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidHandle := -939589629

/**
 * @type {Integer (Int32)}
 */
export global hrRestoreInProgress := -939589628

/**
 * @type {Integer (Int32)}
 */
export global hrAlreadyOpen := -939589627

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidRecips := -939589626

/**
 * @type {Integer (Int32)}
 */
export global hrCouldNotConnect := -939589625

/**
 * @type {Integer (Int32)}
 */
export global hrRestoreMapExists := -939589624

/**
 * @type {Integer (Int32)}
 */
export global hrIncrementalBackupDisabled := -939589623

/**
 * @type {Integer (Int32)}
 */
export global hrLogFileNotFound := -939589622

/**
 * @type {Integer (Int32)}
 */
export global hrCircularLogging := -939589621

/**
 * @type {Integer (Int32)}
 */
export global hrNoFullRestore := -939589620

/**
 * @type {Integer (Int32)}
 */
export global hrCommunicationError := -939589619

/**
 * @type {Integer (Int32)}
 */
export global hrFullBackupNotTaken := -939589618

/**
 * @type {Integer (Int32)}
 */
export global hrMissingExpiryToken := -939589617

/**
 * @type {Integer (Int32)}
 */
export global hrUnknownExpiryTokenFormat := -939589616

/**
 * @type {Integer (Int32)}
 */
export global hrContentsExpired := -939589615

/**
 * @type {Integer (Int32)}
 */
export global hrFileClose := -939523994

/**
 * @type {Integer (Int32)}
 */
export global hrOutOfThreads := -939523993

/**
 * @type {Integer (Int32)}
 */
export global hrTooManyIO := -939523991

/**
 * @type {Integer (Int32)}
 */
export global hrBFNotSynchronous := -2013265720

/**
 * @type {Integer (Int32)}
 */
export global hrBFPageNotFound := -2013265719

/**
 * @type {Integer (Int32)}
 */
export global hrBFInUse := -939523894

/**
 * @type {Integer (Int32)}
 */
export global hrPMRecDeleted := -939523794

/**
 * @type {Integer (Int32)}
 */
export global hrRemainingVersions := -2013265599

/**
 * @type {Integer (Int32)}
 */
export global hrFLDKeyTooBig := -2013265520

/**
 * @type {Integer (Int32)}
 */
export global hrFLDTooManySegments := -939523695

/**
 * @type {Integer (Int32)}
 */
export global hrFLDNullKey := -2013265518

/**
 * @type {Integer (Int32)}
 */
export global hrLogFileCorrupt := -939523595

/**
 * @type {Integer (Int32)}
 */
export global hrNoBackupDirectory := -939523593

/**
 * @type {Integer (Int32)}
 */
export global hrBackupDirectoryNotEmpty := -939523592

/**
 * @type {Integer (Int32)}
 */
export global hrBackupInProgress := -939523591

/**
 * @type {Integer (Int32)}
 */
export global hrMissingPreviousLogFile := -939523587

/**
 * @type {Integer (Int32)}
 */
export global hrLogWriteFail := -939523586

/**
 * @type {Integer (Int32)}
 */
export global hrBadLogVersion := -939523582

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidLogSequence := -939523581

/**
 * @type {Integer (Int32)}
 */
export global hrLoggingDisabled := -939523580

/**
 * @type {Integer (Int32)}
 */
export global hrLogBufferTooSmall := -939523579

/**
 * @type {Integer (Int32)}
 */
export global hrLogSequenceEnd := -939523577

/**
 * @type {Integer (Int32)}
 */
export global hrNoBackup := -939523576

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidBackupSequence := -939523575

/**
 * @type {Integer (Int32)}
 */
export global hrBackupNotAllowedYet := -939523573

/**
 * @type {Integer (Int32)}
 */
export global hrDeleteBackupFileFail := -939523572

/**
 * @type {Integer (Int32)}
 */
export global hrMakeBackupDirectoryFail := -939523571

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidBackup := -939523570

/**
 * @type {Integer (Int32)}
 */
export global hrRecoveredWithErrors := -939523569

/**
 * @type {Integer (Int32)}
 */
export global hrMissingLogFile := -939523568

/**
 * @type {Integer (Int32)}
 */
export global hrLogDiskFull := -939523567

/**
 * @type {Integer (Int32)}
 */
export global hrBadLogSignature := -939523566

/**
 * @type {Integer (Int32)}
 */
export global hrBadDbSignature := -939523565

/**
 * @type {Integer (Int32)}
 */
export global hrBadCheckpointSignature := -939523564

/**
 * @type {Integer (Int32)}
 */
export global hrCheckpointCorrupt := -939523563

/**
 * @type {Integer (Int32)}
 */
export global hrDatabaseInconsistent := -939523546

/**
 * @type {Integer (Int32)}
 */
export global hrConsistentTimeMismatch := -939523545

/**
 * @type {Integer (Int32)}
 */
export global hrPatchFileMismatch := -939523544

/**
 * @type {Integer (Int32)}
 */
export global hrRestoreLogTooLow := -939523543

/**
 * @type {Integer (Int32)}
 */
export global hrRestoreLogTooHigh := -939523542

/**
 * @type {Integer (Int32)}
 */
export global hrGivenLogFileHasBadSignature := -939523541

/**
 * @type {Integer (Int32)}
 */
export global hrGivenLogFileIsNotContiguous := -939523540

/**
 * @type {Integer (Int32)}
 */
export global hrMissingRestoreLogFiles := -939523539

/**
 * @type {Integer (Int32)}
 */
export global hrExistingLogFileHasBadSignature := -2013265362

/**
 * @type {Integer (Int32)}
 */
export global hrExistingLogFileIsNotContiguous := -2013265361

/**
 * @type {Integer (Int32)}
 */
export global hrMissingFullBackup := -939523536

/**
 * @type {Integer (Int32)}
 */
export global hrBadBackupDatabaseSize := -939523535

/**
 * @type {Integer (Int32)}
 */
export global hrTermInProgress := -939523096

/**
 * @type {Integer (Int32)}
 */
export global hrFeatureNotAvailable := -939523095

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidName := -939523094

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidParameter := -939523093

/**
 * @type {Integer (Int32)}
 */
export global hrColumnNull := -2013264916

/**
 * @type {Integer (Int32)}
 */
export global hrBufferTruncated := -2013264914

/**
 * @type {Integer (Int32)}
 */
export global hrDatabaseAttached := -2013264913

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidDatabaseId := -939523086

/**
 * @type {Integer (Int32)}
 */
export global hrOutOfMemory := -939523085

/**
 * @type {Integer (Int32)}
 */
export global hrOutOfDatabaseSpace := -939523084

/**
 * @type {Integer (Int32)}
 */
export global hrOutOfCursors := -939523083

/**
 * @type {Integer (Int32)}
 */
export global hrOutOfBuffers := -939523082

/**
 * @type {Integer (Int32)}
 */
export global hrTooManyIndexes := -939523081

/**
 * @type {Integer (Int32)}
 */
export global hrTooManyKeys := -939523080

/**
 * @type {Integer (Int32)}
 */
export global hrRecordDeleted := -939523079

/**
 * @type {Integer (Int32)}
 */
export global hrReadVerifyFailure := -939523078

/**
 * @type {Integer (Int32)}
 */
export global hrOutOfFileHandles := -939523076

/**
 * @type {Integer (Int32)}
 */
export global hrDiskIO := -939523074

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidPath := -939523073

/**
 * @type {Integer (Int32)}
 */
export global hrRecordTooBig := -939523070

/**
 * @type {Integer (Int32)}
 */
export global hrTooManyOpenDatabases := -939523069

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidDatabase := -939523068

/**
 * @type {Integer (Int32)}
 */
export global hrNotInitialized := -939523067

/**
 * @type {Integer (Int32)}
 */
export global hrAlreadyInitialized := -939523066

/**
 * @type {Integer (Int32)}
 */
export global hrFileAccessDenied := -939523064

/**
 * @type {Integer (Int32)}
 */
export global hrBufferTooSmall := -939523058

/**
 * @type {Integer (Int32)}
 */
export global hrSeekNotEqual := -2013264881

/**
 * @type {Integer (Int32)}
 */
export global hrTooManyColumns := -939523056

/**
 * @type {Integer (Int32)}
 */
export global hrContainerNotEmpty := -939523053

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidFilename := -939523052

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidBookmark := -939523051

/**
 * @type {Integer (Int32)}
 */
export global hrColumnInUse := -939523050

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidBufferSize := -939523049

/**
 * @type {Integer (Int32)}
 */
export global hrColumnNotUpdatable := -939523048

/**
 * @type {Integer (Int32)}
 */
export global hrIndexInUse := -939523045

/**
 * @type {Integer (Int32)}
 */
export global hrNullKeyDisallowed := -939523043

/**
 * @type {Integer (Int32)}
 */
export global hrNotInTransaction := -939523042

/**
 * @type {Integer (Int32)}
 */
export global hrNoIdleActivity := -2013264862

/**
 * @type {Integer (Int32)}
 */
export global hrTooManyActiveUsers := -939523037

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidCountry := -939523035

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidLanguageId := -939523034

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidCodePage := -939523033

/**
 * @type {Integer (Int32)}
 */
export global hrNoWriteLock := -2013264853

/**
 * @type {Integer (Int32)}
 */
export global hrColumnSetNull := -2013264852

/**
 * @type {Integer (Int32)}
 */
export global hrVersionStoreOutOfMemory := -939523027

/**
 * @type {Integer (Int32)}
 */
export global hrCurrencyStackOutOfMemory := -939523026

/**
 * @type {Integer (Int32)}
 */
export global hrOutOfSessions := -939522995

/**
 * @type {Integer (Int32)}
 */
export global hrWriteConflict := -939522994

/**
 * @type {Integer (Int32)}
 */
export global hrTransTooDeep := -939522993

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidSesid := -939522992

/**
 * @type {Integer (Int32)}
 */
export global hrSessionWriteConflict := -939522989

/**
 * @type {Integer (Int32)}
 */
export global hrInTransaction := -939522988

/**
 * @type {Integer (Int32)}
 */
export global hrDatabaseDuplicate := -939522895

/**
 * @type {Integer (Int32)}
 */
export global hrDatabaseInUse := -939522894

/**
 * @type {Integer (Int32)}
 */
export global hrDatabaseNotFound := -939522893

/**
 * @type {Integer (Int32)}
 */
export global hrDatabaseInvalidName := -939522892

/**
 * @type {Integer (Int32)}
 */
export global hrDatabaseInvalidPages := -939522891

/**
 * @type {Integer (Int32)}
 */
export global hrDatabaseCorrupted := -939522890

/**
 * @type {Integer (Int32)}
 */
export global hrDatabaseLocked := -939522889

/**
 * @type {Integer (Int32)}
 */
export global hrTableEmpty := -2013264619

/**
 * @type {Integer (Int32)}
 */
export global hrTableLocked := -939522794

/**
 * @type {Integer (Int32)}
 */
export global hrTableDuplicate := -939522793

/**
 * @type {Integer (Int32)}
 */
export global hrTableInUse := -939522792

/**
 * @type {Integer (Int32)}
 */
export global hrObjectNotFound := -939522791

/**
 * @type {Integer (Int32)}
 */
export global hrCannotRename := -939522790

/**
 * @type {Integer (Int32)}
 */
export global hrDensityInvalid := -939522789

/**
 * @type {Integer (Int32)}
 */
export global hrTableNotEmpty := -939522788

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidTableId := -939522786

/**
 * @type {Integer (Int32)}
 */
export global hrTooManyOpenTables := -939522785

/**
 * @type {Integer (Int32)}
 */
export global hrIllegalOperation := -939522784

/**
 * @type {Integer (Int32)}
 */
export global hrObjectDuplicate := -939522782

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidObject := -939522780

/**
 * @type {Integer (Int32)}
 */
export global hrIndexCantBuild := -939522695

/**
 * @type {Integer (Int32)}
 */
export global hrIndexHasPrimary := -939522694

/**
 * @type {Integer (Int32)}
 */
export global hrIndexDuplicate := -939522693

/**
 * @type {Integer (Int32)}
 */
export global hrIndexNotFound := -939522692

/**
 * @type {Integer (Int32)}
 */
export global hrIndexMustStay := -939522691

/**
 * @type {Integer (Int32)}
 */
export global hrIndexInvalidDef := -939522690

/**
 * @type {Integer (Int32)}
 */
export global hrIndexHasClustered := -939522688

/**
 * @type {Integer (Int32)}
 */
export global hrCreateIndexFailed := -2013264511

/**
 * @type {Integer (Int32)}
 */
export global hrTooManyOpenIndexes := -939522686

/**
 * @type {Integer (Int32)}
 */
export global hrColumnLong := -939522595

/**
 * @type {Integer (Int32)}
 */
export global hrColumnDoesNotFit := -939522593

/**
 * @type {Integer (Int32)}
 */
export global hrNullInvalid := -939522592

/**
 * @type {Integer (Int32)}
 */
export global hrColumnIndexed := -939522591

/**
 * @type {Integer (Int32)}
 */
export global hrColumnTooBig := -939522590

/**
 * @type {Integer (Int32)}
 */
export global hrColumnNotFound := -939522589

/**
 * @type {Integer (Int32)}
 */
export global hrColumnDuplicate := -939522588

/**
 * @type {Integer (Int32)}
 */
export global hrColumn2ndSysMaint := -939522586

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidColumnType := -939522585

/**
 * @type {Integer (Int32)}
 */
export global hrColumnMaxTruncated := -2013264408

/**
 * @type {Integer (Int32)}
 */
export global hrColumnCannotIndex := -939522583

/**
 * @type {Integer (Int32)}
 */
export global hrTaggedNotNULL := -939522582

/**
 * @type {Integer (Int32)}
 */
export global hrNoCurrentIndex := -939522581

/**
 * @type {Integer (Int32)}
 */
export global hrKeyIsMade := -939522580

/**
 * @type {Integer (Int32)}
 */
export global hrBadColumnId := -939522579

/**
 * @type {Integer (Int32)}
 */
export global hrBadItagSequence := -939522578

/**
 * @type {Integer (Int32)}
 */
export global hrCannotBeTagged := -939522575

/**
 * @type {Integer (Int32)}
 */
export global hrRecordNotFound := -939522495

/**
 * @type {Integer (Int32)}
 */
export global hrNoCurrentRecord := -939522493

/**
 * @type {Integer (Int32)}
 */
export global hrRecordClusteredChanged := -939522492

/**
 * @type {Integer (Int32)}
 */
export global hrKeyDuplicate := -939522491

/**
 * @type {Integer (Int32)}
 */
export global hrAlreadyPrepared := -939522489

/**
 * @type {Integer (Int32)}
 */
export global hrKeyNotMade := -939522488

/**
 * @type {Integer (Int32)}
 */
export global hrUpdateNotPrepared := -939522487

/**
 * @type {Integer (Int32)}
 */
export global hrwrnDataHasChanged := -2013264310

/**
 * @type {Integer (Int32)}
 */
export global hrerrDataHasChanged := -939522485

/**
 * @type {Integer (Int32)}
 */
export global hrKeyChanged := -2013264302

/**
 * @type {Integer (Int32)}
 */
export global hrTooManySorts := -939522395

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidOnSort := -939522394

/**
 * @type {Integer (Int32)}
 */
export global hrTempFileOpenError := -939522293

/**
 * @type {Integer (Int32)}
 */
export global hrTooManyAttachedDatabases := -939522291

/**
 * @type {Integer (Int32)}
 */
export global hrDiskFull := -939522288

/**
 * @type {Integer (Int32)}
 */
export global hrPermissionDenied := -939522287

/**
 * @type {Integer (Int32)}
 */
export global hrFileNotFound := -939522285

/**
 * @type {Integer (Int32)}
 */
export global hrFileOpenReadOnly := -2013264107

/**
 * @type {Integer (Int32)}
 */
export global hrAfterInitialization := -939522246

/**
 * @type {Integer (Int32)}
 */
export global hrLogCorrupted := -939522244

/**
 * @type {Integer (Int32)}
 */
export global hrInvalidOperation := -939522190

/**
 * @type {Integer (Int32)}
 */
export global hrAccessDenied := -939522189

/**
 * @type {Guid}
 */
export global CLSID_DsObjectPicker := Guid("{17d6ccd8-3b7b-11d2-b9e0-00c04fd8dbf7}")
;@endregion Constants
