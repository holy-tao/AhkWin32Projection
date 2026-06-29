#Requires AutoHotkey >= v2.1-alpha.24+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.System.Services
 */

;@region Constants

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ALL_ACCESS := 983551

/**
 * @type {Integer (UInt32)}
 */
export global SC_MANAGER_ALL_ACCESS := 983103

/**
 * @type {String}
 */
export global SERVICES_ACTIVE_DATABASEW := "ServicesActive"

/**
 * @type {String}
 */
export global SERVICES_FAILED_DATABASEW := "ServicesFailed"

/**
 * @type {String}
 */
export global SERVICES_ACTIVE_DATABASEA := "ServicesActive"

/**
 * @type {String}
 */
export global SERVICES_FAILED_DATABASEA := "ServicesFailed"

/**
 * @type {String}
 */
export global SERVICES_ACTIVE_DATABASE := "ServicesActive"

/**
 * @type {String}
 */
export global SERVICES_FAILED_DATABASE := "ServicesFailed"

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_NO_CHANGE := 4294967295

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_STOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_PAUSE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_CONTINUE := 3

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_INTERROGATE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_SHUTDOWN := 5

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_PARAMCHANGE := 6

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_NETBINDADD := 7

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_NETBINDREMOVE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_NETBINDENABLE := 9

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_NETBINDDISABLE := 10

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_DEVICEEVENT := 11

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_HARDWAREPROFILECHANGE := 12

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_POWEREVENT := 13

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_SESSIONCHANGE := 14

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_PRESHUTDOWN := 15

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_TIMECHANGE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_TRIGGEREVENT := 32

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_LOWRESOURCES := 96

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_SYSTEMLOWRESOURCES := 97

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_STOP := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_PAUSE_CONTINUE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_SHUTDOWN := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_PARAMCHANGE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_NETBINDCHANGE := 16

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_HARDWAREPROFILECHANGE := 32

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_POWEREVENT := 64

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_SESSIONCHANGE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_PRESHUTDOWN := 256

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_TIMECHANGE := 512

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_TRIGGEREVENT := 1024

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_USER_LOGOFF := 2048

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_LOWRESOURCES := 8192

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ACCEPT_SYSTEMLOWRESOURCES := 16384

/**
 * @type {Integer (UInt32)}
 */
export global SC_MANAGER_CONNECT := 1

/**
 * @type {Integer (UInt32)}
 */
export global SC_MANAGER_CREATE_SERVICE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SC_MANAGER_ENUMERATE_SERVICE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SC_MANAGER_LOCK := 8

/**
 * @type {Integer (UInt32)}
 */
export global SC_MANAGER_QUERY_LOCK_STATUS := 16

/**
 * @type {Integer (UInt32)}
 */
export global SC_MANAGER_MODIFY_BOOT_CONFIG := 32

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_QUERY_CONFIG := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CHANGE_CONFIG := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_QUERY_STATUS := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_ENUMERATE_DEPENDENTS := 8

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_START := 16

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP := 32

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_PAUSE_CONTINUE := 64

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_INTERROGATE := 128

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_USER_DEFINED_CONTROL := 256

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_NOTIFY_STATUS_CHANGE_1 := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_NOTIFY_STATUS_CHANGE_2 := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_NOTIFY_STATUS_CHANGE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_FLAG_MIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_FLAG_UNPLANNED := 268435456

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_FLAG_CUSTOM := 536870912

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_FLAG_PLANNED := 1073741824

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_FLAG_MAX := 2147483648

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_MIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_OTHER := 65536

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_HARDWARE := 131072

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_OPERATINGSYSTEM := 196608

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_SOFTWARE := 262144

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_APPLICATION := 327680

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_NONE := 393216

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_MAX := 458752

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_MIN_CUSTOM := 4194304

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MAJOR_MAX_CUSTOM := 16711680

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_MIN := 0

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_OTHER := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_MAINTENANCE := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_INSTALLATION := 3

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_UPGRADE := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_RECONFIG := 5

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_HUNG := 6

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_UNSTABLE := 7

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_DISK := 8

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_NETWORKCARD := 9

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_ENVIRONMENT := 10

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_HARDWARE_DRIVER := 11

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_OTHERDRIVER := 12

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_SERVICEPACK := 13

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE := 14

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_SECURITYFIX := 15

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_SECURITY := 16

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_NETWORK_CONNECTIVITY := 17

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_WMI := 18

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_SERVICEPACK_UNINSTALL := 19

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE_UNINSTALL := 20

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_SECURITYFIX_UNINSTALL := 21

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_MMC := 22

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_NONE := 23

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_MEMOTYLIMIT := 24

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_MAX := 25

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_MIN_CUSTOM := 256

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_STOP_REASON_MINOR_MAX_CUSTOM := 65535

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_CONTROL_STATUS_REASON_INFO := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SID_TYPE_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_SID_TYPE_UNRESTRICTED := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_TRIGGER_TYPE_CUSTOM_SYSTEM_STATE_CHANGE := 7

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_TRIGGER_TYPE_AGGREGATE := 30

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_START_REASON_DEMAND := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_START_REASON_AUTO := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_START_REASON_TRIGGER := 4

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_START_REASON_RESTART_ON_FAILURE := 8

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_START_REASON_DELAYEDAUTO := 16

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_DYNAMIC_INFORMATION_LEVEL_START_REASON := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_LAUNCH_PROTECTED_NONE := 0

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_LAUNCH_PROTECTED_WINDOWS := 1

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_LAUNCH_PROTECTED_WINDOWS_LIGHT := 2

/**
 * @type {Integer (UInt32)}
 */
export global SERVICE_LAUNCH_PROTECTED_ANTIMALWARE_LIGHT := 3

/**
 * @type {Guid}
 */
export global NETWORK_MANAGER_FIRST_IP_ADDRESS_ARRIVAL_GUID := Guid("{4f27f2de-14e2-430b-a549-7cd48cbc8245}")

/**
 * @type {Guid}
 */
export global NETWORK_MANAGER_LAST_IP_ADDRESS_REMOVAL_GUID := Guid("{cc4ba62a-162e-4648-847a-b6bdf993e335}")

/**
 * @type {Guid}
 */
export global DOMAIN_JOIN_GUID := Guid("{1ce20aba-9851-4421-9430-1ddeb766e809}")

/**
 * @type {Guid}
 */
export global DOMAIN_LEAVE_GUID := Guid("{ddaf516e-58c2-4866-9574-c3b615d42ea1}")

/**
 * @type {Guid}
 */
export global FIREWALL_PORT_OPEN_GUID := Guid("{b7569e07-8421-4ee0-ad10-86915afdad09}")

/**
 * @type {Guid}
 */
export global FIREWALL_PORT_CLOSE_GUID := Guid("{a144ed38-8e12-4de4-9d96-e64740b1a524}")

/**
 * @type {Guid}
 */
export global MACHINE_POLICY_PRESENT_GUID := Guid("{659fcae6-5bdb-4da9-b1ff-ca2a178d46e0}")

/**
 * @type {Guid}
 */
export global USER_POLICY_PRESENT_GUID := Guid("{54fb46c8-f089-464c-b1fd-59d1b62c3b50}")

/**
 * @type {Guid}
 */
export global RPC_INTERFACE_EVENT_GUID := Guid("{bc90d167-9470-4139-a9ba-be0bbbf5b74d}")

/**
 * @type {Guid}
 */
export global NAMED_PIPE_EVENT_GUID := Guid("{1f81d131-3fac-4537-9e0c-7e7b0c2f4b55}")

/**
 * @type {Guid}
 */
export global CUSTOM_SYSTEM_STATE_CHANGE_EVENT_GUID := Guid("{2d7a2816-0c5e-45fc-9ce7-570e5ecde9c9}")

/**
 * @type {String}
 */
export global SERVICE_TRIGGER_STARTED_ARGUMENT := "TriggerStarted"

/**
 * @type {String}
 */
export global SC_AGGREGATE_STORAGE_KEY := "System\CurrentControlSet\Control\ServiceAggregatedEvents"
;@endregion Constants
