#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.GroupPolicy
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global GPM_USE_PDC := 0

/**
 * @type {Integer (UInt32)}
 */
export global GPM_USE_ANYDC := 1

/**
 * @type {Integer (UInt32)}
 */
export global GPM_DONOTUSE_W2KDC := 2

/**
 * @type {Integer (UInt32)}
 */
export global GPM_DONOT_VALIDATEDC := 1

/**
 * @type {Integer (UInt32)}
 */
export global GPM_MIGRATIONTABLE_ONLY := 1

/**
 * @type {Integer (UInt32)}
 */
export global GPM_PROCESS_SECURITY := 2

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_NO_COMPUTER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_NO_USER := 131072

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_PLANNING_ASSUME_SLOW_LINK := 1

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_PLANNING_ASSUME_LOOPBACK_MERGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_PLANNING_ASSUME_LOOPBACK_REPLACE := 4

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_PLANNING_ASSUME_USER_WQLFILTER_TRUE := 8

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_PLANNING_ASSUME_COMP_WQLFILTER_TRUE := 16

/**
 * @type {Integer (UInt32)}
 */
export global PI_NOUI := 1

/**
 * @type {Integer (UInt32)}
 */
export global PI_APPLYPOLICY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PT_TEMPORARY := 1

/**
 * @type {Integer (UInt32)}
 */
export global PT_ROAMING := 2

/**
 * @type {Integer (UInt32)}
 */
export global PT_MANDATORY := 4

/**
 * @type {Integer (UInt32)}
 */
export global PT_ROAMING_PREEXISTING := 8

/**
 * @type {Integer (UInt32)}
 */
export global RP_FORCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global RP_SYNC := 2

/**
 * @type {Integer (UInt32)}
 */
export global GPC_BLOCK_POLICY := 1

/**
 * @type {Integer (UInt32)}
 */
export global GPO_FLAG_DISABLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GPO_FLAG_FORCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global GPO_LIST_FLAG_MACHINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GPO_LIST_FLAG_SITEONLY := 2

/**
 * @type {Integer (UInt32)}
 */
export global GPO_LIST_FLAG_NO_WMIFILTERS := 4

/**
 * @type {Integer (UInt32)}
 */
export global GPO_LIST_FLAG_NO_SECURITYFILTERS := 8

/**
 * @type {String}
 */
export global GP_DLLNAME := "DllName"

/**
 * @type {String}
 */
export global GP_ENABLEASYNCHRONOUSPROCESSING := "EnableAsynchronousProcessing"

/**
 * @type {String}
 */
export global GP_MAXNOGPOLISTCHANGESINTERVAL := "MaxNoGPOListChangesInterval"

/**
 * @type {String}
 */
export global GP_NOBACKGROUNDPOLICY := "NoBackgroundPolicy"

/**
 * @type {String}
 */
export global GP_NOGPOLISTCHANGES := "NoGPOListChanges"

/**
 * @type {String}
 */
export global GP_NOMACHINEPOLICY := "NoMachinePolicy"

/**
 * @type {String}
 */
export global GP_NOSLOWLINK := "NoSlowLink"

/**
 * @type {String}
 */
export global GP_NOTIFYLINKTRANSITION := "NotifyLinkTransition"

/**
 * @type {String}
 */
export global GP_NOUSERPOLICY := "NoUserPolicy"

/**
 * @type {String}
 */
export global GP_PERUSERLOCALSETTINGS := "PerUserLocalSettings"

/**
 * @type {String}
 */
export global GP_PROCESSGROUPPOLICY := "ProcessGroupPolicy"

/**
 * @type {String}
 */
export global GP_REQUIRESSUCCESSFULREGISTRY := "RequiresSuccessfulRegistry"

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_MACHINE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_BACKGROUND := 16

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_SLOWLINK := 32

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_VERBOSE := 64

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_NOCHANGES := 128

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_LINKTRANSITION := 256

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_LOGRSOP_TRANSITION := 512

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_FORCED_REFRESH := 1024

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_SAFEMODE_BOOT := 2048

/**
 * @type {Integer (UInt32)}
 */
export global GPO_INFO_FLAG_ASYNC_FOREGROUND := 4096

/**
 * @type {Guid}
 */
export global REGISTRY_EXTENSION_GUID := Guid("{35378eac-683f-11d2-a89a-00c04fbbcfa2}")

/**
 * @type {Guid}
 */
export global GROUP_POLICY_TRIGGER_EVENT_PROVIDER_GUID := Guid("{bd2f4252-5e1e-49fc-9a30-f3978ad89ee2}")

/**
 * @type {Guid}
 */
export global MACHINE_POLICY_PRESENT_TRIGGER_GUID := Guid("{659fcae6-5bdb-4da9-b1ff-ca2a178d46e0}")

/**
 * @type {Guid}
 */
export global USER_POLICY_PRESENT_TRIGGER_GUID := Guid("{54fb46c8-f089-464c-b1fd-59d1b62c3b50}")

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_NO_GPO_FILTER := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_NO_CSE_INVOKE := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_ASSUME_SLOW_LINK := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_LOOPBACK_MERGE := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_LOOPBACK_REPLACE := 134217728

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_ASSUME_USER_WQLFILTER_TRUE := 67108864

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_ASSUME_COMP_WQLFILTER_TRUE := 33554432

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_PLANNING_MODE := 16777216

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_NO_USER := 1

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_NO_COMPUTER := 2

/**
 * @type {Integer (UInt32)}
 */
export global FLAG_FORCE_CREATENAMESPACE := 4

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_USER_ACCESS_DENIED := 1

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_COMPUTER_ACCESS_DENIED := 2

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_TEMPNAMESPACE_EXISTS := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOCALSTATE_ASSIGNED := 1

/**
 * @type {Integer (UInt32)}
 */
export global LOCALSTATE_PUBLISHED := 2

/**
 * @type {Integer (UInt32)}
 */
export global LOCALSTATE_UNINSTALL_UNMANAGED := 4

/**
 * @type {Integer (UInt32)}
 */
export global LOCALSTATE_POLICYREMOVE_ORPHAN := 8

/**
 * @type {Integer (UInt32)}
 */
export global LOCALSTATE_POLICYREMOVE_UNINSTALL := 16

/**
 * @type {Integer (UInt32)}
 */
export global LOCALSTATE_ORPHANED := 32

/**
 * @type {Integer (UInt32)}
 */
export global LOCALSTATE_UNINSTALLED := 64

/**
 * @type {Integer (UInt32)}
 */
export global MANAGED_APPS_USERAPPLICATIONS := 1

/**
 * @type {Integer (UInt32)}
 */
export global MANAGED_APPS_FROMCATEGORY := 2

/**
 * @type {Integer (UInt32)}
 */
export global MANAGED_APPS_INFOLEVEL_DEFAULT := 65536

/**
 * @type {Integer (UInt32)}
 */
export global MANAGED_APPTYPE_WINDOWSINSTALLER := 1

/**
 * @type {Integer (UInt32)}
 */
export global MANAGED_APPTYPE_SETUPEXE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MANAGED_APPTYPE_UNSUPPORTED := 3

/**
 * @type {Guid}
 */
export global CLSID_GPESnapIn := Guid("{8fc0b734-a0e1-11d1-a7d3-0000f87571e3}")

/**
 * @type {Guid}
 */
export global NODEID_Machine := Guid("{8fc0b737-a0e1-11d1-a7d3-0000f87571e3}")

/**
 * @type {Guid}
 */
export global NODEID_MachineSWSettings := Guid("{8fc0b73a-a0e1-11d1-a7d3-0000f87571e3}")

/**
 * @type {Guid}
 */
export global NODEID_User := Guid("{8fc0b738-a0e1-11d1-a7d3-0000f87571e3}")

/**
 * @type {Guid}
 */
export global NODEID_UserSWSettings := Guid("{8fc0b73c-a0e1-11d1-a7d3-0000f87571e3}")

/**
 * @type {Guid}
 */
export global CLSID_GroupPolicyObject := Guid("{ea502722-a23d-11d1-a7d3-0000f87571e3}")

/**
 * @type {Guid}
 */
export global ADMXCOMMENTS_EXTENSION_GUID := Guid("{6c5a2a86-9eb3-42b9-aa83-a7371ba011b9}")

/**
 * @type {Guid}
 */
export global CLSID_RSOPSnapIn := Guid("{6dc3804b-7212-458d-adb0-9a07e2ae1fa2}")

/**
 * @type {Guid}
 */
export global NODEID_RSOPMachine := Guid("{bd4c1a2e-0b7a-4a62-a6b0-c0577539c97e}")

/**
 * @type {Guid}
 */
export global NODEID_RSOPMachineSWSettings := Guid("{6a76273e-eb8e-45db-94c5-25663a5f2c1a}")

/**
 * @type {Guid}
 */
export global NODEID_RSOPUser := Guid("{ab87364f-0cec-4cd8-9bf8-898f34628fb8}")

/**
 * @type {Guid}
 */
export global NODEID_RSOPUserSWSettings := Guid("{e52c5ce3-fd27-4402-84de-d9a5f2858910}")

/**
 * @type {Integer (UInt32)}
 */
export global RSOP_INFO_FLAG_DIAGNOSTIC_MODE := 1

/**
 * @type {Integer (UInt32)}
 */
export global GPO_BROWSE_DISABLENEW := 1

/**
 * @type {Integer (UInt32)}
 */
export global GPO_BROWSE_NOCOMPUTERS := 2

/**
 * @type {Integer (UInt32)}
 */
export global GPO_BROWSE_NODSGPOS := 4

/**
 * @type {Integer (UInt32)}
 */
export global GPO_BROWSE_OPENBUTTON := 8

/**
 * @type {Integer (UInt32)}
 */
export global GPO_BROWSE_INITTOALL := 16

/**
 * @type {Integer (UInt32)}
 */
export global GPO_BROWSE_NOUSERGPOS := 32

/**
 * @type {Integer (UInt32)}
 */
export global GPO_BROWSE_SENDAPPLYONEDIT := 64
;@endregion Constants
