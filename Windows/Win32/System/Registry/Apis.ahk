#Requires AutoHotkey v2.0.0 64-bit

/**
 * @namespace Windows.Win32.System.Registry
 * @version v4.0.30319
 */
class Registry {

;@region Constants

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_CLASSES_ROOT => -2147483648

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_CURRENT_USER => -2147483647

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_LOCAL_MACHINE => -2147483646

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_USERS => -2147483645

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_PERFORMANCE_DATA => -2147483644

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_PERFORMANCE_TEXT => -2147483568

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_PERFORMANCE_NLSTEXT => -2147483552

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_CURRENT_CONFIG => -2147483643

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_DYN_DATA => -2147483642

    /**
     * @type {Integer (Int32)}
     */
    static HKEY_CURRENT_USER_LOCAL_SETTINGS => -2147483641

    /**
     * @type {Integer (UInt32)}
     */
    static REG_PROCESS_APPKEY => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_USE_CURRENT_SECURITY_CONTEXT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PROVIDER_KEEPS_VALUE_LENGTH => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_MUI_STRING_TRUNCATE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_SECURE_CONNECTION => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REG_ALLOW_TRANSPORT_FALLBACK => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REG_ALLOW_UNSECURE_CONNECTION => 4

    /**
     * @type {String}
     */
    static REGSTR_KEY_CLASS => "Class"

    /**
     * @type {String}
     */
    static REGSTR_KEY_CONFIG => "Config"

    /**
     * @type {String}
     */
    static REGSTR_KEY_ENUM => "Enum"

    /**
     * @type {String}
     */
    static REGSTR_KEY_ROOTENUM => "Root"

    /**
     * @type {String}
     */
    static REGSTR_KEY_BIOSENUM => "BIOS"

    /**
     * @type {String}
     */
    static REGSTR_KEY_ACPIENUM => "ACPI"

    /**
     * @type {String}
     */
    static REGSTR_KEY_PCMCIAENUM => "PCMCIA"

    /**
     * @type {String}
     */
    static REGSTR_KEY_PCIENUM => "PCI"

    /**
     * @type {String}
     */
    static REGSTR_KEY_VPOWERDENUM => "VPOWERD"

    /**
     * @type {String}
     */
    static REGSTR_KEY_ISAENUM => "ISAPnP"

    /**
     * @type {String}
     */
    static REGSTR_KEY_EISAENUM => "EISA"

    /**
     * @type {String}
     */
    static REGSTR_KEY_LOGCONFIG => "LogConfig"

    /**
     * @type {String}
     */
    static REGSTR_KEY_SYSTEMBOARD => "*PNP0C01"

    /**
     * @type {String}
     */
    static REGSTR_KEY_APM => "*PNP0C05"

    /**
     * @type {String}
     */
    static REGSTR_KEY_INIUPDATE => "IniUpdate"

    /**
     * @type {String}
     */
    static REG_KEY_INSTDEV => "Installed"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DOSOPTCDROM => "CD-ROM"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DOSOPTMOUSE => "MOUSE"

    /**
     * @type {String}
     */
    static REGSTR_KEY_KNOWNDOCKINGSTATES => "Hardware Profiles"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DEVICEPARAMETERS => "Device Parameters"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DRIVERPARAMETERS => "Driver Parameters"

    /**
     * @type {String}
     */
    static REGSTR_DEFAULT_INSTANCE => "0000"

    /**
     * @type {String}
     */
    static REGSTR_PATH_SETUP => "Software\Microsoft\Windows\CurrentVersion"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DRIVERSIGN => "Software\Microsoft\Driver Signing"

    /**
     * @type {String}
     */
    static REGSTR_PATH_NONDRIVERSIGN => "Software\Microsoft\Non-Driver Signing"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DRIVERSIGN_POLICY => "Software\Policies\Microsoft\Windows NT\Driver Signing"

    /**
     * @type {String}
     */
    static REGSTR_PATH_NONDRIVERSIGN_POLICY => "Software\Policies\Microsoft\Windows NT\Non-Driver Signing"

    /**
     * @type {String}
     */
    static REGSTR_PATH_PIFCONVERT => "Software\Microsoft\Windows\CurrentVersion\PIFConvert"

    /**
     * @type {String}
     */
    static REGSTR_PATH_MSDOSOPTS => "Software\Microsoft\Windows\CurrentVersion\MS-DOSOptions"

    /**
     * @type {String}
     */
    static REGSTR_PATH_NOSUGGMSDOS => "Software\Microsoft\Windows\CurrentVersion\NoMSDOSWarn"

    /**
     * @type {String}
     */
    static REGSTR_PATH_NEWDOSBOX => "Software\Microsoft\Windows\CurrentVersion\MS-DOSSpecialConfig"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RUNONCE => "Software\Microsoft\Windows\CurrentVersion\RunOnce"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RUNONCEEX => "Software\Microsoft\Windows\CurrentVersion\RunOnceEx"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RUN => "Software\Microsoft\Windows\CurrentVersion\Run"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RUNSERVICESONCE => "Software\Microsoft\Windows\CurrentVersion\RunServicesOnce"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RUNSERVICES => "Software\Microsoft\Windows\CurrentVersion\RunServices"

    /**
     * @type {String}
     */
    static REGSTR_PATH_EXPLORER => "Software\Microsoft\Windows\CurrentVersion\Explorer"

    /**
     * @type {String}
     */
    static REGSTR_PATH_PROPERTYSYSTEM => "Software\Microsoft\Windows\CurrentVersion\PropertySystem"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DETECT => "Software\Microsoft\Windows\CurrentVersion\Detect"

    /**
     * @type {String}
     */
    static REGSTR_PATH_APPPATHS => "Software\Microsoft\Windows\CurrentVersion\App Paths"

    /**
     * @type {String}
     */
    static REGSTR_PATH_UNINSTALL => "Software\Microsoft\Windows\CurrentVersion\Uninstall"

    /**
     * @type {String}
     */
    static REGSTR_PATH_REALMODENET => "Software\Microsoft\Windows\CurrentVersion\Network\Real Mode Net"

    /**
     * @type {String}
     */
    static REGSTR_PATH_NETEQUIV => "Software\Microsoft\Windows\CurrentVersion\Network\Equivalent"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CVNETWORK => "Software\Microsoft\Windows\CurrentVersion\Network"

    /**
     * @type {String}
     */
    static REGSTR_PATH_WMI_SECURITY => "System\CurrentControlSet\Control\Wmi\Security"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RELIABILITY => "Software\Microsoft\Windows\CurrentVersion\Reliability"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RELIABILITY_POLICY => "Software\Policies\Microsoft\Windows NT\Reliability"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RELIABILITY_POLICY_SHUTDOWNREASONUI => "ShutdownReasonUI"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RELIABILITY_POLICY_SNAPSHOT => "Snapshot"

    /**
     * @type {String}
     */
    static REGSTR_PATH_RELIABILITY_POLICY_REPORTSNAPSHOT => "ReportSnapshot"

    /**
     * @type {String}
     */
    static REGSTR_PATH_REINSTALL => "SOFTWARE\Microsoft\Windows\CurrentVersion\Reinstall"

    /**
     * @type {String}
     */
    static REGSTR_PATH_NT_CURRENTVERSION => "Software\Microsoft\Windows NT\CurrentVersion"

    /**
     * @type {String}
     */
    static REGSTR_PATH_VOLUMECACHE => "Software\Microsoft\Windows\CurrentVersion\Explorer\VolumeCaches"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISPLAY => "display"

    /**
     * @type {String}
     */
    static REGSTR_PATH_IDCONFIGDB => "System\CurrentControlSet\Control\IDConfigDB"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CRITICALDEVICEDATABASE => "System\CurrentControlSet\Control\CriticalDeviceDatabase"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CLASS => "System\CurrentControlSet\Services\Class"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DISPLAYSETTINGS => "Display\Settings"

    /**
     * @type {String}
     */
    static REGSTR_PATH_FONTS => "Display\Fonts"

    /**
     * @type {String}
     */
    static REGSTR_PATH_ENUM => "Enum"

    /**
     * @type {String}
     */
    static REGSTR_PATH_ROOT => "Enum\Root"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CURRENTCONTROLSET => "System\CurrentControlSet"

    /**
     * @type {String}
     */
    static REGSTR_PATH_SYSTEMENUM => "System\CurrentControlSet\Enum"

    /**
     * @type {String}
     */
    static REGSTR_PATH_HWPROFILES => "System\CurrentControlSet\Hardware Profiles"

    /**
     * @type {String}
     */
    static REGSTR_PATH_HWPROFILESCURRENT => "System\CurrentControlSet\Hardware Profiles\Current"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CLASS_NT => "System\CurrentControlSet\Control\Class"

    /**
     * @type {String}
     */
    static REGSTR_PATH_PER_HW_ID_STORAGE => "Software\Microsoft\Windows NT\CurrentVersion\PerHwIdStorage"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DEVICE_CLASSES => "System\CurrentControlSet\Control\DeviceClasses"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CODEVICEINSTALLERS => "System\CurrentControlSet\Control\CoDeviceInstallers"

    /**
     * @type {String}
     */
    static REGSTR_PATH_BUSINFORMATION => "System\CurrentControlSet\Control\PnP\BusInformation"

    /**
     * @type {String}
     */
    static REGSTR_PATH_SERVICES => "System\CurrentControlSet\Services"

    /**
     * @type {String}
     */
    static REGSTR_PATH_VXD => "System\CurrentControlSet\Services\VxD"

    /**
     * @type {String}
     */
    static REGSTR_PATH_IOS => "System\CurrentControlSet\Services\VxD\IOS"

    /**
     * @type {String}
     */
    static REGSTR_PATH_VMM => "System\CurrentControlSet\Services\VxD\VMM"

    /**
     * @type {String}
     */
    static REGSTR_PATH_VPOWERD => "System\CurrentControlSet\Services\VxD\VPOWERD"

    /**
     * @type {String}
     */
    static REGSTR_PATH_VNETSUP => "System\CurrentControlSet\Services\VxD\VNETSUP"

    /**
     * @type {String}
     */
    static REGSTR_PATH_NWREDIR => "System\CurrentControlSet\Services\VxD\NWREDIR"

    /**
     * @type {String}
     */
    static REGSTR_PATH_NCPSERVER => "System\CurrentControlSet\Services\NcpServer\Parameters"

    /**
     * @type {String}
     */
    static REGSTR_PATH_VCOMM => "System\CurrentControlSet\Services\VxD\VCOMM"

    /**
     * @type {String}
     */
    static REGSTR_PATH_IOARB => "System\CurrentControlSet\Services\Arbitrators\IOArb"

    /**
     * @type {String}
     */
    static REGSTR_PATH_ADDRARB => "System\CurrentControlSet\Services\Arbitrators\AddrArb"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DMAARB => "System\CurrentControlSet\Services\Arbitrators\DMAArb"

    /**
     * @type {String}
     */
    static REGSTR_PATH_IRQARB => "System\CurrentControlSet\Services\Arbitrators\IRQArb"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CODEPAGE => "System\CurrentControlSet\Control\Nls\Codepage"

    /**
     * @type {String}
     */
    static REGSTR_PATH_FILESYSTEM => "System\CurrentControlSet\Control\FileSystem"

    /**
     * @type {String}
     */
    static REGSTR_PATH_FILESYSTEM_NOVOLTRACK => "System\CurrentControlSet\Control\FileSystem\NoVolTrack"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CDFS => "System\CurrentControlSet\Control\FileSystem\CDFS"

    /**
     * @type {String}
     */
    static REGSTR_PATH_WINBOOT => "System\CurrentControlSet\Control\WinBoot"

    /**
     * @type {String}
     */
    static REGSTR_PATH_INSTALLEDFILES => "System\CurrentControlSet\Control\InstalledFiles"

    /**
     * @type {String}
     */
    static REGSTR_PATH_VMM32FILES => "System\CurrentControlSet\Control\VMM32Files"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_MAX_VALUE_LENGTH => 256

    /**
     * @type {String}
     */
    static REGSTR_KEY_DEVICE_PROPERTIES => "Properties"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SERVICE => "Service"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CLASSGUID => "ClassGUID"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISABLECOUNT => "DisableCount"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOCKSTATE => "DockState"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICE_INSTANCE => "DeviceInstance"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYMBOLIC_LINK => "SymbolicLink"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEFAULT => "Default"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LOWERFILTERS => "LowerFilters"

    /**
     * @type {String}
     */
    static REGSTR_VAL_UPPERFILTERS => "UpperFilters"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LOCATION_INFORMATION => "LocationInformation"

    /**
     * @type {String}
     */
    static REGSTR_VAL_UI_NUMBER => "UINumber"

    /**
     * @type {String}
     */
    static REGSTR_VAL_UI_NUMBER_DESC_FORMAT => "UINumberDescFormat"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CAPABILITIES => "Capabilities"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ADDRESS => "Address"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICE_TYPE => "DeviceType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICE_CHARACTERISTICS => "DeviceCharacteristics"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICE_SECURITY_DESCRIPTOR => "Security"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICE_EXCLUSIVE => "Exclusive"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RESOURCE_PICKER_TAGS => "ResourcePickerTags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RESOURCE_PICKER_EXCEPTIONS => "ResourcePickerExceptions"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CUSTOM_PROPERTY_CACHE_DATE => "CustomPropertyCacheDate"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CUSTOM_PROPERTY_HW_ID_KEY => "CustomPropertyHwIdKey"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LAST_UPDATE_TIME => "LastUpdateTime"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CONTAINERID => "ContainerID"

    /**
     * @type {String}
     */
    static REGSTR_VAL_EJECT_PRIORITY => "EjectPriority"

    /**
     * @type {String}
     */
    static REGSTR_KEY_CONTROL => "Control"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ACTIVESERVICE => "ActiveService"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LINKED => "Linked"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PHYSICALDEVICEOBJECT => "PhysicalDeviceObject"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REMOVAL_POLICY => "RemovalPolicy"

    /**
     * @type {String}
     */
    static REGSTR_KEY_FILTERS => "Filters"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LOWER_FILTER_DEFAULT_LEVEL => "LowerFilterDefaultLevel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_UPPER_FILTER_DEFAULT_LEVEL => "UpperFilterDefaultLevel"

    /**
     * @type {String}
     */
    static REGSTR_KEY_LOWER_FILTER_LEVEL_DEFAULT => "*Lower"

    /**
     * @type {String}
     */
    static REGSTR_KEY_UPPER_FILTER_LEVEL_DEFAULT => "*Upper"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LOWER_FILTER_LEVELS => "LowerFilterLevels"

    /**
     * @type {String}
     */
    static REGSTR_VAL_UPPER_FILTER_LEVELS => "UpperFilterLevels"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CURRENT_VERSION => "CurrentVersion"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CURRENT_BUILD => "CurrentBuildNumber"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CURRENT_CSDVERSION => "CSDVersion"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CURRENT_TYPE => "CurrentType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BITSPERPIXEL => "BitsPerPixel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RESOLUTION => "Resolution"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DPILOGICALX => "DPILogicalX"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DPILOGICALY => "DPILogicalY"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DPIPHYSICALX => "DPIPhysicalX"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DPIPHYSICALY => "DPIPhysicalY"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REFRESHRATE => "RefreshRate"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISPLAYFLAGS => "DisplayFlags"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CONTROLPANEL => "Control Panel"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CONTROLSFOLDER => "Software\Microsoft\Windows\CurrentVersion\Controls Folder"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOSCP => "OEMCP"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WINCP => "ACP"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DONTUSEMEM => "DontAllocLastMem"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSTEMROOT => "SystemRoot"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BOOTCOUNT => "BootCount"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REALNETSTART => "RealNetStart"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MEDIA => "MediaPath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CONFIG => "ConfigPath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICEPATH => "DevicePath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SRCPATH => "SourcePath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRIVERCACHEPATH => "DriverCachePath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_OLDWINDIR => "OldWinDir"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SETUPFLAGS => "SetupFlags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REGOWNER => "RegisteredOwner"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REGORGANIZATION => "RegisteredOrganization"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LICENSINGINFO => "LicensingInfo"

    /**
     * @type {String}
     */
    static REGSTR_VAL_OLDMSDOSVER => "OldMSDOSVer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FIRSTINSTALLDATETIME => "FirstInstallDateTime"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INSTALLTYPE => "InstallType"

    /**
     * @type {Integer (UInt32)}
     */
    static IT_COMPACT => 0

    /**
     * @type {Integer (UInt32)}
     */
    static IT_TYPICAL => 1

    /**
     * @type {Integer (UInt32)}
     */
    static IT_PORTABLE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static IT_CUSTOM => 3

    /**
     * @type {String}
     */
    static REGSTR_VAL_WRAPPER => "Wrapper"

    /**
     * @type {String}
     */
    static REGSTR_KEY_RUNHISTORY => "RunHistory"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTALIVEINTERVAL => "TimeStampInterval"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DIRTYSHUTDOWN => "DirtyShutdown"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DIRTYSHUTDOWNTIME => "DirtyShutdownTime"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BT => "6005BT"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTCOMPUTERNAME => "LastComputerName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTALIVEBT => "LastAliveBT"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTALIVESTAMP => "LastAliveStamp"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTALIVESTAMPFORCED => "LastAliveStampForced"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTALIVESTAMPINTERVAL => "LastAliveStampInterval"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTALIVESTAMPPOLICYINTERVAL => "LastAliveStampPolicyInterval"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTALIVEUPTIME => "LastAliveUptime"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTALIVEPMPOLICY => "LastAlivePMPolicy"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REASONCODE => "ReasonCode"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COMMENT => "Comment"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWNREASON => "ShutdownReason"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWNREASON_CODE => "ShutdownReasonCode"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWNREASON_COMMENT => "ShutdownReasonComment"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWNREASON_PROCESS => "ShutdownReasonProcess"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWNREASON_USERNAME => "ShutdownReasonUserName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHOWREASONUI => "ShutdownReasonUI"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWN_IGNORE_PREDEFINED => "ShutdownIgnorePredefinedReasons"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWN_STATE_SNAPSHOT => "ShutdownStateSnapshot"

    /**
     * @type {String}
     */
    static REGSTR_KEY_SETUP => "\Setup"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BOOTDIR => "BootDir"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WINBOOTDIR => "WinbootDir"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WINDIR => "WinDir"

    /**
     * @type {String}
     */
    static REGSTR_VAL_APPINSTPATH => "AppInstallPath"

    /**
     * @type {String}
     */
    static REGSTR_KEY_EBDFILESLOCAL => "EBDFilesLocale"

    /**
     * @type {String}
     */
    static REGSTR_KEY_EBDFILESKEYBOARD => "EBDFilesKeyboard"

    /**
     * @type {String}
     */
    static REGSTR_KEY_EBDAUTOEXECBATLOCAL => "EBDAutoexecBatLocale"

    /**
     * @type {String}
     */
    static REGSTR_KEY_EBDAUTOEXECBATKEYBOARD => "EBDAutoexecBatKeyboard"

    /**
     * @type {String}
     */
    static REGSTR_KEY_EBDCONFIGSYSLOCAL => "EBDConfigSysLocale"

    /**
     * @type {String}
     */
    static REGSTR_KEY_EBDCONFIGSYSKEYBOARD => "EBDConfigSysKeyboard"

    /**
     * @type {String}
     */
    static REGSTR_VAL_POLICY => "Policy"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BEHAVIOR_ON_FAILED_VERIFY => "BehaviorOnFailedVerify"

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVERSIGN_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVERSIGN_WARNING => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DRIVERSIGN_BLOCKING => 2

    /**
     * @type {String}
     */
    static REGSTR_VAL_MSDOSMODE => "MSDOSMode"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MSDOSMODEDISCARD => "Discard"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOSOPTGLOBALFLAGS => "GlobalFlags"

    /**
     * @type {Integer (Int32)}
     */
    static DOSOPTGF_DEFCLEAN => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOSOPTFLAGS => "Flags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_OPTORDER => "Order"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CONFIGSYS => "Config.Sys"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTOEXEC => "Autoexec.Bat"

    /**
     * @type {String}
     */
    static REGSTR_VAL_STDDOSOPTION => "StdOption"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOSOPTTIP => "TipText"

    /**
     * @type {Integer (Int32)}
     */
    static DOSOPTF_DEFAULT => 1

    /**
     * @type {Integer (Int32)}
     */
    static DOSOPTF_SUPPORTED => 2

    /**
     * @type {Integer (Int32)}
     */
    static DOSOPTF_ALWAYSUSE => 4

    /**
     * @type {Integer (Int32)}
     */
    static DOSOPTF_USESPMODE => 8

    /**
     * @type {Integer (Int32)}
     */
    static DOSOPTF_PROVIDESUMB => 16

    /**
     * @type {Integer (Int32)}
     */
    static DOSOPTF_NEEDSETUP => 32

    /**
     * @type {Integer (Int32)}
     */
    static DOSOPTF_INDOSSTART => 64

    /**
     * @type {Integer (Int32)}
     */
    static DOSOPTF_MULTIPLE => 128

    /**
     * @type {Integer (Int32)}
     */
    static SUF_FIRSTTIME => 1

    /**
     * @type {Integer (Int32)}
     */
    static SUF_EXPRESS => 2

    /**
     * @type {Integer (Int32)}
     */
    static SUF_BATCHINF => 4

    /**
     * @type {Integer (Int32)}
     */
    static SUF_CLEAN => 8

    /**
     * @type {Integer (Int32)}
     */
    static SUF_INSETUP => 16

    /**
     * @type {Integer (Int32)}
     */
    static SUF_NETSETUP => 32

    /**
     * @type {Integer (Int32)}
     */
    static SUF_NETHDBOOT => 64

    /**
     * @type {Integer (Int32)}
     */
    static SUF_NETRPLBOOT => 128

    /**
     * @type {Integer (Int32)}
     */
    static SUF_SBSCOPYOK => 256

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOSPAGER => "DOSPager"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VXDGROUPS => "VXDGroups"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VPOWERDFLAGS => "Flags"

    /**
     * @type {Integer (UInt32)}
     */
    static VPDF_DISABLEPWRMGMT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static VPDF_FORCEAPM10MODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static VPDF_SKIPINTELSLCHECK => 4

    /**
     * @type {Integer (UInt32)}
     */
    static VPDF_DISABLEPWRSTATUSPOLL => 8

    /**
     * @type {Integer (UInt32)}
     */
    static VPDF_DISABLERINGRESUME => 16

    /**
     * @type {Integer (UInt32)}
     */
    static VPDF_SHOWMULTIBATT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static BIF_SHOWSIMILARDRIVERS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static BIF_RAWDEVICENEEDSDRIVER => 2

    /**
     * @type {String}
     */
    static REGSTR_VAL_WORKGROUP => "Workgroup"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DIRECTHOST => "DirectHost"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FILESHARING => "FileSharing"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRINTSHARING => "PrintSharing"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FIRSTNETDRIVE => "FirstNetworkDrive"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MAXCONNECTIONS => "MaxConnections"

    /**
     * @type {String}
     */
    static REGSTR_VAL_APISUPPORT => "APISupport"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MAXRETRY => "MaxRetry"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MINRETRY => "MinRetry"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SUPPORTLFN => "SupportLFN"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SUPPORTBURST => "SupportBurst"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SUPPORTTUNNELLING => "SupportTunnelling"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FULLTRACE => "FullTrace"

    /**
     * @type {String}
     */
    static REGSTR_VAL_READCACHING => "ReadCaching"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHOWDOTS => "ShowDots"

    /**
     * @type {String}
     */
    static REGSTR_VAL_GAPTIME => "GapTime"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SEARCHMODE => "SearchMode"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHELLVERSION => "ShellVersion"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MAXLIP => "MaxLIP"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRESERVECASE => "PreserveCase"

    /**
     * @type {String}
     */
    static REGSTR_VAL_OPTIMIZESFN => "OptimizeSFN"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NCP_BROWSEMASTER => "BrowseMaster"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NCP_USEPEERBROWSING => "Use_PeerBrowsing"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NCP_USESAP => "Use_Sap"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCCARD_POWER => "EnablePowerManagement"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WIN31FILESYSTEM => "Win31FileSystem"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRESERVELONGNAMES => "PreserveLongNames"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRIVEWRITEBEHIND => "DriveWriteBehind"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ASYNCFILECOMMIT => "AsyncFileCommit"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PATHCACHECOUNT => "PathCache"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NAMECACHECOUNT => "NameCache"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CONTIGFILEALLOC => "ContigFileAllocSize"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FREESPACERATIO => "FreeSpaceRatio"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VOLIDLETIMEOUT => "VolumeIdleTimeout"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BUFFIDLETIMEOUT => "BufferIdleTimeout"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BUFFAGETIMEOUT => "BufferAgeTimeout"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NAMENUMERICTAIL => "NameNumericTail"

    /**
     * @type {String}
     */
    static REGSTR_VAL_READAHEADTHRESHOLD => "ReadAheadThreshold"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOUBLEBUFFER => "DoubleBuffer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SOFTCOMPATMODE => "SoftCompatMode"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRIVESPINDOWN => "DriveSpinDown"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FORCEPMIO => "ForcePMIO"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FORCERMIO => "ForceRMIO"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTBOOTPMDRVS => "LastBootPMDrvs"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ACSPINDOWNPREVIOUS => "ACSpinDownPrevious"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BATSPINDOWNPREVIOUS => "BatSpinDownPrevious"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VIRTUALHDIRQ => "VirtualHDIRQ"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SRVNAMECACHECOUNT => "ServerNameCacheMax"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SRVNAMECACHE => "ServerNameCache"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SRVNAMECACHENETPROV => "ServerNameCacheNumNets"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTOMOUNT => "AutoMountDrives"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COMPRESSIONMETHOD => "CompressionAlgorithm"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COMPRESSIONTHRESHOLD => "CompressionThreshold"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ACDRIVESPINDOWN => "ACDriveSpinDown"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BATDRIVESPINDOWN => "BatDriveSpinDown"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDCACHESIZE => "CacheSize"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDPREFETCH => "Prefetch"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDPREFETCHTAIL => "PrefetchTail"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDRAWCACHE => "RawCache"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDEXTERRORS => "ExtendedErrors"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDSVDSENSE => "SVDSense"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDSHOWVERSIONS => "ShowVersions"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDCOMPATNAMES => "MSCDEXCompatNames"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDNOREADAHEAD => "NoReadAhead"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SCSI => "SCSI\"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ESDI => "ESDI\"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FLOP => "FLOP\"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISK => "GenDisk"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDROM => "GenCD"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TAPE => "TAPE"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SCANNER => "SCANNER"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FLOPPY => "FLOPPY"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SCSITID => "SCSITargetID"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SCSILUN => "SCSILUN"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REVLEVEL => "RevisionLevel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRODUCTID => "ProductId"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRODUCTTYPE => "ProductType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVTYPE => "DeviceType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REMOVABLE => "Removable"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CURDRVLET => "CurrentDriveLetterAssignment"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USRDRVLET => "UserDriveLetterAssignment"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYNCDATAXFER => "SyncDataXfer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTOINSNOTE => "AutoInsertNotification"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISCONNECT => "Disconnect"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INT13 => "Int13"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PMODE_INT13 => "PModeInt13"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USERSETTINGS => "AdapterSettings"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOIDE => "NoIDE"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISKCLASSNAME => "DiskDrive"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CDROMCLASSNAME => "CDROM"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FORCELOAD => "ForceLoadPD"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FORCEFIFO => "ForceFIFO"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FORCECL => "ForceChangeLine"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOUSECLASS => "NoUseClass"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOINSTALLCLASS => "NoInstallClass"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NODISPLAYCLASS => "NoDisplayClass"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SILENTINSTALL => "SilentInstall"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FSFILTERCLASS => "FSFilterClass"

    /**
     * @type {String}
     */
    static REGSTR_KEY_PCMCIA_CLASS => "PCMCIA"

    /**
     * @type {String}
     */
    static REGSTR_KEY_SCSI_CLASS => "SCSIAdapter"

    /**
     * @type {String}
     */
    static REGSTR_KEY_PORTS_CLASS => "ports"

    /**
     * @type {String}
     */
    static REGSTR_KEY_MEDIA_CLASS => "MEDIA"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DISPLAY_CLASS => "Display"

    /**
     * @type {String}
     */
    static REGSTR_KEY_KEYBOARD_CLASS => "Keyboard"

    /**
     * @type {String}
     */
    static REGSTR_KEY_MOUSE_CLASS => "Mouse"

    /**
     * @type {String}
     */
    static REGSTR_KEY_MONITOR_CLASS => "Monitor"

    /**
     * @type {String}
     */
    static REGSTR_KEY_MODEM_CLASS => "Modem"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCMCIA_OPT => "Options"

    /**
     * @type {Integer (Int32)}
     */
    static PCMCIA_OPT_HAVE_SOCKET => 1

    /**
     * @type {Integer (Int32)}
     */
    static PCMCIA_OPT_AUTOMEM => 4

    /**
     * @type {Integer (Int32)}
     */
    static PCMCIA_OPT_NO_SOUND => 8

    /**
     * @type {Integer (Int32)}
     */
    static PCMCIA_OPT_NO_AUDIO => 16

    /**
     * @type {Integer (Int32)}
     */
    static PCMCIA_OPT_NO_APMREMOVE => 32

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCMCIA_MEM => "Memory"

    /**
     * @type {Integer (UInt32)}
     */
    static PCMCIA_DEF_MEMBEGIN => 786432

    /**
     * @type {Integer (UInt32)}
     */
    static PCMCIA_DEF_MEMEND => 16777215

    /**
     * @type {Integer (UInt32)}
     */
    static PCMCIA_DEF_MEMLEN => 4096

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCMCIA_ALLOC => "AllocMemWin"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCMCIA_ATAD => "ATADelay"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCMCIA_SIZ => "MinRegionSize"

    /**
     * @type {Integer (UInt32)}
     */
    static PCMCIA_DEF_MIN_REGION => 65536

    /**
     * @type {String}
     */
    static REGSTR_VAL_P1284MDL => "Model"

    /**
     * @type {String}
     */
    static REGSTR_VAL_P1284MFG => "Manufacturer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ISAPNP => "ISAPNP"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ISAPNP_RDP_OVERRIDE => "RDPOverRide"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCI => "PCI"

    /**
     * @type {String}
     */
    static REGSTR_PCI_OPTIONS => "Options"

    /**
     * @type {String}
     */
    static REGSTR_PCI_DUAL_IDE => "PCIDualIDE"

    /**
     * @type {Integer (Int32)}
     */
    static PCI_OPTIONS_USE_BIOS => 1

    /**
     * @type {Integer (Int32)}
     */
    static PCI_OPTIONS_USE_IRQ_STEERING => 2

    /**
     * @type {Integer (Int32)}
     */
    static AGP_FLAG_NO_1X_RATE => 1

    /**
     * @type {Integer (Int32)}
     */
    static AGP_FLAG_NO_2X_RATE => 2

    /**
     * @type {Integer (Int32)}
     */
    static AGP_FLAG_NO_4X_RATE => 4

    /**
     * @type {Integer (Int32)}
     */
    static AGP_FLAG_NO_8X_RATE => 8

    /**
     * @type {Integer (Int32)}
     */
    static AGP_FLAG_REVERSE_INITIALIZATION => 128

    /**
     * @type {Integer (Int32)}
     */
    static AGP_FLAG_NO_SBA_ENABLE => 256

    /**
     * @type {Integer (Int32)}
     */
    static AGP_FLAG_NO_FW_ENABLE => 512

    /**
     * @type {Integer (Int32)}
     */
    static AGP_FLAG_SPECIAL_TARGET => 1048575

    /**
     * @type {Integer (Int32)}
     */
    static AGP_FLAG_SPECIAL_RESERVE => 1015808

    /**
     * @type {String}
     */
    static REGSTR_KEY_CRASHES => "Crashes"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DANGERS => "Dangers"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DETMODVARS => "DetModVars"

    /**
     * @type {String}
     */
    static REGSTR_KEY_NDISINFO => "NDISInfo"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PROTINIPATH => "ProtIniPath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RESOURCES => "Resources"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CRASHFUNCS => "CrashFuncs"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CLASS => "Class"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CLASSDESC => "ClassDesc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVDESC => "DeviceDesc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BOOTCONFIG => "BootConfig"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DETFUNC => "DetFunc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DETFLAGS => "DetFlags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COMPATIBLEIDS => "CompatibleIDs"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DETCONFIG => "DetConfig"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VERIFYKEY => "VerifyKey"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COMINFO => "ComInfo"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INFNAME => "InfName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CARDSPECIFIC => "CardSpecific"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NETOSTYPE => "NetOSType"

    /**
     * @type {String}
     */
    static REGSTR_DATA_NETOS_NDIS => "NDIS"

    /**
     * @type {String}
     */
    static REGSTR_DATA_NETOS_ODI => "ODI"

    /**
     * @type {String}
     */
    static REGSTR_DATA_NETOS_IPX => "IPX"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MFG => "Mfg"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SCAN_ONLY_FIRST => "ScanOnlyFirstDrive"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHARE_IRQ => "ForceIRQSharing"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NONSTANDARD_ATAPI => "NonStandardATAPI"

    /**
     * @type {String}
     */
    static REGSTR_VAL_IDE_FORCE_SERIALIZE => "ForceSerialization"

    /**
     * @type {Integer (UInt32)}
     */
    static REGSTR_VAL_MAX_HCID_LEN => 1024

    /**
     * @type {String}
     */
    static REGSTR_VAL_HWREV => "HWRevision"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENABLEINTS => "EnableInts"

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_NOTDETIO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_NOTDETMEM => 2

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_NOTDETIRQ => 4

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_NOTDETDMA => 8

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_NEEDFULLCONFIG => 16

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_GENFORCEDCONFIG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_NODETCONFIG => 32768

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_CONFLICTIO => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_CONFLICTMEM => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_CONFLICTIRQ => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_CONFLICTDMA => 524288

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_MAPIRQ2TO9 => 1048576

    /**
     * @type {Integer (UInt32)}
     */
    static REGDF_NOTVERIFIED => 2147483648

    /**
     * @type {String}
     */
    static REGSTR_VAL_APMBIOSVER => "APMBiosVer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_APMFLAGS => "APMFlags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SLSUPPORT => "SLSupport"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MACHINETYPE => "MachineType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SETUPMACHINETYPE => "SetupMachineType"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_UNKNOWN => "Unknown"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPC => "IBM PC"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPCJR => "IBM PCjr"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPCCONV => "IBM PC Convertible"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPCXT => "IBM PC/XT"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPCXT_286 => "IBM PC/XT 286"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPCAT => "IBM PC/AT"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_25 => "IBM PS/2-25"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_30_286 => "IBM PS/2-30 286"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_30 => "IBM PS/2-30"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_50 => "IBM PS/2-50"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_50Z => "IBM PS/2-50Z"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_55SX => "IBM PS/2-55SX"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_60 => "IBM PS/2-60"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_65SX => "IBM PS/2-65SX"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_70 => "IBM PS/2-70"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_P70 => "IBM PS/2-P70"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_70_80 => "IBM PS/2-70/80"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_80 => "IBM PS/2-80"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS2_90 => "IBM PS/2-90"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_IBMPS1 => "IBM PS/1"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_PHOENIX_PCAT => "Phoenix PC/AT Compatible"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_HP_VECTRA => "HP Vectra"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_ATT_PC => "AT&T PC"

    /**
     * @type {String}
     */
    static REGSTR_MACHTYPE_ZENITH_PC => "Zenith PC"

    /**
     * @type {String}
     */
    static REGSTR_VAL_APMMENUSUSPEND => "APMMenuSuspend"

    /**
     * @type {Integer (UInt32)}
     */
    static APMMENUSUSPEND_DISABLED => 0

    /**
     * @type {Integer (UInt32)}
     */
    static APMMENUSUSPEND_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static APMMENUSUSPEND_UNDOCKED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static APMMENUSUSPEND_NOCHANGE => 128

    /**
     * @type {String}
     */
    static REGSTR_VAL_APMACTIMEOUT => "APMACTimeout"

    /**
     * @type {String}
     */
    static REGSTR_VAL_APMBATTIMEOUT => "APMBatTimeout"

    /**
     * @type {Integer (UInt32)}
     */
    static APMTIMEOUT_DISABLED => 0

    /**
     * @type {String}
     */
    static REGSTR_VAL_APMSHUTDOWNPOWER => "APMShutDownPower"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BUSTYPE => "BusType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CPU => "CPU"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NDP => "NDP"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PNPBIOSVER => "PnPBIOSVer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PNPSTRUCOFFSET => "PnPStrucOffset"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCIBIOSVER => "PCIBIOSVer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_HWMECHANISM => "HWMechanism"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LASTPCIBUSNUM => "LastPCIBusNum"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CONVMEM => "ConvMem"

    /**
     * @type {String}
     */
    static REGSTR_VAL_EXTMEM => "ExtMem"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COMPUTERNAME => "ComputerName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BIOSNAME => "BIOSName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BIOSVERSION => "BIOSVersion"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BIOSDATE => "BIOSDate"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MODEL => "Model"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SUBMODEL => "Submodel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REVISION => "Revision"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FIFODEPTH => "FIFODepth"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RDINTTHRESHOLD => "RDIntThreshold"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WRINTTHRESHOLD => "WRIntThreshold"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRIORITY => "Priority"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRIVER => "Driver"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FUNCDESC => "FunctionDesc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FORCEDCONFIG => "ForcedConfig"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CONFIGFLAGS => "ConfigFlags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CSCONFIGFLAGS => "CSConfigFlags"

    /**
     * @type {Integer (UInt32)}
     */
    static CSCONFIGFLAG_BITS => 7

    /**
     * @type {Integer (UInt32)}
     */
    static CSCONFIGFLAG_DISABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static CSCONFIGFLAG_DO_NOT_CREATE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static CSCONFIGFLAG_DO_NOT_START => 4

    /**
     * @type {Integer (UInt32)}
     */
    static DMSTATEFLAG_APPLYTOALL => 1

    /**
     * @type {String}
     */
    static REGSTR_VAL_ROOT_DEVNODE => "HTREE\ROOT\0"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RESERVED_DEVNODE => "HTREE\RESERVED\0"

    /**
     * @type {String}
     */
    static REGSTR_PATH_MULTI_FUNCTION => "MF"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RESOURCE_MAP => "ResourceMap"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CHILD_PREFIX => "Child"

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_RESOURCE_MAP => 256

    /**
     * @type {String}
     */
    static REGSTR_VAL_MF_FLAGS => "MFFlags"

    /**
     * @type {Integer (UInt32)}
     */
    static MF_FLAGS_EVEN_IF_NO_RESOURCE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static MF_FLAGS_NO_CREATE_IF_NO_RESOURCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static MF_FLAGS_FILL_IN_UNKNOWN_RESOURCE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static MF_FLAGS_CREATE_BUT_NO_SHOW_DISABLED => 8

    /**
     * @type {String}
     */
    static REGSTR_VAL_EISA_RANGES => "EISARanges"

    /**
     * @type {String}
     */
    static REGSTR_VAL_EISA_FUNCTIONS => "EISAFunctions"

    /**
     * @type {String}
     */
    static REGSTR_VAL_EISA_FUNCTIONS_MASK => "EISAFunctionsMask"

    /**
     * @type {String}
     */
    static REGSTR_VAL_EISA_FLAGS => "EISAFlags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_EISA_SIMULATE_INT15 => "EISASimulateInt15"

    /**
     * @type {Integer (UInt32)}
     */
    static EISAFLAG_NO_IO_MERGE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static EISAFLAG_SLOT_IO_FIRST => 2

    /**
     * @type {Integer (UInt32)}
     */
    static EISA_NO_MAX_FUNCTION => 255

    /**
     * @type {Integer (UInt32)}
     */
    static NUM_EISA_RANGES => 4

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRVDESC => "DriverDesc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVLOADER => "DevLoader"

    /**
     * @type {String}
     */
    static REGSTR_VAL_STATICVXD => "StaticVxD"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PROPERTIES => "Properties"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MANUFACTURER => "Manufacturer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_EXISTS => "Exists"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CMENUMFLAGS => "CMEnumFlags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CMDRIVFLAGS => "CMDrivFlags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENUMERATOR => "Enumerator"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DEVICEDRIVER => "DeviceDriver"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PORTNAME => "PortName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INFPATH => "InfPath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INFSECTION => "InfSection"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INFSECTIONEXT => "InfSectionExt"

    /**
     * @type {String}
     */
    static REGSTR_VAL_POLLING => "Polling"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DONTLOADIFCONFLICT => "DontLoadIfConflict"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PORTSUBCLASS => "PortSubClass"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NETCLEAN => "NetClean"

    /**
     * @type {String}
     */
    static REGSTR_VAL_IDE_NO_SERIALIZE => "IDENoSerialize"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOCMOSORFDPT => "NoCMOSorFDPT"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COMVERIFYBASE => "COMVerifyBase"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MATCHINGDEVID => "MatchingDeviceId"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRIVERDATE => "DriverDate"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRIVERDATEDATA => "DriverDateData"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRIVERVERSION => "DriverVersion"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LOCATION_INFORMATION_OVERRIDE => "LocationInformationOverride"

    /**
     * @type {String}
     */
    static REGSTR_KEY_OVERRIDE => "Override"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CONFIGMG => "CONFIGMG"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSDM => "SysDM"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSDMFUNC => "SysDMFunc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRIVATE => "Private"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRIVATEFUNC => "PrivateFunc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DETECT => "Detect"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DETECTFUNC => "DetectFunc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ASKFORCONFIG => "AskForConfig"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ASKFORCONFIGFUNC => "AskForConfigFunc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WAITFORUNDOCK => "WaitForUndock"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WAITFORUNDOCKFUNC => "WaitForUndockFunc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REMOVEROMOKAY => "RemoveRomOkay"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REMOVEROMOKAYFUNC => "RemoveRomOkayFunc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CURCONFIG => "CurrentConfig"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FRIENDLYNAME => "FriendlyName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CURRENTCONFIG => "CurrentConfig"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MAP => "Map"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ID => "CurrentID"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOCKED => "CurrentDockedState"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CHECKSUM => "CurrentChecksum"

    /**
     * @type {String}
     */
    static REGSTR_VAL_HWDETECT => "HardwareDetect"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INHIBITRESULTS => "InhibitResults"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PROFILEFLAGS => "ProfileFlags"

    /**
     * @type {String}
     */
    static REGSTR_KEY_PCMCIA => "PCMCIA\"

    /**
     * @type {String}
     */
    static REGSTR_KEY_PCUNKNOWN => "UNKNOWN_MANUFACTURER"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCSSDRIVER => "Driver"

    /**
     * @type {String}
     */
    static REGSTR_KEY_PCMTD => "MTD-"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCMTDRIVER => "MTD"

    /**
     * @type {String}
     */
    static REGSTR_VAL_HARDWAREID => "HardwareID"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INSTALLER => "Installer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INSTALLER_32 => "Installer32"

    /**
     * @type {String}
     */
    static REGSTR_VAL_INSICON => "Icon"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENUMPROPPAGES => "EnumPropPages"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ENUMPROPPAGES_32 => "EnumPropPages32"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BASICPROPERTIES => "BasicProperties"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BASICPROPERTIES_32 => "BasicProperties32"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COINSTALLERS_32 => "CoInstallers32"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRIVATEPROBLEM => "PrivateProblem"

    /**
     * @type {String}
     */
    static REGSTR_KEY_CURRENT => "Current"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DEFAULT => "Default"

    /**
     * @type {String}
     */
    static REGSTR_KEY_MODES => "Modes"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MODE => "Mode"

    /**
     * @type {String}
     */
    static REGSTR_VAL_BPP => "BPP"

    /**
     * @type {String}
     */
    static REGSTR_VAL_HRES => "HRes"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VRES => "VRes"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FONTSIZE => "FontSize"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRV => "drv"

    /**
     * @type {String}
     */
    static REGSTR_VAL_GRB => "grb"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VDD => "vdd"

    /**
     * @type {String}
     */
    static REGSTR_VAL_VER => "Ver"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MAXRES => "MaxResolution"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DPMS => "DPMS"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RESUMERESET => "ResumeReset"

    /**
     * @type {String}
     */
    static REGSTR_KEY_SYSTEM => "System"

    /**
     * @type {String}
     */
    static REGSTR_KEY_USER => "User"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DPI => "dpi"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCICOPTIONS => "PCICOptions"

    /**
     * @type {Integer (UInt32)}
     */
    static PCIC_DEFAULT_IRQMASK => 20152

    /**
     * @type {Integer (UInt32)}
     */
    static PCIC_DEFAULT_NUMSOCKETS => 0

    /**
     * @type {String}
     */
    static REGSTR_VAL_PCICIRQMAP => "PCICIRQMap"

    /**
     * @type {String}
     */
    static REGSTR_PATH_APPEARANCE => "Control Panel\Appearance"

    /**
     * @type {String}
     */
    static REGSTR_PATH_LOOKSCHEMES => "Control Panel\Appearance\Schemes"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CUSTOMCOLORS => "CustomColors"

    /**
     * @type {String}
     */
    static REGSTR_PATH_SCREENSAVE => "Control Panel\Desktop"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_USESCRPASSWORD => "ScreenSaveUsePassword"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_SCRPASSWORD => "ScreenSave_Data"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_LOWPOWERTIMEOUT => "ScreenSaveLowPowerTimeout"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_POWEROFFTIMEOUT => "ScreenSavePowerOffTimeout"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_LOWPOWERACTIVE => "ScreenSaveLowPowerActive"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_POWEROFFACTIVE => "ScreenSavePowerOffActive"

    /**
     * @type {String}
     */
    static REGSTR_PATH_WINDOWSAPPLETS => "Software\Microsoft\Windows\CurrentVersion\Applets"

    /**
     * @type {String}
     */
    static REGSTR_PATH_SYSTRAY => "Software\Microsoft\Windows\CurrentVersion\Applets\SysTray"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSTRAYSVCS => "Services"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSTRAYBATFLAGS => "PowerFlags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSTRAYPCCARDFLAGS => "PCMCIAFlags"

    /**
     * @type {String}
     */
    static REGSTR_PATH_NETWORK_USERSETTINGS => "Network"

    /**
     * @type {String}
     */
    static REGSTR_KEY_NETWORK_PERSISTENT => "\Persistent"

    /**
     * @type {String}
     */
    static REGSTR_KEY_NETWORK_RECENT => "\Recent"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REMOTE_PATH => "RemotePath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_USER_NAME => "UserName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PROVIDER_NAME => "ProviderName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CONNECTION_TYPE => "ConnectionType"

    /**
     * @type {String}
     */
    static REGSTR_VAL_UPGRADE => "Upgrade"

    /**
     * @type {String}
     */
    static REGSTR_KEY_LOGON => "\Logon"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MUSTBEVALIDATED => "MustBeValidated"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RUNLOGINSCRIPT => "ProcessLoginScript"

    /**
     * @type {String}
     */
    static REGSTR_KEY_NETWORKPROVIDER => "\NetworkProvider"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTHENT_AGENT => "AuthenticatingAgent"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PREFREDIR => "PreferredRedir"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTOSTART => "AutoStart"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUTOLOGON => "AutoLogon"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NETCARD => "Netcard"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TRANSPORT => "Transport"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DYNAMIC => "Dynamic"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TRANSITION => "Transition"

    /**
     * @type {String}
     */
    static REGSTR_VAL_STATICDRIVE => "StaticDrive"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LOADHI => "LoadHi"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LOADRMDRIVERS => "LoadRMDrivers"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SETUPN => "SetupN"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SETUPNPATH => "SetupNPath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WRKGRP_FORCEMAPPING => "WrkgrpForceMapping"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WRKGRP_REQUIRED => "WrkgrpRequired"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CURRENT_CONTROL_SET => "System\CurrentControlSet\Control"

    /**
     * @type {String}
     */
    static REGSTR_VAL_CURRENT_USER => "Current User"

    /**
     * @type {String}
     */
    static REGSTR_PATH_PWDPROVIDER => "System\CurrentControlSet\Control\PwdProvider"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PWDPROVIDER_PATH => "ProviderPath"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PWDPROVIDER_DESC => "Description"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PWDPROVIDER_CHANGEPWD => "ChangePassword"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PWDPROVIDER_CHANGEPWDHWND => "ChangePasswordHwnd"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PWDPROVIDER_GETPWDSTATUS => "GetPasswordStatus"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PWDPROVIDER_ISNP => "NetworkProvider"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PWDPROVIDER_CHANGEORDER => "ChangeOrder"

    /**
     * @type {String}
     */
    static REGSTR_PATH_POLICIES => "Software\Microsoft\Windows\CurrentVersion\Policies"

    /**
     * @type {String}
     */
    static REGSTR_PATH_UPDATE => "System\CurrentControlSet\Control\Update"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_ENABLE => "Enable"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_VERBOSE => "Verbose"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_NETPATH => "NetworkPath"

    /**
     * @type {String}
     */
    static REGSTR_VALUE_DEFAULTLOC => "UseDefaultNetLocation"

    /**
     * @type {String}
     */
    static REGSTR_KEY_NETWORK => "Network"

    /**
     * @type {String}
     */
    static REGSTR_KEY_PRINTERS => "Printers"

    /**
     * @type {String}
     */
    static REGSTR_KEY_WINOLDAPP => "WinOldApp"

    /**
     * @type {String}
     */
    static REGSTR_KEY_EXPLORER => "Explorer"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOFILESHARING => "NoFileSharing"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOPRINTSHARING => "NoPrintSharing"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOFILESHARINGCTRL => "NoFileSharingControl"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOPRINTSHARINGCTRL => "NoPrintSharingControl"

    /**
     * @type {String}
     */
    static REGSTR_VAL_HIDESHAREPWDS => "HideSharePwds"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISABLEPWDCACHING => "DisablePwdCaching"

    /**
     * @type {String}
     */
    static REGSTR_VAL_ALPHANUMPWDS => "AlphanumPwds"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NETSETUP_DISABLE => "NoNetSetup"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NETSETUP_NOCONFIGPAGE => "NoNetSetupConfigPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NETSETUP_NOIDPAGE => "NoNetSetupIDPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NETSETUP_NOSECURITYPAGE => "NoNetSetupSecurityPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSTEMCPL_NOVIRTMEMPAGE => "NoVirtMemPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSTEMCPL_NODEVMGRPAGE => "NoDevMgrPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSTEMCPL_NOCONFIGPAGE => "NoConfigPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SYSTEMCPL_NOFILESYSPAGE => "NoFileSysPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISPCPL_NODISPCPL => "NoDispCPL"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISPCPL_NOBACKGROUNDPAGE => "NoDispBackgroundPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISPCPL_NOSCRSAVPAGE => "NoDispScrSavPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISPCPL_NOAPPEARANCEPAGE => "NoDispAppearancePage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISPCPL_NOSETTINGSPAGE => "NoDispSettingsPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECCPL_NOSECCPL => "NoSecCPL"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECCPL_NOPWDPAGE => "NoPwdPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECCPL_NOADMINPAGE => "NoAdminPage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SECCPL_NOPROFILEPAGE => "NoProfilePage"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRINTERS_HIDETABS => "NoPrinterTabs"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRINTERS_NODELETE => "NoDeletePrinter"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRINTERS_NOADD => "NoAddPrinter"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WINOLDAPP_DISABLED => "Disabled"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WINOLDAPP_NOREALMODE => "NoRealMode"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOENTIRENETWORK => "NoEntireNetwork"

    /**
     * @type {String}
     */
    static REGSTR_VAL_NOWORKGROUPCONTENTS => "NoWorkgroupContents"

    /**
     * @type {String}
     */
    static REGSTR_VAL_UNDOCK_WITHOUT_LOGON => "UndockWithoutLogon"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MINPWDLEN => "MinPwdLen"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PWDEXPIRATION => "PwdExpiration"

    /**
     * @type {String}
     */
    static REGSTR_VAL_WIN31PROVIDER => "Win31Provider"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DISABLEREGTOOLS => "DisableRegistryTools"

    /**
     * @type {String}
     */
    static REGSTR_PATH_WINLOGON => "Software\Microsoft\Windows\CurrentVersion\Winlogon"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LEGALNOTICECAPTION => "LegalNoticeCaption"

    /**
     * @type {String}
     */
    static REGSTR_VAL_LEGALNOTICETEXT => "LegalNoticeText"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DRIVE_SPINDOWN => "NoDispSpinDown"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHUTDOWN_FLAGS => "ShutdownFlags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_RESTRICTRUN => "RestrictRun"

    /**
     * @type {String}
     */
    static REGSTR_KEY_POL_USERS => "Users"

    /**
     * @type {String}
     */
    static REGSTR_KEY_POL_COMPUTERS => "Computers"

    /**
     * @type {String}
     */
    static REGSTR_KEY_POL_USERGROUPS => "UserGroups"

    /**
     * @type {String}
     */
    static REGSTR_KEY_POL_DEFAULT => ".default"

    /**
     * @type {String}
     */
    static REGSTR_KEY_POL_USERGROUPDATA => "GroupData\UserGroups\Priority"

    /**
     * @type {String}
     */
    static REGSTR_PATH_TIMEZONE => "System\CurrentControlSet\Control\TimeZoneInformation"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZBIAS => "Bias"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZDLTBIAS => "DaylightBias"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZSTDBIAS => "StandardBias"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZACTBIAS => "ActiveTimeBias"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZDLTFLAG => "DaylightFlag"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZSTDSTART => "StandardStart"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZDLTSTART => "DaylightStart"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZDLTNAME => "DaylightName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZSTDNAME => "StandardName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZNOCHANGESTART => "NoChangeStart"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZNOCHANGEEND => "NoChangeEnd"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TZNOAUTOTIME => "DisableAutoDaylightTimeSet"

    /**
     * @type {String}
     */
    static REGSTR_PATH_FLOATINGPOINTPROCESSOR => "HARDWARE\DESCRIPTION\System\FloatingPointProcessor"

    /**
     * @type {String}
     */
    static REGSTR_PATH_FLOATINGPOINTPROCESSOR0 => "HARDWARE\DESCRIPTION\System\FloatingPointProcessor\0"

    /**
     * @type {String}
     */
    static REGSTR_PATH_COMPUTRNAME => "System\CurrentControlSet\Control\ComputerName\ComputerName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_COMPUTRNAME => "ComputerName"

    /**
     * @type {String}
     */
    static REGSTR_PATH_SHUTDOWN => "System\CurrentControlSet\Control\Shutdown"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FORCEREBOOT => "ForceReboot"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SETUPPROGRAMRAN => "SetupProgramRan"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOES_POLLING => "PollingSupportNeeded"

    /**
     * @type {String}
     */
    static REGSTR_PATH_KNOWNDLLS => "System\CurrentControlSet\Control\SessionManager\KnownDLLs"

    /**
     * @type {String}
     */
    static REGSTR_PATH_KNOWN16DLLS => "System\CurrentControlSet\Control\SessionManager\Known16DLLs"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CHECKVERDLLS => "System\CurrentControlSet\Control\SessionManager\CheckVerDLLs"

    /**
     * @type {String}
     */
    static REGSTR_PATH_WARNVERDLLS => "System\CurrentControlSet\Control\SessionManager\WarnVerDLLs"

    /**
     * @type {String}
     */
    static REGSTR_PATH_HACKINIFILE => "System\CurrentControlSet\Control\SessionManager\HackIniFiles"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CHECKBADAPPS => "System\CurrentControlSet\Control\SessionManager\CheckBadApps"

    /**
     * @type {String}
     */
    static REGSTR_PATH_APPPATCH => "System\CurrentControlSet\Control\SessionManager\AppPatches"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CHECKBADAPPS400 => "System\CurrentControlSet\Control\SessionManager\CheckBadApps400"

    /**
     * @type {String}
     */
    static REGSTR_PATH_KNOWNVXDS => "System\CurrentControlSet\Control\SessionManager\KnownVxDs"

    /**
     * @type {String}
     */
    static REGSTR_VAL_UNINSTALLER_DISPLAYNAME => "DisplayName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_UNINSTALLER_COMMANDLINE => "UninstallString"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REINSTALL_DISPLAYNAME => "DisplayName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REINSTALL_STRING => "ReinstallString"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REINSTALL_DEVICEINSTANCEIDS => "DeviceInstanceIds"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DESKTOP => "Control Panel\Desktop"

    /**
     * @type {String}
     */
    static REGSTR_PATH_MOUSE => "Control Panel\Mouse"

    /**
     * @type {String}
     */
    static REGSTR_PATH_KEYBOARD => "Control Panel\Keyboard"

    /**
     * @type {String}
     */
    static REGSTR_PATH_COLORS => "Control Panel\Colors"

    /**
     * @type {String}
     */
    static REGSTR_PATH_SOUND => "Control Panel\Sound"

    /**
     * @type {String}
     */
    static REGSTR_PATH_METRICS => "Control Panel\Desktop\WindowMetrics"

    /**
     * @type {String}
     */
    static REGSTR_PATH_ICONS => "Control Panel\Icons"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CURSORS => "Control Panel\Cursors"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CHECKDISK => "Software\Microsoft\Windows\CurrentVersion\Applets\Check Drive"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CHECKDISKSET => "Settings"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CHECKDISKUDRVS => "NoUnknownDDErrDrvs"

    /**
     * @type {String}
     */
    static REGSTR_PATH_FAULT => "Software\Microsoft\Windows\CurrentVersion\Fault"

    /**
     * @type {String}
     */
    static REGSTR_VAL_FAULT_LOGFILE => "LogFile"

    /**
     * @type {String}
     */
    static REGSTR_PATH_AEDEBUG => "Software\Microsoft\Windows NT\CurrentVersion\AeDebug"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AEDEBUG_DEBUGGER => "Debugger"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AEDEBUG_AUTO => "Auto"

    /**
     * @type {String}
     */
    static REGSTR_PATH_GRPCONV => "Software\Microsoft\Windows\CurrentVersion\GrpConv"

    /**
     * @type {String}
     */
    static REGSTR_VAL_REGITEMDELETEMESSAGE => "Removal Message"

    /**
     * @type {String}
     */
    static REGSTR_PATH_LASTCHECK => "Software\Microsoft\Windows\CurrentVersion\Explorer\LastCheck"

    /**
     * @type {String}
     */
    static REGSTR_PATH_LASTOPTIMIZE => "Software\Microsoft\Windows\CurrentVersion\Explorer\LastOptimize"

    /**
     * @type {String}
     */
    static REGSTR_PATH_LASTBACKUP => "Software\Microsoft\Windows\CurrentVersion\Explorer\LastBackup"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CHKLASTCHECK => "Software\Microsoft\Windows\CurrentVersion\Applets\Check Drive\LastCheck"

    /**
     * @type {String}
     */
    static REGSTR_PATH_CHKLASTSURFAN => "Software\Microsoft\Windows\CurrentVersion\Applets\Check Drive\LastSurfaceAnalysis"

    /**
     * @type {Integer (UInt32)}
     */
    static DTRESULTOK => 0

    /**
     * @type {Integer (UInt32)}
     */
    static DTRESULTFIX => 1

    /**
     * @type {Integer (UInt32)}
     */
    static DTRESULTPROB => 2

    /**
     * @type {Integer (UInt32)}
     */
    static DTRESULTPART => 3

    /**
     * @type {String}
     */
    static REGSTR_KEY_SHARES => "Software\Microsoft\Windows\CurrentVersion\Network\LanMan"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHARES_FLAGS => "Flags"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHARES_TYPE => "Type"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHARES_PATH => "Path"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHARES_REMARK => "Remark"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHARES_RW_PASS => "Parm1"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SHARES_RO_PASS => "Parm2"

    /**
     * @type {String}
     */
    static REGSTR_PATH_PRINT => "System\CurrentControlSet\Control\Print"

    /**
     * @type {String}
     */
    static REGSTR_PATH_PRINTERS => "System\CurrentControlSet\Control\Print\Printers"

    /**
     * @type {String}
     */
    static REGSTR_PATH_PROVIDERS => "System\CurrentControlSet\Control\Print\Providers"

    /**
     * @type {String}
     */
    static REGSTR_PATH_MONITORS => "System\CurrentControlSet\Control\Print\Monitors"

    /**
     * @type {String}
     */
    static REGSTR_PATH_ENVIRONMENTS => "System\CurrentControlSet\Control\Print\Environments"

    /**
     * @type {String}
     */
    static REGSTR_VAL_START_ON_BOOT => "StartOnBoot"

    /**
     * @type {String}
     */
    static REGSTR_VAL_PRINTERS_MASK => "PrintersMask"

    /**
     * @type {String}
     */
    static REGSTR_VAL_DOS_SPOOL_MASK => "DOSSpoolMask"

    /**
     * @type {String}
     */
    static REGSTR_KEY_CURRENT_ENV => "\Windows 4.0"

    /**
     * @type {String}
     */
    static REGSTR_KEY_DRIVERS => "\Drivers"

    /**
     * @type {String}
     */
    static REGSTR_KEY_PRINT_PROC => "\Print Processors"

    /**
     * @type {String}
     */
    static REGSTR_PATH_EVENTLABELS => "AppEvents\EventLabels"

    /**
     * @type {String}
     */
    static REGSTR_PATH_SCHEMES => "AppEvents\Schemes"

    /**
     * @type {String}
     */
    static REGSTR_PATH_MULTIMEDIA_AUDIO => "Software\Microsoft\Multimedia\Audio"

    /**
     * @type {String}
     */
    static REGSTR_KEY_JOYCURR => "CurrentJoystickSettings"

    /**
     * @type {String}
     */
    static REGSTR_KEY_JOYSETTINGS => "JoystickSettings"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYUSERVALUES => "JoystickUserValues"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYCALLOUT => "JoystickCallout"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYNCONFIG => "Joystick%dConfiguration"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYNOEMNAME => "Joystick%dOEMName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYNOEMCALLOUT => "Joystick%dOEMCallout"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCALLOUT => "OEMCallout"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMNAME => "OEMName"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMDATA => "OEMData"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMXYLABEL => "OEMXYLabel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMZLABEL => "OEMZLabel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMRLABEL => "OEMRLabel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMPOVLABEL => "OEMPOVLabel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMULABEL => "OEMULabel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMVLABEL => "OEMVLabel"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMTESTMOVEDESC => "OEMTestMoveDesc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMTESTBUTTONDESC => "OEMTestButtonDesc"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMTESTMOVECAP => "OEMTestMoveCap"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMTESTBUTTONCAP => "OEMTestButtonCap"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMTESTWINCAP => "OEMTestWinCap"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCALCAP => "OEMCalCap"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCALWINCAP => "OEMCalWinCap"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL1 => "OEMCal1"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL2 => "OEMCal2"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL3 => "OEMCal3"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL4 => "OEMCal4"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL5 => "OEMCal5"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL6 => "OEMCal6"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL7 => "OEMCal7"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL8 => "OEMCal8"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL9 => "OEMCal9"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL10 => "OEMCal10"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL11 => "OEMCal11"

    /**
     * @type {String}
     */
    static REGSTR_VAL_JOYOEMCAL12 => "OEMCal12"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUDIO_BITMAP => "bitmap"

    /**
     * @type {String}
     */
    static REGSTR_VAL_AUDIO_ICON => "icon"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DEVICEINSTALLER => "Software\Microsoft\Windows\CurrentVersion\Device Installer"

    /**
     * @type {String}
     */
    static REGSTR_PATH_DIFX => "Software\Microsoft\Windows\CurrentVersion\DIFX"

    /**
     * @type {String}
     */
    static REGSTR_VAL_SEARCHOPTIONS => "SearchOptions"

    /**
     * @type {String}
     */
    static REGSTR_PATH_BIOSINFO => "System\CurrentControlSet\Control\BiosInfo"

    /**
     * @type {String}
     */
    static REGSTR_PATH_PCIIR => "System\CurrentControlSet\Control\Pnp\PciIrqRouting"

    /**
     * @type {String}
     */
    static REGSTR_VAL_OPTIONS => "Options"

    /**
     * @type {String}
     */
    static REGSTR_VAL_STAT => "Status"

    /**
     * @type {String}
     */
    static REGSTR_VAL_TABLE_STAT => "TableStatus"

    /**
     * @type {String}
     */
    static REGSTR_VAL_MINIPORT_STAT => "MiniportStatus"

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_OPTION_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_OPTION_REGISTRY => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_OPTION_MSSPEC => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_OPTION_REALMODE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_OPTION_DEFAULT => 15

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_ERROR => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_ENABLED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_DISABLED => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MAX => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_TABLE_REGISTRY => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_TABLE_MSSPEC => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_TABLE_REALMODE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_TABLE_NONE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_TABLE_ERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_TABLE_BAD => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_TABLE_SUCCESS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_TABLE_MAX => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MINIPORT_NORMAL => 0

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MINIPORT_COMPATIBLE => 1

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MINIPORT_OVERRIDE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MINIPORT_NONE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MINIPORT_ERROR => 4

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MINIPORT_NOKEY => 5

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MINIPORT_SUCCESS => 6

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MINIPORT_INVALID => 7

    /**
     * @type {Integer (UInt32)}
     */
    static PIR_STATUS_MINIPORT_MAX => 8

    /**
     * @type {String}
     */
    static REGSTR_PATH_LASTGOOD => "System\LastKnownGoodRecovery\LastGood"

    /**
     * @type {String}
     */
    static REGSTR_PATH_LASTGOODTMP => "System\LastKnownGoodRecovery\LastGood.Tmp"

    /**
     * @type {Integer (UInt32)}
     */
    static LASTGOOD_OPERATION => 255

    /**
     * @type {Integer (UInt32)}
     */
    static LASTGOOD_OPERATION_NOPOSTPROC => 0

    /**
     * @type {Integer (UInt32)}
     */
    static LASTGOOD_OPERATION_DELETE => 1
;@endregion Constants

;@region Methods
    /**
     * Closes a handle to the specified registry key.
     * @param {Pointer<Void>} hKey A handle to the open key to be closed. The handle must have been opened by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a>, or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regclosekey
     * @since windows5.0
     */
    static RegCloseKey(hKey) {
        result := DllCall("ADVAPI32.dll\RegCloseKey", "ptr", hKey, "uint")
        return result
    }

    /**
     * Maps a predefined registry key to the specified registry key.
     * @param {Pointer<Void>} hKey A handle to one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * 
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_PERFORMANCE_DATA</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Void>} hNewHKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It cannot be one of the predefined keys. The function maps <i>hKey</i> to refer to the <i>hNewHKey</i> key. This affects only the calling process. 
     * 
     * 
     * 
     * 
     * If <i>hNewHKey</i> is <b>NULL</b>, the function restores the default mapping of the predefined key.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regoverridepredefkey
     * @since windows5.0
     */
    static RegOverridePredefKey(hKey, hNewHKey) {
        result := DllCall("ADVAPI32.dll\RegOverridePredefKey", "ptr", hKey, "ptr", hNewHKey, "uint")
        return result
    }

    /**
     * Retrieves a handle to the HKEY_CLASSES_ROOT key for a specified user. The user is identified by an access token.
     * @param {Pointer<Void>} hToken A handle to a primary or impersonation access token that identifies the user of interest. This can be a token handle returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-createrestrictedtoken">CreateRestrictedToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetoken">DuplicateToken</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-duplicatetokenex">DuplicateTokenEx</a>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openprocesstoken">OpenProcessToken</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthreadtoken">OpenThreadToken</a> functions. 
     * 
     * 
     * 
     * 
     * The handle must have TOKEN_QUERY access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/access-rights-for-access-token-objects">Access Rights for Access-Token Objects</a>.
     * @param {Integer} samDesired A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened key. When you no longer need the returned handle, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function to close it.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regopenuserclassesroot
     * @since windows5.0
     */
    static RegOpenUserClassesRoot(hToken, samDesired, phkResult) {
        static dwOptions := 0 ;Reserved parameters must always be NULL

        result := DllCall("ADVAPI32.dll\RegOpenUserClassesRoot", "ptr", hToken, "uint", dwOptions, "uint", samDesired, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Retrieves a handle to the HKEY_CURRENT_USER key for the user the current thread is impersonating.
     * @param {Integer} samDesired A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened key. When you no longer need the returned handle, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function to close it.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regopencurrentuser
     * @since windows5.0
     */
    static RegOpenCurrentUser(samDesired, phkResult) {
        result := DllCall("ADVAPI32.dll\RegOpenCurrentUser", "uint", samDesired, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Disables handle caching of the predefined registry handle for HKEY_CURRENT_USER for the current process.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdisablepredefinedcache
     * @since windows5.0
     */
    static RegDisablePredefinedCache() {
        result := DllCall("ADVAPI32.dll\RegDisablePredefinedCache", "uint")
        return result
    }

    /**
     * Disables handle caching for all predefined registry handles for the current process.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdisablepredefinedcacheex
     * @since windows6.0.6000
     */
    static RegDisablePredefinedCacheEx() {
        result := DllCall("ADVAPI32.dll\RegDisablePredefinedCacheEx", "uint")
        return result
    }

    /**
     * Establishes a connection to a predefined registry key on another computer.
     * @param {Pointer<Byte>} lpMachineName The name of the remote computer. The string has the following form: 
     * 
     * 
     * 
     * 
     * &#92;&#92;<i>computername</i>
     * 
     * The caller must have access to the remote computer or the function fails.
     * 
     * If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {Pointer<Void>} hKey A predefined registry handle. This parameter can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a> on the remote computer. 
     * 
     * 
     * 
     * 
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_PERFORMANCE_DATA</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a key handle identifying the predefined handle on the remote computer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regconnectregistrya
     * @since windows5.0
     */
    static RegConnectRegistryA(lpMachineName, hKey, phkResult) {
        lpMachineName := lpMachineName is String? StrPtr(lpMachineName) : lpMachineName

        result := DllCall("ADVAPI32.dll\RegConnectRegistryA", "ptr", lpMachineName, "ptr", hKey, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Establishes a connection to a predefined registry key on another computer.
     * @param {Pointer<Char>} lpMachineName The name of the remote computer. The string has the following form: 
     * 
     * 
     * 
     * 
     * &#92;&#92;<i>computername</i>
     * 
     * The caller must have access to the remote computer or the function fails.
     * 
     * If this parameter is <b>NULL</b>, the local computer name is used.
     * @param {Pointer<Void>} hKey A predefined registry handle. This parameter can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a> on the remote computer. 
     * 
     * 
     * 
     * 
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_PERFORMANCE_DATA</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a key handle identifying the predefined handle on the remote computer.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regconnectregistryw
     * @since windows5.0
     */
    static RegConnectRegistryW(lpMachineName, hKey, phkResult) {
        lpMachineName := lpMachineName is String? StrPtr(lpMachineName) : lpMachineName

        result := DllCall("ADVAPI32.dll\RegConnectRegistryW", "ptr", lpMachineName, "ptr", hKey, "ptr", phkResult, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Byte>} lpMachineName 
     * @param {Pointer<Void>} hKey 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} phkResult 
     * @returns {Integer} 
     */
    static RegConnectRegistryExA(lpMachineName, hKey, Flags, phkResult) {
        lpMachineName := lpMachineName is String? StrPtr(lpMachineName) : lpMachineName

        result := DllCall("ADVAPI32.dll\RegConnectRegistryExA", "ptr", lpMachineName, "ptr", hKey, "uint", Flags, "ptr", phkResult, "int")
        return result
    }

    /**
     * 
     * @param {Pointer<Char>} lpMachineName 
     * @param {Pointer<Void>} hKey 
     * @param {Integer} Flags 
     * @param {Pointer<Void>} phkResult 
     * @returns {Integer} 
     */
    static RegConnectRegistryExW(lpMachineName, hKey, Flags, phkResult) {
        lpMachineName := lpMachineName is String? StrPtr(lpMachineName) : lpMachineName

        result := DllCall("ADVAPI32.dll\RegConnectRegistryExW", "ptr", lpMachineName, "ptr", hKey, "uint", Flags, "ptr", phkResult, "int")
        return result
    }

    /**
     * Creates the specified registry key. If the key already exists in the registry, the function opens it.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that create keys if allowed by its security descriptor.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The name of a key that this function opens or creates. This key must be a subkey of the key identified by the <i>hKey</i> parameter. 
     * 
     * 
     * For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
     * 
     * If <i>hKey</i> is one of the predefined keys, <i>lpSubKey</i> may be <b>NULL</b>. In that case, <i>phkResult</i> receives the same <i>hKey</i> handle passed in to the function.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regcreatekeya
     * @since windows5.0
     */
    static RegCreateKeyA(hKey, lpSubKey, phkResult) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegCreateKeyA", "ptr", hKey, "ptr", lpSubKey, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Creates the specified registry key. If the key already exists in the registry, the function opens it.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that create keys if allowed by its security descriptor.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The name of a key that this function opens or creates. This key must be a subkey of the key identified by the <i>hKey</i> parameter. 
     * 
     * 
     * For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
     * 
     * If <i>hKey</i> is one of the predefined keys, <i>lpSubKey</i> may be <b>NULL</b>. In that case, <i>phkResult</i> receives the same <i>hKey</i> handle passed in to the function.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regcreatekeyw
     * @since windows5.0
     */
    static RegCreateKeyW(hKey, lpSubKey, phkResult) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegCreateKeyW", "ptr", hKey, "ptr", lpSubKey, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Creates the specified registry key. If the key already exists, the function opens it. Note that key names are not case sensitive.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that modify the registry if allowed by its security descriptor.
     * 
     * This handle is returned by the 
     * <b>RegCreateKeyEx</b> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * <dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The name of a subkey that this function opens or creates. The subkey specified must be a subkey of the key identified by the <i>hKey</i> parameter; it can be up to 32 levels deep in the registry tree. For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
     * 
     * If <i>lpSubKey</i> is a pointer to an empty string, <i>phkResult</i> receives a new handle to the key specified by <i>hKey</i>.
     * 
     * This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Byte>} lpClass The user-defined class type of this key. This parameter may be ignored. This parameter can be <b>NULL</b>.
     * @param {Integer} dwOptions 
     * @param {Integer} samDesired A mask that specifies the access rights for the key to be created. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new key. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the key gets a default security descriptor. The ACLs in a default security descriptor for a key are inherited from its direct parent key.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @param {Pointer<UInt32>} lpdwDisposition A pointer to a variable that receives one of the following disposition values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_CREATED_NEW_KEY"></a><a id="reg_created_new_key"></a><dl>
     * <dt><b>REG_CREATED_NEW_KEY</b></dt>
     * <dt>0x00000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key did not exist and was created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_OPENED_EXISTING_KEY"></a><a id="reg_opened_existing_key"></a><dl>
     * <dt><b>REG_OPENED_EXISTING_KEY</b></dt>
     * <dt>0x00000002L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key existed and was simply opened without being changed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>lpdwDisposition</i> is <b>NULL</b>, no disposition information is returned.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regcreatekeyexa
     * @since windows5.0
     */
    static RegCreateKeyExA(hKey, lpSubKey, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpClass := lpClass is String? StrPtr(lpClass) : lpClass

        result := DllCall("ADVAPI32.dll\RegCreateKeyExA", "ptr", hKey, "ptr", lpSubKey, "uint", Reserved, "ptr", lpClass, "uint", dwOptions, "uint", samDesired, "ptr", lpSecurityAttributes, "ptr", phkResult, "uint*", lpdwDisposition, "uint")
        return result
    }

    /**
     * Creates the specified registry key. If the key already exists, the function opens it. Note that key names are not case sensitive.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that modify the registry if allowed by its security descriptor.
     * 
     * This handle is returned by the 
     * <b>RegCreateKeyEx</b> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * <dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The name of a subkey that this function opens or creates. The subkey specified must be a subkey of the key identified by the <i>hKey</i> parameter; it can be up to 32 levels deep in the registry tree. For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
     * 
     * If <i>lpSubKey</i> is a pointer to an empty string, <i>phkResult</i> receives a new handle to the key specified by <i>hKey</i>.
     * 
     * This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Char>} lpClass The user-defined class type of this key. This parameter may be ignored. This parameter can be <b>NULL</b>.
     * @param {Integer} dwOptions 
     * @param {Integer} samDesired A mask that specifies the access rights for the key to be created. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new key. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the key gets a default security descriptor. The ACLs in a default security descriptor for a key are inherited from its direct parent key.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @param {Pointer<UInt32>} lpdwDisposition A pointer to a variable that receives one of the following disposition values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_CREATED_NEW_KEY"></a><a id="reg_created_new_key"></a><dl>
     * <dt><b>REG_CREATED_NEW_KEY</b></dt>
     * <dt>0x00000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key did not exist and was created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_OPENED_EXISTING_KEY"></a><a id="reg_opened_existing_key"></a><dl>
     * <dt><b>REG_OPENED_EXISTING_KEY</b></dt>
     * <dt>0x00000002L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key existed and was simply opened without being changed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>lpdwDisposition</i> is <b>NULL</b>, no disposition information is returned.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regcreatekeyexw
     * @since windows5.0
     */
    static RegCreateKeyExW(hKey, lpSubKey, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpClass := lpClass is String? StrPtr(lpClass) : lpClass

        result := DllCall("ADVAPI32.dll\RegCreateKeyExW", "ptr", hKey, "ptr", lpSubKey, "uint", Reserved, "ptr", lpClass, "uint", dwOptions, "uint", samDesired, "ptr", lpSecurityAttributes, "ptr", phkResult, "uint*", lpdwDisposition, "uint")
        return result
    }

    /**
     * Creates the specified registry key and associates it with a transaction.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that create keys if allowed by its security descriptor.
     * 
     * This handle is returned by the 
     * <b>RegCreateKeyTransacted</b> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * <dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The name of a subkey that this function opens or creates. The subkey specified must be a subkey of the key identified by the <i>hKey</i> parameter; it can be up to 32 levels deep in the registry tree. For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
     * 
     * If <i>lpSubKey</i> is a pointer to an empty string, <i>phkResult</i> receives a new handle to the key specified by <i>hKey</i>.
     * 
     * This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Byte>} lpClass The user-defined class of this key. This parameter may be ignored. This parameter can be <b>NULL</b>.
     * @param {Integer} dwOptions 
     * @param {Integer} samDesired A mask that specifies the access rights for the key to be created. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new key. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the key gets a default security descriptor. The ACLs in a default security descriptor for a key are inherited from its direct parent key.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @param {Pointer<UInt32>} lpdwDisposition A pointer to a variable that receives one of the following disposition values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_CREATED_NEW_KEY"></a><a id="reg_created_new_key"></a><dl>
     * <dt><b>REG_CREATED_NEW_KEY</b></dt>
     * <dt>0x00000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key did not exist and was created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_OPENED_EXISTING_KEY"></a><a id="reg_opened_existing_key"></a><dl>
     * <dt><b>REG_OPENED_EXISTING_KEY</b></dt>
     * <dt>0x00000002L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key existed and was simply opened without being changed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>lpdwDisposition</i> is <b>NULL</b>, no disposition information is returned.
     * @param {Pointer<Void>} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regcreatekeytransacteda
     * @since windows6.0.6000
     */
    static RegCreateKeyTransactedA(hKey, lpSubKey, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition, hTransaction) {
        static Reserved := 0, pExtendedParemeter := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpClass := lpClass is String? StrPtr(lpClass) : lpClass

        result := DllCall("ADVAPI32.dll\RegCreateKeyTransactedA", "ptr", hKey, "ptr", lpSubKey, "uint", Reserved, "ptr", lpClass, "uint", dwOptions, "uint", samDesired, "ptr", lpSecurityAttributes, "ptr", phkResult, "uint*", lpdwDisposition, "ptr", hTransaction, "ptr", pExtendedParemeter, "uint")
        return result
    }

    /**
     * Creates the specified registry key and associates it with a transaction.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The calling process  must have KEY_CREATE_SUB_KEY access to the key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * Access for key creation is checked against the security descriptor of the registry key, not the access mask specified when the handle was obtained. Therefore, even if <i>hKey</i> was opened with a <i>samDesired</i> of KEY_READ, it   can be used in operations that create keys if allowed by its security descriptor.
     * 
     * This handle is returned by the 
     * <b>RegCreateKeyTransacted</b> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * <dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The name of a subkey that this function opens or creates. The subkey specified must be a subkey of the key identified by the <i>hKey</i> parameter; it can be up to 32 levels deep in the registry tree. For more information on key names, see <a href="https://docs.microsoft.com/windows/desktop/SysInfo/structure-of-the-registry">Structure of the Registry</a>.
     * 
     * If <i>lpSubKey</i> is a pointer to an empty string, <i>phkResult</i> receives a new handle to the key specified by <i>hKey</i>.
     * 
     * This parameter cannot be <b>NULL</b>.
     * @param {Pointer<Char>} lpClass The user-defined class of this key. This parameter may be ignored. This parameter can be <b>NULL</b>.
     * @param {Integer} dwOptions 
     * @param {Integer} samDesired A mask that specifies the access rights for the key to be created. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that determines whether the returned handle can be inherited by child processes. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the handle cannot be inherited. 
     * 
     * 
     * 
     * 
     * The <b>lpSecurityDescriptor</b> member of the structure specifies a security descriptor for the new key. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the key gets a default security descriptor. The ACLs in a default security descriptor for a key are inherited from its direct parent key.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened or created key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @param {Pointer<UInt32>} lpdwDisposition A pointer to a variable that receives one of the following disposition values.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_CREATED_NEW_KEY"></a><a id="reg_created_new_key"></a><dl>
     * <dt><b>REG_CREATED_NEW_KEY</b></dt>
     * <dt>0x00000001L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key did not exist and was created.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_OPENED_EXISTING_KEY"></a><a id="reg_opened_existing_key"></a><dl>
     * <dt><b>REG_OPENED_EXISTING_KEY</b></dt>
     * <dt>0x00000002L</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key existed and was simply opened without being changed.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If <i>lpdwDisposition</i> is <b>NULL</b>, no disposition information is returned.
     * @param {Pointer<Void>} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regcreatekeytransactedw
     * @since windows6.0.6000
     */
    static RegCreateKeyTransactedW(hKey, lpSubKey, lpClass, dwOptions, samDesired, lpSecurityAttributes, phkResult, lpdwDisposition, hTransaction) {
        static Reserved := 0, pExtendedParemeter := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpClass := lpClass is String? StrPtr(lpClass) : lpClass

        result := DllCall("ADVAPI32.dll\RegCreateKeyTransactedW", "ptr", hKey, "ptr", lpSubKey, "uint", Reserved, "ptr", lpClass, "uint", dwOptions, "uint", samDesired, "ptr", lpSecurityAttributes, "ptr", phkResult, "uint*", lpdwDisposition, "ptr", hTransaction, "ptr", pExtendedParemeter, "uint")
        return result
    }

    /**
     * Deletes a subkey and its values.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">Predefined Keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The name of the key to be deleted. It must be a subkey of the key that <i>hKey</i> identifies, but it cannot have subkeys. This parameter cannot be <b>NULL</b>.
     * 
     * The function opens the subkey with the DELETE access right. 
     * 
     * Key names are not case sensitive.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. To get a generic description of the error, you can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletekeya
     * @since windows5.0
     */
    static RegDeleteKeyA(hKey, lpSubKey) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegDeleteKeyA", "ptr", hKey, "ptr", lpSubKey, "uint")
        return result
    }

    /**
     * Deletes a subkey and its values.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">Predefined Keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The name of the key to be deleted. It must be a subkey of the key that <i>hKey</i> identifies, but it cannot have subkeys. This parameter cannot be <b>NULL</b>.
     * 
     * The function opens the subkey with the DELETE access right. 
     * 
     * Key names are not case sensitive.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. To get a generic description of the error, you can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletekeyw
     * @since windows5.0
     */
    static RegDeleteKeyW(hKey, lpSubKey) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegDeleteKeyW", "ptr", hKey, "ptr", lpSubKey, "uint")
        return result
    }

    /**
     * Deletes a subkey and its values from the specified platform-specific view of the registry.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The name of the key to be deleted. This key must be a subkey of the key specified by the value of the <i>hKey</i> parameter. 
     * 
     * The  function opens the subkey with the DELETE access right. 
     * 
     * Key names are not case sensitive.
     * 
     * The value of this parameter cannot be <b>NULL</b>.
     * @param {Integer} samDesired An access mask the specifies the platform-specific view of the registry.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KEY_WOW64_32KEY"></a><a id="key_wow64_32key"></a><dl>
     * <dt><b>KEY_WOW64_32KEY</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the key from the 32-bit registry view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KEY_WOW64_64KEY"></a><a id="key_wow64_64key"></a><dl>
     * <dt><b>KEY_WOW64_64KEY</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the key from the 64-bit registry view.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletekeyexa
     * @since windows6.0.6000
     */
    static RegDeleteKeyExA(hKey, lpSubKey, samDesired) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegDeleteKeyExA", "ptr", hKey, "ptr", lpSubKey, "uint", samDesired, "uint", Reserved, "uint")
        return result
    }

    /**
     * Deletes a subkey and its values from the specified platform-specific view of the registry.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The name of the key to be deleted. This key must be a subkey of the key specified by the value of the <i>hKey</i> parameter. 
     * 
     * The  function opens the subkey with the DELETE access right. 
     * 
     * Key names are not case sensitive.
     * 
     * The value of this parameter cannot be <b>NULL</b>.
     * @param {Integer} samDesired An access mask the specifies the platform-specific view of the registry.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KEY_WOW64_32KEY"></a><a id="key_wow64_32key"></a><dl>
     * <dt><b>KEY_WOW64_32KEY</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the key from the 32-bit registry view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KEY_WOW64_64KEY"></a><a id="key_wow64_64key"></a><dl>
     * <dt><b>KEY_WOW64_64KEY</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the key from the 64-bit registry view.
     * 
     * </td>
     * </tr>
     * </table>
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletekeyexw
     * @since windows6.0.6000
     */
    static RegDeleteKeyExW(hKey, lpSubKey, samDesired) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegDeleteKeyExW", "ptr", hKey, "ptr", lpSubKey, "uint", samDesired, "uint", Reserved, "uint")
        return result
    }

    /**
     * Deletes a subkey and its values from the specified platform-specific view of the registry as a transacted operation.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The name of the key to be deleted. This key must be a subkey of the key specified by the value of the <i>hKey</i> parameter. 
     * 
     * The  function opens the subkey with the DELETE access right. 
     * 
     * Key names are not case sensitive.
     * 
     * The value of this parameter cannot be <b>NULL</b>.
     * @param {Integer} samDesired An access mask the specifies the platform-specific view of the registry.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KEY_WOW64_32KEY"></a><a id="key_wow64_32key"></a><dl>
     * <dt><b>KEY_WOW64_32KEY</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the key from the 32-bit registry view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KEY_WOW64_64KEY"></a><a id="key_wow64_64key"></a><dl>
     * <dt><b>KEY_WOW64_64KEY</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the key from the 64-bit registry view.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletekeytransacteda
     * @since windows6.0.6000
     */
    static RegDeleteKeyTransactedA(hKey, lpSubKey, samDesired, hTransaction) {
        static Reserved := 0, pExtendedParameter := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegDeleteKeyTransactedA", "ptr", hKey, "ptr", lpSubKey, "uint", samDesired, "uint", Reserved, "ptr", hTransaction, "ptr", pExtendedParameter, "uint")
        return result
    }

    /**
     * Deletes a subkey and its values from the specified platform-specific view of the registry as a transacted operation.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The access rights of this key do not affect the delete operation. For more information about access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The name of the key to be deleted. This key must be a subkey of the key specified by the value of the <i>hKey</i> parameter. 
     * 
     * The  function opens the subkey with the DELETE access right. 
     * 
     * Key names are not case sensitive.
     * 
     * The value of this parameter cannot be <b>NULL</b>.
     * @param {Integer} samDesired An access mask the specifies the platform-specific view of the registry.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KEY_WOW64_32KEY"></a><a id="key_wow64_32key"></a><dl>
     * <dt><b>KEY_WOW64_32KEY</b></dt>
     * <dt>0x0200</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the key from the 32-bit registry view.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="KEY_WOW64_64KEY"></a><a id="key_wow64_64key"></a><dl>
     * <dt><b>KEY_WOW64_64KEY</b></dt>
     * <dt>0x0100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Delete the key from the 64-bit registry view.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Void>} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletekeytransactedw
     * @since windows6.0.6000
     */
    static RegDeleteKeyTransactedW(hKey, lpSubKey, samDesired, hTransaction) {
        static Reserved := 0, pExtendedParameter := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegDeleteKeyTransactedW", "ptr", hKey, "ptr", lpSubKey, "uint", samDesired, "uint", Reserved, "ptr", hTransaction, "ptr", pExtendedParameter, "uint")
        return result
    }

    /**
     * Disables registry reflection for the specified key. Disabling reflection for a key does not affect reflection of any subkeys.
     * @param {Pointer<Void>} hBase A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function; it cannot specify a key on a remote computer.
     * 
     * If the key is not on the reflection list, the function succeeds but has no effect. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg64/registry-redirector">Registry Redirector</a>and <a href="https://docs.microsoft.com/windows/desktop/WinProg64/registry-reflection">Registry Reflection</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdisablereflectionkey
     * @since windows6.0.6000
     */
    static RegDisableReflectionKey(hBase) {
        result := DllCall("ADVAPI32.dll\RegDisableReflectionKey", "ptr", hBase, "uint")
        return result
    }

    /**
     * Restores registry reflection for the specified disabled key. Restoring reflection for a key does not affect reflection of any subkeys.
     * @param {Pointer<Void>} hBase A handle to the registry key that was previously disabled using the <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdisablereflectionkey">RegDisableReflectionKey</a> function. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function; it cannot specify a key on a remote computer.
     * 
     * If the key is not on the reflection list, this function succeeds but has no effect. For more information, see <a href="https://docs.microsoft.com/windows/desktop/WinProg64/registry-redirector">Registry Redirector</a>and <a href="https://docs.microsoft.com/windows/desktop/WinProg64/registry-reflection">Registry Reflection</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regenablereflectionkey
     * @since windows6.0.6000
     */
    static RegEnableReflectionKey(hBase) {
        result := DllCall("ADVAPI32.dll\RegEnableReflectionKey", "ptr", hBase, "uint")
        return result
    }

    /**
     * Determines whether reflection has been disabled or enabled for the specified key.
     * @param {Pointer<Void>} hBase A handle to the registry key.
     *       This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function; it cannot specify a key on a remote computer.
     * @param {Pointer<Int32>} bIsReflectionDisabled A value that indicates whether reflection has been disabled through <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regdisablereflectionkey">RegDisableReflectionKey</a> or enabled through <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regenablereflectionkey">RegEnableReflectionKey</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     *        <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the
     *        FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regqueryreflectionkey
     * @since windows6.0.6000
     */
    static RegQueryReflectionKey(hBase, bIsReflectionDisabled) {
        result := DllCall("ADVAPI32.dll\RegQueryReflectionKey", "ptr", hBase, "int*", bIsReflectionDisabled, "uint")
        return result
    }

    /**
     * Removes a named value from the specified registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * 
     * <pre xml:space="preserve"><b></b>
     *    <b>HKEY_CLASSES_ROOT</b>
     *    <b>HKEY_CURRENT_CONFIG</b>
     *    <b>HKEY_CURRENT_USER</b>
     *    <b>HKEY_LOCAL_MACHINE</b>
     *    <b>HKEY_USERS</b></pre>
     * @param {Pointer<Byte>} lpValueName The registry value to be removed. If this parameter is <b>NULL</b> or an empty string, the value set by the 
     * <a href="https://docs.microsoft.com/windows/win32/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function is removed. 
     * 
     * 
     * 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletevaluea
     * @since windows5.0
     */
    static RegDeleteValueA(hKey, lpValueName) {
        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegDeleteValueA", "ptr", hKey, "ptr", lpValueName, "uint")
        return result
    }

    /**
     * Removes a named value from the specified registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * 
     * <pre xml:space="preserve"><b></b>
     *    <b>HKEY_CLASSES_ROOT</b>
     *    <b>HKEY_CURRENT_CONFIG</b>
     *    <b>HKEY_CURRENT_USER</b>
     *    <b>HKEY_LOCAL_MACHINE</b>
     *    <b>HKEY_USERS</b></pre>
     * @param {Pointer<Char>} lpValueName The registry value to be removed. If this parameter is <b>NULL</b> or an empty string, the value set by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvaluea">RegSetValue</a> function is removed. 
     * 
     * 
     * 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletevaluew
     * @since windows5.0
     */
    static RegDeleteValueW(hKey, lpValueName) {
        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegDeleteValueW", "ptr", hKey, "ptr", lpValueName, "uint")
        return result
    }

    /**
     * Enumerates the subkeys of the specified open registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_ENUMERATE_SUB_KEYS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Integer} dwIndex The index of the subkey of <i>hKey</i> to be retrieved. This value should be zero for the first call to the 
     * <b>RegEnumKey</b> function and then incremented for subsequent calls. 
     * 
     * 
     * 
     * 
     * Because subkeys are not ordered, any new subkey will have an arbitrary index. This means that the function may return subkeys in any order.
     * @param {Pointer<Byte>} lpName A pointer to a buffer that receives the name of the subkey, including the terminating null character. This function copies only the name of the subkey, not the full key hierarchy, to the buffer. 
     * 
     * 
     * 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Integer} cchName The size of the buffer pointed to by the <i>lpName</i> parameter, in <b>TCHARs</b>. To determine the required buffer size, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function to determine the size of the largest subkey for the key identified by the <i>hKey</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more subkeys available, the function returns ERROR_NO_MORE_ITEMS.
     * 
     * If the <i>lpName</i> buffer is too small to receive the name of the key, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regenumkeya
     * @since windows5.0
     */
    static RegEnumKeyA(hKey, dwIndex, lpName, cchName) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        result := DllCall("ADVAPI32.dll\RegEnumKeyA", "ptr", hKey, "uint", dwIndex, "ptr", lpName, "uint", cchName, "uint")
        return result
    }

    /**
     * Enumerates the subkeys of the specified open registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_ENUMERATE_SUB_KEYS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Integer} dwIndex The index of the subkey of <i>hKey</i> to be retrieved. This value should be zero for the first call to the 
     * <b>RegEnumKey</b> function and then incremented for subsequent calls. 
     * 
     * 
     * 
     * 
     * Because subkeys are not ordered, any new subkey will have an arbitrary index. This means that the function may return subkeys in any order.
     * @param {Pointer<Char>} lpName A pointer to a buffer that receives the name of the subkey, including the terminating null character. This function copies only the name of the subkey, not the full key hierarchy, to the buffer. 
     * 
     * 
     * 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Integer} cchName The size of the buffer pointed to by the <i>lpName</i> parameter, in <b>TCHARs</b>. To determine the required buffer size, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function to determine the size of the largest subkey for the key identified by the <i>hKey</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more subkeys available, the function returns ERROR_NO_MORE_ITEMS.
     * 
     * If the <i>lpName</i> buffer is too small to receive the name of the key, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regenumkeyw
     * @since windows5.0
     */
    static RegEnumKeyW(hKey, dwIndex, lpName, cchName) {
        lpName := lpName is String? StrPtr(lpName) : lpName

        result := DllCall("ADVAPI32.dll\RegEnumKeyW", "ptr", hKey, "uint", dwIndex, "ptr", lpName, "uint", cchName, "uint")
        return result
    }

    /**
     * Enumerates the subkeys of the specified open registry key. The function retrieves information about one subkey each time it is called.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_ENUMERATE_SUB_KEYS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Integer} dwIndex The index of the subkey to retrieve. This parameter should be zero for the first call to the 
     * <b>RegEnumKeyEx</b> function and then incremented for subsequent calls. 
     * 
     * 
     * 
     * 
     * Because subkeys are not ordered, any new subkey will have an arbitrary index. This means that the function may return subkeys in any order.
     * @param {Pointer<Byte>} lpName A pointer to a buffer that receives the name of the subkey, including the terminating <b>null</b> character. The function copies only the name of the subkey, not the full key hierarchy, to the buffer. 
     * 
     * 
     * If the function fails, no information is copied to this buffer.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<UInt32>} lpcchName A pointer to a variable that specifies the size of the buffer specified by the <i>lpName</i> parameter, in characters. This size should include the terminating <b>null</b> character. If the function succeeds, the variable pointed to by <i>lpcName</i> contains the number of characters stored in the buffer, not including the terminating <b>null</b> character.
     * 
     * To determine the required buffer size, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function to determine the size of the largest subkey for the key identified by the <i>hKey</i> parameter.
     * @param {Pointer<Byte>} lpClass A pointer to a buffer that receives the user-defined class of the enumerated subkey. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcchClass A pointer to a variable that specifies the size of the buffer specified by the <i>lpClass</i> parameter, in characters. The size should include the terminating <b>null</b> character. If the function succeeds, <i>lpcClass</i> contains the number of characters stored in the buffer, not including the terminating <b>null</b> character. This parameter can be <b>NULL</b> only if <i>lpClass</i> is <b>NULL</b>.
     * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the time at which the enumerated subkey was last written. This parameter can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more subkeys available, the function returns ERROR_NO_MORE_ITEMS.
     * 
     * If the <i>lpName</i> buffer is too small to receive the name of the key, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regenumkeyexa
     * @since windows5.0
     */
    static RegEnumKeyExA(hKey, dwIndex, lpName, lpcchName, lpClass, lpcchClass, lpftLastWriteTime) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpName := lpName is String? StrPtr(lpName) : lpName
        lpClass := lpClass is String? StrPtr(lpClass) : lpClass

        result := DllCall("ADVAPI32.dll\RegEnumKeyExA", "ptr", hKey, "uint", dwIndex, "ptr", lpName, "uint*", lpcchName, "uint*", lpReserved, "ptr", lpClass, "uint*", lpcchClass, "ptr", lpftLastWriteTime, "uint")
        return result
    }

    /**
     * Enumerates the subkeys of the specified open registry key. The function retrieves information about one subkey each time it is called.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_ENUMERATE_SUB_KEYS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Integer} dwIndex The index of the subkey to retrieve. This parameter should be zero for the first call to the 
     * <b>RegEnumKeyEx</b> function and then incremented for subsequent calls. 
     * 
     * 
     * 
     * 
     * Because subkeys are not ordered, any new subkey will have an arbitrary index. This means that the function may return subkeys in any order.
     * @param {Pointer<Char>} lpName A pointer to a buffer that receives the name of the subkey, including the terminating <b>null</b> character. The function copies only the name of the subkey, not the full key hierarchy, to the buffer. 
     * 
     * 
     * If the function fails, no information is copied to this buffer.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<UInt32>} lpcchName A pointer to a variable that specifies the size of the buffer specified by the <i>lpName</i> parameter, in characters. This size should include the terminating <b>null</b> character. If the function succeeds, the variable pointed to by <i>lpcName</i> contains the number of characters stored in the buffer, not including the terminating <b>null</b> character.
     * 
     * To determine the required buffer size, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regqueryinfokeya">RegQueryInfoKey</a> function to determine the size of the largest subkey for the key identified by the <i>hKey</i> parameter.
     * @param {Pointer<Char>} lpClass A pointer to a buffer that receives the user-defined class of the enumerated subkey. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcchClass A pointer to a variable that specifies the size of the buffer specified by the <i>lpClass</i> parameter, in characters. The size should include the terminating <b>null</b> character. If the function succeeds, <i>lpcClass</i> contains the number of characters stored in the buffer, not including the terminating <b>null</b> character. This parameter can be <b>NULL</b> only if <i>lpClass</i> is <b>NULL</b>.
     * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the time at which the enumerated subkey was last written. This parameter can be <b>NULL</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more subkeys available, the function returns ERROR_NO_MORE_ITEMS.
     * 
     * If the <i>lpName</i> buffer is too small to receive the name of the key, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regenumkeyexw
     * @since windows5.0
     */
    static RegEnumKeyExW(hKey, dwIndex, lpName, lpcchName, lpClass, lpcchClass, lpftLastWriteTime) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpName := lpName is String? StrPtr(lpName) : lpName
        lpClass := lpClass is String? StrPtr(lpClass) : lpClass

        result := DllCall("ADVAPI32.dll\RegEnumKeyExW", "ptr", hKey, "uint", dwIndex, "ptr", lpName, "uint*", lpcchName, "uint*", lpReserved, "ptr", lpClass, "uint*", lpcchClass, "ptr", lpftLastWriteTime, "uint")
        return result
    }

    /**
     * Enumerates the values for the specified open registry key. The function copies one indexed value name and data block for the key each time it is called.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Integer} dwIndex The index of the value to be retrieved. This parameter should be zero for the first call to the 
     * <b>RegEnumValue</b> function and then be incremented for subsequent calls. 
     * 
     * 
     * 
     * 
     * Because values are not ordered, any new value will have an arbitrary index. This means that the function may return values in any order.
     * @param {Pointer<Byte>} lpValueName A pointer to a buffer that receives the name of the value as a <b>null</b>-terminated string. 
     * 
     * 
     * This buffer must be large enough to include the terminating <b>null</b> character. 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<UInt32>} lpcchValueName A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValueName</i> parameter, in characters. When the function returns, the variable receives the number of characters stored in the buffer, not including the terminating <b>null</b> character.
     * 
     * If the buffer specified by <i>lpValueName</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and the buffer size in the variable pointed to by <i>lpValueName</i> is not changed. In this case, the contents of <i>lpcchValueName</i> are undefined.
     * 
     * Registry value names are limited to 32,767 bytes. The ANSI version of this function treats this parameter as a <b>SHORT</b> value. Therefore, if you specify a value greater than 32,767 bytes, there is an overflow and the function may return ERROR_MORE_DATA.
     * @param {Pointer<UInt32>} lpType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. The <i>lpType</i> parameter can be <b>NULL</b> if the type code is not required.
     * @param {Pointer} lpData A pointer to a buffer that receives the data for the value entry. This parameter can be <b>NULL</b> if the data is not required. 
     * 
     * 
     * 
     * 
     * If <i>lpData</i> is <b>NULL</b> and <i>lpcbData</i> is non-<b>NULL</b>, the function stores the size of the data, in bytes, in the variable pointed to by <i>lpcbData</i>. This enables an application to determine the best way to allocate a buffer for the data.
     * @param {Pointer<UInt32>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpData</i> parameter, in bytes. When the function returns, the variable receives the number of bytes stored in the buffer. 
     * 
     * This parameter can be <b>NULL</b> only if <i>lpData</i> is <b>NULL</b>.
     * 
     * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
     * 
     * If the buffer specified by <i>lpData</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbData</i>. In this case, the contents of <i>lpData</i> are undefined.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more values available, the function returns ERROR_NO_MORE_ITEMS.
     * 
     * If the buffer specified by <i>lpValueName</i> or <i>lpData</i> is too small to receive the value, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regenumvaluea
     * @since windows5.0
     */
    static RegEnumValueA(hKey, dwIndex, lpValueName, lpcchValueName, lpType, lpData, lpcbData) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegEnumValueA", "ptr", hKey, "uint", dwIndex, "ptr", lpValueName, "uint*", lpcchValueName, "uint*", lpReserved, "uint*", lpType, "ptr", lpData, "uint*", lpcbData, "uint")
        return result
    }

    /**
     * Enumerates the values for the specified open registry key. The function copies one indexed value name and data block for the key each time it is called.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Integer} dwIndex The index of the value to be retrieved. This parameter should be zero for the first call to the 
     * <b>RegEnumValue</b> function and then be incremented for subsequent calls. 
     * 
     * 
     * 
     * 
     * Because values are not ordered, any new value will have an arbitrary index. This means that the function may return values in any order.
     * @param {Pointer<Char>} lpValueName A pointer to a buffer that receives the name of the value as a <b>null</b>-terminated string. 
     * 
     * 
     * This buffer must be large enough to include the terminating <b>null</b> character. 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<UInt32>} lpcchValueName A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValueName</i> parameter, in characters. When the function returns, the variable receives the number of characters stored in the buffer, not including the terminating <b>null</b> character.
     * 
     * Registry value names are limited to 32,767 bytes. The ANSI version of this function treats this parameter as a <b>SHORT</b> value. Therefore, if you specify a value greater than 32,767 bytes, there is an overflow and the function may return ERROR_MORE_DATA.
     * @param {Pointer<UInt32>} lpType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. The <i>lpType</i> parameter can be <b>NULL</b> if the type code is not required.
     * @param {Pointer} lpData A pointer to a buffer that receives the data for the value entry. This parameter can be <b>NULL</b> if the data is not required. 
     * 
     * 
     * 
     * 
     * If <i>lpData</i> is <b>NULL</b> and <i>lpcbData</i> is non-<b>NULL</b>, the function stores the size of the data, in bytes, in the variable pointed to by <i>lpcbData</i>. This enables an application to determine the best way to allocate a buffer for the data.
     * @param {Pointer<UInt32>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpData</i> parameter, in bytes. When the function returns, the variable receives the number of bytes stored in the buffer. 
     * 
     * This parameter can be <b>NULL</b> only if <i>lpData</i> is <b>NULL</b>.
     * 
     * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
     * 
     * If the buffer specified by <i>lpData</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbData</i>. In this case, the contents of <i>lpData</i> are undefined.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>. If there are no more values available, the function returns ERROR_NO_MORE_ITEMS.
     * 
     * If the <i>lpData</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regenumvaluew
     * @since windows5.0
     */
    static RegEnumValueW(hKey, dwIndex, lpValueName, lpcchValueName, lpType, lpData, lpcbData) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegEnumValueW", "ptr", hKey, "uint", dwIndex, "ptr", lpValueName, "uint*", lpcchValueName, "uint*", lpReserved, "uint*", lpType, "ptr", lpData, "uint*", lpcbData, "uint")
        return result
    }

    /**
     * Writes all the attributes of the specified open registry key into the registry.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regflushkey
     * @since windows5.0
     */
    static RegFlushKey(hKey) {
        result := DllCall("ADVAPI32.dll\RegFlushKey", "ptr", hKey, "uint")
        return result
    }

    /**
     * Retrieves a copy of the security descriptor protecting the specified open registry key.
     * @param {Pointer<Void>} hKey A handle to an open key for which to retrieve the security descriptor.
     * @param {Integer} SecurityInformation A 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> value that indicates the requested security information.
     * @param {Pointer} pSecurityDescriptor A pointer to a buffer that receives a copy of the requested security descriptor.
     * @param {Pointer<UInt32>} lpcbSecurityDescriptor A pointer to a variable that specifies the size, in bytes, of the buffer pointed to by the <i>pSecurityDescriptor</i> parameter. When the function returns, the variable contains the number of bytes written to the buffer.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-reggetkeysecurity
     * @since windows5.1.2600
     */
    static RegGetKeySecurity(hKey, SecurityInformation, pSecurityDescriptor, lpcbSecurityDescriptor) {
        result := DllCall("ADVAPI32.dll\RegGetKeySecurity", "ptr", hKey, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint*", lpcbSecurityDescriptor, "uint")
        return result
    }

    /**
     * Creates a subkey under HKEY_USERS or HKEY_LOCAL_MACHINE and loads the data from the specified registry hive into that subkey.
     * @param {Pointer<Void>} hKey A handle to the key where the subkey will be created. This can be a handle returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a>, or one of the following predefined handles: 
     * 
     * 
     * 
     * 
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * This function always loads information at the top of the registry hierarchy. The <b>HKEY_CLASSES_ROOT</b> and <b>HKEY_CURRENT_USER</b> handle values cannot be specified for this parameter, because they represent subsets of the <b>HKEY_LOCAL_MACHINE</b> and <b>HKEY_USERS</b> handle values, respectively.
     * @param {Pointer<Byte>} lpSubKey The name of the key to be created under <i>hKey</i>. This subkey is where the registration information from the file will be loaded. 
     * 
     * 
     * 
     * 
     * Key names are not case sensitive.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<Byte>} lpFile The name of the  file containing the registry data. This file must be a local file that was created with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function. If this file does not exist, a file is created with the specified name.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regloadkeya
     * @since windows5.0
     */
    static RegLoadKeyA(hKey, lpSubKey, lpFile) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegLoadKeyA", "ptr", hKey, "ptr", lpSubKey, "ptr", lpFile, "uint")
        return result
    }

    /**
     * Creates a subkey under HKEY_USERS or HKEY_LOCAL_MACHINE and loads the data from the specified registry hive into that subkey.
     * @param {Pointer<Void>} hKey A handle to the key where the subkey will be created. This can be a handle returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a>, or one of the following predefined handles: 
     * 
     * 
     * 
     * 
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * This function always loads information at the top of the registry hierarchy. The <b>HKEY_CLASSES_ROOT</b> and <b>HKEY_CURRENT_USER</b> handle values cannot be specified for this parameter, because they represent subsets of the <b>HKEY_LOCAL_MACHINE</b> and <b>HKEY_USERS</b> handle values, respectively.
     * @param {Pointer<Char>} lpSubKey The name of the key to be created under <i>hKey</i>. This subkey is where the registration information from the file will be loaded. 
     * 
     * 
     * 
     * 
     * Key names are not case sensitive.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<Char>} lpFile The name of the  file containing the registry data. This file must be a local file that was created with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function. If this file does not exist, a file is created with the specified name.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regloadkeyw
     * @since windows5.0
     */
    static RegLoadKeyW(hKey, lpSubKey, lpFile) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegLoadKeyW", "ptr", hKey, "ptr", lpSubKey, "ptr", lpFile, "uint")
        return result
    }

    /**
     * Notifies the caller about changes to the attributes or contents of a specified registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * 
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * This parameter must be a local handle. If 
     * <b>RegNotifyChangeKeyValue</b> is called with a remote handle, it returns ERROR_INVALID_HANDLE.
     * 
     * The key must have been opened with the KEY_NOTIFY access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Integer} bWatchSubtree If this parameter is TRUE, the function reports changes in the specified key and its subkeys. If the parameter is <b>FALSE</b>, the function reports changes only in the specified key.
     * @param {Integer} dwNotifyFilter 
     * @param {Pointer<Void>} hEvent A handle to an event. If the <i>fAsynchronous</i> parameter is <b>TRUE</b>, the function returns immediately and changes are reported by signaling this event. If <i>fAsynchronous</i> is <b>FALSE</b>, <i>hEvent</i> is ignored.
     * @param {Integer} fAsynchronous If this parameter is <b>TRUE</b>, the function returns immediately and reports changes by signaling the specified event. If this parameter is <b>FALSE</b>, the function does not return until a change has occurred. 
     * 
     * 
     * 
     * 
     * If <i>hEvent</i> does not specify a valid event, the <i>fAsynchronous</i> parameter cannot be <b>TRUE</b>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regnotifychangekeyvalue
     * @since windows5.0
     */
    static RegNotifyChangeKeyValue(hKey, bWatchSubtree, dwNotifyFilter, hEvent, fAsynchronous) {
        result := DllCall("ADVAPI32.dll\RegNotifyChangeKeyValue", "ptr", hKey, "int", bWatchSubtree, "uint", dwNotifyFilter, "ptr", hEvent, "int", fAsynchronous, "uint")
        return result
    }

    /**
     * Opens the specified registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Byte>} lpSubKey The name of the registry key to be opened. This key must be a subkey of the key identified by the <i>hKey</i> parameter. 
     * 
     * Key names are not case sensitive.
     * 
     * If this parameter is <b>NULL</b> or a pointer to an empty string, the function returns the same handle that was passed in.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regopenkeya
     * @since windows5.0
     */
    static RegOpenKeyA(hKey, lpSubKey, phkResult) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegOpenKeyA", "ptr", hKey, "ptr", lpSubKey, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Opens the specified registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Char>} lpSubKey The name of the registry key to be opened. This key must be a subkey of the key identified by the <i>hKey</i> parameter. 
     * 
     * Key names are not case sensitive.
     * 
     * If this parameter is <b>NULL</b> or a pointer to an empty string, the function returns the same handle that was passed in.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regopenkeyw
     * @since windows5.0
     */
    static RegOpenKeyW(hKey, lpSubKey, phkResult) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegOpenKeyW", "ptr", hKey, "ptr", lpSubKey, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Opens the specified registry key. Note that key names are not case sensitive.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <b>RegOpenKeyEx</b> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * 
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Byte>} lpSubKey The name of the registry subkey to be opened. 
     * 
     * Key names are not case sensitive.
     * 
     * If the <i>lpSubKey</i> parameter is <b>NULL</b> or a pointer to an empty string,
     * and if <i>hKey</i> is a predefined key,
     * then the system refreshes the predefined key,
     * and <i>phkResult</i> receives the same <i>hKey</i> handle passed into the function.
     * Otherwise, <i>phkResult</i> receives a new handle to the opened key.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Integer} ulOptions Specifies the option to apply when opening the key. Set this parameter to zero or the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_OPTION_OPEN_LINK"></a><a id="reg_option_open_link"></a><dl>
     * <dt><b>REG_OPTION_OPEN_LINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a symbolic link. Registry symbolic links should only be used when absolutely necessary.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} samDesired A mask that specifies the desired access rights to the key to be opened. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * 
     * > [!NOTE] 
     * > On legacy versions of Windows, this API is also exposed by kernel32.dll.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regopenkeyexa
     * @since windows5.0
     */
    static RegOpenKeyExA(hKey, lpSubKey, ulOptions, samDesired, phkResult) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegOpenKeyExA", "ptr", hKey, "ptr", lpSubKey, "uint", ulOptions, "uint", samDesired, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Opens the specified registry key. Note that key names are not case sensitive.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <b>RegOpenKeyEx</b> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * 
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Char>} lpSubKey The name of the registry subkey to be opened. 
     * 
     * Key names are not case sensitive.
     * 
     * If the <i>lpSubKey</i> parameter is <b>NULL</b> or a pointer to an empty string,
     * and if <i>hKey</i> is a predefined key,
     * then the system refreshes the predefined key,
     * and <i>phkResult</i> receives the same <i>hKey</i> handle passed into the function.
     * Otherwise, <i>phkResult</i> receives a new handle to the opened key.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Integer} ulOptions Specifies the option to apply when opening the key. Set this parameter to zero or the following:
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_OPTION_OPEN_LINK"></a><a id="reg_option_open_link"></a><dl>
     * <dt><b>REG_OPTION_OPEN_LINK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The key is a symbolic link. Registry symbolic links should only be used when absolutely necessary.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} samDesired A mask that specifies the desired access rights to the key to be opened. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regopenkeyexw
     * @since windows5.0
     */
    static RegOpenKeyExW(hKey, lpSubKey, ulOptions, samDesired, phkResult) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegOpenKeyExW", "ptr", hKey, "ptr", lpSubKey, "uint", ulOptions, "uint", samDesired, "ptr", phkResult, "uint")
        return result
    }

    /**
     * Opens the specified registry key and associates it with a transaction.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     *  <b>RegOpenKeyTransacted</b> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Byte>} lpSubKey The name of the registry subkey to be opened. 
     * 
     * Key names are not case sensitive.
     * 
     * If the <i>lpSubKey</i> parameter is <b>NULL</b> or a pointer to an empty string,
     * and if <i>hKey</i> is a predefined key,
     * then the system refreshes the predefined key,
     * and <i>phkResult</i> receives the same <i>hKey</i> handle passed into the function.
     * Otherwise, <i>phkResult</i> receives a new handle to the opened key.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Integer} ulOptions This parameter is reserved and must be zero.
     * @param {Integer} samDesired A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @param {Pointer<Void>} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regopenkeytransacteda
     * @since windows6.0.6000
     */
    static RegOpenKeyTransactedA(hKey, lpSubKey, ulOptions, samDesired, phkResult, hTransaction) {
        static pExtendedParemeter := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegOpenKeyTransactedA", "ptr", hKey, "ptr", lpSubKey, "uint", ulOptions, "uint", samDesired, "ptr", phkResult, "ptr", hTransaction, "ptr", pExtendedParemeter, "uint")
        return result
    }

    /**
     * Opens the specified registry key and associates it with a transaction.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     *  <b>RegOpenKeyTransacted</b> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Char>} lpSubKey The name of the registry subkey to be opened. 
     * 
     * Key names are not case sensitive.
     * 
     * If the <i>lpSubKey</i> parameter is <b>NULL</b> or a pointer to an empty string,
     * and if <i>hKey</i> is a predefined key,
     * then the system refreshes the predefined key,
     * and <i>phkResult</i> receives the same <i>hKey</i> handle passed into the function.
     * Otherwise, <i>phkResult</i> receives a new handle to the opened key.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Integer} ulOptions This parameter is reserved and must be zero.
     * @param {Integer} samDesired A mask that specifies the desired access rights to the key. The function fails if the security descriptor of the key does not permit the requested access for the calling process. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<Void>} phkResult A pointer to a variable that receives a handle to the opened key. If the key is not one of the predefined registry keys, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regclosekey">RegCloseKey</a> function after you have finished using the handle.
     * @param {Pointer<Void>} hTransaction A handle to an active transaction. This handle is returned by the <a href="https://docs.microsoft.com/windows/desktop/api/ktmw32/nf-ktmw32-createtransaction">CreateTransaction</a> function.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regopenkeytransactedw
     * @since windows6.0.6000
     */
    static RegOpenKeyTransactedW(hKey, lpSubKey, ulOptions, samDesired, phkResult, hTransaction) {
        static pExtendedParemeter := 0 ;Reserved parameters must always be NULL

        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegOpenKeyTransactedW", "ptr", hKey, "ptr", lpSubKey, "uint", ulOptions, "uint", samDesired, "ptr", phkResult, "ptr", hTransaction, "ptr", pExtendedParemeter, "uint")
        return result
    }

    /**
     * Retrieves information about the specified registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<pre xml:space="preserve"><b></b>
     *    <b>HKEY_CLASSES_ROOT</b>
     *    <b>HKEY_CURRENT_CONFIG</b>
     *    <b>HKEY_CURRENT_USER</b>
     *    <b>HKEY_LOCAL_MACHINE</b>
     *    <b>HKEY_PERFORMANCE_DATA</b>
     *    <b>HKEY_USERS</b></pre>
     * @param {Pointer<Byte>} lpClass A pointer to a buffer that receives the user-defined class of the key. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcchClass A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpClass</i> parameter, in characters. 
     * 
     * The size should include the terminating <b>null</b> character. When the function returns, this variable contains the size of the class string that is stored in the buffer. The count returned does not include the terminating <b>null</b> character. If the buffer is not big enough, the function returns ERROR_MORE_DATA, and the variable contains the size of the string, in characters, without counting the terminating <b>null</b> character.
     * 
     * If <i>lpClass</i> is <b>NULL</b>, <i>lpcClass</i> can be <b>NULL</b>.
     * 
     * If the <i>lpClass</i> parameter is a valid address, but the <i>lpcClass</i> parameter is not, for example, it is <b>NULL</b>, then the  function returns ERROR_INVALID_PARAMETER.
     * @param {Pointer<UInt32>} lpcSubKeys A pointer to a variable that receives the number of subkeys that are contained by the specified key. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbMaxSubKeyLen A pointer to a variable that receives the size of the key's subkey with the longest name, in Unicode characters, not including the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbMaxClassLen A pointer to a variable that receives the size of the longest string that specifies a subkey class, in Unicode characters. The count returned does not include the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcValues A pointer to a variable that receives the number of values that are associated with the key. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbMaxValueNameLen A pointer to a variable that receives the size of the key's longest value name, in Unicode characters. The size does not include the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbMaxValueLen A pointer to a variable that receives the size of the longest data component among the key's values, in bytes. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbSecurityDescriptor A pointer to a variable that receives the size of the key's security descriptor, in bytes. This parameter can be <b>NULL</b>.
     * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the last write time. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * The function sets the members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure to indicate the last time that the key or any of its value entries is modified.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>lpClass</i> buffer is too small to receive the name of the class, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regqueryinfokeya
     * @since windows5.0
     */
    static RegQueryInfoKeyA(hKey, lpClass, lpcchClass, lpcSubKeys, lpcbMaxSubKeyLen, lpcbMaxClassLen, lpcValues, lpcbMaxValueNameLen, lpcbMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpClass := lpClass is String? StrPtr(lpClass) : lpClass

        result := DllCall("ADVAPI32.dll\RegQueryInfoKeyA", "ptr", hKey, "ptr", lpClass, "uint*", lpcchClass, "uint*", lpReserved, "uint*", lpcSubKeys, "uint*", lpcbMaxSubKeyLen, "uint*", lpcbMaxClassLen, "uint*", lpcValues, "uint*", lpcbMaxValueNameLen, "uint*", lpcbMaxValueLen, "uint*", lpcbSecurityDescriptor, "ptr", lpftLastWriteTime, "uint")
        return result
    }

    /**
     * Retrieves information about the specified registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<pre xml:space="preserve"><b></b>
     *    <b>HKEY_CLASSES_ROOT</b>
     *    <b>HKEY_CURRENT_CONFIG</b>
     *    <b>HKEY_CURRENT_USER</b>
     *    <b>HKEY_LOCAL_MACHINE</b>
     *    <b>HKEY_PERFORMANCE_DATA</b>
     *    <b>HKEY_USERS</b></pre>
     * @param {Pointer<Char>} lpClass A pointer to a buffer that receives the user-defined class of the key. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcchClass A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpClass</i> parameter, in characters. 
     * 
     * The size should include the terminating <b>null</b> character. When the function returns, this variable contains the size of the class string that is stored in the buffer. The count returned does not include the terminating <b>null</b> character. If the buffer is not big enough, the function returns ERROR_MORE_DATA, and the variable contains the size of the string, in characters, without counting the terminating <b>null</b> character.
     * 
     * If <i>lpClass</i> is <b>NULL</b>, <i>lpcClass</i> can be <b>NULL</b>.
     * 
     * If the <i>lpClass</i> parameter is a valid address, but the <i>lpcClass</i> parameter is not, for example, it is <b>NULL</b>, then the  function returns ERROR_INVALID_PARAMETER.
     * @param {Pointer<UInt32>} lpcSubKeys A pointer to a variable that receives the number of subkeys that are contained by the specified key. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbMaxSubKeyLen A pointer to a variable that receives the size of the key's subkey with the longest name, in Unicode characters, not including the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbMaxClassLen A pointer to a variable that receives the size of the longest string that specifies a subkey class, in Unicode characters. The count returned does not include the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcValues A pointer to a variable that receives the number of values that are associated with the key. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbMaxValueNameLen A pointer to a variable that receives the size of the key's longest value name, in Unicode characters. The size does not include the terminating <b>null</b> character. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbMaxValueLen A pointer to a variable that receives the size of the longest data component among the key's values, in bytes. This parameter can be <b>NULL</b>.
     * @param {Pointer<UInt32>} lpcbSecurityDescriptor A pointer to a variable that receives the size of the key's security descriptor, in bytes. This parameter can be <b>NULL</b>.
     * @param {Pointer<FILETIME>} lpftLastWriteTime A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure that receives the last write time. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * The function sets the members of the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/minwinbase/ns-minwinbase-filetime">FILETIME</a> structure to indicate the last time that the key or any of its value entries is modified.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>lpClass</i> buffer is too small to receive the name of the class, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regqueryinfokeyw
     * @since windows5.0
     */
    static RegQueryInfoKeyW(hKey, lpClass, lpcchClass, lpcSubKeys, lpcbMaxSubKeyLen, lpcbMaxClassLen, lpcValues, lpcbMaxValueNameLen, lpcbMaxValueLen, lpcbSecurityDescriptor, lpftLastWriteTime) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpClass := lpClass is String? StrPtr(lpClass) : lpClass

        result := DllCall("ADVAPI32.dll\RegQueryInfoKeyW", "ptr", hKey, "ptr", lpClass, "uint*", lpcchClass, "uint*", lpReserved, "uint*", lpcSubKeys, "uint*", lpcbMaxSubKeyLen, "uint*", lpcbMaxClassLen, "uint*", lpcValues, "uint*", lpcbMaxValueNameLen, "uint*", lpcbMaxValueLen, "uint*", lpcbSecurityDescriptor, "ptr", lpftLastWriteTime, "uint")
        return result
    }

    /**
     * Retrieves the data associated with the default or unnamed value of a specified registry key. The data must be a null-terminated string.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The name of the subkey of the <i>hKey</i> parameter for which the default value is retrieved. 
     * 
     * Key names are not case sensitive.
     * 
     * If this parameter is <b>NULL</b> or points to an empty string, the function retrieves the default value for the key identified by <i>hKey</i>.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer} lpData A pointer to a buffer that receives the default value of the specified key. 
     * 
     * 
     * 
     * 
     * If <i>lpValue</i> is <b>NULL</b>, and <i>lpcbValue</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS, and stores the size of the data, in bytes, in the variable pointed to by <i>lpcbValue</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
     * @param {Pointer<Int32>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValue</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>lpValue</i>, including any terminating <b>null</b> characters. 
     * 
     * 
     * 
     * 
     * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
     * 
     * If the buffer specified <i>lpValue</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbValue</i>. In this case, the contents of the <i>lpValue</i> buffer are undefined.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>lpValue</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regqueryvaluea
     * @since windows5.0
     */
    static RegQueryValueA(hKey, lpSubKey, lpData, lpcbData) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegQueryValueA", "ptr", hKey, "ptr", lpSubKey, "ptr", lpData, "int*", lpcbData, "uint")
        return result
    }

    /**
     * Retrieves the data associated with the default or unnamed value of a specified registry key. The data must be a null-terminated string.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The name of the subkey of the <i>hKey</i> parameter for which the default value is retrieved. 
     * 
     * Key names are not case sensitive.
     * 
     * If this parameter is <b>NULL</b> or points to an empty string, the function retrieves the default value for the key identified by <i>hKey</i>.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer} lpData A pointer to a buffer that receives the default value of the specified key. 
     * 
     * 
     * 
     * 
     * If <i>lpValue</i> is <b>NULL</b>, and <i>lpcbValue</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS, and stores the size of the data, in bytes, in the variable pointed to by <i>lpcbValue</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
     * @param {Pointer<Int32>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValue</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>lpValue</i>, including any terminating <b>null</b> characters. 
     * 
     * 
     * 
     * 
     * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
     * 
     * If the buffer specified <i>lpValue</i> is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbValue</i>. In this case, the contents of the <i>lpValue</i> buffer are undefined.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>lpValue</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regqueryvaluew
     * @since windows5.0
     */
    static RegQueryValueW(hKey, lpSubKey, lpData, lpcbData) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegQueryValueW", "ptr", hKey, "ptr", lpSubKey, "ptr", lpData, "int*", lpcbData, "uint")
        return result
    }

    /**
     * Retrieves the type and data for a list of value names associated with an open registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * 
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<VALENTA>} val_list A pointer to an array of 
     * 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/ns-winreg-valenta">VALENT</a> structures that describe one or more value entries. On input, the <b>ve_valuename</b> member of each structure must contain a pointer to the name of a value to retrieve. The function fails if any of the specified values do not exist in the specified key. 
     * 
     * 
     * 
     * 
     * If the function succeeds, each element of the array contains the information for the specified value.
     * @param {Integer} num_vals The number of elements in the <i>val_list</i> array.
     * @param {Pointer} lpValueBuf A pointer to a buffer. If the function succeeds, the buffer receives the data for each value. 
     * 
     * 
     * 
     * 
     * If <i>lpValueBuf</i> is <b>NULL</b>, the value pointed to by the <i>ldwTotsize</i> parameter must be zero, in which case the function returns ERROR_MORE_DATA and <i>ldwTotsize</i> receives the required size of the buffer, in bytes.
     * @param {Pointer<UInt32>} ldwTotsize A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValueBuf</i> parameter, in bytes. If the function succeeds, <i>ldwTotsize</i> receives the number of bytes copied to the buffer. If the function fails because the buffer is too small, <i>ldwTotsize</i> receives the required size, in bytes.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANTREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/winreg/nf-winreg-regquerymultiplevaluesa">RegQueryMultipleValues</a> cannot instantiate or access the provider of the dynamic key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpValueBuf</i> was too small. In this case, <i>ldwTotsize</i> receives the required buffer size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TRANSFER_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The total size of the requested data (size of the <i>val_list</i> array + <i>ldwTotSize</i>) is more than the system limit of one megabyte.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regquerymultiplevaluesa
     * @since windows5.0
     */
    static RegQueryMultipleValuesA(hKey, val_list, num_vals, lpValueBuf, ldwTotsize) {
        result := DllCall("ADVAPI32.dll\RegQueryMultipleValuesA", "ptr", hKey, "ptr", val_list, "uint", num_vals, "ptr", lpValueBuf, "uint*", ldwTotsize, "uint")
        return result
    }

    /**
     * Retrieves the type and data for a list of value names associated with an open registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<VALENTW>} val_list A pointer to an array of 
     * [VALENT](./ns-winreg-valentw.md) structures that describe one or more value entries. On input, the <b>ve_valuename</b> member of each structure must contain a pointer to the name of a value to retrieve. The function fails if any of the specified values do not exist in the specified key. 
     * 
     * 
     * 
     * 
     * If the function succeeds, each element of the array contains the information for the specified value.
     * @param {Integer} num_vals The number of elements in the <i>val_list</i> array.
     * @param {Pointer} lpValueBuf A pointer to a buffer. If the function succeeds, the buffer receives the data for each value. 
     * 
     * 
     * 
     * 
     * If <i>lpValueBuf</i> is <b>NULL</b>, the value pointed to by the <i>ldwTotsize</i> parameter must be zero, in which case the function returns ERROR_MORE_DATA and <i>ldwTotsize</i> receives the required size of the buffer, in bytes.
     * @param {Pointer<UInt32>} ldwTotsize A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpValueBuf</i> parameter, in bytes. If the function succeeds, <i>ldwTotsize</i> receives the number of bytes copied to the buffer. If the function fails because the buffer is too small, <i>ldwTotsize</i> receives the required size, in bytes.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is one of the following error codes.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CANTREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * 
     * <a href="/windows/desktop/api/winreg/nf-winreg-regquerymultiplevaluesa">RegQueryMultipleValues</a> cannot instantiate or access the provider of the dynamic key.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_MORE_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer pointed to by <i>lpValueBuf</i> was too small. In this case, <i>ldwTotsize</i> receives the required buffer size.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_TRANSFER_TOO_LONG</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The total size of the requested data (size of the <i>val_list</i> array + <i>ldwTotSize</i>) is more than the system limit of one megabyte.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regquerymultiplevaluesw
     * @since windows5.0
     */
    static RegQueryMultipleValuesW(hKey, val_list, num_vals, lpValueBuf, ldwTotsize) {
        result := DllCall("ADVAPI32.dll\RegQueryMultipleValuesW", "ptr", hKey, "ptr", val_list, "uint", num_vals, "ptr", lpValueBuf, "uint*", ldwTotsize, "uint")
        return result
    }

    /**
     * Retrieves the type and data for the specified value name associated with an open registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_PERFORMANCE_NLSTEXT</b></dd>
     * <dd><b>HKEY_PERFORMANCE_TEXT</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpValueName The name of the registry value. 
     * 
     * 
     * 
     * 
     * If <i>lpValueName</i> is <b>NULL</b> or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any. 
     * 
     * If <i>lpValueName</i> specifies a value that is not in the registry, the function returns ERROR_FILE_NOT_FOUND.
     * 
     * Keys do not automatically have an unnamed or default value. Unnamed values can be of any type. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<UInt32>} lpType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. The <i>lpType</i> parameter can be <b>NULL</b> if the type code is not required.
     * @param {Pointer} lpData A pointer to a buffer that receives the value's data. This parameter can be <b>NULL</b> if the data is not required.
     * @param {Pointer<UInt32>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpData</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>lpData</i>. 
     * 
     * 
     * 
     * 
     * The <i>lpcbData</i> parameter can be <b>NULL</b> only if <i>lpData</i> is <b>NULL</b>.
     * 
     * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters unless the data was stored without them. For more information, see Remarks.
     * 
     * If the buffer specified by <i>lpData</i> parameter is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbData</i>. In this case, the contents of the <i>lpData</i> buffer are undefined.
     * 
     * If <i>lpData</i> is <b>NULL</b>, and <i>lpcbData</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS and stores the size of the data, in bytes, in the variable pointed to by <i>lpcbData</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
     * 
     * If <i>hKey</i> specifies <b>HKEY_PERFORMANCE_DATA</b> and the <i>lpData</i> buffer is not large enough to contain all of the returned data, 
     * <b>RegQueryValueEx</b> returns ERROR_MORE_DATA and the value returned through the <i>lpcbData</i> parameter is undefined. This is because the size of the performance data can change from one call to the next. In this case, you must increase the buffer size and call 
     * <b>RegQueryValueEx</b> again passing the updated buffer size in the <i>lpcbData</i> parameter. Repeat this until the function succeeds. You need to maintain a separate variable to keep track of the buffer size, because the value returned by <i>lpcbData</i> is unpredictable.
     * 
     * If the <i>lpValueName</i> registry value does not exist, <b>RegQueryValueEx</b> returns ERROR_FILE_NOT_FOUND and the value returned through the <i>lpcbData</i> parameter is undefined.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>lpData</i> buffer is too small to receive the data, the function returns ERROR_MORE_DATA.
     * 
     * If the <i>lpValueName</i> registry value does not exist, the function returns ERROR_FILE_NOT_FOUND.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regqueryvalueexa
     * @since windows5.0
     */
    static RegQueryValueExA(hKey, lpValueName, lpType, lpData, lpcbData) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegQueryValueExA", "ptr", hKey, "ptr", lpValueName, "uint*", lpReserved, "uint*", lpType, "ptr", lpData, "uint*", lpcbData, "uint")
        return result
    }

    /**
     * Retrieves the type and data for the specified value name associated with an open registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_PERFORMANCE_NLSTEXT</b></dd>
     * <dd><b>HKEY_PERFORMANCE_TEXT</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpValueName The name of the registry value. 
     * 
     * 
     * 
     * 
     * If <i>lpValueName</i> is <b>NULL</b> or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any. 
     * 
     * If <i>lpValueName</i> specifies a value that is not in the registry, the function returns ERROR_FILE_NOT_FOUND.
     * 
     * Keys do not automatically have an unnamed or default value. Unnamed values can be of any type. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<UInt32>} lpType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. The <i>lpType</i> parameter can be <b>NULL</b> if the type code is not required.
     * @param {Pointer} lpData A pointer to a buffer that receives the value's data. This parameter can be <b>NULL</b> if the data is not required.
     * @param {Pointer<UInt32>} lpcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>lpData</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>lpData</i>. 
     * 
     * 
     * 
     * 
     * The <i>lpcbData</i> parameter can be <b>NULL</b> only if <i>lpData</i> is <b>NULL</b>.
     * 
     * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters unless the data was stored without them. For more information, see Remarks.
     * 
     * If the buffer specified by <i>lpData</i> parameter is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>lpcbData</i>. In this case, the contents of the <i>lpData</i> buffer are undefined.
     * 
     * If <i>lpData</i> is <b>NULL</b>, and <i>lpcbData</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS and stores the size of the data, in bytes, in the variable pointed to by <i>lpcbData</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
     * 
     * If <i>hKey</i> specifies <b>HKEY_PERFORMANCE_DATA</b> and the <i>lpData</i> buffer is not large enough to contain all of the returned data, 
     * <b>RegQueryValueEx</b> returns ERROR_MORE_DATA and the value returned through the <i>lpcbData</i> parameter is undefined. This is because the size of the performance data can change from one call to the next. In this case, you must increase the buffer size and call 
     * <b>RegQueryValueEx</b> again passing the updated buffer size in the <i>lpcbData</i> parameter. Repeat this until the function succeeds. You need to maintain a separate variable to keep track of the buffer size, because the value returned by <i>lpcbData</i> is unpredictable.
     * 
     * If the <i>lpValueName</i> registry value does not exist, <b>RegQueryValueEx</b> returns ERROR_FILE_NOT_FOUND and the value returned through the <i>lpcbData</i> parameter is undefined.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>lpData</i> buffer is too small to receive the data, the function returns ERROR_MORE_DATA.
     * 
     * If the <i>lpValueName</i> registry value does not exist, the function returns ERROR_FILE_NOT_FOUND.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regqueryvalueexw
     * @since windows5.0
     */
    static RegQueryValueExW(hKey, lpValueName, lpType, lpData, lpcbData) {
        static lpReserved := 0 ;Reserved parameters must always be NULL

        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegQueryValueExW", "ptr", hKey, "ptr", lpValueName, "uint*", lpReserved, "uint*", lpType, "ptr", lpData, "uint*", lpcbData, "uint")
        return result
    }

    /**
     * Replaces the file backing a registry key and all its subkeys with another file, so that when the system is next started, the key and subkeys will have the values stored in the new file.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * 
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Byte>} lpSubKey The name of the registry key whose subkeys and values are to be replaced. If the key exists, it must be a subkey of the key identified by the <i>hKey</i> parameter. If the subkey does not exist, it is created. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If the specified subkey is not the root of a hive, 
     * <b>RegReplaceKey</b> traverses up the hive tree structure until it encounters a hive root, then it replaces the contents of that hive with the contents of the data file specified by <i>lpNewFile</i>.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<Byte>} lpNewFile The name of the file with the registry information. This file is typically created by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function.
     * @param {Pointer<Byte>} lpOldFile The name of the file that receives a backup copy of the registry information being replaced.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regreplacekeya
     * @since windows5.0
     */
    static RegReplaceKeyA(hKey, lpSubKey, lpNewFile, lpOldFile) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpNewFile := lpNewFile is String? StrPtr(lpNewFile) : lpNewFile
        lpOldFile := lpOldFile is String? StrPtr(lpOldFile) : lpOldFile

        result := DllCall("ADVAPI32.dll\RegReplaceKeyA", "ptr", hKey, "ptr", lpSubKey, "ptr", lpNewFile, "ptr", lpOldFile, "uint")
        return result
    }

    /**
     * Replaces the file backing a registry key and all its subkeys with another file, so that when the system is next started, the key and subkeys will have the values stored in the new file.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * 
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Char>} lpSubKey The name of the registry key whose subkeys and values are to be replaced. If the key exists, it must be a subkey of the key identified by the <i>hKey</i> parameter. If the subkey does not exist, it is created. This parameter can be <b>NULL</b>. 
     * 
     * 
     * 
     * 
     * If the specified subkey is not the root of a hive, 
     * <b>RegReplaceKey</b> traverses up the hive tree structure until it encounters a hive root, then it replaces the contents of that hive with the contents of the data file specified by <i>lpNewFile</i>.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Pointer<Char>} lpNewFile The name of the file with the registry information. This file is typically created by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function.
     * @param {Pointer<Char>} lpOldFile The name of the file that receives a backup copy of the registry information being replaced.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regreplacekeyw
     * @since windows5.0
     */
    static RegReplaceKeyW(hKey, lpSubKey, lpNewFile, lpOldFile) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpNewFile := lpNewFile is String? StrPtr(lpNewFile) : lpNewFile
        lpOldFile := lpOldFile is String? StrPtr(lpOldFile) : lpOldFile

        result := DllCall("ADVAPI32.dll\RegReplaceKeyW", "ptr", hKey, "ptr", lpSubKey, "ptr", lpNewFile, "ptr", lpOldFile, "uint")
        return result
    }

    /**
     * Reads the registry information in a specified file and copies it over the specified key. This registry information may be in the form of a key and multiple levels of subkeys.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * 
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * Any information contained in this key and its descendent keys is overwritten by the information in the file pointed to by the <i>lpFile</i> parameter.
     * @param {Pointer<Byte>} lpFile The name of the file with the registry information. This file is typically created by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regrestorekeya
     * @since windows5.0
     */
    static RegRestoreKeyA(hKey, lpFile, dwFlags) {
        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegRestoreKeyA", "ptr", hKey, "ptr", lpFile, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Reads the registry information in a specified file and copies it over the specified key. This registry information may be in the form of a key and multiple levels of subkeys.
     * @param {Pointer<Void>} hKey A handle to an open registry key. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * 
     * 
     * <b>HKEY_CLASSES_ROOT</b>
     * <b>HKEY_CURRENT_CONFIG</b>
     * <b>HKEY_CURRENT_USER</b>
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * Any information contained in this key and its descendent keys is overwritten by the information in the file pointed to by the <i>lpFile</i> parameter.
     * @param {Pointer<Char>} lpFile The name of the file with the registry information. This file is typically created by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> function.
     * @param {Integer} dwFlags 
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regrestorekeyw
     * @since windows5.0
     */
    static RegRestoreKeyW(hKey, lpFile, dwFlags) {
        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegRestoreKeyW", "ptr", hKey, "ptr", lpFile, "uint", dwFlags, "uint")
        return result
    }

    /**
     * Changes the name of the specified registry key.
     * @param {Pointer<Void>} hKey A handle to the key to be renamed. The handle must be opened with the KEY_WRITE access right. For more information, see [Registry Key Security and Access Rights](/windows/win32/SysInfo/registry-key-security-and-access-rights).
     * 
     * This handle is returned by the [RegCreateKeyEx](nf-winreg-regcreatekeyexa.md) or [RegOpenKeyEx](nf-winreg-regopenkeyexa.md) function, or it can be one of the following [Predefined Keys](/windows/win32/SysInfo/predefined-keys):
     * 
     * * HKEY_CLASSES_ROOT
     * * HKEY_CURRENT_CONFIG
     * * HKEY_CURRENT_USER
     * * HKEY_LOCAL_MACHINE
     * * HKEY_USERS
     * @param {Pointer<Char>} lpSubKeyName The name of the subkey to be renamed. This key must be a subkey of the key identified by the *hKeySrc* parameter. This parameter can also be **NULL**, in which case the key identified by the *hKeySrc* parameter will be renamed.
     * @param {Pointer<Char>} lpNewKeyName The new name of the key. The new name must not already exist.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the [FormatMessage](/windows/desktop/api/winbase/nf-winbase-formatmessage) function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error. An error code of STATUS_ACCESS_DENIED indicates that the caller does not have the necessary access rights to the specified registry key or subkeys.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regrenamekey
     */
    static RegRenameKey(hKey, lpSubKeyName, lpNewKeyName) {
        lpSubKeyName := lpSubKeyName is String? StrPtr(lpSubKeyName) : lpSubKeyName
        lpNewKeyName := lpNewKeyName is String? StrPtr(lpNewKeyName) : lpNewKeyName

        result := DllCall("ADVAPI32.dll\RegRenameKey", "ptr", hKey, "ptr", lpSubKeyName, "ptr", lpNewKeyName, "uint")
        return result
    }

    /**
     * Saves the specified key and all of its subkeys and values to a new file, in the standard format.
     * @param {Pointer<Void>} hKey A handle to an open registry key. 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * <dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpFile The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails. 
     * 
     * 
     * 
     * 
     * If the string does not include a path, the file is created in the current directory of the calling process for a local key, or in the %systemroot%\system32 directory for a remote key. The new file has the archive attribute.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new file. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * 
     * If the file already exists, the function fails with the ERROR_ALREADY_EXISTS error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsavekeya
     * @since windows5.0
     */
    static RegSaveKeyA(hKey, lpFile, lpSecurityAttributes) {
        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegSaveKeyA", "ptr", hKey, "ptr", lpFile, "ptr", lpSecurityAttributes, "uint")
        return result
    }

    /**
     * Saves the specified key and all of its subkeys and values to a new file, in the standard format.
     * @param {Pointer<Void>} hKey A handle to an open registry key. 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>: 
     * 
     * 
     * <dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpFile The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails. 
     * 
     * 
     * 
     * 
     * If the string does not include a path, the file is created in the current directory of the calling process for a local key, or in the %systemroot%\system32 directory for a remote key. The new file has the archive attribute.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new file. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * 
     * If the file already exists, the function fails with the ERROR_ALREADY_EXISTS error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsavekeyw
     * @since windows5.0
     */
    static RegSaveKeyW(hKey, lpFile, lpSecurityAttributes) {
        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegSaveKeyW", "ptr", hKey, "ptr", lpFile, "ptr", lpSecurityAttributes, "uint")
        return result
    }

    /**
     * Sets the security of an open registry key.
     * @param {Pointer<Void>} hKey A handle to an open key for which the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> is set.
     * @param {Integer} SecurityInformation A set of 
     * bit flags that indicate the type of security information to set. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags.
     * @param {Pointer<Void>} pSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that specifies the security <a href="https://docs.microsoft.com/windows/desktop/SecGloss/a-gly">attributes</a> to set for the specified key.
     * @returns {Integer} If the function succeeds, the function returns ERROR_SUCCESS.
     * 						
     * 
     * If the function fails, it returns a nonzero error code defined in WinError.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsetkeysecurity
     * @since windows5.1.2600
     */
    static RegSetKeySecurity(hKey, SecurityInformation, pSecurityDescriptor) {
        result := DllCall("ADVAPI32.dll\RegSetKeySecurity", "ptr", hKey, "uint", SecurityInformation, "ptr", pSecurityDescriptor, "uint")
        return result
    }

    /**
     * Sets the data for the default or unnamed value of a specified registry key. The data must be a text string.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The name of a subkey of the <i>hKey</i> parameter. The function sets the default value of the specified subkey. If <i>lpSubKey</i> does not exist, the function creates it.
     * 
     * Key names are not case sensitive.
     * 
     * If this parameter is <b>NULL</b> or points to an empty string, the function sets the default value of the key identified by <i>hKey</i>.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Integer} dwType The type of information to be stored. This parameter must be the REG_SZ type. To store other data types, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function.
     * @param {Pointer} lpData The data to be stored. This parameter cannot be <b>NULL</b>.
     * @param {Integer} cbData This parameter is ignored. The function calculates this value based on the size of the data in the <i>lpData</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsetvaluea
     * @since windows5.0
     */
    static RegSetValueA(hKey, lpSubKey, dwType, lpData, cbData) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegSetValueA", "ptr", hKey, "ptr", lpSubKey, "uint", dwType, "ptr", lpData, "uint", cbData, "uint")
        return result
    }

    /**
     * Sets the data for the default or unnamed value of a specified registry key. The data must be a text string.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The name of a subkey of the <i>hKey</i> parameter. The function sets the default value of the specified subkey. If <i>lpSubKey</i> does not exist, the function creates it.
     * 
     * Key names are not case sensitive.
     * 
     * If this parameter is <b>NULL</b> or points to an empty string, the function sets the default value of the key identified by <i>hKey</i>.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @param {Integer} dwType The type of information to be stored. This parameter must be the REG_SZ type. To store other data types, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsetvalueexa">RegSetValueEx</a> function.
     * @param {Pointer} lpData The data to be stored. This parameter cannot be <b>NULL</b>.
     * @param {Integer} cbData This parameter is ignored. The function calculates this value based on the size of the data in the <i>lpData</i> parameter.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsetvaluew
     * @since windows5.0
     */
    static RegSetValueW(hKey, lpSubKey, dwType, lpData, cbData) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegSetValueW", "ptr", hKey, "ptr", lpSubKey, "uint", dwType, "ptr", lpData, "uint", cbData, "uint")
        return result
    }

    /**
     * Sets the data and type of a specified value under a registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>The Unicode version of this function supports the following additional predefined keys:<ul>
     * <li><b>HKEY_PERFORMANCE_TEXT</b></li>
     * <li><b>HKEY_PERFORMANCE_NLSTEXT</b></li>
     * </ul>
     * @param {Pointer<Byte>} lpValueName The name of the value to be set. If a value with this name is not already present in the key, the function adds it to the key. 
     * 
     * If <i>lpValueName</i> is <b>NULL</b> or an empty string, "", the function sets the type and data for the key's unnamed or default value.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * 
     * Registry keys do not have default values, but they can have one unnamed value, which can be of any type.
     * @param {Integer} dwType The type of data pointed to by the <i>lpData</i> parameter. For a list of the possible types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
     * @param {Pointer} lpData The data to be stored. 
     * 
     * For string-based types, such as REG_SZ, the string must be <b>null</b>-terminated. With the REG_MULTI_SZ data type, the string must be terminated with two <b>null</b> characters.
     * 
     * <div class="alert"><b>Note</b>  lpData indicating a  <b>null</b> value is valid, however, if this is the case, <i>cbData</i> must be set to '0'.</div>
     * <div> </div>
     * @param {Integer} cbData The size of the information pointed to by the <i>lpData</i> parameter, in bytes. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, <i>cbData</i> must include the size of the terminating <b>null</b> character or characters.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsetvalueexa
     * @since windows5.0
     */
    static RegSetValueExA(hKey, lpValueName, dwType, lpData, cbData) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegSetValueExA", "ptr", hKey, "ptr", lpValueName, "uint", Reserved, "uint", dwType, "ptr", lpData, "uint", cbData, "uint")
        return result
    }

    /**
     * Sets the data and type of a specified value under a registry key.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>The Unicode version of this function supports the following additional predefined keys:<ul>
     * <li><b>HKEY_PERFORMANCE_TEXT</b></li>
     * <li><b>HKEY_PERFORMANCE_NLSTEXT</b></li>
     * </ul>
     * @param {Pointer<Char>} lpValueName The name of the value to be set. If a value with this name is not already present in the key, the function adds it to the key. 
     * 
     * If <i>lpValueName</i> is <b>NULL</b> or an empty string, "", the function sets the type and data for the key's unnamed or default value.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * 
     * Registry keys do not have default values, but they can have one unnamed value, which can be of any type.
     * @param {Integer} dwType The type of data pointed to by the <i>lpData</i> parameter. For a list of the possible types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
     * @param {Pointer} lpData The data to be stored. 
     * 
     * For string-based types, such as REG_SZ, the string must be <b>null</b>-terminated. With the REG_MULTI_SZ data type, the string must be terminated with two <b>null</b> characters.
     * 
     * <div class="alert"><b>Note</b>  lpData indicating a  <b>null</b> value is valid, however, if this is the case, <i>cbData</i> must be set to '0'.</div>
     * <div> </div>
     * @param {Integer} cbData The size of the information pointed to by the <i>lpData</i> parameter, in bytes. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, <i>cbData</i> must include the size of the terminating <b>null</b> character or characters.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsetvalueexw
     * @since windows5.0
     */
    static RegSetValueExW(hKey, lpValueName, dwType, lpData, cbData) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegSetValueExW", "ptr", hKey, "ptr", lpValueName, "uint", Reserved, "uint", dwType, "ptr", lpData, "uint", cbData, "uint")
        return result
    }

    /**
     * Unloads the specified registry key and its subkeys from the registry.
     * @param {Pointer<Void>} hKey A handle to the registry key to be unloaded. This parameter can be a handle returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a> function or one of the following predefined handles: 
     * 
     * 
     * 
     * 
     * <b>HKEY_LOCAL_MACHINE</b>
     * <b>HKEY_USERS</b>
     * @param {Pointer<Byte>} lpSubKey The name of the subkey to be unloaded. The key referred to by the <i>lpSubKey</i> parameter must have been created by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a> function. 
     * 
     * 
     * 
     * 
     * Key names are not case sensitive.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regunloadkeya
     * @since windows5.0
     */
    static RegUnLoadKeyA(hKey, lpSubKey) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegUnLoadKeyA", "ptr", hKey, "ptr", lpSubKey, "uint")
        return result
    }

    /**
     * Unloads the specified registry key and its subkeys from the registry.
     * @param {Pointer<Void>} hKey A handle to the registry key to be unloaded. This parameter can be a handle returned by a call to 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regconnectregistrya">RegConnectRegistry</a> function or one of the following predefined handles: 
     * 
     * * HKEY_LOCAL_MACHINE
     * * HKEY_USERS
     * @param {Pointer<Char>} lpSubKey The name of the subkey to be unloaded. The key referred to by the <i>lpSubKey</i> parameter must have been created by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadkeya">RegLoadKey</a> function. 
     * 
     * 
     * 
     * 
     * Key names are not case sensitive.
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-element-size-limits">Registry Element Size Limits</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regunloadkeyw
     * @since windows5.0
     */
    static RegUnLoadKeyW(hKey, lpSubKey) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegUnLoadKeyW", "ptr", hKey, "ptr", lpSubKey, "uint")
        return result
    }

    /**
     * Removes the specified value from the specified registry key and subkey.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * 
     * <pre xml:space="preserve"><b></b>
     *    <b>HKEY_CLASSES_ROOT</b>
     *    <b>HKEY_CURRENT_CONFIG</b>
     *    <b>HKEY_CURRENT_USER</b>
     *    <b>HKEY_LOCAL_MACHINE</b>
     *    <b>HKEY_USERS</b></pre>
     * @param {Pointer<Byte>} lpSubKey The name of the registry key. This key must be a subkey of the key identified by the <i>hKey</i> parameter.
     * @param {Pointer<Byte>} lpValueName The registry value to be removed from the key.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletekeyvaluea
     * @since windows6.0.6000
     */
    static RegDeleteKeyValueA(hKey, lpSubKey, lpValueName) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegDeleteKeyValueA", "ptr", hKey, "ptr", lpSubKey, "ptr", lpValueName, "uint")
        return result
    }

    /**
     * Removes the specified value from the specified registry key and subkey.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * 
     * <pre xml:space="preserve"><b></b>
     *    <b>HKEY_CLASSES_ROOT</b>
     *    <b>HKEY_CURRENT_CONFIG</b>
     *    <b>HKEY_CURRENT_USER</b>
     *    <b>HKEY_LOCAL_MACHINE</b>
     *    <b>HKEY_USERS</b></pre>
     * @param {Pointer<Char>} lpSubKey The name of the registry key. This key must be a subkey of the key identified by the <i>hKey</i> parameter.
     * @param {Pointer<Char>} lpValueName The registry value to be removed from the key.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletekeyvaluew
     * @since windows6.0.6000
     */
    static RegDeleteKeyValueW(hKey, lpSubKey, lpValueName) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegDeleteKeyValueW", "ptr", hKey, "ptr", lpSubKey, "ptr", lpValueName, "uint")
        return result
    }

    /**
     * Sets the data for the specified value in the specified registry key and subkey.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * 
     * <pre xml:space="preserve"><b></b>
     *    <b>HKEY_CLASSES_ROOT</b>
     *    <b>HKEY_CURRENT_CONFIG</b>
     *    <b>HKEY_CURRENT_USER</b>
     *    <b>HKEY_LOCAL_MACHINE</b>
     *    <b>HKEY_USERS</b></pre>
     * @param {Pointer<Byte>} lpSubKey The name of the subkey relative to the key identified by <i>hKey</i>.
     * If the subkey does not exist, it is created as a non-volatile key with a default security descriptor.
     * If this parameter is <b>NULL</b>, then the value is created in the key specified by <i>hKey</i>.
     * @param {Pointer<Byte>} lpValueName The name of the registry value whose data is to be updated.
     * @param {Integer} dwType The type of data pointed to by the <i>lpData</i> parameter. For a list of the possible types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
     * @param {Pointer} lpData The data to be stored with the specified value name. 
     * 
     * For string-based types, such as REG_SZ, the string must be null-terminated. With the REG_MULTI_SZ data type, the string must be terminated with two null characters.
     * @param {Integer} cbData The size of the information pointed to by the <i>lpData</i> parameter, in bytes. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, <i>cbData</i> must include the size of the terminating null character or characters.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsetkeyvaluea
     * @since windows6.0.6000
     */
    static RegSetKeyValueA(hKey, lpSubKey, lpValueName, dwType, lpData, cbData) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegSetKeyValueA", "ptr", hKey, "ptr", lpSubKey, "ptr", lpValueName, "uint", dwType, "ptr", lpData, "uint", cbData, "uint")
        return result
    }

    /**
     * Sets the data for the specified value in the specified registry key and subkey.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_SET_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:
     * 
     * 
     * <pre xml:space="preserve"><b></b>
     *    <b>HKEY_CLASSES_ROOT</b>
     *    <b>HKEY_CURRENT_CONFIG</b>
     *    <b>HKEY_CURRENT_USER</b>
     *    <b>HKEY_LOCAL_MACHINE</b>
     *    <b>HKEY_USERS</b></pre>
     * @param {Pointer<Char>} lpSubKey The name of the subkey relative to the key identified by <i>hKey</i>.
     * If the subkey does not exist, it is created as a non-volatile key with a default security descriptor.
     * If this parameter is <b>NULL</b>, then the value is created in the key specified by <i>hKey</i>.
     * @param {Pointer<Char>} lpValueName The name of the registry value whose data is to be updated.
     * @param {Integer} dwType The type of data pointed to by the <i>lpData</i> parameter. For a list of the possible types, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>.
     * @param {Pointer} lpData The data to be stored with the specified value name. 
     * 
     * For string-based types, such as REG_SZ, the string must be null-terminated. With the REG_MULTI_SZ data type, the string must be terminated with two null characters.
     * @param {Integer} cbData The size of the information pointed to by the <i>lpData</i> parameter, in bytes. If the data is of type REG_SZ, REG_EXPAND_SZ, or REG_MULTI_SZ, <i>cbData</i> must include the size of the terminating null character or characters.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsetkeyvaluew
     * @since windows6.0.6000
     */
    static RegSetKeyValueW(hKey, lpSubKey, lpValueName, dwType, lpData, cbData) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpValueName := lpValueName is String? StrPtr(lpValueName) : lpValueName

        result := DllCall("ADVAPI32.dll\RegSetKeyValueW", "ptr", hKey, "ptr", lpSubKey, "ptr", lpValueName, "uint", dwType, "ptr", lpData, "uint", cbData, "uint")
        return result
    }

    /**
     * Deletes the subkeys and values of the specified key recursively.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the following access rights: DELETE, KEY_ENUMERATE_SUB_KEYS, and KEY_QUERY_VALUE. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">Predefined Keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The name of the key. This key must be a subkey of the key identified by the <i>hKey</i> parameter. If this parameter is <b>NULL</b>, the subkeys and values of <i>hKey</i> are deleted.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletetreea
     * @since windows6.0.6000
     */
    static RegDeleteTreeA(hKey, lpSubKey) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegDeleteTreeA", "ptr", hKey, "ptr", lpSubKey, "uint")
        return result
    }

    /**
     * Deletes the subkeys and values of the specified key recursively.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the following access rights: DELETE, KEY_ENUMERATE_SUB_KEYS, and KEY_QUERY_VALUE. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">Predefined Keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The name of the key. This key must be a subkey of the key identified by the <i>hKey</i> parameter. If this parameter is <b>NULL</b>, the subkeys and values of <i>hKey</i> are deleted.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regdeletetreew
     * @since windows6.0.6000
     */
    static RegDeleteTreeW(hKey, lpSubKey) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegDeleteTreeW", "ptr", hKey, "ptr", lpSubKey, "uint")
        return result
    }

    /**
     * Copies the specified registry key, along with its values and subkeys, to the specified destination key.
     * @param {Pointer<Void>} hKeySrc A handle to an open registry key. The key must have been opened with the KEY_READ access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>.
     * @param {Pointer<Byte>} lpSubKey The name of the key. This key must be a subkey of the key identified by the <i>hKeySrc</i> parameter. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Void>} hKeyDest A handle to the destination key. The calling process  must have KEY_CREATE_SUB_KEY access to the key.  
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regcopytreea
     * @since windows6.0.6000
     */
    static RegCopyTreeA(hKeySrc, lpSubKey, hKeyDest) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegCopyTreeA", "ptr", hKeySrc, "ptr", lpSubKey, "ptr", hKeyDest, "uint")
        return result
    }

    /**
     * Retrieves the type and data for the specified registry value.
     * @param {Pointer<Void>} hkey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_PERFORMANCE_NLSTEXT</b></dd>
     * <dd><b>HKEY_PERFORMANCE_TEXT</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} lpSubKey The path of a registry key relative to the key specified by the *hkey* parameter. The registry value will be retrieved from this subkey.
     * 
     * The path is not case sensitive.
     * 
     * If this parameter is **NULL** or an empty string, "", the value will be read from the key specified by *hkey* itself.
     * @param {Pointer<Byte>} lpValue The name of the registry value.
     * 
     * If this parameter is **NULL** or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any.
     * Keys do not automatically have an unnamed or default value, and unnamed values can be of any type.
     * 
     * For more information, see [Registry Element Size Limits](/windows/win32/sysinfo/registry-element-size-limits).
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pdwType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. This parameter can be <b>NULL</b> if the type is not required.
     * @param {Pointer} pvData A pointer to a buffer that receives the value's data. This parameter can be <b>NULL</b> if the data is not required.
     * 
     * If the data is a string, the function checks for a terminating <b>null</b> character. If one is not found, the string is stored with a <b>null</b> terminator if the buffer is large enough to accommodate the extra character. Otherwise, the function fails and returns ERROR_MORE_DATA.
     * @param {Pointer<UInt32>} pcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>pvData</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>pvData</i>. 
     * 
     * 
     * 
     * 
     * The <i>pcbData</i> parameter can be <b>NULL</b> only if <i>pvData</i> is <b>NULL</b>.
     * 
     * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
     * 
     * If the buffer specified by <i>pvData</i> parameter is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>pcbData</i>. In this case, the contents of the <i>pvData</i> buffer are zeroes if dwFlags specifies RRF_ZEROONFAILURE and undefined otherwise.
     * 
     * If <i>pvData</i> is <b>NULL</b>, and <i>pcbData</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS and stores the size of the data, in bytes, in the variable pointed to by <i>pcbData</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
     * 
     * If <i>hKey</i> specifies <b>HKEY_PERFORMANCE_DATA</b> and the <i>pvData</i> buffer is not large enough to contain all of the returned data, 
     * the function returns ERROR_MORE_DATA and the value returned through the <i>pcbData</i> parameter is undefined. This is because the size of the performance data can change from one call to the next. In this case, you must increase the buffer size and call 
     * <b>RegGetValue</b> again passing the updated buffer size in the <i>pcbData</i> parameter. Repeat this until the function succeeds. You need to maintain a separate variable to keep track of the buffer size, because the value returned by <i>pcbData</i> is unpredictable.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>pvData</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
     * 
     * If <i>dwFlags</i> specifies a combination of both <b>RRF_SUBKEY_WOW6464KEY</b> and  <b>RRF_SUBKEY_WOW6432KEY</b>, the function returns ERROR_INVALID_PARAMETER.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-reggetvaluea
     * @since windows6.0.6000
     */
    static RegGetValueA(hkey, lpSubKey, lpValue, dwFlags, pdwType, pvData, pcbData) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpValue := lpValue is String? StrPtr(lpValue) : lpValue

        result := DllCall("ADVAPI32.dll\RegGetValueA", "ptr", hkey, "ptr", lpSubKey, "ptr", lpValue, "uint", dwFlags, "uint*", pdwType, "ptr", pvData, "uint*", pcbData, "uint")
        return result
    }

    /**
     * Retrieves the type and data for the specified registry value.
     * @param {Pointer<Void>} hkey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeytransacteda">RegCreateKeyTransacted</a>, <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a>, or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeytransacteda">RegOpenKeyTransacted</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_PERFORMANCE_DATA</b></dd>
     * <dd><b>HKEY_PERFORMANCE_NLSTEXT</b></dd>
     * <dd><b>HKEY_PERFORMANCE_TEXT</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} lpSubKey The path of a registry key relative to the key specified by the *hkey* parameter. The registry value will be retrieved from this subkey.
     * 
     * The path is not case sensitive.
     * 
     * If this parameter is **NULL** or an empty string, "", the value will be read from the key specified by *hkey* itself.
     * @param {Pointer<Char>} lpValue The name of the registry value.
     * 
     * If this parameter is **NULL** or an empty string, "", the function retrieves the type and data for the key's unnamed or default value, if any.
     * Keys do not automatically have an unnamed or default value, and unnamed values can be of any type.
     * 
     * For more information, see [Registry Element Size Limits](/windows/win32/sysinfo/registry-element-size-limits).
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pdwType A pointer to a variable that receives a code indicating the type of data stored in the specified value. For a list of the possible type codes, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-value-types">Registry Value Types</a>. This parameter can be <b>NULL</b> if the type is not required.
     * @param {Pointer} pvData A pointer to a buffer that receives the value's data. This parameter can be <b>NULL</b> if the data is not required.
     * 
     * If the data is a string, the function checks for a terminating <b>null</b> character. If one is not found, the string is stored with a <b>null</b> terminator if the buffer is large enough to accommodate the extra character. Otherwise, the function fails and returns ERROR_MORE_DATA.
     * @param {Pointer<UInt32>} pcbData A pointer to a variable that specifies the size of the buffer pointed to by the <i>pvData</i> parameter, in bytes. When the function returns, this variable contains the size of the data copied to <i>pvData</i>. 
     * 
     * 
     * 
     * 
     * The <i>pcbData</i> parameter can be <b>NULL</b> only if <i>pvData</i> is <b>NULL</b>.
     * 
     * If the data has the REG_SZ, REG_MULTI_SZ or REG_EXPAND_SZ type, this size includes any terminating <b>null</b> character or characters. For more information, see Remarks.
     * 
     * If the buffer specified by <i>pvData</i> parameter is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>pcbData</i>. In this case, the contents of the <i>pvData</i> buffer are zeroes if dwFlags specifies RRF_ZEROONFAILURE and undefined otherwise.
     * 
     * If <i>pvData</i> is <b>NULL</b>, and <i>pcbData</i> is non-<b>NULL</b>, the function returns ERROR_SUCCESS and stores the size of the data, in bytes, in the variable pointed to by <i>pcbData</i>. This enables an application to determine the best way to allocate a buffer for the value's data.
     * 
     * If <i>hKey</i> specifies <b>HKEY_PERFORMANCE_DATA</b> and the <i>pvData</i> buffer is not large enough to contain all of the returned data, 
     * the function returns ERROR_MORE_DATA and the value returned through the <i>pcbData</i> parameter is undefined. This is because the size of the performance data can change from one call to the next. In this case, you must increase the buffer size and call 
     * <b>RegGetValue</b> again passing the updated buffer size in the <i>pcbData</i> parameter. Repeat this until the function succeeds. You need to maintain a separate variable to keep track of the buffer size, because the value returned by <i>pcbData</i> is unpredictable.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>pvData</i> buffer is too small to receive the value, the function returns ERROR_MORE_DATA.
     * 
     * If <i>dwFlags</i> specifies a combination of both <b>RRF_SUBKEY_WOW6464KEY</b> and  <b>RRF_SUBKEY_WOW6432KEY</b>, the function returns ERROR_INVALID_PARAMETER.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-reggetvaluew
     * @since windows6.0.6000
     */
    static RegGetValueW(hkey, lpSubKey, lpValue, dwFlags, pdwType, pvData, pcbData) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey
        lpValue := lpValue is String? StrPtr(lpValue) : lpValue

        result := DllCall("ADVAPI32.dll\RegGetValueW", "ptr", hkey, "ptr", lpSubKey, "ptr", lpValue, "uint", dwFlags, "uint*", pdwType, "ptr", pvData, "uint*", pcbData, "uint")
        return result
    }

    /**
     * Copies the specified registry key, along with its values and subkeys, to the specified destination key.
     * @param {Pointer<Void>} hKeySrc A handle to an open registry key. The key must have been opened with the KEY_READ access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>.
     * @param {Pointer<Char>} lpSubKey The name of the key. This key must be a subkey of the key identified by the <i>hKeySrc</i> parameter. This parameter can also be <b>NULL</b>.
     * @param {Pointer<Void>} hKeyDest A handle to the destination key. The calling process  must have KEY_CREATE_SUB_KEY access to the key.  
     * 
     * 
     * 
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function, or it can be one of the <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regcopytreew
     * @since windows6.0.6000
     */
    static RegCopyTreeW(hKeySrc, lpSubKey, hKeyDest) {
        lpSubKey := lpSubKey is String? StrPtr(lpSubKey) : lpSubKey

        result := DllCall("ADVAPI32.dll\RegCopyTreeW", "ptr", hKeySrc, "ptr", lpSubKey, "ptr", hKeyDest, "uint")
        return result
    }

    /**
     * Loads the specified string from the specified key and subkey.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Byte>} pszValue The name of the registry value.
     * @param {Pointer} pszOutBuf A pointer to a buffer that receives the string.
     * 
     * Strings of the following form receive special handling:
     * 
     * @[<i>path</i>]&#92;<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. If the <i>pszDirectory</i> parameter is not <b>NULL</b>, the directory is prepended to the path specified in the registry data. Note that <i>dllname</i> can contain environment variables to be expanded.
     * @param {Integer} cbOutBuf The size of the <i>pszOutBuf</i> buffer, in bytes.
     * @param {Pointer<UInt32>} pcbData A pointer to a variable that receives the size of the data copied to the <i>pszOutBuf</i> buffer, in bytes.
     * 
     * If the buffer is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>pcbData</i>. In this case, the contents of the buffer are undefined.
     * @param {Integer} Flags This parameter can be 0 or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_MUI_STRING_TRUNCATE"></a><a id="reg_mui_string_truncate"></a><dl>
     * <dt><b>REG_MUI_STRING_TRUNCATE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string is truncated to fit the available size of the <i>pszOutBuf</i> buffer. If this flag is specified, <i>pcbData</i> must be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Byte>} pszDirectory The directory path.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>pcbData</i> buffer is too small to receive the string, the function returns ERROR_MORE_DATA.
     * 
     * The ANSI version of this function returns ERROR_CALL_NOT_IMPLEMENTED.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regloadmuistringa
     * @since windows6.0.6000
     */
    static RegLoadMUIStringA(hKey, pszValue, pszOutBuf, cbOutBuf, pcbData, Flags, pszDirectory) {
        pszValue := pszValue is String? StrPtr(pszValue) : pszValue
        pszDirectory := pszDirectory is String? StrPtr(pszDirectory) : pszDirectory

        result := DllCall("ADVAPI32.dll\RegLoadMUIStringA", "ptr", hKey, "ptr", pszValue, "ptr", pszOutBuf, "uint", cbOutBuf, "uint*", pcbData, "uint", Flags, "ptr", pszDirectory, "uint")
        return result
    }

    /**
     * Loads the specified string from the specified key and subkey.
     * @param {Pointer<Void>} hKey A handle to an open registry key. The key must have been opened with the KEY_QUERY_VALUE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * 
     * This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regcreatekeyexa">RegCreateKeyEx</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regopenkeyexa">RegOpenKeyEx</a> function. It can also be one of the following 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/predefined-keys">predefined keys</a>:<dl>
     * <dd><b>HKEY_CLASSES_ROOT</b></dd>
     * <dd><b>HKEY_CURRENT_CONFIG</b></dd>
     * <dd><b>HKEY_CURRENT_USER</b></dd>
     * <dd><b>HKEY_LOCAL_MACHINE</b></dd>
     * <dd><b>HKEY_USERS</b></dd>
     * </dl>
     * @param {Pointer<Char>} pszValue The name of the registry value.
     * @param {Pointer} pszOutBuf A pointer to a buffer that receives the string.
     * 
     * Strings of the following form receive special handling:
     * 
     * @[<i>path</i>]&#92;<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. If the <i>pszDirectory</i> parameter is not <b>NULL</b>, the directory is prepended to the path specified in the registry data. Note that <i>dllname</i> can contain environment variables to be expanded.
     * @param {Integer} cbOutBuf The size of the <i>pszOutBuf</i> buffer, in bytes.
     * @param {Pointer<UInt32>} pcbData A pointer to a variable that receives the size of the data copied to the <i>pszOutBuf</i> buffer, in bytes.
     * 
     * If the buffer is not large enough to hold the data, the function returns ERROR_MORE_DATA and stores the required buffer size in the variable pointed to by <i>pcbData</i>. In this case, the contents of the buffer are undefined.
     * @param {Integer} Flags This parameter can be 0 or the following value.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="REG_MUI_STRING_TRUNCATE"></a><a id="reg_mui_string_truncate"></a><dl>
     * <dt><b>REG_MUI_STRING_TRUNCATE</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The string is truncated to fit the available size of the <i>pszOutBuf</i> buffer. If this flag is specified, <i>pcbData</i> must be <b>NULL</b>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Char>} pszDirectory The directory path.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a 
     * <a href="/windows/desktop/Debug/system-error-codes">system error code</a>.
     * 
     * If the <i>pcbData</i> buffer is too small to receive the string, the function returns ERROR_MORE_DATA.
     * 
     * The ANSI version of this function returns ERROR_CALL_NOT_IMPLEMENTED.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regloadmuistringw
     * @since windows6.0.6000
     */
    static RegLoadMUIStringW(hKey, pszValue, pszOutBuf, cbOutBuf, pcbData, Flags, pszDirectory) {
        pszValue := pszValue is String? StrPtr(pszValue) : pszValue
        pszDirectory := pszDirectory is String? StrPtr(pszDirectory) : pszDirectory

        result := DllCall("ADVAPI32.dll\RegLoadMUIStringW", "ptr", hKey, "ptr", pszValue, "ptr", pszOutBuf, "uint", cbOutBuf, "uint*", pcbData, "uint", Flags, "ptr", pszDirectory, "uint")
        return result
    }

    /**
     * Loads the specified registry hive as an application hive.
     * @param {Pointer<Byte>} lpFile The name of the  hive file. This hive must have been created with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeyexa">RegSaveKeyEx</a> function. If the  file does not exist, an empty hive file is created with the specified name.
     * @param {Pointer<Void>} phkResult Pointer to the handle for the root key of the loaded hive.
     * 
     * The only way to access keys in the hive is through this handle. The registry will prevent an application from accessing keys in this hive using an absolute path to the key. As a result, it is not possible to navigate to this hive through the registry's namespace.
     * @param {Integer} samDesired A mask that specifies the access rights requested for the returned root key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Integer} dwOptions If this parameter is REG_PROCESS_APPKEY, the hive cannot be loaded again  while it is loaded by the caller. This prevents access to this registry hive by another caller.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regloadappkeya
     * @since windows6.0.6000
     */
    static RegLoadAppKeyA(lpFile, phkResult, samDesired, dwOptions) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegLoadAppKeyA", "ptr", lpFile, "ptr", phkResult, "uint", samDesired, "uint", dwOptions, "uint", Reserved, "uint")
        return result
    }

    /**
     * Loads the specified registry hive as an application hive.
     * @param {Pointer<Char>} lpFile The name of the  hive file. This hive must have been created with the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeya">RegSaveKey</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regsavekeyexa">RegSaveKeyEx</a> function. If the  file does not exist, an empty hive file is created with the specified name.
     * @param {Pointer<Void>} phkResult Pointer to the handle for the root key of the loaded hive.
     * 
     * The only way to access keys in the hive is through this handle. The registry will prevent an application from accessing keys in this hive using an absolute path to the key. As a result, it is not possible to navigate to this hive through the registry's namespace.
     * @param {Integer} samDesired A mask that specifies the access rights requested for the returned root key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Integer} dwOptions If this parameter is REG_PROCESS_APPKEY, the hive cannot be loaded again  while it is loaded by the caller. This prevents access to this registry hive by another caller.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regloadappkeyw
     * @since windows6.0.6000
     */
    static RegLoadAppKeyW(lpFile, phkResult, samDesired, dwOptions) {
        static Reserved := 0 ;Reserved parameters must always be NULL

        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegLoadAppKeyW", "ptr", lpFile, "ptr", phkResult, "uint", samDesired, "uint", dwOptions, "uint", Reserved, "uint")
        return result
    }

    /**
     * Saves the specified key and all of its subkeys and values to a registry file, in the specified format.
     * @param {Pointer<Void>} hKey A handle to an open registry key. 
     * 
     * This function does not support the <b>HKEY_CLASSES_ROOT</b> predefined key.
     * @param {Pointer<Byte>} lpFile The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails. 
     * 
     * 
     * 
     * 
     * The new file has the archive attribute.
     * 
     * If the string does not include a path, the file is created in the current directory of the calling process for a local key, or in the %systemroot%\system32 directory for a remote key.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new file. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * 
     * If more than one of the possible values listed above for the <i>Flags</i> parameter is specified in one call to this function—for example, if two or more values are OR'ed— or if REG_NO_COMPRESSION is specified and <i>hKey</i> specifies a key that is not the root of a hive, this function returns ERROR_INVALID_PARAMETER.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsavekeyexa
     * @since windows5.1.2600
     */
    static RegSaveKeyExA(hKey, lpFile, lpSecurityAttributes, Flags) {
        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegSaveKeyExA", "ptr", hKey, "ptr", lpFile, "ptr", lpSecurityAttributes, "uint", Flags, "uint")
        return result
    }

    /**
     * Saves the specified key and all of its subkeys and values to a registry file, in the specified format.
     * @param {Pointer<Void>} hKey A handle to an open registry key. 
     * 
     * This function does not support the <b>HKEY_CLASSES_ROOT</b> predefined key.
     * @param {Pointer<Char>} lpFile The name of the file in which the specified key and subkeys are to be saved. If the file already exists, the function fails. 
     * 
     * 
     * 
     * 
     * The new file has the archive attribute.
     * 
     * If the string does not include a path, the file is created in the current directory of the calling process for a local key, or in the %systemroot%\system32 directory for a remote key.
     * @param {Pointer<SECURITY_ATTRIBUTES>} lpSecurityAttributes A pointer to a 
     * <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/aa379560(v=vs.85)">SECURITY_ATTRIBUTES</a> structure that specifies a security descriptor for the new file. If <i>lpSecurityAttributes</i> is <b>NULL</b>, the file gets a default security descriptor. The ACLs in a default security descriptor for a file are inherited from its parent directory.
     * @param {Integer} Flags 
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS.
     * 
     * If the function fails, the return value is a nonzero error code defined in Winerror.h. You can use the 
     * <a href="/windows/desktop/api/winbase/nf-winbase-formatmessage">FormatMessage</a> function with the FORMAT_MESSAGE_FROM_SYSTEM flag to get a generic description of the error.
     * 
     * If more than one of the possible values listed above for the <i>Flags</i> parameter is specified in one call to this function—for example, if two or more values are OR'ed— or if REG_NO_COMPRESSION is specified and <i>hKey</i> specifies a key that is not the root of a hive, this function returns ERROR_INVALID_PARAMETER.
     * @see https://docs.microsoft.com/windows/win32/api//winreg/nf-winreg-regsavekeyexw
     * @since windows5.1.2600
     */
    static RegSaveKeyExW(hKey, lpFile, lpSecurityAttributes, Flags) {
        lpFile := lpFile is String? StrPtr(lpFile) : lpFile

        result := DllCall("ADVAPI32.dll\RegSaveKeyExW", "ptr", hKey, "ptr", lpFile, "ptr", lpSecurityAttributes, "uint", Flags, "uint")
        return result
    }

    /**
     * 
     * @param {Pointer<Void>} hkeyPrimary 
     * @param {Pointer<Char>} pwszPrimarySubKey 
     * @param {Pointer<Void>} hkeyFallback 
     * @param {Pointer<Char>} pwszFallbackSubKey 
     * @param {Pointer<Char>} pwszValue 
     * @param {Integer} dwFlags 
     * @param {Pointer<UInt32>} pdwType 
     * @param {Pointer} pvData 
     * @param {Integer} cbDataIn 
     * @param {Pointer<UInt32>} pcbDataOut 
     * @returns {Integer} 
     */
    static GetRegistryValueWithFallbackW(hkeyPrimary, pwszPrimarySubKey, hkeyFallback, pwszFallbackSubKey, pwszValue, dwFlags, pdwType, pvData, cbDataIn, pcbDataOut) {
        pwszPrimarySubKey := pwszPrimarySubKey is String? StrPtr(pwszPrimarySubKey) : pwszPrimarySubKey
        pwszFallbackSubKey := pwszFallbackSubKey is String? StrPtr(pwszFallbackSubKey) : pwszFallbackSubKey
        pwszValue := pwszValue is String? StrPtr(pwszValue) : pwszValue

        result := DllCall("api-ms-win-core-state-helpers-l1-1-0.dll\GetRegistryValueWithFallbackW", "ptr", hkeyPrimary, "ptr", pwszPrimarySubKey, "ptr", hkeyFallback, "ptr", pwszFallbackSubKey, "ptr", pwszValue, "uint", dwFlags, "uint*", pdwType, "ptr", pvData, "uint", cbDataIn, "uint*", pcbDataOut, "uint")
        return result
    }

;@endregion Methods
}
