#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.ApplicationInstallationAndServicing
 */

;@region Constants

/**
 * @type {Integer (Int32)}
 */
export global MSIDBOPEN_READONLY := 0

/**
 * @type {Integer (Int32)}
 */
export global MSIDBOPEN_TRANSACT := 1

/**
 * @type {Integer (Int32)}
 */
export global MSIDBOPEN_DIRECT := 2

/**
 * @type {Integer (Int32)}
 */
export global MSIDBOPEN_CREATE := 3

/**
 * @type {Integer (Int32)}
 */
export global MSIDBOPEN_CREATEDIRECT := 4

/**
 * @type {Integer (Int32)}
 */
export global MSIDBOPEN_PATCHFILE := 16

/**
 * @type {Integer (UInt32)}
 */
export global UIALL := 32768

/**
 * @type {Integer (UInt32)}
 */
export global LOGTOKEN_TYPE_MASK := 3

/**
 * @type {Integer (UInt32)}
 */
export global LOGTOKEN_UNSPECIFIED := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOGTOKEN_NO_LOG := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOGTOKEN_SETUPAPI_APPLOG := 2

/**
 * @type {Integer (UInt32)}
 */
export global LOGTOKEN_SETUPAPI_DEVLOG := 3

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_SETUPAPI_DEVLOG := 1

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_SETUPAPI_CMDLINE := 2

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_SETUPAPI_BITS := 3

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_ERROR := 1

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_WARNING := 2

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_SYSTEM_STATE_CHANGE := 3

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_SUMMARY := 4

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_DETAILS := 5

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_VERBOSE := 6

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_VERY_VERBOSE := 7

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_RESERVED_FLAGS := 65520

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_TIMESTAMP := 65536

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_DEPTH_INCR := 131072

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_DEPTH_DECR := 262144

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_TAB_1 := 524288

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_FLUSH_FILE := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_DEVINST := 1

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_INF := 2

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_FILEQ := 4

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_COPYFILES := 8

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_SIGVERIF := 32

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_BACKUP := 128

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_UI := 256

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_UTIL := 512

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_INFDB := 1024

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_DRVSETUP := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_POLICY := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_NEWDEV := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_UMPNPMGR := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_DRIVER_STORE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_SETUP := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_CMI := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_DEVMGR := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_INSTALLER := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global TXTLOG_VENDOR := 2147483648

/**
 * @type {Guid}
 */
export global CLSID_EvalCom2 := Guid("{6e5e1910-8053-4660-b795-6b612e29bc58}")

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_MSM := 100

/**
 * @type {Guid}
 */
export global LIBID_MsmMergeTypeLib := Guid("{0adda82f-2c26-11d2-ad65-00a0c9af11a6}")

/**
 * @type {Guid}
 */
export global CLSID_MsmMerge2 := Guid("{f94985d5-29f9-4743-9805-99bc3f35b678}")

/**
 * @type {Integer (UInt32)}
 */
export global _WIN32_MSI := 500

/**
 * @type {Integer (UInt32)}
 */
export global MAX_GUID_CHARS := 38

/**
 * @type {Integer (UInt32)}
 */
export global MAX_FEATURE_CHARS := 38

/**
 * @type {String}
 */
export global INSTALLPROPERTY_PACKAGENAME := "PackageName"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_TRANSFORMS := "Transforms"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_LANGUAGE := "Language"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_PRODUCTNAME := "ProductName"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_ASSIGNMENTTYPE := "AssignmentType"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_INSTANCETYPE := "InstanceType"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_AUTHORIZED_LUA_APP := "AuthorizedLUAApp"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_PACKAGECODE := "PackageCode"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_VERSION := "Version"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_PRODUCTICON := "ProductIcon"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_INSTALLEDPRODUCTNAME := "InstalledProductName"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_VERSIONSTRING := "VersionString"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_HELPLINK := "HelpLink"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_HELPTELEPHONE := "HelpTelephone"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_INSTALLLOCATION := "InstallLocation"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_INSTALLSOURCE := "InstallSource"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_INSTALLDATE := "InstallDate"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_PUBLISHER := "Publisher"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_LOCALPACKAGE := "LocalPackage"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_URLINFOABOUT := "URLInfoAbout"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_URLUPDATEINFO := "URLUpdateInfo"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_VERSIONMINOR := "VersionMinor"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_VERSIONMAJOR := "VersionMajor"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_PRODUCTID := "ProductID"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_REGCOMPANY := "RegCompany"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_REGOWNER := "RegOwner"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_INSTALLEDLANGUAGE := "InstalledLanguage"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_UNINSTALLABLE := "Uninstallable"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_PRODUCTSTATE := "State"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_PATCHSTATE := "State"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_PATCHTYPE := "PatchType"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_LUAENABLED := "LUAEnabled"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_DISPLAYNAME := "DisplayName"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_MOREINFOURL := "MoreInfoURL"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_LASTUSEDSOURCE := "LastUsedSource"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_LASTUSEDTYPE := "LastUsedType"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_MEDIAPACKAGEPATH := "MediaPackagePath"

/**
 * @type {String}
 */
export global INSTALLPROPERTY_DISKPROMPT := "DiskPrompt"

/**
 * @type {Integer (UInt32)}
 */
export global MSI_INVALID_HASH_IS_FATAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_ROLLBACK_DISABLED := 1653

/**
 * @type {Integer (UInt32)}
 */
export global MSI_NULL_INTEGER := 2147483648

/**
 * @type {Integer (Int32)}
 */
export global INSTALLMESSAGE_TYPEMASK := -16777216

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_FORMAT_COMPLIB_MODULE := 0

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_FORMAT_COMPLIB_MANIFEST := 1

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_FORMAT_WIN32_MODULE := 2

/**
 * @type {Integer (UInt32)}
 */
export global STREAM_FORMAT_WIN32_MANIFEST := 4

/**
 * @type {Integer (UInt32)}
 */
export global IASSEMBLYCACHEITEM_COMMIT_FLAG_REFRESH := 1

/**
 * @type {Integer (UInt32)}
 */
export global ASSEMBLYINFO_FLAG_INSTALLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global ASSEMBLYINFO_FLAG_PAYLOADRESIDENT := 2

/**
 * @type {Integer (UInt32)}
 */
export global IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_INSTALLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_REFRESHED := 2

/**
 * @type {Integer (UInt32)}
 */
export global IASSEMBLYCACHEITEM_COMMIT_DISPOSITION_ALREADY_INSTALLED := 3

/**
 * @type {Guid}
 */
export global FUSION_REFCOUNT_UNINSTALL_SUBKEY_GUID := Guid("{8cedc215-ac4b-488b-93c0-a50a49cb2fb8}")

/**
 * @type {Guid}
 */
export global FUSION_REFCOUNT_FILEPATH_GUID := Guid("{b02f9d65-fb77-4f7a-afa5-b391309f11c9}")

/**
 * @type {Guid}
 */
export global FUSION_REFCOUNT_OPAQUE_STRING_GUID := Guid("{2ec93463-b0c3-45e1-8364-327e96aea856}")

/**
 * @type {Integer (UInt32)}
 */
export global SFC_DISABLE_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global SFC_DISABLE_ASK := 1

/**
 * @type {Integer (UInt32)}
 */
export global SFC_DISABLE_ONCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SFC_DISABLE_SETUP := 3

/**
 * @type {Integer (UInt32)}
 */
export global SFC_DISABLE_NOPOPUPS := 4

/**
 * @type {Integer (UInt32)}
 */
export global SFC_SCAN_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global SFC_SCAN_ALWAYS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SFC_SCAN_ONCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SFC_SCAN_IMMEDIATE := 3

/**
 * @type {Integer (UInt32)}
 */
export global SFC_QUOTA_DEFAULT := 50

/**
 * @type {String}
 */
export global SFC_IDLE_TRIGGER := "WFP_IDLE_TRIGGER"

/**
 * @type {String}
 */
export global IPROPNAME_PRODUCTNAME := "ProductName"

/**
 * @type {String}
 */
export global IPROPNAME_PRODUCTCODE := "ProductCode"

/**
 * @type {String}
 */
export global IPROPNAME_PRODUCTVERSION := "ProductVersion"

/**
 * @type {String}
 */
export global IPROPNAME_INSTALLLANGUAGE := "ProductLanguage"

/**
 * @type {String}
 */
export global IPROPNAME_MANUFACTURER := "Manufacturer"

/**
 * @type {String}
 */
export global IPROPNAME_UPGRADECODE := "UpgradeCode"

/**
 * @type {String}
 */
export global IPROPNAME_PIDTEMPLATE := "PIDTemplate"

/**
 * @type {String}
 */
export global IPROPNAME_DISKPROMPT := "DiskPrompt"

/**
 * @type {String}
 */
export global IPROPNAME_LEFTUNIT := "LeftUnit"

/**
 * @type {String}
 */
export global IPROPNAME_ADMIN_PROPERTIES := "AdminProperties"

/**
 * @type {String}
 */
export global IPROPNAME_DEFAULTUIFONT := "DefaultUIFont"

/**
 * @type {String}
 */
export global IPROPNAME_ALLOWEDPROPERTIES := "SecureCustomProperties"

/**
 * @type {String}
 */
export global IPROPNAME_ENABLEUSERCONTROL := "EnableUserControl"

/**
 * @type {String}
 */
export global IPROPNAME_HIDDEN_PROPERTIES := "MsiHiddenProperties"

/**
 * @type {String}
 */
export global IPROPNAME_USERNAME := "USERNAME"

/**
 * @type {String}
 */
export global IPROPNAME_COMPANYNAME := "COMPANYNAME"

/**
 * @type {String}
 */
export global IPROPNAME_PIDKEY := "PIDKEY"

/**
 * @type {String}
 */
export global IPROPNAME_PATCH := "PATCH"

/**
 * @type {String}
 */
export global IPROPNAME_MSIPATCHREMOVE := "MSIPATCHREMOVE"

/**
 * @type {String}
 */
export global IPROPNAME_TARGETDIR := "TARGETDIR"

/**
 * @type {String}
 */
export global IPROPNAME_ACTION := "ACTION"

/**
 * @type {String}
 */
export global IPROPNAME_LIMITUI := "LIMITUI"

/**
 * @type {String}
 */
export global IPROPNAME_LOGACTION := "LOGACTION"

/**
 * @type {String}
 */
export global IPROPNAME_ALLUSERS := "ALLUSERS"

/**
 * @type {String}
 */
export global IPROPNAME_INSTALLLEVEL := "INSTALLLEVEL"

/**
 * @type {String}
 */
export global IPROPNAME_REBOOT := "REBOOT"

/**
 * @type {String}
 */
export global IPROPNAME_REBOOTPROMPT := "REBOOTPROMPT"

/**
 * @type {String}
 */
export global IPROPNAME_EXECUTEMODE := "EXECUTEMODE"

/**
 * @type {String}
 */
export global IPROPVALUE_EXECUTEMODE_NONE := "NONE"

/**
 * @type {String}
 */
export global IPROPVALUE_EXECUTEMODE_SCRIPT := "SCRIPT"

/**
 * @type {String}
 */
export global IPROPNAME_EXECUTEACTION := "EXECUTEACTION"

/**
 * @type {String}
 */
export global IPROPNAME_SOURCELIST := "SOURCELIST"

/**
 * @type {String}
 */
export global IPROPNAME_ROOTDRIVE := "ROOTDRIVE"

/**
 * @type {String}
 */
export global IPROPNAME_TRANSFORMS := "TRANSFORMS"

/**
 * @type {String}
 */
export global IPROPNAME_TRANSFORMSATSOURCE := "TRANSFORMSATSOURCE"

/**
 * @type {String}
 */
export global IPROPNAME_TRANSFORMSSECURE := "TRANSFORMSSECURE"

/**
 * @type {String}
 */
export global IPROPNAME_SEQUENCE := "SEQUENCE"

/**
 * @type {String}
 */
export global IPROPNAME_SHORTFILENAMES := "SHORTFILENAMES"

/**
 * @type {String}
 */
export global IPROPNAME_PRIMARYFOLDER := "PRIMARYFOLDER"

/**
 * @type {String}
 */
export global IPROPNAME_AFTERREBOOT := "AFTERREBOOT"

/**
 * @type {String}
 */
export global IPROPNAME_NOCOMPANYNAME := "NOCOMPANYNAME"

/**
 * @type {String}
 */
export global IPROPNAME_NOUSERNAME := "NOUSERNAME"

/**
 * @type {String}
 */
export global IPROPNAME_DISABLEROLLBACK := "DISABLEROLLBACK"

/**
 * @type {String}
 */
export global IPROPNAME_AVAILABLEFREEREG := "AVAILABLEFREEREG"

/**
 * @type {String}
 */
export global IPROPNAME_DISABLEADVTSHORTCUTS := "DISABLEADVTSHORTCUTS"

/**
 * @type {String}
 */
export global IPROPNAME_PATCHNEWPACKAGECODE := "PATCHNEWPACKAGECODE"

/**
 * @type {String}
 */
export global IPROPNAME_PATCHNEWSUMMARYSUBJECT := "PATCHNEWSUMMARYSUBJECT"

/**
 * @type {String}
 */
export global IPROPNAME_PATCHNEWSUMMARYCOMMENTS := "PATCHNEWSUMMARYCOMMENTS"

/**
 * @type {String}
 */
export global IPROPNAME_PRODUCTLANGUAGE := "PRODUCTLANGUAGE"

/**
 * @type {String}
 */
export global IPROPNAME_CHECKCRCS := "MSICHECKCRCS"

/**
 * @type {String}
 */
export global IPROPNAME_MSINODISABLEMEDIA := "MSINODISABLEMEDIA"

/**
 * @type {String}
 */
export global IPROPNAME_CARRYINGNDP := "CARRYINGNDP"

/**
 * @type {String}
 */
export global IPROPVALUE__CARRYINGNDP_URTREINSTALL := "URTREINSTALL"

/**
 * @type {String}
 */
export global IPROPVALUE__CARRYINGNDP_URTUPGRADE := "URTUPGRADE"

/**
 * @type {String}
 */
export global IPROPNAME_ENFORCE_UPGRADE_COMPONENT_RULES := "MSIENFORCEUPGRADECOMPONENTRULES"

/**
 * @type {String}
 */
export global IPROPNAME_MSINEWINSTANCE := "MSINEWINSTANCE"

/**
 * @type {String}
 */
export global IPROPNAME_MSIINSTANCEGUID := "MSIINSTANCEGUID"

/**
 * @type {String}
 */
export global IPROPNAME_MSIPACKAGEDOWNLOADLOCALCOPY := "MSIPACKAGEDOWNLOADLOCALCOPY"

/**
 * @type {String}
 */
export global IPROPNAME_MSIPATCHDOWNLOADLOCALCOPY := "MSIPATCHDOWNLOADLOCALCOPY"

/**
 * @type {String}
 */
export global IPROPNAME_MSIDISABLELUAPATCHING := "MSIDISABLELUAPATCHING"

/**
 * @type {String}
 */
export global IPROPNAME_MSILOGGINGMODE := "MsiLogging"

/**
 * @type {String}
 */
export global IPROPNAME_MSILOGFILELOCATION := "MsiLogFileLocation"

/**
 * @type {String}
 */
export global IPROPNAME_MSI_RM_CONTROL := "MSIRESTARTMANAGERCONTROL"

/**
 * @type {String}
 */
export global IPROPVALUE_MSI_RM_CONTROL_DISABLE := "Disable"

/**
 * @type {String}
 */
export global IPROPVALUE_MSI_RM_CONTROL_DISABLESHUTDOWN := "DisableShutdown"

/**
 * @type {String}
 */
export global IPROPNAME_MSI_RM_SESSION_KEY := "MsiRestartManagerSessionKey"

/**
 * @type {String}
 */
export global IPROPNAME_MSI_REBOOT_PENDING := "MsiSystemRebootPending"

/**
 * @type {String}
 */
export global IPROPNAME_MSI_RM_SHUTDOWN := "MSIRMSHUTDOWN"

/**
 * @type {String}
 */
export global IPROPNAME_MSI_RM_DISABLE_RESTART := "MSIDISABLERMRESTART"

/**
 * @type {String}
 */
export global IPROPNAME_MSI_UAC_DEPLOYMENT_COMPLIANT := "MSIDEPLOYMENTCOMPLIANT"

/**
 * @type {String}
 */
export global IPROPNAME_MSI_USE_REAL_ADMIN_DETECTION := "MSIUSEREALADMINDETECTION"

/**
 * @type {String}
 */
export global IPROPNAME_MSI_UNINSTALL_SUPERSEDED_COMPONENTS := "MSIUNINSTALLSUPERSEDEDCOMPONENTS"

/**
 * @type {String}
 */
export global IPROPNAME_MSIDISABLEEEUI := "MSIDISABLEEEUI"

/**
 * @type {String}
 */
export global IPROPNAME_MSI_FASTINSTALL := "MSIFASTINSTALL"

/**
 * @type {String}
 */
export global IPROPNAME_INSTALLPERUSER := "MSIINSTALLPERUSER"

/**
 * @type {String}
 */
export global IPROPNAME_INTERNALINSTALLEDPERUSER := "MSIINTERNALINSTALLEDPERUSER"

/**
 * @type {String}
 */
export global IPROPNAME_ARPAUTHORIZEDCDFPREFIX := "ARPAUTHORIZEDCDFPREFIX"

/**
 * @type {String}
 */
export global IPROPNAME_ARPCOMMENTS := "ARPCOMMENTS"

/**
 * @type {String}
 */
export global IPROPNAME_ARPCONTACT := "ARPCONTACT"

/**
 * @type {String}
 */
export global IPROPNAME_ARPHELPLINK := "ARPHELPLINK"

/**
 * @type {String}
 */
export global IPROPNAME_ARPHELPTELEPHONE := "ARPHELPTELEPHONE"

/**
 * @type {String}
 */
export global IPROPNAME_ARPINSTALLLOCATION := "ARPINSTALLLOCATION"

/**
 * @type {String}
 */
export global IPROPNAME_ARPNOMODIFY := "ARPNOMODIFY"

/**
 * @type {String}
 */
export global IPROPNAME_ARPNOREMOVE := "ARPNOREMOVE"

/**
 * @type {String}
 */
export global IPROPNAME_ARPNOREPAIR := "ARPNOREPAIR"

/**
 * @type {String}
 */
export global IPROPNAME_ARPREADME := "ARPREADME"

/**
 * @type {String}
 */
export global IPROPNAME_ARPSIZE := "ARPSIZE"

/**
 * @type {String}
 */
export global IPROPNAME_ARPSYSTEMCOMPONENT := "ARPSYSTEMCOMPONENT"

/**
 * @type {String}
 */
export global IPROPNAME_ARPURLINFOABOUT := "ARPURLINFOABOUT"

/**
 * @type {String}
 */
export global IPROPNAME_ARPURLUPDATEINFO := "ARPURLUPDATEINFO"

/**
 * @type {String}
 */
export global IPROPNAME_ARPPRODUCTICON := "ARPPRODUCTICON"

/**
 * @type {String}
 */
export global IPROPNAME_ARPSETTINGSIDENTIFIER := "MSIARPSETTINGSIDENTIFIER"

/**
 * @type {String}
 */
export global IPROPNAME_ARPSHIMFLAGS := "SHIMFLAGS"

/**
 * @type {String}
 */
export global IPROPNAME_ARPSHIMVERSIONNT := "SHIMVERSIONNT"

/**
 * @type {String}
 */
export global IPROPNAME_ARPSHIMSERVICEPACKLEVEL := "SHIMSERVICEPACKLEVEL"

/**
 * @type {String}
 */
export global IPROPNAME_INSTALLED := "Installed"

/**
 * @type {String}
 */
export global IPROPNAME_PRODUCTSTATE := "ProductState"

/**
 * @type {String}
 */
export global IPROPNAME_PRESELECTED := "Preselected"

/**
 * @type {String}
 */
export global IPROPNAME_RESUME := "RESUME"

/**
 * @type {String}
 */
export global IPROPNAME_UPDATESTARTED := "UpdateStarted"

/**
 * @type {String}
 */
export global IPROPNAME_PRODUCTID := "ProductID"

/**
 * @type {String}
 */
export global IPROPNAME_OUTOFDISKSPACE := "OutOfDiskSpace"

/**
 * @type {String}
 */
export global IPROPNAME_OUTOFNORBDISKSPACE := "OutOfNoRbDiskSpace"

/**
 * @type {String}
 */
export global IPROPNAME_COSTINGCOMPLETE := "CostingComplete"

/**
 * @type {String}
 */
export global IPROPNAME_SOURCEDIR := "SourceDir"

/**
 * @type {String}
 */
export global IPROPNAME_REPLACEDINUSEFILES := "ReplacedInUseFiles"

/**
 * @type {String}
 */
export global IPROPNAME_PRIMARYFOLDER_PATH := "PrimaryVolumePath"

/**
 * @type {String}
 */
export global IPROPNAME_PRIMARYFOLDER_SPACEAVAILABLE := "PrimaryVolumeSpaceAvailable"

/**
 * @type {String}
 */
export global IPROPNAME_PRIMARYFOLDER_SPACEREQUIRED := "PrimaryVolumeSpaceRequired"

/**
 * @type {String}
 */
export global IPROPNAME_PRIMARYFOLDER_SPACEREMAINING := "PrimaryVolumeSpaceRemaining"

/**
 * @type {String}
 */
export global IPROPNAME_ISADMINPACKAGE := "IsAdminPackage"

/**
 * @type {String}
 */
export global IPROPNAME_ROLLBACKDISABLED := "RollbackDisabled"

/**
 * @type {String}
 */
export global IPROPNAME_RESTRICTEDUSERCONTROL := "RestrictedUserControl"

/**
 * @type {String}
 */
export global IPROPNAME_SOURCERESONLY := "MsiUISourceResOnly"

/**
 * @type {String}
 */
export global IPROPNAME_HIDECANCEL := "MsiUIHideCancel"

/**
 * @type {String}
 */
export global IPROPNAME_PROGRESSONLY := "MsiUIProgressOnly"

/**
 * @type {String}
 */
export global IPROPNAME_UACONLY := "MsiUIUACOnly"

/**
 * @type {String}
 */
export global IPROPNAME_TIME := "Time"

/**
 * @type {String}
 */
export global IPROPNAME_DATE := "Date"

/**
 * @type {String}
 */
export global IPROPNAME_DATETIME := "DateTime"

/**
 * @type {String}
 */
export global IPROPNAME_ARM := "Arm"

/**
 * @type {String}
 */
export global IPROPNAME_ARM64 := "Arm64"

/**
 * @type {String}
 */
export global IPROPNAME_INTEL := "Intel"

/**
 * @type {String}
 */
export global IPROPNAME_TEMPLATE_AMD64 := "AMD64"

/**
 * @type {String}
 */
export global IPROPNAME_TEMPLATE_X64 := "x64"

/**
 * @type {String}
 */
export global IPROPNAME_MSIAMD64 := "MsiAMD64"

/**
 * @type {String}
 */
export global IPROPNAME_MSIX64 := "Msix64"

/**
 * @type {String}
 */
export global IPROPNAME_INTEL64 := "Intel64"

/**
 * @type {String}
 */
export global IPROPNAME_IA64 := "IA64"

/**
 * @type {String}
 */
export global IPROPNAME_TEXTHEIGHT := "TextHeight"

/**
 * @type {String}
 */
export global IPROPNAME_TEXTINTERNALLEADING := "TextInternalLeading"

/**
 * @type {String}
 */
export global IPROPNAME_SCREENX := "ScreenX"

/**
 * @type {String}
 */
export global IPROPNAME_SCREENY := "ScreenY"

/**
 * @type {String}
 */
export global IPROPNAME_CAPTIONHEIGHT := "CaptionHeight"

/**
 * @type {String}
 */
export global IPROPNAME_BORDERTOP := "BorderTop"

/**
 * @type {String}
 */
export global IPROPNAME_BORDERSIDE := "BorderSide"

/**
 * @type {String}
 */
export global IPROPNAME_COLORBITS := "ColorBits"

/**
 * @type {String}
 */
export global IPROPNAME_PHYSICALMEMORY := "PhysicalMemory"

/**
 * @type {String}
 */
export global IPROPNAME_VIRTUALMEMORY := "VirtualMemory"

/**
 * @type {String}
 */
export global IPROPNAME_TEXTHEIGHT_CORRECTION := "TextHeightCorrection"

/**
 * @type {String}
 */
export global IPROPNAME_MSITABLETPC := "MsiTabletPC"

/**
 * @type {String}
 */
export global IPROPNAME_VERSIONNT := "VersionNT"

/**
 * @type {String}
 */
export global IPROPNAME_VERSION9X := "Version9X"

/**
 * @type {String}
 */
export global IPROPNAME_VERSIONNT64 := "VersionNT64"

/**
 * @type {String}
 */
export global IPROPNAME_WINDOWSBUILD := "WindowsBuild"

/**
 * @type {String}
 */
export global IPROPNAME_SERVICEPACKLEVEL := "ServicePackLevel"

/**
 * @type {String}
 */
export global IPROPNAME_SERVICEPACKLEVELMINOR := "ServicePackLevelMinor"

/**
 * @type {String}
 */
export global IPROPNAME_SHAREDWINDOWS := "SharedWindows"

/**
 * @type {String}
 */
export global IPROPNAME_COMPUTERNAME := "ComputerName"

/**
 * @type {String}
 */
export global IPROPNAME_SHELLADVTSUPPORT := "ShellAdvtSupport"

/**
 * @type {String}
 */
export global IPROPNAME_OLEADVTSUPPORT := "OLEAdvtSupport"

/**
 * @type {String}
 */
export global IPROPNAME_SYSTEMLANGUAGEID := "SystemLanguageID"

/**
 * @type {String}
 */
export global IPROPNAME_TTCSUPPORT := "TTCSupport"

/**
 * @type {String}
 */
export global IPROPNAME_TERMSERVER := "TerminalServer"

/**
 * @type {String}
 */
export global IPROPNAME_REMOTEADMINTS := "RemoteAdminTS"

/**
 * @type {String}
 */
export global IPROPNAME_REDIRECTEDDLLSUPPORT := "RedirectedDllSupport"

/**
 * @type {String}
 */
export global IPROPNAME_NTPRODUCTTYPE := "MsiNTProductType"

/**
 * @type {String}
 */
export global IPROPNAME_NTSUITEBACKOFFICE := "MsiNTSuiteBackOffice"

/**
 * @type {String}
 */
export global IPROPNAME_NTSUITEDATACENTER := "MsiNTSuiteDataCenter"

/**
 * @type {String}
 */
export global IPROPNAME_NTSUITEENTERPRISE := "MsiNTSuiteEnterprise"

/**
 * @type {String}
 */
export global IPROPNAME_NTSUITESMALLBUSINESS := "MsiNTSuiteSmallBusiness"

/**
 * @type {String}
 */
export global IPROPNAME_NTSUITESMALLBUSINESSRESTRICTED := "MsiNTSuiteSmallBusinessRestricted"

/**
 * @type {String}
 */
export global IPROPNAME_NTSUITEPERSONAL := "MsiNTSuitePersonal"

/**
 * @type {String}
 */
export global IPROPNAME_NTSUITEWEBSERVER := "MsiNTSuiteWebServer"

/**
 * @type {String}
 */
export global IPROPNAME_NETASSEMBLYSUPPORT := "MsiNetAssemblySupport"

/**
 * @type {String}
 */
export global IPROPNAME_WIN32ASSEMBLYSUPPORT := "MsiWin32AssemblySupport"

/**
 * @type {String}
 */
export global IPROPNAME_LOGONUSER := "LogonUser"

/**
 * @type {String}
 */
export global IPROPNAME_USERSID := "UserSID"

/**
 * @type {String}
 */
export global IPROPNAME_ADMINUSER := "AdminUser"

/**
 * @type {String}
 */
export global IPROPNAME_USERLANGUAGEID := "UserLanguageID"

/**
 * @type {String}
 */
export global IPROPNAME_PRIVILEGED := "Privileged"

/**
 * @type {String}
 */
export global IPROPNAME_RUNNINGELEVATED := "MsiRunningElevated"

/**
 * @type {String}
 */
export global IPROPNAME_TRUEADMINUSER := "MsiTrueAdminUser"

/**
 * @type {String}
 */
export global IPROPNAME_WINDOWS_FOLDER := "WindowsFolder"

/**
 * @type {String}
 */
export global IPROPNAME_SYSTEM_FOLDER := "SystemFolder"

/**
 * @type {String}
 */
export global IPROPNAME_SYSTEM16_FOLDER := "System16Folder"

/**
 * @type {String}
 */
export global IPROPNAME_WINDOWS_VOLUME := "WindowsVolume"

/**
 * @type {String}
 */
export global IPROPNAME_TEMP_FOLDER := "TempFolder"

/**
 * @type {String}
 */
export global IPROPNAME_PROGRAMFILES_FOLDER := "ProgramFilesFolder"

/**
 * @type {String}
 */
export global IPROPNAME_COMMONFILES_FOLDER := "CommonFilesFolder"

/**
 * @type {String}
 */
export global IPROPNAME_SYSTEM64_FOLDER := "System64Folder"

/**
 * @type {String}
 */
export global IPROPNAME_PROGRAMFILES64_FOLDER := "ProgramFiles64Folder"

/**
 * @type {String}
 */
export global IPROPNAME_COMMONFILES64_FOLDER := "CommonFiles64Folder"

/**
 * @type {String}
 */
export global IPROPNAME_STARTMENU_FOLDER := "StartMenuFolder"

/**
 * @type {String}
 */
export global IPROPNAME_PROGRAMMENU_FOLDER := "ProgramMenuFolder"

/**
 * @type {String}
 */
export global IPROPNAME_STARTUP_FOLDER := "StartupFolder"

/**
 * @type {String}
 */
export global IPROPNAME_NETHOOD_FOLDER := "NetHoodFolder"

/**
 * @type {String}
 */
export global IPROPNAME_PERSONAL_FOLDER := "PersonalFolder"

/**
 * @type {String}
 */
export global IPROPNAME_SENDTO_FOLDER := "SendToFolder"

/**
 * @type {String}
 */
export global IPROPNAME_DESKTOP_FOLDER := "DesktopFolder"

/**
 * @type {String}
 */
export global IPROPNAME_TEMPLATE_FOLDER := "TemplateFolder"

/**
 * @type {String}
 */
export global IPROPNAME_FONTS_FOLDER := "FontsFolder"

/**
 * @type {String}
 */
export global IPROPNAME_FAVORITES_FOLDER := "FavoritesFolder"

/**
 * @type {String}
 */
export global IPROPNAME_RECENT_FOLDER := "RecentFolder"

/**
 * @type {String}
 */
export global IPROPNAME_APPDATA_FOLDER := "AppDataFolder"

/**
 * @type {String}
 */
export global IPROPNAME_PRINTHOOD_FOLDER := "PrintHoodFolder"

/**
 * @type {String}
 */
export global IPROPNAME_ADMINTOOLS_FOLDER := "AdminToolsFolder"

/**
 * @type {String}
 */
export global IPROPNAME_COMMONAPPDATA_FOLDER := "CommonAppDataFolder"

/**
 * @type {String}
 */
export global IPROPNAME_LOCALAPPDATA_FOLDER := "LocalAppDataFolder"

/**
 * @type {String}
 */
export global IPROPNAME_MYPICTURES_FOLDER := "MyPicturesFolder"

/**
 * @type {String}
 */
export global IPROPNAME_FEATUREADDLOCAL := "ADDLOCAL"

/**
 * @type {String}
 */
export global IPROPNAME_FEATUREADDSOURCE := "ADDSOURCE"

/**
 * @type {String}
 */
export global IPROPNAME_FEATUREADDDEFAULT := "ADDDEFAULT"

/**
 * @type {String}
 */
export global IPROPNAME_FEATUREREMOVE := "REMOVE"

/**
 * @type {String}
 */
export global IPROPNAME_FEATUREADVERTISE := "ADVERTISE"

/**
 * @type {String}
 */
export global IPROPVALUE_FEATURE_ALL := "ALL"

/**
 * @type {String}
 */
export global IPROPNAME_COMPONENTADDLOCAL := "COMPADDLOCAL"

/**
 * @type {String}
 */
export global IPROPNAME_COMPONENTADDSOURCE := "COMPADDSOURCE"

/**
 * @type {String}
 */
export global IPROPNAME_COMPONENTADDDEFAULT := "COMPADDDEFAULT"

/**
 * @type {String}
 */
export global IPROPNAME_FILEADDLOCAL := "FILEADDLOCAL"

/**
 * @type {String}
 */
export global IPROPNAME_FILEADDSOURCE := "FILEADDSOURCE"

/**
 * @type {String}
 */
export global IPROPNAME_FILEADDDEFAULT := "FILEADDDEFAULT"

/**
 * @type {String}
 */
export global IPROPNAME_REINSTALL := "REINSTALL"

/**
 * @type {String}
 */
export global IPROPNAME_REINSTALLMODE := "REINSTALLMODE"

/**
 * @type {String}
 */
export global IPROPNAME_PROMPTROLLBACKCOST := "PROMPTROLLBACKCOST"

/**
 * @type {String}
 */
export global IPROPVALUE_RBCOST_PROMPT := "P"

/**
 * @type {String}
 */
export global IPROPVALUE_RBCOST_SILENT := "D"

/**
 * @type {String}
 */
export global IPROPVALUE_RBCOST_FAIL := "F"

/**
 * @type {String}
 */
export global IPROPNAME_CUSTOMACTIONDATA := "CustomActionData"

/**
 * @type {String}
 */
export global IACTIONNAME_INSTALL := "INSTALL"

/**
 * @type {String}
 */
export global IACTIONNAME_ADVERTISE := "ADVERTISE"

/**
 * @type {String}
 */
export global IACTIONNAME_ADMIN := "ADMIN"

/**
 * @type {String}
 */
export global IACTIONNAME_SEQUENCE := "SEQUENCE"

/**
 * @type {String}
 */
export global IACTIONNAME_COLLECTUSERINFO := "CollectUserInfo"

/**
 * @type {String}
 */
export global IACTIONNAME_FIRSTRUN := "FirstRun"

/**
 * @type {Integer (UInt32)}
 */
export global PID_TITLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PID_SUBJECT := 3

/**
 * @type {Integer (UInt32)}
 */
export global PID_AUTHOR := 4

/**
 * @type {Integer (UInt32)}
 */
export global PID_KEYWORDS := 5

/**
 * @type {Integer (UInt32)}
 */
export global PID_COMMENTS := 6

/**
 * @type {Integer (UInt32)}
 */
export global PID_TEMPLATE := 7

/**
 * @type {Integer (UInt32)}
 */
export global PID_LASTAUTHOR := 8

/**
 * @type {Integer (UInt32)}
 */
export global PID_REVNUMBER := 9

/**
 * @type {Integer (UInt32)}
 */
export global PID_EDITTIME := 10

/**
 * @type {Integer (UInt32)}
 */
export global PID_LASTPRINTED := 11

/**
 * @type {Integer (UInt32)}
 */
export global PID_CREATE_DTM := 12

/**
 * @type {Integer (UInt32)}
 */
export global PID_LASTSAVE_DTM := 13

/**
 * @type {Integer (UInt32)}
 */
export global PID_PAGECOUNT := 14

/**
 * @type {Integer (UInt32)}
 */
export global PID_WORDCOUNT := 15

/**
 * @type {Integer (UInt32)}
 */
export global PID_CHARCOUNT := 16

/**
 * @type {Integer (UInt32)}
 */
export global PID_THUMBNAIL := 17

/**
 * @type {Integer (UInt32)}
 */
export global PID_APPNAME := 18

/**
 * @type {Integer (UInt32)}
 */
export global PID_MSIVERSION := 14

/**
 * @type {Integer (UInt32)}
 */
export global PID_MSISOURCE := 15

/**
 * @type {Integer (UInt32)}
 */
export global PID_MSIRESTRICT := 16

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_USE_BEST := 0

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_USE_LZX_BEST := 3

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_USE_LZX_A := 1

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_USE_LZX_B := 2

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_USE_LZX_LARGE := 4

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_NO_BINDFIX := 65536

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_NO_LOCKFIX := 131072

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_NO_REBASE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_FAIL_IF_SAME_FILE := 524288

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_FAIL_IF_BIGGER := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_NO_CHECKSUM := 2097152

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_NO_RESTIMEFIX := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_NO_TIMESTAMP := 8388608

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_SIGNATURE_MD5 := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_INTERLEAVE_FILES := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_RESERVED1 := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_OPTION_VALID_FLAGS := 3237937159

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_SYMBOL_NO_IMAGEHLP := 1

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_SYMBOL_NO_FAILURES := 2

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_SYMBOL_UNDECORATED_TOO := 4

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_SYMBOL_RESERVED1 := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_TRANSFORM_PE_RESOURCE_2 := 256

/**
 * @type {Integer (UInt32)}
 */
export global PATCH_TRANSFORM_PE_IRELOC_2 := 512

/**
 * @type {Integer (UInt32)}
 */
export global APPLY_OPTION_FAIL_IF_EXACT := 1

/**
 * @type {Integer (UInt32)}
 */
export global APPLY_OPTION_FAIL_IF_CLOSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global APPLY_OPTION_TEST_ONLY := 4

/**
 * @type {Integer (UInt32)}
 */
export global APPLY_OPTION_VALID_FLAGS := 7

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_ENCODE_FAILURE := 3222155521

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_INVALID_OPTIONS := 3222155522

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_SAME_FILE := 3222155523

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_RETAIN_RANGES_DIFFER := 3222155524

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_BIGGER_THAN_COMPRESSED := 3222155525

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_IMAGEHLP_FAILURE := 3222155526

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_DECODE_FAILURE := 3222159617

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_CORRUPT := 3222159618

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_NEWER_FORMAT := 3222159619

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_WRONG_FILE := 3222159620

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_NOT_NECESSARY := 3222159621

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PATCH_NOT_AVAILABLE := 3222159622

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BASE := 3222163713

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_PCP_DOESNT_EXIST := 3222163713

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_PCP_BAD_FORMAT := 3222163714

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_CREATE_TEMP_FOLDER := 3222163715

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_MISSING_PATCH_PATH := 3222163716

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_OVERWRITE_PATCH := 3222163717

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_CREATE_PATCH_FILE := 3222163718

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_MISSING_PATCH_GUID := 3222163719

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_PATCH_GUID := 3222163720

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_GUIDS_TO_REPLACE := 3222163721

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_TARGET_PRODUCT_CODE_LIST := 3222163722

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_NO_UPGRADED_IMAGES_TO_PATCH := 3222163723

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_API_PATCHING_SYMBOL_FLAGS := 3222163725

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_OODS_COPYING_MSI := 3222163726

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_IMAGE_NAME_TOO_LONG := 3222163727

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_UPGRADED_IMAGE_NAME := 3222163728

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_DUP_UPGRADED_IMAGE_NAME := 3222163729

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_IMAGE_PATH_TOO_LONG := 3222163730

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_IMAGE_PATH_EMPTY := 3222163731

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_IMAGE_PATH_NOT_EXIST := 3222163732

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_IMAGE_PATH_NOT_MSI := 3222163733

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_IMAGE_COMPRESSED := 3222163734

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_IMAGE_NAME_TOO_LONG := 3222163735

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_TARGET_IMAGE_NAME := 3222163736

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_DUP_TARGET_IMAGE_NAME := 3222163737

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_IMAGE_PATH_TOO_LONG := 3222163738

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_IMAGE_PATH_EMPTY := 3222163739

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_IMAGE_PATH_NOT_EXIST := 3222163740

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_IMAGE_PATH_NOT_MSI := 3222163741

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_IMAGE_COMPRESSED := 3222163742

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_BAD_PROD_VALIDATE := 3222163743

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_BAD_PROD_CODE_VAL := 3222163744

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_MISSING_SRC_FILES := 3222163745

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_MISSING_SRC_FILES := 3222163746

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_IMAGE_FAMILY_NAME_TOO_LONG := 3222163747

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_IMAGE_FAMILY_NAME := 3222163748

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_DUP_IMAGE_FAMILY_NAME := 3222163749

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_IMAGE_FAMILY_SRC_PROP := 3222163750

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UFILEDATA_LONG_FILE_TABLE_KEY := 3222163751

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UFILEDATA_BLANK_FILE_TABLE_KEY := 3222163752

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UFILEDATA_MISSING_FILE_TABLE_KEY := 3222163753

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_LONG_FILE_TABLE_KEY := 3222163754

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_BLANK_FILE_TABLE_KEY := 3222163755

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_BAD_FAMILY_FIELD := 3222163756

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_LONG_PATH_TO_FILE := 3222163757

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_BLANK_PATH_TO_FILE := 3222163758

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_MISSING_FILE := 3222163759

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_FILE_SEQUENCE_START := 3222163770

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_COPY_FILE_TO_TEMP_FOLDER := 3222163771

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_CREATE_ONE_PATCH_FILE := 3222163772

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_IMAGE_FAMILY_DISKID := 3222163773

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_IMAGE_FAMILY_FILESEQSTART := 3222163774

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_UPGRADED_IMAGE_FAMILY := 3222163775

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_TARGET_IMAGE_UPGRADED := 3222163776

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_DUP_TARGET_IMAGE_PACKCODE := 3222163777

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UFILEDATA_BAD_UPGRADED_FIELD := 3222163778

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_MISMATCHED_PRODUCT_CODES := 3222163779

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_MISMATCHED_PRODUCT_VERSIONS := 3222163780

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANNOT_WRITE_DDF := 3222163781

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANNOT_RUN_MAKECAB := 3222163782

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_WRITE_SUMMARY_PROPERTIES := 3222163787

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_LONG_FILE_TABLE_KEY := 3222163788

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_BLANK_FILE_TABLE_KEY := 3222163789

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_MISSING_FILE_TABLE_KEY := 3222163790

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_BAD_TARGET_FIELD := 3222163791

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_IMAGE_PATCH_PATH_TOO_LONG := 3222163792

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_IMAGE_PATCH_PATH_NOT_EXIST := 3222163793

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UPGRADED_IMAGE_PATCH_PATH_NOT_MSI := 3222163794

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_DUP_UPGRADED_IMAGE_PACKCODE := 3222163795

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UFILEIGNORE_BAD_UPGRADED_FIELD := 3222163796

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UFILEIGNORE_LONG_FILE_TABLE_KEY := 3222163797

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UFILEIGNORE_BLANK_FILE_TABLE_KEY := 3222163798

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UFILEIGNORE_BAD_FILE_TABLE_KEY := 3222163799

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_NAME_TOO_LONG := 3222163800

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_FAMILY_RANGE_NAME := 3222163801

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_LONG_FILE_TABLE_KEY := 3222163802

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_BLANK_FILE_TABLE_KEY := 3222163803

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_LONG_RETAIN_OFFSETS := 3222163804

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_BLANK_RETAIN_OFFSETS := 3222163805

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_BAD_RETAIN_OFFSETS := 3222163806

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_LONG_RETAIN_LENGTHS := 3222163807

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_BLANK_RETAIN_LENGTHS := 3222163808

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_BAD_RETAIN_LENGTHS := 3222163809

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAMILY_RANGE_COUNT_MISMATCH := 3222163810

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_LONG_IGNORE_OFFSETS := 3222163811

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_BAD_IGNORE_OFFSETS := 3222163812

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_LONG_IGNORE_LENGTHS := 3222163813

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_BAD_IGNORE_LENGTHS := 3222163814

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_IGNORE_COUNT_MISMATCH := 3222163815

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_LONG_RETAIN_OFFSETS := 3222163816

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXTFILE_BAD_RETAIN_OFFSETS := 3222163817

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_LONG_IGNORE_OFFSETS := 3222163819

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_BAD_IGNORE_OFFSETS := 3222163820

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_LONG_IGNORE_LENGTHS := 3222163821

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_BAD_IGNORE_LENGTHS := 3222163822

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_IGNORE_COUNT_MISMATCH := 3222163823

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_LONG_RETAIN_OFFSETS := 3222163824

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TFILEDATA_BAD_RETAIN_OFFSETS := 3222163825

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_GENERATE_TRANSFORM := 3222163827

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_CREATE_SUMMARY_INFO := 3222163828

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_GENERATE_TRANSFORM_POUND := 3222163829

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_CREATE_SUMMARY_INFO_POUND := 3222163830

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_UPGRADED_IMAGE_PRODUCT_CODE := 3222163831

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_UPGRADED_IMAGE_PRODUCT_VERSION := 3222163832

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_UPGRADED_IMAGE_UPGRADE_CODE := 3222163833

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_TARGET_IMAGE_PRODUCT_CODE := 3222163834

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_TARGET_IMAGE_PRODUCT_VERSION := 3222163835

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_TARGET_IMAGE_UPGRADE_CODE := 3222163836

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_MATCHED_PRODUCT_VERSIONS := 3222163837

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_OBSOLETION_WITH_SEQUENCE_DATA := 3222163838

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_OBSOLETION_WITH_MSI30 := 3222163839

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_OBSOLETION_WITH_PATCHSEQUENCE := 3222163840

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANNOT_CREATE_TABLE := 3222163841

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_GENERATE_SEQUENCEINFO_MAJORUPGD := 3222163842

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_MAJOR_UPGD_WITHOUT_SEQUENCING := 3222163843

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_PRODUCTVERSION_VALIDATION := 3222163844

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_TRANSFORMSET := 3222163845

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_TGT_UPD_IMAGES := 3222163846

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_SUPERCEDENCE := 3222163847

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_SEQUENCE := 3222163848

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_TARGET := 3222163849

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_NULL_PATCHFAMILY := 3222163850

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_NULL_SEQUENCE_NUMBER := 3222163851

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_VERSION_STRING := 3222163852

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_BAD_MAJOR_VERSION := 3222163853

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_SEQUENCING_BAD_TARGET := 3222163854

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_PATCHMETADATA_PROP_NOT_SET := 3222163855

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PATCHMETADATA_PROP := 3222163856

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_SUPERCEDENCE := 3222163857

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_DUPLICATE_SEQUENCE_RECORD := 3222163858

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_WRONG_PATCHMETADATA_STRD_PROP := 3222163859

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PARAMETER := 3222163860

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CREATEFILE_LOG_FAILED := 3222163861

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_LOG_LEVEL := 3222163862

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_UI_LEVEL := 3222163863

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_ERROR_WRITING_TO_LOG := 3222163864

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_OUT_OF_MEMORY := 3222163865

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UNKNOWN_ERROR := 3222163866

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UNKNOWN_INFO := 3222163867

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_UNKNOWN_WARN := 3222163868

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_OPEN_VIEW := 3222163869

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_EXECUTE_VIEW := 3222163870

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_VIEW_FETCH := 3222163871

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAILED_EXPAND_PATH := 3222163872

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INTERNAL_ERROR := 3222163969

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_PROPERTY := 3222163970

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_TARGETIMAGES := 3222163971

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_LAX_VALIDATION_FLAGS := 3222163972

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_FAILED_CREATE_TRANSFORM := 3222163973

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_DELETE_TEMP_FOLDER := 3222163974

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_MISSING_DIRECTORY_TABLE := 3222163975

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_SUPERSEDENCE_VALUE := 3222163976

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PATCH_TYPE_SEQUENCING := 3222163977

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_CANT_READ_FILE := 3222163978

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_TARGET_WRONG_PRODUCT_VERSION_COMP := 3222163979

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_UPGRADEDFILESTOIGNORE := 3222163980

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_UPGRADEDIMAGES := 3222163981

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_EXTERNALFILES := 3222163982

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_IMAGEFAMILIES := 3222163983

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_PATCHSEQUENCE := 3222163984

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_TARGETFILES_OPTIONALDATA := 3222163985

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_UPGRADEDFILES_OPTIONALDATA := 3222163986

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_MISSING_PATCHMETADATA := 3222163987

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_IMAGE_PATH_NOT_EXIST := 3222163988

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_RANGE_ELEMENT := 3222163989

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_MAJOR_VERSION := 3222163990

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_PROPERTIES := 3222163991

/**
 * @type {Integer (UInt32)}
 */
export global ERROR_PCW_INVALID_PCP_FAMILYFILERANGES := 3222163992

/**
 * @type {Integer (UInt32)}
 */
export global INFO_BASE := 3222229249

/**
 * @type {Integer (UInt32)}
 */
export global INFO_PASSED_MAIN_CONTROL := 3222229249

/**
 * @type {Integer (UInt32)}
 */
export global INFO_ENTERING_PHASE_I_VALIDATION := 3222229250

/**
 * @type {Integer (UInt32)}
 */
export global INFO_ENTERING_PHASE_I := 3222229251

/**
 * @type {Integer (UInt32)}
 */
export global INFO_PCP_PATH := 3222229252

/**
 * @type {Integer (UInt32)}
 */
export global INFO_TEMP_DIR := 3222229253

/**
 * @type {Integer (UInt32)}
 */
export global INFO_SET_OPTIONS := 3222229254

/**
 * @type {Integer (UInt32)}
 */
export global INFO_PROPERTY := 3222229255

/**
 * @type {Integer (UInt32)}
 */
export global INFO_ENTERING_PHASE_II := 3222229256

/**
 * @type {Integer (UInt32)}
 */
export global INFO_ENTERING_PHASE_III := 3222229257

/**
 * @type {Integer (UInt32)}
 */
export global INFO_ENTERING_PHASE_IV := 3222229258

/**
 * @type {Integer (UInt32)}
 */
export global INFO_ENTERING_PHASE_V := 3222229259

/**
 * @type {Integer (UInt32)}
 */
export global INFO_GENERATING_METADATA := 3222229265

/**
 * @type {Integer (UInt32)}
 */
export global INFO_TEMP_DIR_CLEANUP := 3222229266

/**
 * @type {Integer (UInt32)}
 */
export global INFO_PATCHCACHE_FILEINFO_FAILURE := 3222229267

/**
 * @type {Integer (UInt32)}
 */
export global INFO_PATCHCACHE_PCI_READFAILURE := 3222229268

/**
 * @type {Integer (UInt32)}
 */
export global INFO_PATCHCACHE_PCI_WRITEFAILURE := 3222229269

/**
 * @type {Integer (UInt32)}
 */
export global INFO_USING_USER_MSI_FOR_PATCH_TABLES := 3222229270

/**
 * @type {Integer (UInt32)}
 */
export global INFO_SUCCESSFUL_PATCH_CREATION := 3222229271

/**
 * @type {Integer (UInt32)}
 */
export global WARN_BASE := 3222294785

/**
 * @type {Integer (UInt32)}
 */
export global WARN_MAJOR_UPGRADE_PATCH := 3222294785

/**
 * @type {Integer (UInt32)}
 */
export global WARN_SEQUENCE_DATA_GENERATION_DISABLED := 3222294786

/**
 * @type {Integer (UInt32)}
 */
export global WARN_SEQUENCE_DATA_SUPERSEDENCE_IGNORED := 3222294787

/**
 * @type {Integer (UInt32)}
 */
export global WARN_IMPROPER_TRANSFORM_VALIDATION := 3222294788

/**
 * @type {Integer (UInt32)}
 */
export global WARN_PCW_MISMATCHED_PRODUCT_CODES := 3222294789

/**
 * @type {Integer (UInt32)}
 */
export global WARN_PCW_MISMATCHED_PRODUCT_VERSIONS := 3222294790

/**
 * @type {Integer (UInt32)}
 */
export global WARN_INVALID_TRANSFORM_VALIDATION := 3222294791

/**
 * @type {Integer (UInt32)}
 */
export global WARN_BAD_MAJOR_VERSION := 3222294792

/**
 * @type {Integer (UInt32)}
 */
export global WARN_FILE_VERSION_DOWNREV := 3222294793

/**
 * @type {Integer (UInt32)}
 */
export global WARN_EQUAL_FILE_VERSION := 3222294794

/**
 * @type {Integer (UInt32)}
 */
export global WARN_PATCHPROPERTYNOTSET := 3222294795

/**
 * @type {Integer (UInt32)}
 */
export global WARN_OBSOLETION_WITH_SEQUENCE_DATA := 3222294802

/**
 * @type {Integer (UInt32)}
 */
export global WARN_OBSOLETION_WITH_MSI30 := 3222294801

/**
 * @type {Integer (UInt32)}
 */
export global WARN_OBSOLETION_WITH_PATCHSEQUENCE := 3222294803

/**
 * @type {Integer (UInt32)}
 */
export global DELTA_MAX_HASH_SIZE := 32

/**
 * @type {Integer (Int32)}
 */
export global cchMaxInteger := 12

/**
 * @type {Integer (UInt32)}
 */
export global LOGNONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global LOGINFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOGWARN := 2

/**
 * @type {Integer (UInt32)}
 */
export global LOGERR := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOGPERFMESSAGES := 8

/**
 * @type {Integer (UInt32)}
 */
export global LOGALL := 15

/**
 * @type {Integer (UInt32)}
 */
export global UINONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global UILOGBITS := 15

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_MINIMUM_REQUIRED_MSI_VERSION := 100

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_FILE_SEQUENCE_START := 2

/**
 * @type {Integer (UInt32)}
 */
export global DEFAULT_DISK_ID := 2
;@endregion Constants
