#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import ".\HKEY.ahk" { HKEY }

/**
 * @namespace Windows.Win32.System.Registry
 */

;@region Constants

/**
 * @type {HKEY}
 */
export global HKEY_CLASSES_ROOT := HKEY(-2147483648)

/**
 * @type {HKEY}
 */
export global HKEY_CURRENT_USER := HKEY(-2147483647)

/**
 * @type {HKEY}
 */
export global HKEY_LOCAL_MACHINE := HKEY(-2147483646)

/**
 * @type {HKEY}
 */
export global HKEY_USERS := HKEY(-2147483645)

/**
 * @type {HKEY}
 */
export global HKEY_PERFORMANCE_DATA := HKEY(-2147483644)

/**
 * @type {HKEY}
 */
export global HKEY_PERFORMANCE_TEXT := HKEY(-2147483568)

/**
 * @type {HKEY}
 */
export global HKEY_PERFORMANCE_NLSTEXT := HKEY(-2147483552)

/**
 * @type {HKEY}
 */
export global HKEY_CURRENT_CONFIG := HKEY(-2147483643)

/**
 * @type {HKEY}
 */
export global HKEY_DYN_DATA := HKEY(-2147483642)

/**
 * @type {HKEY}
 */
export global HKEY_CURRENT_USER_LOCAL_SETTINGS := HKEY(-2147483641)

/**
 * @type {Integer (UInt32)}
 */
export global REG_PROCESS_APPKEY := 1

/**
 * @type {Integer (UInt32)}
 */
export global REG_USE_CURRENT_SECURITY_CONTEXT := 2

/**
 * @type {Integer (UInt32)}
 */
export global PROVIDER_KEEPS_VALUE_LENGTH := 1

/**
 * @type {Integer (UInt32)}
 */
export global REG_MUI_STRING_TRUNCATE := 1

/**
 * @type {Integer (UInt32)}
 */
export global REG_SECURE_CONNECTION := 1

/**
 * @type {Integer (UInt32)}
 */
export global REG_ALLOW_TRANSPORT_FALLBACK := 2

/**
 * @type {Integer (UInt32)}
 */
export global REG_ALLOW_UNSECURE_CONNECTION := 4

/**
 * @type {String}
 */
export global REGSTR_KEY_CLASS := "Class"

/**
 * @type {String}
 */
export global REGSTR_KEY_CONFIG := "Config"

/**
 * @type {String}
 */
export global REGSTR_KEY_ENUM := "Enum"

/**
 * @type {String}
 */
export global REGSTR_KEY_ROOTENUM := "Root"

/**
 * @type {String}
 */
export global REGSTR_KEY_BIOSENUM := "BIOS"

/**
 * @type {String}
 */
export global REGSTR_KEY_ACPIENUM := "ACPI"

/**
 * @type {String}
 */
export global REGSTR_KEY_PCMCIAENUM := "PCMCIA"

/**
 * @type {String}
 */
export global REGSTR_KEY_PCIENUM := "PCI"

/**
 * @type {String}
 */
export global REGSTR_KEY_VPOWERDENUM := "VPOWERD"

/**
 * @type {String}
 */
export global REGSTR_KEY_ISAENUM := "ISAPnP"

/**
 * @type {String}
 */
export global REGSTR_KEY_EISAENUM := "EISA"

/**
 * @type {String}
 */
export global REGSTR_KEY_LOGCONFIG := "LogConfig"

/**
 * @type {String}
 */
export global REGSTR_KEY_SYSTEMBOARD := "*PNP0C01"

/**
 * @type {String}
 */
export global REGSTR_KEY_APM := "*PNP0C05"

/**
 * @type {String}
 */
export global REGSTR_KEY_INIUPDATE := "IniUpdate"

/**
 * @type {String}
 */
export global REG_KEY_INSTDEV := "Installed"

/**
 * @type {String}
 */
export global REGSTR_KEY_DOSOPTCDROM := "CD-ROM"

/**
 * @type {String}
 */
export global REGSTR_KEY_DOSOPTMOUSE := "MOUSE"

/**
 * @type {String}
 */
export global REGSTR_KEY_KNOWNDOCKINGSTATES := "Hardware Profiles"

/**
 * @type {String}
 */
export global REGSTR_KEY_DEVICEPARAMETERS := "Device Parameters"

/**
 * @type {String}
 */
export global REGSTR_KEY_DRIVERPARAMETERS := "Driver Parameters"

/**
 * @type {String}
 */
export global REGSTR_DEFAULT_INSTANCE := "0000"

/**
 * @type {String}
 */
export global REGSTR_PATH_SETUP := "Software\Microsoft\Windows\CurrentVersion"

/**
 * @type {String}
 */
export global REGSTR_PATH_DRIVERSIGN := "Software\Microsoft\Driver Signing"

/**
 * @type {String}
 */
export global REGSTR_PATH_NONDRIVERSIGN := "Software\Microsoft\Non-Driver Signing"

/**
 * @type {String}
 */
export global REGSTR_PATH_DRIVERSIGN_POLICY := "Software\Policies\Microsoft\Windows NT\Driver Signing"

/**
 * @type {String}
 */
export global REGSTR_PATH_NONDRIVERSIGN_POLICY := "Software\Policies\Microsoft\Windows NT\Non-Driver Signing"

/**
 * @type {String}
 */
export global REGSTR_PATH_PIFCONVERT := "Software\Microsoft\Windows\CurrentVersion\PIFConvert"

/**
 * @type {String}
 */
export global REGSTR_PATH_MSDOSOPTS := "Software\Microsoft\Windows\CurrentVersion\MS-DOSOptions"

/**
 * @type {String}
 */
export global REGSTR_PATH_NOSUGGMSDOS := "Software\Microsoft\Windows\CurrentVersion\NoMSDOSWarn"

/**
 * @type {String}
 */
export global REGSTR_PATH_NEWDOSBOX := "Software\Microsoft\Windows\CurrentVersion\MS-DOSSpecialConfig"

/**
 * @type {String}
 */
export global REGSTR_PATH_RUNONCE := "Software\Microsoft\Windows\CurrentVersion\RunOnce"

/**
 * @type {String}
 */
export global REGSTR_PATH_RUNONCEEX := "Software\Microsoft\Windows\CurrentVersion\RunOnceEx"

/**
 * @type {String}
 */
export global REGSTR_PATH_RUN := "Software\Microsoft\Windows\CurrentVersion\Run"

/**
 * @type {String}
 */
export global REGSTR_PATH_RUNSERVICESONCE := "Software\Microsoft\Windows\CurrentVersion\RunServicesOnce"

/**
 * @type {String}
 */
export global REGSTR_PATH_RUNSERVICES := "Software\Microsoft\Windows\CurrentVersion\RunServices"

/**
 * @type {String}
 */
export global REGSTR_PATH_EXPLORER := "Software\Microsoft\Windows\CurrentVersion\Explorer"

/**
 * @type {String}
 */
export global REGSTR_PATH_PROPERTYSYSTEM := "Software\Microsoft\Windows\CurrentVersion\PropertySystem"

/**
 * @type {String}
 */
export global REGSTR_PATH_DETECT := "Software\Microsoft\Windows\CurrentVersion\Detect"

/**
 * @type {String}
 */
export global REGSTR_PATH_APPPATHS := "Software\Microsoft\Windows\CurrentVersion\App Paths"

/**
 * @type {String}
 */
export global REGSTR_PATH_UNINSTALL := "Software\Microsoft\Windows\CurrentVersion\Uninstall"

/**
 * @type {String}
 */
export global REGSTR_PATH_REALMODENET := "Software\Microsoft\Windows\CurrentVersion\Network\Real Mode Net"

/**
 * @type {String}
 */
export global REGSTR_PATH_NETEQUIV := "Software\Microsoft\Windows\CurrentVersion\Network\Equivalent"

/**
 * @type {String}
 */
export global REGSTR_PATH_CVNETWORK := "Software\Microsoft\Windows\CurrentVersion\Network"

/**
 * @type {String}
 */
export global REGSTR_PATH_WMI_SECURITY := "System\CurrentControlSet\Control\Wmi\Security"

/**
 * @type {String}
 */
export global REGSTR_PATH_RELIABILITY := "Software\Microsoft\Windows\CurrentVersion\Reliability"

/**
 * @type {String}
 */
export global REGSTR_PATH_RELIABILITY_POLICY := "Software\Policies\Microsoft\Windows NT\Reliability"

/**
 * @type {String}
 */
export global REGSTR_PATH_RELIABILITY_POLICY_SHUTDOWNREASONUI := "ShutdownReasonUI"

/**
 * @type {String}
 */
export global REGSTR_PATH_RELIABILITY_POLICY_SNAPSHOT := "Snapshot"

/**
 * @type {String}
 */
export global REGSTR_PATH_RELIABILITY_POLICY_REPORTSNAPSHOT := "ReportSnapshot"

/**
 * @type {String}
 */
export global REGSTR_PATH_REINSTALL := "SOFTWARE\Microsoft\Windows\CurrentVersion\Reinstall"

/**
 * @type {String}
 */
export global REGSTR_PATH_NT_CURRENTVERSION := "Software\Microsoft\Windows NT\CurrentVersion"

/**
 * @type {String}
 */
export global REGSTR_PATH_VOLUMECACHE := "Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISPLAY := "display"

/**
 * @type {String}
 */
export global REGSTR_PATH_IDCONFIGDB := "System\CurrentControlSet\Control\IDConfigDB"

/**
 * @type {String}
 */
export global REGSTR_PATH_CRITICALDEVICEDATABASE := "System\CurrentControlSet\Control\CriticalDeviceDatabase"

/**
 * @type {String}
 */
export global REGSTR_PATH_CLASS := "System\CurrentControlSet\Services\Class"

/**
 * @type {String}
 */
export global REGSTR_PATH_DISPLAYSETTINGS := "Display\Settings"

/**
 * @type {String}
 */
export global REGSTR_PATH_FONTS := "Display\Fonts"

/**
 * @type {String}
 */
export global REGSTR_PATH_ENUM := "Enum"

/**
 * @type {String}
 */
export global REGSTR_PATH_ROOT := "Enum\Root"

/**
 * @type {String}
 */
export global REGSTR_PATH_CURRENTCONTROLSET := "System\CurrentControlSet"

/**
 * @type {String}
 */
export global REGSTR_PATH_SYSTEMENUM := "System\CurrentControlSet\Enum"

/**
 * @type {String}
 */
export global REGSTR_PATH_HWPROFILES := "System\CurrentControlSet\Hardware Profiles"

/**
 * @type {String}
 */
export global REGSTR_PATH_HWPROFILESCURRENT := "System\CurrentControlSet\Hardware Profiles\Current"

/**
 * @type {String}
 */
export global REGSTR_PATH_CLASS_NT := "System\CurrentControlSet\Control\Class"

/**
 * @type {String}
 */
export global REGSTR_PATH_PER_HW_ID_STORAGE := "Software\Microsoft\Windows NT\CurrentVersion\PerHwIdStorage"

/**
 * @type {String}
 */
export global REGSTR_PATH_DEVICE_CLASSES := "System\CurrentControlSet\Control\DeviceClasses"

/**
 * @type {String}
 */
export global REGSTR_PATH_CODEVICEINSTALLERS := "System\CurrentControlSet\Control\CoDeviceInstallers"

/**
 * @type {String}
 */
export global REGSTR_PATH_BUSINFORMATION := "System\CurrentControlSet\Control\PnP\BusInformation"

/**
 * @type {String}
 */
export global REGSTR_PATH_SERVICES := "System\CurrentControlSet\Services"

/**
 * @type {String}
 */
export global REGSTR_PATH_VXD := "System\CurrentControlSet\Services\VxD"

/**
 * @type {String}
 */
export global REGSTR_PATH_IOS := "System\CurrentControlSet\Services\VxD\IOS"

/**
 * @type {String}
 */
export global REGSTR_PATH_VMM := "System\CurrentControlSet\Services\VxD\VMM"

/**
 * @type {String}
 */
export global REGSTR_PATH_VPOWERD := "System\CurrentControlSet\Services\VxD\VPOWERD"

/**
 * @type {String}
 */
export global REGSTR_PATH_VNETSUP := "System\CurrentControlSet\Services\VxD\VNETSUP"

/**
 * @type {String}
 */
export global REGSTR_PATH_NWREDIR := "System\CurrentControlSet\Services\VxD\NWREDIR"

/**
 * @type {String}
 */
export global REGSTR_PATH_NCPSERVER := "System\CurrentControlSet\Services\NcpServer\Parameters"

/**
 * @type {String}
 */
export global REGSTR_PATH_VCOMM := "System\CurrentControlSet\Services\VxD\VCOMM"

/**
 * @type {String}
 */
export global REGSTR_PATH_IOARB := "System\CurrentControlSet\Services\Arbitrators\IOArb"

/**
 * @type {String}
 */
export global REGSTR_PATH_ADDRARB := "System\CurrentControlSet\Services\Arbitrators\AddrArb"

/**
 * @type {String}
 */
export global REGSTR_PATH_DMAARB := "System\CurrentControlSet\Services\Arbitrators\DMAArb"

/**
 * @type {String}
 */
export global REGSTR_PATH_IRQARB := "System\CurrentControlSet\Services\Arbitrators\IRQArb"

/**
 * @type {String}
 */
export global REGSTR_PATH_CODEPAGE := "System\CurrentControlSet\Control\Nls\Codepage"

/**
 * @type {String}
 */
export global REGSTR_PATH_FILESYSTEM := "System\CurrentControlSet\Control\FileSystem"

/**
 * @type {String}
 */
export global REGSTR_PATH_FILESYSTEM_NOVOLTRACK := "System\CurrentControlSet\Control\FileSystem\NoVolTrack"

/**
 * @type {String}
 */
export global REGSTR_PATH_CDFS := "System\CurrentControlSet\Control\FileSystem\CDFS"

/**
 * @type {String}
 */
export global REGSTR_PATH_WINBOOT := "System\CurrentControlSet\Control\WinBoot"

/**
 * @type {String}
 */
export global REGSTR_PATH_INSTALLEDFILES := "System\CurrentControlSet\Control\InstalledFiles"

/**
 * @type {String}
 */
export global REGSTR_PATH_VMM32FILES := "System\CurrentControlSet\Control\VMM32Files"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_MAX_VALUE_LENGTH := 256

/**
 * @type {String}
 */
export global REGSTR_KEY_DEVICE_PROPERTIES := "Properties"

/**
 * @type {String}
 */
export global REGSTR_VAL_SERVICE := "Service"

/**
 * @type {String}
 */
export global REGSTR_VAL_CLASSGUID := "ClassGUID"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISABLECOUNT := "DisableCount"

/**
 * @type {String}
 */
export global REGSTR_VAL_DOCKSTATE := "DockState"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICE_INSTANCE := "DeviceInstance"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYMBOLIC_LINK := "SymbolicLink"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEFAULT := "Default"

/**
 * @type {String}
 */
export global REGSTR_VAL_LOWERFILTERS := "LowerFilters"

/**
 * @type {String}
 */
export global REGSTR_VAL_UPPERFILTERS := "UpperFilters"

/**
 * @type {String}
 */
export global REGSTR_VAL_LOCATION_INFORMATION := "LocationInformation"

/**
 * @type {String}
 */
export global REGSTR_VAL_UI_NUMBER := "UINumber"

/**
 * @type {String}
 */
export global REGSTR_VAL_UI_NUMBER_DESC_FORMAT := "UINumberDescFormat"

/**
 * @type {String}
 */
export global REGSTR_VAL_CAPABILITIES := "Capabilities"

/**
 * @type {String}
 */
export global REGSTR_VAL_ADDRESS := "Address"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICE_TYPE := "DeviceType"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICE_CHARACTERISTICS := "DeviceCharacteristics"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICE_SECURITY_DESCRIPTOR := "Security"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICE_EXCLUSIVE := "Exclusive"

/**
 * @type {String}
 */
export global REGSTR_VAL_RESOURCE_PICKER_TAGS := "ResourcePickerTags"

/**
 * @type {String}
 */
export global REGSTR_VAL_RESOURCE_PICKER_EXCEPTIONS := "ResourcePickerExceptions"

/**
 * @type {String}
 */
export global REGSTR_VAL_CUSTOM_PROPERTY_CACHE_DATE := "CustomPropertyCacheDate"

/**
 * @type {String}
 */
export global REGSTR_VAL_CUSTOM_PROPERTY_HW_ID_KEY := "CustomPropertyHwIdKey"

/**
 * @type {String}
 */
export global REGSTR_VAL_LAST_UPDATE_TIME := "LastUpdateTime"

/**
 * @type {String}
 */
export global REGSTR_VAL_CONTAINERID := "ContainerID"

/**
 * @type {String}
 */
export global REGSTR_VAL_EJECT_PRIORITY := "EjectPriority"

/**
 * @type {String}
 */
export global REGSTR_KEY_CONTROL := "Control"

/**
 * @type {String}
 */
export global REGSTR_VAL_ACTIVESERVICE := "ActiveService"

/**
 * @type {String}
 */
export global REGSTR_VAL_LINKED := "Linked"

/**
 * @type {String}
 */
export global REGSTR_VAL_PHYSICALDEVICEOBJECT := "PhysicalDeviceObject"

/**
 * @type {String}
 */
export global REGSTR_VAL_REMOVAL_POLICY := "RemovalPolicy"

/**
 * @type {String}
 */
export global REGSTR_KEY_FILTERS := "Filters"

/**
 * @type {String}
 */
export global REGSTR_VAL_LOWER_FILTER_DEFAULT_LEVEL := "LowerFilterDefaultLevel"

/**
 * @type {String}
 */
export global REGSTR_VAL_UPPER_FILTER_DEFAULT_LEVEL := "UpperFilterDefaultLevel"

/**
 * @type {String}
 */
export global REGSTR_KEY_LOWER_FILTER_LEVEL_DEFAULT := "*Lower"

/**
 * @type {String}
 */
export global REGSTR_KEY_UPPER_FILTER_LEVEL_DEFAULT := "*Upper"

/**
 * @type {String}
 */
export global REGSTR_VAL_LOWER_FILTER_LEVELS := "LowerFilterLevels"

/**
 * @type {String}
 */
export global REGSTR_VAL_UPPER_FILTER_LEVELS := "UpperFilterLevels"

/**
 * @type {String}
 */
export global REGSTR_VAL_CURRENT_VERSION := "CurrentVersion"

/**
 * @type {String}
 */
export global REGSTR_VAL_CURRENT_BUILD := "CurrentBuildNumber"

/**
 * @type {String}
 */
export global REGSTR_VAL_CURRENT_CSDVERSION := "CSDVersion"

/**
 * @type {String}
 */
export global REGSTR_VAL_CURRENT_TYPE := "CurrentType"

/**
 * @type {String}
 */
export global REGSTR_VAL_BITSPERPIXEL := "BitsPerPixel"

/**
 * @type {String}
 */
export global REGSTR_VAL_RESOLUTION := "Resolution"

/**
 * @type {String}
 */
export global REGSTR_VAL_DPILOGICALX := "DPILogicalX"

/**
 * @type {String}
 */
export global REGSTR_VAL_DPILOGICALY := "DPILogicalY"

/**
 * @type {String}
 */
export global REGSTR_VAL_DPIPHYSICALX := "DPIPhysicalX"

/**
 * @type {String}
 */
export global REGSTR_VAL_DPIPHYSICALY := "DPIPhysicalY"

/**
 * @type {String}
 */
export global REGSTR_VAL_REFRESHRATE := "RefreshRate"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISPLAYFLAGS := "DisplayFlags"

/**
 * @type {String}
 */
export global REGSTR_PATH_CONTROLPANEL := "Control Panel"

/**
 * @type {String}
 */
export global REGSTR_PATH_CONTROLSFOLDER := "Software\Microsoft\Windows\CurrentVersion\Controls Folder"

/**
 * @type {String}
 */
export global REGSTR_VAL_DOSCP := "OEMCP"

/**
 * @type {String}
 */
export global REGSTR_VAL_WINCP := "ACP"

/**
 * @type {String}
 */
export global REGSTR_VAL_DONTUSEMEM := "DontAllocLastMem"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSTEMROOT := "SystemRoot"

/**
 * @type {String}
 */
export global REGSTR_VAL_BOOTCOUNT := "BootCount"

/**
 * @type {String}
 */
export global REGSTR_VAL_REALNETSTART := "RealNetStart"

/**
 * @type {String}
 */
export global REGSTR_VAL_MEDIA := "MediaPath"

/**
 * @type {String}
 */
export global REGSTR_VAL_CONFIG := "ConfigPath"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICEPATH := "DevicePath"

/**
 * @type {String}
 */
export global REGSTR_VAL_SRCPATH := "SourcePath"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRIVERCACHEPATH := "DriverCachePath"

/**
 * @type {String}
 */
export global REGSTR_VAL_OLDWINDIR := "OldWinDir"

/**
 * @type {String}
 */
export global REGSTR_VAL_SETUPFLAGS := "SetupFlags"

/**
 * @type {String}
 */
export global REGSTR_VAL_REGOWNER := "RegisteredOwner"

/**
 * @type {String}
 */
export global REGSTR_VAL_REGORGANIZATION := "RegisteredOrganization"

/**
 * @type {String}
 */
export global REGSTR_VAL_LICENSINGINFO := "LicensingInfo"

/**
 * @type {String}
 */
export global REGSTR_VAL_OLDMSDOSVER := "OldMSDOSVer"

/**
 * @type {String}
 */
export global REGSTR_VAL_FIRSTINSTALLDATETIME := "FirstInstallDateTime"

/**
 * @type {String}
 */
export global REGSTR_VAL_INSTALLTYPE := "InstallType"

/**
 * @type {Integer (UInt32)}
 */
export global IT_COMPACT := 0

/**
 * @type {Integer (UInt32)}
 */
export global IT_TYPICAL := 1

/**
 * @type {Integer (UInt32)}
 */
export global IT_PORTABLE := 2

/**
 * @type {Integer (UInt32)}
 */
export global IT_CUSTOM := 3

/**
 * @type {String}
 */
export global REGSTR_VAL_WRAPPER := "Wrapper"

/**
 * @type {String}
 */
export global REGSTR_KEY_RUNHISTORY := "RunHistory"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTALIVEINTERVAL := "TimeStampInterval"

/**
 * @type {String}
 */
export global REGSTR_VAL_DIRTYSHUTDOWN := "DirtyShutdown"

/**
 * @type {String}
 */
export global REGSTR_VAL_DIRTYSHUTDOWNTIME := "DirtyShutdownTime"

/**
 * @type {String}
 */
export global REGSTR_VAL_BT := "6005BT"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTCOMPUTERNAME := "LastComputerName"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTALIVEBT := "LastAliveBT"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTALIVESTAMP := "LastAliveStamp"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTALIVESTAMPFORCED := "LastAliveStampForced"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTALIVESTAMPINTERVAL := "LastAliveStampInterval"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTALIVESTAMPPOLICYINTERVAL := "LastAliveStampPolicyInterval"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTALIVEUPTIME := "LastAliveUptime"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTALIVEPMPOLICY := "LastAlivePMPolicy"

/**
 * @type {String}
 */
export global REGSTR_VAL_REASONCODE := "ReasonCode"

/**
 * @type {String}
 */
export global REGSTR_VAL_COMMENT := "Comment"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWNREASON := "ShutdownReason"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWNREASON_CODE := "ShutdownReasonCode"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWNREASON_COMMENT := "ShutdownReasonComment"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWNREASON_PROCESS := "ShutdownReasonProcess"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWNREASON_USERNAME := "ShutdownReasonUserName"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHOWREASONUI := "ShutdownReasonUI"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWN_IGNORE_PREDEFINED := "ShutdownIgnorePredefinedReasons"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWN_STATE_SNAPSHOT := "ShutdownStateSnapshot"

/**
 * @type {String}
 */
export global REGSTR_KEY_SETUP := "\Setup"

/**
 * @type {String}
 */
export global REGSTR_VAL_BOOTDIR := "BootDir"

/**
 * @type {String}
 */
export global REGSTR_VAL_WINBOOTDIR := "WinbootDir"

/**
 * @type {String}
 */
export global REGSTR_VAL_WINDIR := "WinDir"

/**
 * @type {String}
 */
export global REGSTR_VAL_APPINSTPATH := "AppInstallPath"

/**
 * @type {String}
 */
export global REGSTR_KEY_EBDFILESLOCAL := "EBDFilesLocale"

/**
 * @type {String}
 */
export global REGSTR_KEY_EBDFILESKEYBOARD := "EBDFilesKeyboard"

/**
 * @type {String}
 */
export global REGSTR_KEY_EBDAUTOEXECBATLOCAL := "EBDAutoexecBatLocale"

/**
 * @type {String}
 */
export global REGSTR_KEY_EBDAUTOEXECBATKEYBOARD := "EBDAutoexecBatKeyboard"

/**
 * @type {String}
 */
export global REGSTR_KEY_EBDCONFIGSYSLOCAL := "EBDConfigSysLocale"

/**
 * @type {String}
 */
export global REGSTR_KEY_EBDCONFIGSYSKEYBOARD := "EBDConfigSysKeyboard"

/**
 * @type {String}
 */
export global REGSTR_VAL_POLICY := "Policy"

/**
 * @type {String}
 */
export global REGSTR_VAL_BEHAVIOR_ON_FAILED_VERIFY := "BehaviorOnFailedVerify"

/**
 * @type {Integer (UInt32)}
 */
export global DRIVERSIGN_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global DRIVERSIGN_WARNING := 1

/**
 * @type {Integer (UInt32)}
 */
export global DRIVERSIGN_BLOCKING := 2

/**
 * @type {String}
 */
export global REGSTR_VAL_MSDOSMODE := "MSDOSMode"

/**
 * @type {String}
 */
export global REGSTR_VAL_MSDOSMODEDISCARD := "Discard"

/**
 * @type {String}
 */
export global REGSTR_VAL_DOSOPTGLOBALFLAGS := "GlobalFlags"

/**
 * @type {Integer (Int32)}
 */
export global DOSOPTGF_DEFCLEAN := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_DOSOPTFLAGS := "Flags"

/**
 * @type {String}
 */
export global REGSTR_VAL_OPTORDER := "Order"

/**
 * @type {String}
 */
export global REGSTR_VAL_CONFIGSYS := "Config.Sys"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTOEXEC := "Autoexec.Bat"

/**
 * @type {String}
 */
export global REGSTR_VAL_STDDOSOPTION := "StdOption"

/**
 * @type {String}
 */
export global REGSTR_VAL_DOSOPTTIP := "TipText"

/**
 * @type {Integer (Int32)}
 */
export global DOSOPTF_DEFAULT := 1

/**
 * @type {Integer (Int32)}
 */
export global DOSOPTF_SUPPORTED := 2

/**
 * @type {Integer (Int32)}
 */
export global DOSOPTF_ALWAYSUSE := 4

/**
 * @type {Integer (Int32)}
 */
export global DOSOPTF_USESPMODE := 8

/**
 * @type {Integer (Int32)}
 */
export global DOSOPTF_PROVIDESUMB := 16

/**
 * @type {Integer (Int32)}
 */
export global DOSOPTF_NEEDSETUP := 32

/**
 * @type {Integer (Int32)}
 */
export global DOSOPTF_INDOSSTART := 64

/**
 * @type {Integer (Int32)}
 */
export global DOSOPTF_MULTIPLE := 128

/**
 * @type {Integer (Int32)}
 */
export global SUF_FIRSTTIME := 1

/**
 * @type {Integer (Int32)}
 */
export global SUF_EXPRESS := 2

/**
 * @type {Integer (Int32)}
 */
export global SUF_BATCHINF := 4

/**
 * @type {Integer (Int32)}
 */
export global SUF_CLEAN := 8

/**
 * @type {Integer (Int32)}
 */
export global SUF_INSETUP := 16

/**
 * @type {Integer (Int32)}
 */
export global SUF_NETSETUP := 32

/**
 * @type {Integer (Int32)}
 */
export global SUF_NETHDBOOT := 64

/**
 * @type {Integer (Int32)}
 */
export global SUF_NETRPLBOOT := 128

/**
 * @type {Integer (Int32)}
 */
export global SUF_SBSCOPYOK := 256

/**
 * @type {String}
 */
export global REGSTR_VAL_DOSPAGER := "DOSPager"

/**
 * @type {String}
 */
export global REGSTR_VAL_VXDGROUPS := "VXDGroups"

/**
 * @type {String}
 */
export global REGSTR_VAL_VPOWERDFLAGS := "Flags"

/**
 * @type {Integer (UInt32)}
 */
export global VPDF_DISABLEPWRMGMT := 1

/**
 * @type {Integer (UInt32)}
 */
export global VPDF_FORCEAPM10MODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global VPDF_SKIPINTELSLCHECK := 4

/**
 * @type {Integer (UInt32)}
 */
export global VPDF_DISABLEPWRSTATUSPOLL := 8

/**
 * @type {Integer (UInt32)}
 */
export global VPDF_DISABLERINGRESUME := 16

/**
 * @type {Integer (UInt32)}
 */
export global VPDF_SHOWMULTIBATT := 32

/**
 * @type {Integer (UInt32)}
 */
export global BIF_SHOWSIMILARDRIVERS := 1

/**
 * @type {Integer (UInt32)}
 */
export global BIF_RAWDEVICENEEDSDRIVER := 2

/**
 * @type {String}
 */
export global REGSTR_VAL_WORKGROUP := "Workgroup"

/**
 * @type {String}
 */
export global REGSTR_VAL_DIRECTHOST := "DirectHost"

/**
 * @type {String}
 */
export global REGSTR_VAL_FILESHARING := "FileSharing"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRINTSHARING := "PrintSharing"

/**
 * @type {String}
 */
export global REGSTR_VAL_FIRSTNETDRIVE := "FirstNetworkDrive"

/**
 * @type {String}
 */
export global REGSTR_VAL_MAXCONNECTIONS := "MaxConnections"

/**
 * @type {String}
 */
export global REGSTR_VAL_APISUPPORT := "APISupport"

/**
 * @type {String}
 */
export global REGSTR_VAL_MAXRETRY := "MaxRetry"

/**
 * @type {String}
 */
export global REGSTR_VAL_MINRETRY := "MinRetry"

/**
 * @type {String}
 */
export global REGSTR_VAL_SUPPORTLFN := "SupportLFN"

/**
 * @type {String}
 */
export global REGSTR_VAL_SUPPORTBURST := "SupportBurst"

/**
 * @type {String}
 */
export global REGSTR_VAL_SUPPORTTUNNELLING := "SupportTunnelling"

/**
 * @type {String}
 */
export global REGSTR_VAL_FULLTRACE := "FullTrace"

/**
 * @type {String}
 */
export global REGSTR_VAL_READCACHING := "ReadCaching"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHOWDOTS := "ShowDots"

/**
 * @type {String}
 */
export global REGSTR_VAL_GAPTIME := "GapTime"

/**
 * @type {String}
 */
export global REGSTR_VAL_SEARCHMODE := "SearchMode"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHELLVERSION := "ShellVersion"

/**
 * @type {String}
 */
export global REGSTR_VAL_MAXLIP := "MaxLIP"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRESERVECASE := "PreserveCase"

/**
 * @type {String}
 */
export global REGSTR_VAL_OPTIMIZESFN := "OptimizeSFN"

/**
 * @type {String}
 */
export global REGSTR_VAL_NCP_BROWSEMASTER := "BrowseMaster"

/**
 * @type {String}
 */
export global REGSTR_VAL_NCP_USEPEERBROWSING := "Use_PeerBrowsing"

/**
 * @type {String}
 */
export global REGSTR_VAL_NCP_USESAP := "Use_Sap"

/**
 * @type {String}
 */
export global REGSTR_VAL_PCCARD_POWER := "EnablePowerManagement"

/**
 * @type {String}
 */
export global REGSTR_VAL_WIN31FILESYSTEM := "Win31FileSystem"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRESERVELONGNAMES := "PreserveLongNames"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRIVEWRITEBEHIND := "DriveWriteBehind"

/**
 * @type {String}
 */
export global REGSTR_VAL_ASYNCFILECOMMIT := "AsyncFileCommit"

/**
 * @type {String}
 */
export global REGSTR_VAL_PATHCACHECOUNT := "PathCache"

/**
 * @type {String}
 */
export global REGSTR_VAL_NAMECACHECOUNT := "NameCache"

/**
 * @type {String}
 */
export global REGSTR_VAL_CONTIGFILEALLOC := "ContigFileAllocSize"

/**
 * @type {String}
 */
export global REGSTR_VAL_FREESPACERATIO := "FreeSpaceRatio"

/**
 * @type {String}
 */
export global REGSTR_VAL_VOLIDLETIMEOUT := "VolumeIdleTimeout"

/**
 * @type {String}
 */
export global REGSTR_VAL_BUFFIDLETIMEOUT := "BufferIdleTimeout"

/**
 * @type {String}
 */
export global REGSTR_VAL_BUFFAGETIMEOUT := "BufferAgeTimeout"

/**
 * @type {String}
 */
export global REGSTR_VAL_NAMENUMERICTAIL := "NameNumericTail"

/**
 * @type {String}
 */
export global REGSTR_VAL_READAHEADTHRESHOLD := "ReadAheadThreshold"

/**
 * @type {String}
 */
export global REGSTR_VAL_DOUBLEBUFFER := "DoubleBuffer"

/**
 * @type {String}
 */
export global REGSTR_VAL_SOFTCOMPATMODE := "SoftCompatMode"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRIVESPINDOWN := "DriveSpinDown"

/**
 * @type {String}
 */
export global REGSTR_VAL_FORCEPMIO := "ForcePMIO"

/**
 * @type {String}
 */
export global REGSTR_VAL_FORCERMIO := "ForceRMIO"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTBOOTPMDRVS := "LastBootPMDrvs"

/**
 * @type {String}
 */
export global REGSTR_VAL_ACSPINDOWNPREVIOUS := "ACSpinDownPrevious"

/**
 * @type {String}
 */
export global REGSTR_VAL_BATSPINDOWNPREVIOUS := "BatSpinDownPrevious"

/**
 * @type {String}
 */
export global REGSTR_VAL_VIRTUALHDIRQ := "VirtualHDIRQ"

/**
 * @type {String}
 */
export global REGSTR_VAL_SRVNAMECACHECOUNT := "ServerNameCacheMax"

/**
 * @type {String}
 */
export global REGSTR_VAL_SRVNAMECACHE := "ServerNameCache"

/**
 * @type {String}
 */
export global REGSTR_VAL_SRVNAMECACHENETPROV := "ServerNameCacheNumNets"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTOMOUNT := "AutoMountDrives"

/**
 * @type {String}
 */
export global REGSTR_VAL_COMPRESSIONMETHOD := "CompressionAlgorithm"

/**
 * @type {String}
 */
export global REGSTR_VAL_COMPRESSIONTHRESHOLD := "CompressionThreshold"

/**
 * @type {String}
 */
export global REGSTR_VAL_ACDRIVESPINDOWN := "ACDriveSpinDown"

/**
 * @type {String}
 */
export global REGSTR_VAL_BATDRIVESPINDOWN := "BatDriveSpinDown"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDCACHESIZE := "CacheSize"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDPREFETCH := "Prefetch"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDPREFETCHTAIL := "PrefetchTail"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDRAWCACHE := "RawCache"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDEXTERRORS := "ExtendedErrors"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDSVDSENSE := "SVDSense"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDSHOWVERSIONS := "ShowVersions"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDCOMPATNAMES := "MSCDEXCompatNames"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDNOREADAHEAD := "NoReadAhead"

/**
 * @type {String}
 */
export global REGSTR_VAL_SCSI := "SCSI\"

/**
 * @type {String}
 */
export global REGSTR_VAL_ESDI := "ESDI\"

/**
 * @type {String}
 */
export global REGSTR_VAL_FLOP := "FLOP\"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISK := "GenDisk"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDROM := "GenCD"

/**
 * @type {String}
 */
export global REGSTR_VAL_TAPE := "TAPE"

/**
 * @type {String}
 */
export global REGSTR_VAL_SCANNER := "SCANNER"

/**
 * @type {String}
 */
export global REGSTR_VAL_FLOPPY := "FLOPPY"

/**
 * @type {String}
 */
export global REGSTR_VAL_SCSITID := "SCSITargetID"

/**
 * @type {String}
 */
export global REGSTR_VAL_SCSILUN := "SCSILUN"

/**
 * @type {String}
 */
export global REGSTR_VAL_REVLEVEL := "RevisionLevel"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRODUCTID := "ProductId"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRODUCTTYPE := "ProductType"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVTYPE := "DeviceType"

/**
 * @type {String}
 */
export global REGSTR_VAL_REMOVABLE := "Removable"

/**
 * @type {String}
 */
export global REGSTR_VAL_CURDRVLET := "CurrentDriveLetterAssignment"

/**
 * @type {String}
 */
export global REGSTR_VAL_USRDRVLET := "UserDriveLetterAssignment"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYNCDATAXFER := "SyncDataXfer"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTOINSNOTE := "AutoInsertNotification"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISCONNECT := "Disconnect"

/**
 * @type {String}
 */
export global REGSTR_VAL_INT13 := "Int13"

/**
 * @type {String}
 */
export global REGSTR_VAL_PMODE_INT13 := "PModeInt13"

/**
 * @type {String}
 */
export global REGSTR_VAL_USERSETTINGS := "AdapterSettings"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOIDE := "NoIDE"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISKCLASSNAME := "DiskDrive"

/**
 * @type {String}
 */
export global REGSTR_VAL_CDROMCLASSNAME := "CDROM"

/**
 * @type {String}
 */
export global REGSTR_VAL_FORCELOAD := "ForceLoadPD"

/**
 * @type {String}
 */
export global REGSTR_VAL_FORCEFIFO := "ForceFIFO"

/**
 * @type {String}
 */
export global REGSTR_VAL_FORCECL := "ForceChangeLine"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOUSECLASS := "NoUseClass"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOINSTALLCLASS := "NoInstallClass"

/**
 * @type {String}
 */
export global REGSTR_VAL_NODISPLAYCLASS := "NoDisplayClass"

/**
 * @type {String}
 */
export global REGSTR_VAL_SILENTINSTALL := "SilentInstall"

/**
 * @type {String}
 */
export global REGSTR_VAL_FSFILTERCLASS := "FSFilterClass"

/**
 * @type {String}
 */
export global REGSTR_KEY_PCMCIA_CLASS := "PCMCIA"

/**
 * @type {String}
 */
export global REGSTR_KEY_SCSI_CLASS := "SCSIAdapter"

/**
 * @type {String}
 */
export global REGSTR_KEY_PORTS_CLASS := "ports"

/**
 * @type {String}
 */
export global REGSTR_KEY_MEDIA_CLASS := "MEDIA"

/**
 * @type {String}
 */
export global REGSTR_KEY_DISPLAY_CLASS := "Display"

/**
 * @type {String}
 */
export global REGSTR_KEY_KEYBOARD_CLASS := "Keyboard"

/**
 * @type {String}
 */
export global REGSTR_KEY_MOUSE_CLASS := "Mouse"

/**
 * @type {String}
 */
export global REGSTR_KEY_MONITOR_CLASS := "Monitor"

/**
 * @type {String}
 */
export global REGSTR_KEY_MODEM_CLASS := "Modem"

/**
 * @type {String}
 */
export global REGSTR_VAL_PCMCIA_OPT := "Options"

/**
 * @type {Integer (Int32)}
 */
export global PCMCIA_OPT_HAVE_SOCKET := 1

/**
 * @type {Integer (Int32)}
 */
export global PCMCIA_OPT_AUTOMEM := 4

/**
 * @type {Integer (Int32)}
 */
export global PCMCIA_OPT_NO_SOUND := 8

/**
 * @type {Integer (Int32)}
 */
export global PCMCIA_OPT_NO_AUDIO := 16

/**
 * @type {Integer (Int32)}
 */
export global PCMCIA_OPT_NO_APMREMOVE := 32

/**
 * @type {String}
 */
export global REGSTR_VAL_PCMCIA_MEM := "Memory"

/**
 * @type {Integer (UInt32)}
 */
export global PCMCIA_DEF_MEMBEGIN := 786432

/**
 * @type {Integer (UInt32)}
 */
export global PCMCIA_DEF_MEMEND := 16777215

/**
 * @type {Integer (UInt32)}
 */
export global PCMCIA_DEF_MEMLEN := 4096

/**
 * @type {String}
 */
export global REGSTR_VAL_PCMCIA_ALLOC := "AllocMemWin"

/**
 * @type {String}
 */
export global REGSTR_VAL_PCMCIA_ATAD := "ATADelay"

/**
 * @type {String}
 */
export global REGSTR_VAL_PCMCIA_SIZ := "MinRegionSize"

/**
 * @type {Integer (UInt32)}
 */
export global PCMCIA_DEF_MIN_REGION := 65536

/**
 * @type {String}
 */
export global REGSTR_VAL_P1284MDL := "Model"

/**
 * @type {String}
 */
export global REGSTR_VAL_P1284MFG := "Manufacturer"

/**
 * @type {String}
 */
export global REGSTR_VAL_ISAPNP := "ISAPNP"

/**
 * @type {String}
 */
export global REGSTR_VAL_ISAPNP_RDP_OVERRIDE := "RDPOverRide"

/**
 * @type {String}
 */
export global REGSTR_VAL_PCI := "PCI"

/**
 * @type {String}
 */
export global REGSTR_PCI_OPTIONS := "Options"

/**
 * @type {String}
 */
export global REGSTR_PCI_DUAL_IDE := "PCIDualIDE"

/**
 * @type {Integer (Int32)}
 */
export global PCI_OPTIONS_USE_BIOS := 1

/**
 * @type {Integer (Int32)}
 */
export global PCI_OPTIONS_USE_IRQ_STEERING := 2

/**
 * @type {Integer (Int32)}
 */
export global AGP_FLAG_NO_1X_RATE := 1

/**
 * @type {Integer (Int32)}
 */
export global AGP_FLAG_NO_2X_RATE := 2

/**
 * @type {Integer (Int32)}
 */
export global AGP_FLAG_NO_4X_RATE := 4

/**
 * @type {Integer (Int32)}
 */
export global AGP_FLAG_NO_8X_RATE := 8

/**
 * @type {Integer (Int32)}
 */
export global AGP_FLAG_REVERSE_INITIALIZATION := 128

/**
 * @type {Integer (Int32)}
 */
export global AGP_FLAG_NO_SBA_ENABLE := 256

/**
 * @type {Integer (Int32)}
 */
export global AGP_FLAG_NO_FW_ENABLE := 512

/**
 * @type {Integer (Int32)}
 */
export global AGP_FLAG_SPECIAL_TARGET := 1048575

/**
 * @type {Integer (Int32)}
 */
export global AGP_FLAG_SPECIAL_RESERVE := 1015808

/**
 * @type {String}
 */
export global REGSTR_KEY_CRASHES := "Crashes"

/**
 * @type {String}
 */
export global REGSTR_KEY_DANGERS := "Dangers"

/**
 * @type {String}
 */
export global REGSTR_KEY_DETMODVARS := "DetModVars"

/**
 * @type {String}
 */
export global REGSTR_KEY_NDISINFO := "NDISInfo"

/**
 * @type {String}
 */
export global REGSTR_VAL_PROTINIPATH := "ProtIniPath"

/**
 * @type {String}
 */
export global REGSTR_VAL_RESOURCES := "Resources"

/**
 * @type {String}
 */
export global REGSTR_VAL_CRASHFUNCS := "CrashFuncs"

/**
 * @type {String}
 */
export global REGSTR_VAL_CLASS := "Class"

/**
 * @type {String}
 */
export global REGSTR_VAL_CLASSDESC := "ClassDesc"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVDESC := "DeviceDesc"

/**
 * @type {String}
 */
export global REGSTR_VAL_BOOTCONFIG := "BootConfig"

/**
 * @type {String}
 */
export global REGSTR_VAL_DETFUNC := "DetFunc"

/**
 * @type {String}
 */
export global REGSTR_VAL_DETFLAGS := "DetFlags"

/**
 * @type {String}
 */
export global REGSTR_VAL_COMPATIBLEIDS := "CompatibleIDs"

/**
 * @type {String}
 */
export global REGSTR_VAL_DETCONFIG := "DetConfig"

/**
 * @type {String}
 */
export global REGSTR_VAL_VERIFYKEY := "VerifyKey"

/**
 * @type {String}
 */
export global REGSTR_VAL_COMINFO := "ComInfo"

/**
 * @type {String}
 */
export global REGSTR_VAL_INFNAME := "InfName"

/**
 * @type {String}
 */
export global REGSTR_VAL_CARDSPECIFIC := "CardSpecific"

/**
 * @type {String}
 */
export global REGSTR_VAL_NETOSTYPE := "NetOSType"

/**
 * @type {String}
 */
export global REGSTR_DATA_NETOS_NDIS := "NDIS"

/**
 * @type {String}
 */
export global REGSTR_DATA_NETOS_ODI := "ODI"

/**
 * @type {String}
 */
export global REGSTR_DATA_NETOS_IPX := "IPX"

/**
 * @type {String}
 */
export global REGSTR_VAL_MFG := "Mfg"

/**
 * @type {String}
 */
export global REGSTR_VAL_SCAN_ONLY_FIRST := "ScanOnlyFirstDrive"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHARE_IRQ := "ForceIRQSharing"

/**
 * @type {String}
 */
export global REGSTR_VAL_NONSTANDARD_ATAPI := "NonStandardATAPI"

/**
 * @type {String}
 */
export global REGSTR_VAL_IDE_FORCE_SERIALIZE := "ForceSerialization"

/**
 * @type {Integer (UInt32)}
 */
export global REGSTR_VAL_MAX_HCID_LEN := 1024

/**
 * @type {String}
 */
export global REGSTR_VAL_HWREV := "HWRevision"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENABLEINTS := "EnableInts"

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_NOTDETIO := 1

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_NOTDETMEM := 2

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_NOTDETIRQ := 4

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_NOTDETDMA := 8

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_NEEDFULLCONFIG := 16

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_GENFORCEDCONFIG := 32

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_NODETCONFIG := 32768

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_CONFLICTIO := 65536

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_CONFLICTMEM := 131072

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_CONFLICTIRQ := 262144

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_CONFLICTDMA := 524288

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_MAPIRQ2TO9 := 1048576

/**
 * @type {Integer (UInt32)}
 */
export global REGDF_NOTVERIFIED := 2147483648

/**
 * @type {String}
 */
export global REGSTR_VAL_APMBIOSVER := "APMBiosVer"

/**
 * @type {String}
 */
export global REGSTR_VAL_APMFLAGS := "APMFlags"

/**
 * @type {String}
 */
export global REGSTR_VAL_SLSUPPORT := "SLSupport"

/**
 * @type {String}
 */
export global REGSTR_VAL_MACHINETYPE := "MachineType"

/**
 * @type {String}
 */
export global REGSTR_VAL_SETUPMACHINETYPE := "SetupMachineType"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_UNKNOWN := "Unknown"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPC := "IBM PC"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPCJR := "IBM PCjr"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPCCONV := "IBM PC Convertible"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPCXT := "IBM PC/XT"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPCXT_286 := "IBM PC/XT 286"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPCAT := "IBM PC/AT"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_25 := "IBM PS/2-25"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_30_286 := "IBM PS/2-30 286"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_30 := "IBM PS/2-30"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_50 := "IBM PS/2-50"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_50Z := "IBM PS/2-50Z"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_55SX := "IBM PS/2-55SX"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_60 := "IBM PS/2-60"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_65SX := "IBM PS/2-65SX"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_70 := "IBM PS/2-70"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_P70 := "IBM PS/2-P70"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_70_80 := "IBM PS/2-70/80"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_80 := "IBM PS/2-80"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS2_90 := "IBM PS/2-90"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_IBMPS1 := "IBM PS/1"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_PHOENIX_PCAT := "Phoenix PC/AT Compatible"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_HP_VECTRA := "HP Vectra"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_ATT_PC := "AT&T PC"

/**
 * @type {String}
 */
export global REGSTR_MACHTYPE_ZENITH_PC := "Zenith PC"

/**
 * @type {String}
 */
export global REGSTR_VAL_APMMENUSUSPEND := "APMMenuSuspend"

/**
 * @type {Integer (UInt32)}
 */
export global APMMENUSUSPEND_DISABLED := 0

/**
 * @type {Integer (UInt32)}
 */
export global APMMENUSUSPEND_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global APMMENUSUSPEND_UNDOCKED := 2

/**
 * @type {Integer (UInt32)}
 */
export global APMMENUSUSPEND_NOCHANGE := 128

/**
 * @type {String}
 */
export global REGSTR_VAL_APMACTIMEOUT := "APMACTimeout"

/**
 * @type {String}
 */
export global REGSTR_VAL_APMBATTIMEOUT := "APMBatTimeout"

/**
 * @type {Integer (UInt32)}
 */
export global APMTIMEOUT_DISABLED := 0

/**
 * @type {String}
 */
export global REGSTR_VAL_APMSHUTDOWNPOWER := "APMShutDownPower"

/**
 * @type {String}
 */
export global REGSTR_VAL_BUSTYPE := "BusType"

/**
 * @type {String}
 */
export global REGSTR_VAL_CPU := "CPU"

/**
 * @type {String}
 */
export global REGSTR_VAL_NDP := "NDP"

/**
 * @type {String}
 */
export global REGSTR_VAL_PNPBIOSVER := "PnPBIOSVer"

/**
 * @type {String}
 */
export global REGSTR_VAL_PNPSTRUCOFFSET := "PnPStrucOffset"

/**
 * @type {String}
 */
export global REGSTR_VAL_PCIBIOSVER := "PCIBIOSVer"

/**
 * @type {String}
 */
export global REGSTR_VAL_HWMECHANISM := "HWMechanism"

/**
 * @type {String}
 */
export global REGSTR_VAL_LASTPCIBUSNUM := "LastPCIBusNum"

/**
 * @type {String}
 */
export global REGSTR_VAL_CONVMEM := "ConvMem"

/**
 * @type {String}
 */
export global REGSTR_VAL_EXTMEM := "ExtMem"

/**
 * @type {String}
 */
export global REGSTR_VAL_COMPUTERNAME := "ComputerName"

/**
 * @type {String}
 */
export global REGSTR_VAL_BIOSNAME := "BIOSName"

/**
 * @type {String}
 */
export global REGSTR_VAL_BIOSVERSION := "BIOSVersion"

/**
 * @type {String}
 */
export global REGSTR_VAL_BIOSDATE := "BIOSDate"

/**
 * @type {String}
 */
export global REGSTR_VAL_MODEL := "Model"

/**
 * @type {String}
 */
export global REGSTR_VAL_SUBMODEL := "Submodel"

/**
 * @type {String}
 */
export global REGSTR_VAL_REVISION := "Revision"

/**
 * @type {String}
 */
export global REGSTR_VAL_FIFODEPTH := "FIFODepth"

/**
 * @type {String}
 */
export global REGSTR_VAL_RDINTTHRESHOLD := "RDIntThreshold"

/**
 * @type {String}
 */
export global REGSTR_VAL_WRINTTHRESHOLD := "WRIntThreshold"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRIORITY := "Priority"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRIVER := "Driver"

/**
 * @type {String}
 */
export global REGSTR_VAL_FUNCDESC := "FunctionDesc"

/**
 * @type {String}
 */
export global REGSTR_VAL_FORCEDCONFIG := "ForcedConfig"

/**
 * @type {String}
 */
export global REGSTR_VAL_CONFIGFLAGS := "ConfigFlags"

/**
 * @type {String}
 */
export global REGSTR_VAL_CSCONFIGFLAGS := "CSConfigFlags"

/**
 * @type {Integer (UInt32)}
 */
export global CSCONFIGFLAG_BITS := 7

/**
 * @type {Integer (UInt32)}
 */
export global CSCONFIGFLAG_DISABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global CSCONFIGFLAG_DO_NOT_CREATE := 2

/**
 * @type {Integer (UInt32)}
 */
export global CSCONFIGFLAG_DO_NOT_START := 4

/**
 * @type {Integer (UInt32)}
 */
export global DMSTATEFLAG_APPLYTOALL := 1

/**
 * @type {String}
 */
export global REGSTR_VAL_ROOT_DEVNODE := "HTREE\ROOT\0"

/**
 * @type {String}
 */
export global REGSTR_VAL_RESERVED_DEVNODE := "HTREE\RESERVED\0"

/**
 * @type {String}
 */
export global REGSTR_PATH_MULTI_FUNCTION := "MF"

/**
 * @type {String}
 */
export global REGSTR_VAL_RESOURCE_MAP := "ResourceMap"

/**
 * @type {String}
 */
export global REGSTR_PATH_CHILD_PREFIX := "Child"

/**
 * @type {Integer (UInt32)}
 */
export global NUM_RESOURCE_MAP := 256

/**
 * @type {String}
 */
export global REGSTR_VAL_MF_FLAGS := "MFFlags"

/**
 * @type {Integer (UInt32)}
 */
export global MF_FLAGS_EVEN_IF_NO_RESOURCE := 1

/**
 * @type {Integer (UInt32)}
 */
export global MF_FLAGS_NO_CREATE_IF_NO_RESOURCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global MF_FLAGS_FILL_IN_UNKNOWN_RESOURCE := 4

/**
 * @type {Integer (UInt32)}
 */
export global MF_FLAGS_CREATE_BUT_NO_SHOW_DISABLED := 8

/**
 * @type {String}
 */
export global REGSTR_VAL_EISA_RANGES := "EISARanges"

/**
 * @type {String}
 */
export global REGSTR_VAL_EISA_FUNCTIONS := "EISAFunctions"

/**
 * @type {String}
 */
export global REGSTR_VAL_EISA_FUNCTIONS_MASK := "EISAFunctionsMask"

/**
 * @type {String}
 */
export global REGSTR_VAL_EISA_FLAGS := "EISAFlags"

/**
 * @type {String}
 */
export global REGSTR_VAL_EISA_SIMULATE_INT15 := "EISASimulateInt15"

/**
 * @type {Integer (UInt32)}
 */
export global EISAFLAG_NO_IO_MERGE := 1

/**
 * @type {Integer (UInt32)}
 */
export global EISAFLAG_SLOT_IO_FIRST := 2

/**
 * @type {Integer (UInt32)}
 */
export global EISA_NO_MAX_FUNCTION := 255

/**
 * @type {Integer (UInt32)}
 */
export global NUM_EISA_RANGES := 4

/**
 * @type {String}
 */
export global REGSTR_VAL_DRVDESC := "DriverDesc"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVLOADER := "DevLoader"

/**
 * @type {String}
 */
export global REGSTR_VAL_STATICVXD := "StaticVxD"

/**
 * @type {String}
 */
export global REGSTR_VAL_PROPERTIES := "Properties"

/**
 * @type {String}
 */
export global REGSTR_VAL_MANUFACTURER := "Manufacturer"

/**
 * @type {String}
 */
export global REGSTR_VAL_EXISTS := "Exists"

/**
 * @type {String}
 */
export global REGSTR_VAL_CMENUMFLAGS := "CMEnumFlags"

/**
 * @type {String}
 */
export global REGSTR_VAL_CMDRIVFLAGS := "CMDrivFlags"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENUMERATOR := "Enumerator"

/**
 * @type {String}
 */
export global REGSTR_VAL_DEVICEDRIVER := "DeviceDriver"

/**
 * @type {String}
 */
export global REGSTR_VAL_PORTNAME := "PortName"

/**
 * @type {String}
 */
export global REGSTR_VAL_INFPATH := "InfPath"

/**
 * @type {String}
 */
export global REGSTR_VAL_INFSECTION := "InfSection"

/**
 * @type {String}
 */
export global REGSTR_VAL_INFSECTIONEXT := "InfSectionExt"

/**
 * @type {String}
 */
export global REGSTR_VAL_POLLING := "Polling"

/**
 * @type {String}
 */
export global REGSTR_VAL_DONTLOADIFCONFLICT := "DontLoadIfConflict"

/**
 * @type {String}
 */
export global REGSTR_VAL_PORTSUBCLASS := "PortSubClass"

/**
 * @type {String}
 */
export global REGSTR_VAL_NETCLEAN := "NetClean"

/**
 * @type {String}
 */
export global REGSTR_VAL_IDE_NO_SERIALIZE := "IDENoSerialize"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOCMOSORFDPT := "NoCMOSorFDPT"

/**
 * @type {String}
 */
export global REGSTR_VAL_COMVERIFYBASE := "COMVerifyBase"

/**
 * @type {String}
 */
export global REGSTR_VAL_MATCHINGDEVID := "MatchingDeviceId"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRIVERDATE := "DriverDate"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRIVERDATEDATA := "DriverDateData"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRIVERVERSION := "DriverVersion"

/**
 * @type {String}
 */
export global REGSTR_VAL_LOCATION_INFORMATION_OVERRIDE := "LocationInformationOverride"

/**
 * @type {String}
 */
export global REGSTR_KEY_OVERRIDE := "Override"

/**
 * @type {String}
 */
export global REGSTR_VAL_CONFIGMG := "CONFIGMG"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSDM := "SysDM"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSDMFUNC := "SysDMFunc"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRIVATE := "Private"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRIVATEFUNC := "PrivateFunc"

/**
 * @type {String}
 */
export global REGSTR_VAL_DETECT := "Detect"

/**
 * @type {String}
 */
export global REGSTR_VAL_DETECTFUNC := "DetectFunc"

/**
 * @type {String}
 */
export global REGSTR_VAL_ASKFORCONFIG := "AskForConfig"

/**
 * @type {String}
 */
export global REGSTR_VAL_ASKFORCONFIGFUNC := "AskForConfigFunc"

/**
 * @type {String}
 */
export global REGSTR_VAL_WAITFORUNDOCK := "WaitForUndock"

/**
 * @type {String}
 */
export global REGSTR_VAL_WAITFORUNDOCKFUNC := "WaitForUndockFunc"

/**
 * @type {String}
 */
export global REGSTR_VAL_REMOVEROMOKAY := "RemoveRomOkay"

/**
 * @type {String}
 */
export global REGSTR_VAL_REMOVEROMOKAYFUNC := "RemoveRomOkayFunc"

/**
 * @type {String}
 */
export global REGSTR_VAL_CURCONFIG := "CurrentConfig"

/**
 * @type {String}
 */
export global REGSTR_VAL_FRIENDLYNAME := "FriendlyName"

/**
 * @type {String}
 */
export global REGSTR_VAL_CURRENTCONFIG := "CurrentConfig"

/**
 * @type {String}
 */
export global REGSTR_VAL_MAP := "Map"

/**
 * @type {String}
 */
export global REGSTR_VAL_ID := "CurrentID"

/**
 * @type {String}
 */
export global REGSTR_VAL_DOCKED := "CurrentDockedState"

/**
 * @type {String}
 */
export global REGSTR_VAL_CHECKSUM := "CurrentChecksum"

/**
 * @type {String}
 */
export global REGSTR_VAL_HWDETECT := "HardwareDetect"

/**
 * @type {String}
 */
export global REGSTR_VAL_INHIBITRESULTS := "InhibitResults"

/**
 * @type {String}
 */
export global REGSTR_VAL_PROFILEFLAGS := "ProfileFlags"

/**
 * @type {String}
 */
export global REGSTR_KEY_PCMCIA := "PCMCIA\"

/**
 * @type {String}
 */
export global REGSTR_KEY_PCUNKNOWN := "UNKNOWN_MANUFACTURER"

/**
 * @type {String}
 */
export global REGSTR_VAL_PCSSDRIVER := "Driver"

/**
 * @type {String}
 */
export global REGSTR_KEY_PCMTD := "MTD-"

/**
 * @type {String}
 */
export global REGSTR_VAL_PCMTDRIVER := "MTD"

/**
 * @type {String}
 */
export global REGSTR_VAL_HARDWAREID := "HardwareID"

/**
 * @type {String}
 */
export global REGSTR_VAL_INSTALLER := "Installer"

/**
 * @type {String}
 */
export global REGSTR_VAL_INSTALLER_32 := "Installer32"

/**
 * @type {String}
 */
export global REGSTR_VAL_INSICON := "Icon"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENUMPROPPAGES := "EnumPropPages"

/**
 * @type {String}
 */
export global REGSTR_VAL_ENUMPROPPAGES_32 := "EnumPropPages32"

/**
 * @type {String}
 */
export global REGSTR_VAL_BASICPROPERTIES := "BasicProperties"

/**
 * @type {String}
 */
export global REGSTR_VAL_BASICPROPERTIES_32 := "BasicProperties32"

/**
 * @type {String}
 */
export global REGSTR_VAL_COINSTALLERS_32 := "CoInstallers32"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRIVATEPROBLEM := "PrivateProblem"

/**
 * @type {String}
 */
export global REGSTR_KEY_CURRENT := "Current"

/**
 * @type {String}
 */
export global REGSTR_KEY_DEFAULT := "Default"

/**
 * @type {String}
 */
export global REGSTR_KEY_MODES := "Modes"

/**
 * @type {String}
 */
export global REGSTR_VAL_MODE := "Mode"

/**
 * @type {String}
 */
export global REGSTR_VAL_BPP := "BPP"

/**
 * @type {String}
 */
export global REGSTR_VAL_HRES := "HRes"

/**
 * @type {String}
 */
export global REGSTR_VAL_VRES := "VRes"

/**
 * @type {String}
 */
export global REGSTR_VAL_FONTSIZE := "FontSize"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRV := "drv"

/**
 * @type {String}
 */
export global REGSTR_VAL_GRB := "grb"

/**
 * @type {String}
 */
export global REGSTR_VAL_VDD := "vdd"

/**
 * @type {String}
 */
export global REGSTR_VAL_VER := "Ver"

/**
 * @type {String}
 */
export global REGSTR_VAL_MAXRES := "MaxResolution"

/**
 * @type {String}
 */
export global REGSTR_VAL_DPMS := "DPMS"

/**
 * @type {String}
 */
export global REGSTR_VAL_RESUMERESET := "ResumeReset"

/**
 * @type {String}
 */
export global REGSTR_KEY_SYSTEM := "System"

/**
 * @type {String}
 */
export global REGSTR_KEY_USER := "User"

/**
 * @type {String}
 */
export global REGSTR_VAL_DPI := "dpi"

/**
 * @type {String}
 */
export global REGSTR_VAL_PCICOPTIONS := "PCICOptions"

/**
 * @type {Integer (UInt32)}
 */
export global PCIC_DEFAULT_IRQMASK := 20152

/**
 * @type {Integer (UInt32)}
 */
export global PCIC_DEFAULT_NUMSOCKETS := 0

/**
 * @type {String}
 */
export global REGSTR_VAL_PCICIRQMAP := "PCICIRQMap"

/**
 * @type {String}
 */
export global REGSTR_PATH_APPEARANCE := "Control Panel\Appearance"

/**
 * @type {String}
 */
export global REGSTR_PATH_LOOKSCHEMES := "Control Panel\Appearance\Schemes"

/**
 * @type {String}
 */
export global REGSTR_VAL_CUSTOMCOLORS := "CustomColors"

/**
 * @type {String}
 */
export global REGSTR_PATH_SCREENSAVE := "Control Panel\Desktop"

/**
 * @type {String}
 */
export global REGSTR_VALUE_USESCRPASSWORD := "ScreenSaveUsePassword"

/**
 * @type {String}
 */
export global REGSTR_VALUE_SCRPASSWORD := "ScreenSave_Data"

/**
 * @type {String}
 */
export global REGSTR_VALUE_LOWPOWERTIMEOUT := "ScreenSaveLowPowerTimeout"

/**
 * @type {String}
 */
export global REGSTR_VALUE_POWEROFFTIMEOUT := "ScreenSavePowerOffTimeout"

/**
 * @type {String}
 */
export global REGSTR_VALUE_LOWPOWERACTIVE := "ScreenSaveLowPowerActive"

/**
 * @type {String}
 */
export global REGSTR_VALUE_POWEROFFACTIVE := "ScreenSavePowerOffActive"

/**
 * @type {String}
 */
export global REGSTR_PATH_WINDOWSAPPLETS := "Software\Microsoft\Windows\CurrentVersion\Applets"

/**
 * @type {String}
 */
export global REGSTR_PATH_SYSTRAY := "Software\Microsoft\Windows\CurrentVersion\Applets\SysTray"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSTRAYSVCS := "Services"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSTRAYBATFLAGS := "PowerFlags"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSTRAYPCCARDFLAGS := "PCMCIAFlags"

/**
 * @type {String}
 */
export global REGSTR_PATH_NETWORK_USERSETTINGS := "Network"

/**
 * @type {String}
 */
export global REGSTR_KEY_NETWORK_PERSISTENT := "\Persistent"

/**
 * @type {String}
 */
export global REGSTR_KEY_NETWORK_RECENT := "\Recent"

/**
 * @type {String}
 */
export global REGSTR_VAL_REMOTE_PATH := "RemotePath"

/**
 * @type {String}
 */
export global REGSTR_VAL_USER_NAME := "UserName"

/**
 * @type {String}
 */
export global REGSTR_VAL_PROVIDER_NAME := "ProviderName"

/**
 * @type {String}
 */
export global REGSTR_VAL_CONNECTION_TYPE := "ConnectionType"

/**
 * @type {String}
 */
export global REGSTR_VAL_UPGRADE := "Upgrade"

/**
 * @type {String}
 */
export global REGSTR_KEY_LOGON := "\Logon"

/**
 * @type {String}
 */
export global REGSTR_VAL_MUSTBEVALIDATED := "MustBeValidated"

/**
 * @type {String}
 */
export global REGSTR_VAL_RUNLOGINSCRIPT := "ProcessLoginScript"

/**
 * @type {String}
 */
export global REGSTR_KEY_NETWORKPROVIDER := "\NetworkProvider"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTHENT_AGENT := "AuthenticatingAgent"

/**
 * @type {String}
 */
export global REGSTR_VAL_PREFREDIR := "PreferredRedir"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTOSTART := "AutoStart"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUTOLOGON := "AutoLogon"

/**
 * @type {String}
 */
export global REGSTR_VAL_NETCARD := "Netcard"

/**
 * @type {String}
 */
export global REGSTR_VAL_TRANSPORT := "Transport"

/**
 * @type {String}
 */
export global REGSTR_VAL_DYNAMIC := "Dynamic"

/**
 * @type {String}
 */
export global REGSTR_VAL_TRANSITION := "Transition"

/**
 * @type {String}
 */
export global REGSTR_VAL_STATICDRIVE := "StaticDrive"

/**
 * @type {String}
 */
export global REGSTR_VAL_LOADHI := "LoadHi"

/**
 * @type {String}
 */
export global REGSTR_VAL_LOADRMDRIVERS := "LoadRMDrivers"

/**
 * @type {String}
 */
export global REGSTR_VAL_SETUPN := "SetupN"

/**
 * @type {String}
 */
export global REGSTR_VAL_SETUPNPATH := "SetupNPath"

/**
 * @type {String}
 */
export global REGSTR_VAL_WRKGRP_FORCEMAPPING := "WrkgrpForceMapping"

/**
 * @type {String}
 */
export global REGSTR_VAL_WRKGRP_REQUIRED := "WrkgrpRequired"

/**
 * @type {String}
 */
export global REGSTR_PATH_CURRENT_CONTROL_SET := "System\CurrentControlSet\Control"

/**
 * @type {String}
 */
export global REGSTR_VAL_CURRENT_USER := "Current User"

/**
 * @type {String}
 */
export global REGSTR_PATH_PWDPROVIDER := "System\CurrentControlSet\Control\PwdProvider"

/**
 * @type {String}
 */
export global REGSTR_VAL_PWDPROVIDER_PATH := "ProviderPath"

/**
 * @type {String}
 */
export global REGSTR_VAL_PWDPROVIDER_DESC := "Description"

/**
 * @type {String}
 */
export global REGSTR_VAL_PWDPROVIDER_CHANGEPWD := "ChangePassword"

/**
 * @type {String}
 */
export global REGSTR_VAL_PWDPROVIDER_CHANGEPWDHWND := "ChangePasswordHwnd"

/**
 * @type {String}
 */
export global REGSTR_VAL_PWDPROVIDER_GETPWDSTATUS := "GetPasswordStatus"

/**
 * @type {String}
 */
export global REGSTR_VAL_PWDPROVIDER_ISNP := "NetworkProvider"

/**
 * @type {String}
 */
export global REGSTR_VAL_PWDPROVIDER_CHANGEORDER := "ChangeOrder"

/**
 * @type {String}
 */
export global REGSTR_PATH_POLICIES := "Software\Microsoft\Windows\CurrentVersion\Policies"

/**
 * @type {String}
 */
export global REGSTR_PATH_UPDATE := "System\CurrentControlSet\Control\Update"

/**
 * @type {String}
 */
export global REGSTR_VALUE_ENABLE := "Enable"

/**
 * @type {String}
 */
export global REGSTR_VALUE_VERBOSE := "Verbose"

/**
 * @type {String}
 */
export global REGSTR_VALUE_NETPATH := "NetworkPath"

/**
 * @type {String}
 */
export global REGSTR_VALUE_DEFAULTLOC := "UseDefaultNetLocation"

/**
 * @type {String}
 */
export global REGSTR_KEY_NETWORK := "Network"

/**
 * @type {String}
 */
export global REGSTR_KEY_PRINTERS := "Printers"

/**
 * @type {String}
 */
export global REGSTR_KEY_WINOLDAPP := "WinOldApp"

/**
 * @type {String}
 */
export global REGSTR_KEY_EXPLORER := "Explorer"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOFILESHARING := "NoFileSharing"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOPRINTSHARING := "NoPrintSharing"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOFILESHARINGCTRL := "NoFileSharingControl"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOPRINTSHARINGCTRL := "NoPrintSharingControl"

/**
 * @type {String}
 */
export global REGSTR_VAL_HIDESHAREPWDS := "HideSharePwds"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISABLEPWDCACHING := "DisablePwdCaching"

/**
 * @type {String}
 */
export global REGSTR_VAL_ALPHANUMPWDS := "AlphanumPwds"

/**
 * @type {String}
 */
export global REGSTR_VAL_NETSETUP_DISABLE := "NoNetSetup"

/**
 * @type {String}
 */
export global REGSTR_VAL_NETSETUP_NOCONFIGPAGE := "NoNetSetupConfigPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_NETSETUP_NOIDPAGE := "NoNetSetupIDPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_NETSETUP_NOSECURITYPAGE := "NoNetSetupSecurityPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSTEMCPL_NOVIRTMEMPAGE := "NoVirtMemPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSTEMCPL_NODEVMGRPAGE := "NoDevMgrPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSTEMCPL_NOCONFIGPAGE := "NoConfigPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_SYSTEMCPL_NOFILESYSPAGE := "NoFileSysPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISPCPL_NODISPCPL := "NoDispCPL"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISPCPL_NOBACKGROUNDPAGE := "NoDispBackgroundPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISPCPL_NOSCRSAVPAGE := "NoDispScrSavPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISPCPL_NOAPPEARANCEPAGE := "NoDispAppearancePage"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISPCPL_NOSETTINGSPAGE := "NoDispSettingsPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_SECCPL_NOSECCPL := "NoSecCPL"

/**
 * @type {String}
 */
export global REGSTR_VAL_SECCPL_NOPWDPAGE := "NoPwdPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_SECCPL_NOADMINPAGE := "NoAdminPage"

/**
 * @type {String}
 */
export global REGSTR_VAL_SECCPL_NOPROFILEPAGE := "NoProfilePage"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRINTERS_HIDETABS := "NoPrinterTabs"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRINTERS_NODELETE := "NoDeletePrinter"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRINTERS_NOADD := "NoAddPrinter"

/**
 * @type {String}
 */
export global REGSTR_VAL_WINOLDAPP_DISABLED := "Disabled"

/**
 * @type {String}
 */
export global REGSTR_VAL_WINOLDAPP_NOREALMODE := "NoRealMode"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOENTIRENETWORK := "NoEntireNetwork"

/**
 * @type {String}
 */
export global REGSTR_VAL_NOWORKGROUPCONTENTS := "NoWorkgroupContents"

/**
 * @type {String}
 */
export global REGSTR_VAL_UNDOCK_WITHOUT_LOGON := "UndockWithoutLogon"

/**
 * @type {String}
 */
export global REGSTR_VAL_MINPWDLEN := "MinPwdLen"

/**
 * @type {String}
 */
export global REGSTR_VAL_PWDEXPIRATION := "PwdExpiration"

/**
 * @type {String}
 */
export global REGSTR_VAL_WIN31PROVIDER := "Win31Provider"

/**
 * @type {String}
 */
export global REGSTR_VAL_DISABLEREGTOOLS := "DisableRegistryTools"

/**
 * @type {String}
 */
export global REGSTR_PATH_WINLOGON := "Software\Microsoft\Windows\CurrentVersion\Winlogon"

/**
 * @type {String}
 */
export global REGSTR_VAL_LEGALNOTICECAPTION := "LegalNoticeCaption"

/**
 * @type {String}
 */
export global REGSTR_VAL_LEGALNOTICETEXT := "LegalNoticeText"

/**
 * @type {String}
 */
export global REGSTR_VAL_DRIVE_SPINDOWN := "NoDispSpinDown"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHUTDOWN_FLAGS := "ShutdownFlags"

/**
 * @type {String}
 */
export global REGSTR_VAL_RESTRICTRUN := "RestrictRun"

/**
 * @type {String}
 */
export global REGSTR_KEY_POL_USERS := "Users"

/**
 * @type {String}
 */
export global REGSTR_KEY_POL_COMPUTERS := "Computers"

/**
 * @type {String}
 */
export global REGSTR_KEY_POL_USERGROUPS := "UserGroups"

/**
 * @type {String}
 */
export global REGSTR_KEY_POL_DEFAULT := ".default"

/**
 * @type {String}
 */
export global REGSTR_KEY_POL_USERGROUPDATA := "GroupData\UserGroups\Priority"

/**
 * @type {String}
 */
export global REGSTR_PATH_TIMEZONE := "System\CurrentControlSet\Control\TimeZoneInformation"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZBIAS := "Bias"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZDLTBIAS := "DaylightBias"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZSTDBIAS := "StandardBias"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZACTBIAS := "ActiveTimeBias"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZDLTFLAG := "DaylightFlag"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZSTDSTART := "StandardStart"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZDLTSTART := "DaylightStart"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZDLTNAME := "DaylightName"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZSTDNAME := "StandardName"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZNOCHANGESTART := "NoChangeStart"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZNOCHANGEEND := "NoChangeEnd"

/**
 * @type {String}
 */
export global REGSTR_VAL_TZNOAUTOTIME := "DisableAutoDaylightTimeSet"

/**
 * @type {String}
 */
export global REGSTR_PATH_FLOATINGPOINTPROCESSOR := "HARDWARE\DESCRIPTION\System\FloatingPointProcessor"

/**
 * @type {String}
 */
export global REGSTR_PATH_FLOATINGPOINTPROCESSOR0 := "HARDWARE\DESCRIPTION\System\FloatingPointProcessor\0"

/**
 * @type {String}
 */
export global REGSTR_PATH_COMPUTRNAME := "System\CurrentControlSet\Control\ComputerName\ComputerName"

/**
 * @type {String}
 */
export global REGSTR_VAL_COMPUTRNAME := "ComputerName"

/**
 * @type {String}
 */
export global REGSTR_PATH_SHUTDOWN := "System\CurrentControlSet\Control\Shutdown"

/**
 * @type {String}
 */
export global REGSTR_VAL_FORCEREBOOT := "ForceReboot"

/**
 * @type {String}
 */
export global REGSTR_VAL_SETUPPROGRAMRAN := "SetupProgramRan"

/**
 * @type {String}
 */
export global REGSTR_VAL_DOES_POLLING := "PollingSupportNeeded"

/**
 * @type {String}
 */
export global REGSTR_PATH_KNOWNDLLS := "System\CurrentControlSet\Control\SessionManager\KnownDLLs"

/**
 * @type {String}
 */
export global REGSTR_PATH_KNOWN16DLLS := "System\CurrentControlSet\Control\SessionManager\Known16DLLs"

/**
 * @type {String}
 */
export global REGSTR_PATH_CHECKVERDLLS := "System\CurrentControlSet\Control\SessionManager\CheckVerDLLs"

/**
 * @type {String}
 */
export global REGSTR_PATH_WARNVERDLLS := "System\CurrentControlSet\Control\SessionManager\WarnVerDLLs"

/**
 * @type {String}
 */
export global REGSTR_PATH_HACKINIFILE := "System\CurrentControlSet\Control\SessionManager\HackIniFiles"

/**
 * @type {String}
 */
export global REGSTR_PATH_CHECKBADAPPS := "System\CurrentControlSet\Control\SessionManager\CheckBadApps"

/**
 * @type {String}
 */
export global REGSTR_PATH_APPPATCH := "System\CurrentControlSet\Control\SessionManager\AppPatches"

/**
 * @type {String}
 */
export global REGSTR_PATH_CHECKBADAPPS400 := "System\CurrentControlSet\Control\SessionManager\CheckBadApps400"

/**
 * @type {String}
 */
export global REGSTR_PATH_KNOWNVXDS := "System\CurrentControlSet\Control\SessionManager\KnownVxDs"

/**
 * @type {String}
 */
export global REGSTR_VAL_UNINSTALLER_DISPLAYNAME := "DisplayName"

/**
 * @type {String}
 */
export global REGSTR_VAL_UNINSTALLER_COMMANDLINE := "UninstallString"

/**
 * @type {String}
 */
export global REGSTR_VAL_REINSTALL_DISPLAYNAME := "DisplayName"

/**
 * @type {String}
 */
export global REGSTR_VAL_REINSTALL_STRING := "ReinstallString"

/**
 * @type {String}
 */
export global REGSTR_VAL_REINSTALL_DEVICEINSTANCEIDS := "DeviceInstanceIds"

/**
 * @type {String}
 */
export global REGSTR_PATH_DESKTOP := "Control Panel\Desktop"

/**
 * @type {String}
 */
export global REGSTR_PATH_MOUSE := "Control Panel\Mouse"

/**
 * @type {String}
 */
export global REGSTR_PATH_KEYBOARD := "Control Panel\Keyboard"

/**
 * @type {String}
 */
export global REGSTR_PATH_COLORS := "Control Panel\Colors"

/**
 * @type {String}
 */
export global REGSTR_PATH_SOUND := "Control Panel\Sound"

/**
 * @type {String}
 */
export global REGSTR_PATH_METRICS := "Control Panel\Desktop\WindowMetrics"

/**
 * @type {String}
 */
export global REGSTR_PATH_ICONS := "Control Panel\Icons"

/**
 * @type {String}
 */
export global REGSTR_PATH_CURSORS := "Control Panel\Cursors"

/**
 * @type {String}
 */
export global REGSTR_PATH_CHECKDISK := "Software\Microsoft\Windows\CurrentVersion\Applets\Check Drive"

/**
 * @type {String}
 */
export global REGSTR_PATH_CHECKDISKSET := "Settings"

/**
 * @type {String}
 */
export global REGSTR_PATH_CHECKDISKUDRVS := "NoUnknownDDErrDrvs"

/**
 * @type {String}
 */
export global REGSTR_PATH_FAULT := "Software\Microsoft\Windows\CurrentVersion\Fault"

/**
 * @type {String}
 */
export global REGSTR_VAL_FAULT_LOGFILE := "LogFile"

/**
 * @type {String}
 */
export global REGSTR_PATH_AEDEBUG := "Software\Microsoft\Windows NT\CurrentVersion\AeDebug"

/**
 * @type {String}
 */
export global REGSTR_VAL_AEDEBUG_DEBUGGER := "Debugger"

/**
 * @type {String}
 */
export global REGSTR_VAL_AEDEBUG_AUTO := "Auto"

/**
 * @type {String}
 */
export global REGSTR_PATH_GRPCONV := "Software\Microsoft\Windows\CurrentVersion\GrpConv"

/**
 * @type {String}
 */
export global REGSTR_VAL_REGITEMDELETEMESSAGE := "Removal Message"

/**
 * @type {String}
 */
export global REGSTR_PATH_LASTCHECK := "Software\Microsoft\Windows\CurrentVersion\Explorer\LastCheck"

/**
 * @type {String}
 */
export global REGSTR_PATH_LASTOPTIMIZE := "Software\Microsoft\Windows\CurrentVersion\Explorer\LastOptimize"

/**
 * @type {String}
 */
export global REGSTR_PATH_LASTBACKUP := "Software\Microsoft\Windows\CurrentVersion\Explorer\LastBackup"

/**
 * @type {String}
 */
export global REGSTR_PATH_CHKLASTCHECK := "Software\Microsoft\Windows\CurrentVersion\Applets\Check Drive\LastCheck"

/**
 * @type {String}
 */
export global REGSTR_PATH_CHKLASTSURFAN := "Software\Microsoft\Windows\CurrentVersion\Applets\Check Drive\LastSurfaceAnalysis"

/**
 * @type {Integer (UInt32)}
 */
export global DTRESULTOK := 0

/**
 * @type {Integer (UInt32)}
 */
export global DTRESULTFIX := 1

/**
 * @type {Integer (UInt32)}
 */
export global DTRESULTPROB := 2

/**
 * @type {Integer (UInt32)}
 */
export global DTRESULTPART := 3

/**
 * @type {String}
 */
export global REGSTR_KEY_SHARES := "Software\Microsoft\Windows\CurrentVersion\Network\LanMan"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHARES_FLAGS := "Flags"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHARES_TYPE := "Type"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHARES_PATH := "Path"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHARES_REMARK := "Remark"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHARES_RW_PASS := "Parm1"

/**
 * @type {String}
 */
export global REGSTR_VAL_SHARES_RO_PASS := "Parm2"

/**
 * @type {String}
 */
export global REGSTR_PATH_PRINT := "System\CurrentControlSet\Control\Print"

/**
 * @type {String}
 */
export global REGSTR_PATH_PRINTERS := "System\CurrentControlSet\Control\Print\Printers"

/**
 * @type {String}
 */
export global REGSTR_PATH_PROVIDERS := "System\CurrentControlSet\Control\Print\Providers"

/**
 * @type {String}
 */
export global REGSTR_PATH_MONITORS := "System\CurrentControlSet\Control\Print\Monitors"

/**
 * @type {String}
 */
export global REGSTR_PATH_ENVIRONMENTS := "System\CurrentControlSet\Control\Print\Environments"

/**
 * @type {String}
 */
export global REGSTR_VAL_START_ON_BOOT := "StartOnBoot"

/**
 * @type {String}
 */
export global REGSTR_VAL_PRINTERS_MASK := "PrintersMask"

/**
 * @type {String}
 */
export global REGSTR_VAL_DOS_SPOOL_MASK := "DOSSpoolMask"

/**
 * @type {String}
 */
export global REGSTR_KEY_CURRENT_ENV := "\Windows 4.0"

/**
 * @type {String}
 */
export global REGSTR_KEY_DRIVERS := "\Drivers"

/**
 * @type {String}
 */
export global REGSTR_KEY_PRINT_PROC := "\Print Processors"

/**
 * @type {String}
 */
export global REGSTR_PATH_EVENTLABELS := "AppEvents\EventLabels"

/**
 * @type {String}
 */
export global REGSTR_PATH_SCHEMES := "AppEvents\Schemes"

/**
 * @type {String}
 */
export global REGSTR_PATH_MULTIMEDIA_AUDIO := "Software\Microsoft\Multimedia\Audio"

/**
 * @type {String}
 */
export global REGSTR_KEY_JOYCURR := "CurrentJoystickSettings"

/**
 * @type {String}
 */
export global REGSTR_KEY_JOYSETTINGS := "JoystickSettings"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYUSERVALUES := "JoystickUserValues"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYCALLOUT := "JoystickCallout"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYNCONFIG := "Joystick%dConfiguration"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYNOEMNAME := "Joystick%dOEMName"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYNOEMCALLOUT := "Joystick%dOEMCallout"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCALLOUT := "OEMCallout"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMNAME := "OEMName"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMDATA := "OEMData"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMXYLABEL := "OEMXYLabel"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMZLABEL := "OEMZLabel"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMRLABEL := "OEMRLabel"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMPOVLABEL := "OEMPOVLabel"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMULABEL := "OEMULabel"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMVLABEL := "OEMVLabel"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMTESTMOVEDESC := "OEMTestMoveDesc"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMTESTBUTTONDESC := "OEMTestButtonDesc"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMTESTMOVECAP := "OEMTestMoveCap"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMTESTBUTTONCAP := "OEMTestButtonCap"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMTESTWINCAP := "OEMTestWinCap"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCALCAP := "OEMCalCap"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCALWINCAP := "OEMCalWinCap"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL1 := "OEMCal1"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL2 := "OEMCal2"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL3 := "OEMCal3"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL4 := "OEMCal4"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL5 := "OEMCal5"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL6 := "OEMCal6"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL7 := "OEMCal7"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL8 := "OEMCal8"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL9 := "OEMCal9"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL10 := "OEMCal10"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL11 := "OEMCal11"

/**
 * @type {String}
 */
export global REGSTR_VAL_JOYOEMCAL12 := "OEMCal12"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUDIO_BITMAP := "bitmap"

/**
 * @type {String}
 */
export global REGSTR_VAL_AUDIO_ICON := "icon"

/**
 * @type {String}
 */
export global REGSTR_PATH_DEVICEINSTALLER := "Software\Microsoft\Windows\CurrentVersion\Device Installer"

/**
 * @type {String}
 */
export global REGSTR_PATH_DIFX := "Software\Microsoft\Windows\CurrentVersion\DIFX"

/**
 * @type {String}
 */
export global REGSTR_VAL_SEARCHOPTIONS := "SearchOptions"

/**
 * @type {String}
 */
export global REGSTR_PATH_BIOSINFO := "System\CurrentControlSet\Control\BiosInfo"

/**
 * @type {String}
 */
export global REGSTR_PATH_PCIIR := "System\CurrentControlSet\Control\Pnp\PciIrqRouting"

/**
 * @type {String}
 */
export global REGSTR_VAL_OPTIONS := "Options"

/**
 * @type {String}
 */
export global REGSTR_VAL_STAT := "Status"

/**
 * @type {String}
 */
export global REGSTR_VAL_TABLE_STAT := "TableStatus"

/**
 * @type {String}
 */
export global REGSTR_VAL_MINIPORT_STAT := "MiniportStatus"

/**
 * @type {Integer (UInt32)}
 */
export global PIR_OPTION_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PIR_OPTION_REGISTRY := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIR_OPTION_MSSPEC := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIR_OPTION_REALMODE := 8

/**
 * @type {Integer (UInt32)}
 */
export global PIR_OPTION_DEFAULT := 15

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_ERROR := 0

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_ENABLED := 1

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_DISABLED := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MAX := 3

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_TABLE_REGISTRY := 0

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_TABLE_MSSPEC := 1

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_TABLE_REALMODE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_TABLE_NONE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_TABLE_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_TABLE_BAD := 5

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_TABLE_SUCCESS := 6

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_TABLE_MAX := 7

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MINIPORT_NORMAL := 0

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MINIPORT_COMPATIBLE := 1

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MINIPORT_OVERRIDE := 2

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MINIPORT_NONE := 3

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MINIPORT_ERROR := 4

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MINIPORT_NOKEY := 5

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MINIPORT_SUCCESS := 6

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MINIPORT_INVALID := 7

/**
 * @type {Integer (UInt32)}
 */
export global PIR_STATUS_MINIPORT_MAX := 8

/**
 * @type {String}
 */
export global REGSTR_PATH_LASTGOOD := "System\LastKnownGoodRecovery\LastGood"

/**
 * @type {String}
 */
export global REGSTR_PATH_LASTGOODTMP := "System\LastKnownGoodRecovery\LastGood.Tmp"

/**
 * @type {Integer (UInt32)}
 */
export global LASTGOOD_OPERATION := 255

/**
 * @type {Integer (UInt32)}
 */
export global LASTGOOD_OPERATION_NOPOSTPROC := 0

/**
 * @type {Integer (UInt32)}
 */
export global LASTGOOD_OPERATION_DELETE := 1
;@endregion Constants
