#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Handle.ahk
#Include ..\..\..\..\Guid.ahk
#Include .\SC_HANDLE.ahk
#Include .\SERVICE_STATUS_HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 */
class Services {

;@region Constants

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ALL_ACCESS => 983551

    /**
     * @type {Integer (UInt32)}
     */
    static SC_MANAGER_ALL_ACCESS => 983103

    /**
     * @type {String}
     */
    static SERVICES_ACTIVE_DATABASEW => "ServicesActive"

    /**
     * @type {String}
     */
    static SERVICES_FAILED_DATABASEW => "ServicesFailed"

    /**
     * @type {String}
     */
    static SERVICES_ACTIVE_DATABASEA => "ServicesActive"

    /**
     * @type {String}
     */
    static SERVICES_FAILED_DATABASEA => "ServicesFailed"

    /**
     * @type {String}
     */
    static SERVICES_ACTIVE_DATABASE => "ServicesActive"

    /**
     * @type {String}
     */
    static SERVICES_FAILED_DATABASE => "ServicesFailed"

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NO_CHANGE => 4294967295

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_STOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_PAUSE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_CONTINUE => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_INTERROGATE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_SHUTDOWN => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_PARAMCHANGE => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_NETBINDADD => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_NETBINDREMOVE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_NETBINDENABLE => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_NETBINDDISABLE => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_DEVICEEVENT => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_HARDWAREPROFILECHANGE => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_POWEREVENT => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_SESSIONCHANGE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_PRESHUTDOWN => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_TIMECHANGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_TRIGGEREVENT => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_LOWRESOURCES => 96

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_SYSTEMLOWRESOURCES => 97

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_STOP => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_PAUSE_CONTINUE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_SHUTDOWN => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_PARAMCHANGE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_NETBINDCHANGE => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_HARDWAREPROFILECHANGE => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_POWEREVENT => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_SESSIONCHANGE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_PRESHUTDOWN => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_TIMECHANGE => 512

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_TRIGGEREVENT => 1024

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_USER_LOGOFF => 2048

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_LOWRESOURCES => 8192

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ACCEPT_SYSTEMLOWRESOURCES => 16384

    /**
     * @type {Integer (UInt32)}
     */
    static SC_MANAGER_CONNECT => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SC_MANAGER_CREATE_SERVICE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SC_MANAGER_ENUMERATE_SERVICE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SC_MANAGER_LOCK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SC_MANAGER_QUERY_LOCK_STATUS => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SC_MANAGER_MODIFY_BOOT_CONFIG => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_QUERY_CONFIG => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CHANGE_CONFIG => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_QUERY_STATUS => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_ENUMERATE_DEPENDENTS => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_START => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP => 32

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_PAUSE_CONTINUE => 64

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_INTERROGATE => 128

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_USER_DEFINED_CONTROL => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_STATUS_CHANGE_1 => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_STATUS_CHANGE_2 => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_NOTIFY_STATUS_CHANGE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_FLAG_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_FLAG_UNPLANNED => 268435456

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_FLAG_CUSTOM => 536870912

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_FLAG_PLANNED => 1073741824

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_FLAG_MAX => 2147483648

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_OTHER => 65536

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_HARDWARE => 131072

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_OPERATINGSYSTEM => 196608

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_SOFTWARE => 262144

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_APPLICATION => 327680

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_NONE => 393216

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_MAX => 458752

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_MIN_CUSTOM => 4194304

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MAJOR_MAX_CUSTOM => 16711680

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_MIN => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_OTHER => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_MAINTENANCE => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_INSTALLATION => 3

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_UPGRADE => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_RECONFIG => 5

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_HUNG => 6

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_UNSTABLE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_DISK => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_NETWORKCARD => 9

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_ENVIRONMENT => 10

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_HARDWARE_DRIVER => 11

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_OTHERDRIVER => 12

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_SERVICEPACK => 13

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE => 14

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_SECURITYFIX => 15

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_SECURITY => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_NETWORK_CONNECTIVITY => 17

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_WMI => 18

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_SERVICEPACK_UNINSTALL => 19

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_SOFTWARE_UPDATE_UNINSTALL => 20

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_SECURITYFIX_UNINSTALL => 21

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_MMC => 22

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_NONE => 23

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_MEMOTYLIMIT => 24

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_MAX => 25

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_MIN_CUSTOM => 256

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_STOP_REASON_MINOR_MAX_CUSTOM => 65535

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_CONTROL_STATUS_REASON_INFO => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SID_TYPE_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_SID_TYPE_UNRESTRICTED => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_TYPE_CUSTOM_SYSTEM_STATE_CHANGE => 7

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_TRIGGER_TYPE_AGGREGATE => 30

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_START_REASON_DEMAND => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_START_REASON_AUTO => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_START_REASON_TRIGGER => 4

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_START_REASON_RESTART_ON_FAILURE => 8

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_START_REASON_DELAYEDAUTO => 16

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_DYNAMIC_INFORMATION_LEVEL_START_REASON => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_LAUNCH_PROTECTED_NONE => 0

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_LAUNCH_PROTECTED_WINDOWS => 1

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_LAUNCH_PROTECTED_WINDOWS_LIGHT => 2

    /**
     * @type {Integer (UInt32)}
     */
    static SERVICE_LAUNCH_PROTECTED_ANTIMALWARE_LIGHT => 3

    /**
     * @type {Guid}
     */
    static NETWORK_MANAGER_FIRST_IP_ADDRESS_ARRIVAL_GUID => Guid("{4f27f2de-14e2-430b-a549-7cd48cbc8245}")

    /**
     * @type {Guid}
     */
    static NETWORK_MANAGER_LAST_IP_ADDRESS_REMOVAL_GUID => Guid("{cc4ba62a-162e-4648-847a-b6bdf993e335}")

    /**
     * @type {Guid}
     */
    static DOMAIN_JOIN_GUID => Guid("{1ce20aba-9851-4421-9430-1ddeb766e809}")

    /**
     * @type {Guid}
     */
    static DOMAIN_LEAVE_GUID => Guid("{ddaf516e-58c2-4866-9574-c3b615d42ea1}")

    /**
     * @type {Guid}
     */
    static FIREWALL_PORT_OPEN_GUID => Guid("{b7569e07-8421-4ee0-ad10-86915afdad09}")

    /**
     * @type {Guid}
     */
    static FIREWALL_PORT_CLOSE_GUID => Guid("{a144ed38-8e12-4de4-9d96-e64740b1a524}")

    /**
     * @type {Guid}
     */
    static MACHINE_POLICY_PRESENT_GUID => Guid("{659fcae6-5bdb-4da9-b1ff-ca2a178d46e0}")

    /**
     * @type {Guid}
     */
    static USER_POLICY_PRESENT_GUID => Guid("{54fb46c8-f089-464c-b1fd-59d1b62c3b50}")

    /**
     * @type {Guid}
     */
    static RPC_INTERFACE_EVENT_GUID => Guid("{bc90d167-9470-4139-a9ba-be0bbbf5b74d}")

    /**
     * @type {Guid}
     */
    static NAMED_PIPE_EVENT_GUID => Guid("{1f81d131-3fac-4537-9e0c-7e7b0c2f4b55}")

    /**
     * @type {Guid}
     */
    static CUSTOM_SYSTEM_STATE_CHANGE_EVENT_GUID => Guid("{2d7a2816-0c5e-45fc-9ce7-570e5ecde9c9}")

    /**
     * @type {String}
     */
    static SERVICE_TRIGGER_STARTED_ARGUMENT => "TriggerStarted"

    /**
     * @type {String}
     */
    static SC_AGGREGATE_STORAGE_KEY => "System\CurrentControlSet\Control\ServiceAggregatedEvents"
;@endregion Constants

;@region Methods
    /**
     * Registers a service type with the service control manager and the Server service.
     * @param {SERVICE_STATUS_HANDLE} hServiceStatus A handle to the status information structure for the service. A service obtains the handle by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a> function.
     * @param {Integer} dwServiceBits The service type. 
     * 
     * 
     * 
     * 
     * Certain bit flags (0xC00F3F7B) are reserved for use by Microsoft. The 
     * <b>SetServiceBits</b> function fails with the error ERROR_INVALID_DATA if any of these bit flags are set in <i>dwServiceBits</i>. The following bit flags are reserved for use by Microsoft.
     * @param {BOOL} bSetBitsOn If this value is TRUE, the bits in <i>dwServiceBit</i> are to be set. If this value is FALSE, the bits are to be cleared.
     * @param {BOOL} bUpdateImmediately If this value is TRUE, the Server service is to perform an immediate update. If this value is FALSE, the update is not be performed immediately.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//lmserver/nf-lmserver-setservicebits
     * @since windows5.1.2600
     */
    static SetServiceBits(hServiceStatus, dwServiceBits, bSetBitsOn, bUpdateImmediately) {
        hServiceStatus := hServiceStatus is Win32Handle ? NumGet(hServiceStatus, "ptr") : hServiceStatus

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetServiceBits", "ptr", hServiceStatus, "uint", dwServiceBits, "int", bSetBitsOn, "int", bUpdateImmediately, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the configuration parameters of a service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the <b>SERVICE_CHANGE_CONFIG</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceType The type of service. Specify <b>SERVICE_NO_CHANGE</b> if you are not changing the existing service type; otherwise, specify one of the following service types.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_FILE_SYSTEM_DRIVER"></a><a id="service_file_system_driver"></a><dl>
     * <dt><b>SERVICE_FILE_SYSTEM_DRIVER</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File system driver service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_KERNEL_DRIVER"></a><a id="service_kernel_driver"></a><dl>
     * <dt><b>SERVICE_KERNEL_DRIVER</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_WIN32_OWN_PROCESS"></a><a id="service_win32_own_process"></a><dl>
     * <dt><b>SERVICE_WIN32_OWN_PROCESS</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service that runs in its own process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_WIN32_SHARE_PROCESS"></a><a id="service_win32_share_process"></a><dl>
     * <dt><b>SERVICE_WIN32_SHARE_PROCESS</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service that shares a process with other services.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If you specify either <b>SERVICE_WIN32_OWN_PROCESS</b> or <b>SERVICE_WIN32_SHARE_PROCESS</b>, and the service is running in the context of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a>, you can also specify the following type.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_INTERACTIVE_PROCESS"></a><a id="service_interactive_process"></a><dl>
     * <dt><b>SERVICE_INTERACTIVE_PROCESS</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service can interact with the desktop. 
     * 
     * 
     * 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/interactive-services">Interactive Services</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwStartType 
     * @param {Integer} dwErrorControl 
     * @param {PSTR} lpBinaryPathName The fully qualified path to the service binary file. Specify NULL if you are not changing the existing path. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"". 
     * 
     * 
     * 
     * 
     * The path can also include arguments for an auto-start service. For example, "d:\\myshare\\myservice.exe arg1 arg2". These arguments are passed to the service entry point (typically the <b>main</b> function).
     * 
     * If you specify a path on another computer, the share must be accessible by the computer account of the local computer because this is the security context used in the remote call. However, this requirement allows any potential vulnerabilities in the remote computer to affect the local computer. Therefore, it is best to use a local file.
     * @param {PSTR} lpLoadOrderGroup The  name of the load ordering group of which this service is a member. Specify NULL if you are not changing the existing group. Specify an empty string if the service does not belong to a group. 
     * 
     * 
     * 
     * 
     * The startup program uses load ordering groups to load groups of services in a specified order with respect to the other groups. The list of load ordering groups is contained in the <b>ServiceGroupOrder</b> value of the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control</b>
     * @param {Pointer<Integer>} lpdwTagId A pointer to a variable that receives a tag value that is unique in the group specified in the <i>lpLoadOrderGroup</i> parameter. Specify NULL if you are not changing the existing tag. 
     * 
     * 
     * 
     * 
     * You can use a tag for ordering service startup within a load ordering group by specifying a tag order vector in the <b>GroupOrderList</b> value of the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control</b>
     * 
     * Tags are only evaluated for driver services that have <b>SERVICE_BOOT_START</b> or <b>SERVICE_SYSTEM_START</b> start types.
     * @param {PSTR} lpDependencies A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service can be started. (Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group.) Specify NULL if you are not changing the existing dependencies. Specify an empty string if the service has no dependencies. 
     * 
     * 
     * 
     * 
     * You must prefix group names with SC_GROUP_IDENTIFIER so that they can be distinguished from a service name, because services and service groups share the same name space.
     * @param {PSTR} lpServiceStartName The name of the account under which the service should run. Specify <b>NULL</b> if you are not changing the existing account name. If the service type is <b>SERVICE_WIN32_OWN_PROCESS</b>, use an account name in the form <i>DomainName</i>&#92;<i>UserName</i>. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .&#92;<i>UserName</i> (note that the corresponding C/C++ string is ".&#92;&#92;<i>UserName</i>"). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-user-accounts">Service User Accounts</a> and the warning in the Remarks section. 
     * 
     * 
     * 
     * 						
     * 
     * A shared process can run as any user.
     * 
     * If the service type is <b>SERVICE_KERNEL_DRIVER</b> or <b>SERVICE_FILE_SYSTEM_DRIVER</b>, the name is the driver object name that the system uses to load the device driver. Specify <b>NULL</b> if the driver is to use a default object name created by the I/O system.
     * 
     * A service can be configured to use a managed account or a virtual  account. If the service is configured to use a managed service account, the name is the managed service account name. If the service is configured to use a virtual  account, specify the name as NT SERVICE&#92;<i>ServiceName</i>. For more information about managed service accounts and virtual accounts, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd548356(v=ws.10)">Service Accounts Step-by-Step Guide</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>Managed service accounts and virtual accounts are not supported until Windows 7 and Windows Server 2008 R2.
     * @param {PSTR} lpPassword The password to the account name specified by the <i>lpServiceStartName</i> parameter. Specify <b>NULL</b> if you are not changing the existing password. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-record-list">Service Record List</a>. 
     * 
     * 
     * 
     * 
     * If the account name specified by the  <i>lpServiceStartName</i> parameter is the name of  a managed service account or virtual account name, the <i>lpPassword</i> parameter must be <b>NULL</b>. 
     * 
     * Passwords are ignored for driver services.
     * @param {PSTR} lpDisplayName The display name to be used by applications to identify the service for its users. Specify <b>NULL</b> if you are not changing the existing display name; otherwise, this string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
     * 
     * This parameter can specify a localized string using the following format:
     * 
     * @[<i>path</i>\]<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadmuistringa">RegLoadMUIString</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Localized strings are not supported until Windows Vista.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes may be set by the service control manager. Other error codes may be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the <b>SERVICE_CHANGE_CONFIG</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CIRCULAR_DEPENDENCY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A circular service dependency was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUPLICATE_SERVICE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display name already exists in the service controller manager database, either as a service name or as another display name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter that was specified is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_ACCOUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The account name does not exist, or a service is specified to share the same binary file as an already installed service but with an account name that is not the same as the installed service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_MARKED_FOR_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has been marked for deletion.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-changeserviceconfiga
     * @since windows5.1.2600
     */
    static ChangeServiceConfigA(hService, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword, lpDisplayName) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService
        lpBinaryPathName := lpBinaryPathName is String ? StrPtr(lpBinaryPathName) : lpBinaryPathName
        lpLoadOrderGroup := lpLoadOrderGroup is String ? StrPtr(lpLoadOrderGroup) : lpLoadOrderGroup
        lpDependencies := lpDependencies is String ? StrPtr(lpDependencies) : lpDependencies
        lpServiceStartName := lpServiceStartName is String ? StrPtr(lpServiceStartName) : lpServiceStartName
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName

        lpdwTagIdMarshal := lpdwTagId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ChangeServiceConfigA", "ptr", hService, "uint", dwServiceType, "uint", dwStartType, "uint", dwErrorControl, "ptr", lpBinaryPathName, "ptr", lpLoadOrderGroup, lpdwTagIdMarshal, lpdwTagId, "ptr", lpDependencies, "ptr", lpServiceStartName, "ptr", lpPassword, "ptr", lpDisplayName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the configuration parameters of a service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the <b>SERVICE_CHANGE_CONFIG</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceType The type of service. Specify <b>SERVICE_NO_CHANGE</b> if you are not changing the existing service type; otherwise, specify one of the following service types.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_FILE_SYSTEM_DRIVER"></a><a id="service_file_system_driver"></a><dl>
     * <dt><b>SERVICE_FILE_SYSTEM_DRIVER</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * File system driver service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_KERNEL_DRIVER"></a><a id="service_kernel_driver"></a><dl>
     * <dt><b>SERVICE_KERNEL_DRIVER</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Driver service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_WIN32_OWN_PROCESS"></a><a id="service_win32_own_process"></a><dl>
     * <dt><b>SERVICE_WIN32_OWN_PROCESS</b></dt>
     * <dt>0x00000010</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service that runs in its own process.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_WIN32_SHARE_PROCESS"></a><a id="service_win32_share_process"></a><dl>
     * <dt><b>SERVICE_WIN32_SHARE_PROCESS</b></dt>
     * <dt>0x00000020</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Service that shares a process with other services.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * If you specify either <b>SERVICE_WIN32_OWN_PROCESS</b> or <b>SERVICE_WIN32_SHARE_PROCESS</b>, and the service is running in the context of the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a>, you can also specify the following type.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_INTERACTIVE_PROCESS"></a><a id="service_interactive_process"></a><dl>
     * <dt><b>SERVICE_INTERACTIVE_PROCESS</b></dt>
     * <dt>0x00000100</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service can interact with the desktop. 
     * 
     * 
     * 
     * 
     * For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/interactive-services">Interactive Services</a>.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwStartType 
     * @param {Integer} dwErrorControl 
     * @param {PWSTR} lpBinaryPathName The fully qualified path to the service binary file. Specify NULL if you are not changing the existing path. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"". 
     * 
     * 
     * 
     * 
     * The path can also include arguments for an auto-start service. For example, "d:\\myshare\\myservice.exe arg1 arg2". These arguments are passed to the service entry point (typically the <b>main</b> function).
     * 
     * If you specify a path on another computer, the share must be accessible by the computer account of the local computer because this is the security context used in the remote call. However, this requirement allows any potential vulnerabilities in the remote computer to affect the local computer. Therefore, it is best to use a local file.
     * @param {PWSTR} lpLoadOrderGroup The  name of the load ordering group of which this service is a member. Specify NULL if you are not changing the existing group. Specify an empty string if the service does not belong to a group. 
     * 
     * 
     * 
     * 
     * The startup program uses load ordering groups to load groups of services in a specified order with respect to the other groups. The list of load ordering groups is contained in the <b>ServiceGroupOrder</b> value of the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control</b>
     * @param {Pointer<Integer>} lpdwTagId A pointer to a variable that receives a tag value that is unique in the group specified in the <i>lpLoadOrderGroup</i> parameter. Specify NULL if you are not changing the existing tag. 
     * 
     * 
     * 
     * 
     * You can use a tag for ordering service startup within a load ordering group by specifying a tag order vector in the <b>GroupOrderList</b> value of the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control</b>
     * 
     * Tags are only evaluated for driver services that have <b>SERVICE_BOOT_START</b> or <b>SERVICE_SYSTEM_START</b> start types.
     * @param {PWSTR} lpDependencies A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service can be started. (Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group.) Specify NULL if you are not changing the existing dependencies. Specify an empty string if the service has no dependencies. 
     * 
     * 
     * 
     * 
     * You must prefix group names with SC_GROUP_IDENTIFIER so that they can be distinguished from a service name, because services and service groups share the same name space.
     * @param {PWSTR} lpServiceStartName The name of the account under which the service should run. Specify <b>NULL</b> if you are not changing the existing account name. If the service type is <b>SERVICE_WIN32_OWN_PROCESS</b>, use an account name in the form <i>DomainName</i>&#92;<i>UserName</i>. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .&#92;<i>UserName</i> (note that the corresponding C/C++ string is ".&#92;&#92;<i>UserName</i>"). For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-user-accounts">Service User Accounts</a> and the warning in the Remarks section. 
     * 
     * 
     * 
     * 						
     * 
     * A shared process can run as any user.
     * 
     * If the service type is <b>SERVICE_KERNEL_DRIVER</b> or <b>SERVICE_FILE_SYSTEM_DRIVER</b>, the name is the driver object name that the system uses to load the device driver. Specify <b>NULL</b> if the driver is to use a default object name created by the I/O system.
     * 
     * A service can be configured to use a managed account or a virtual  account. If the service is configured to use a managed service account, the name is the managed service account name. If the service is configured to use a virtual  account, specify the name as NT SERVICE&#92;<i>ServiceName</i>. For more information about managed service accounts and virtual accounts, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd548356(v=ws.10)">Service Accounts Step-by-Step Guide</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>Managed service accounts and virtual accounts are not supported until Windows 7 and Windows Server 2008 R2.
     * @param {PWSTR} lpPassword The password to the account name specified by the <i>lpServiceStartName</i> parameter. Specify <b>NULL</b> if you are not changing the existing password. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-record-list">Service Record List</a>. 
     * 
     * 
     * 
     * 
     * If the account name specified by the  <i>lpServiceStartName</i> parameter is the name of  a managed service account or virtual account name, the <i>lpPassword</i> parameter must be <b>NULL</b>. 
     * 
     * Passwords are ignored for driver services.
     * @param {PWSTR} lpDisplayName The display name to be used by applications to identify the service for its users. Specify <b>NULL</b> if you are not changing the existing display name; otherwise, this string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
     * 
     * This parameter can specify a localized string using the following format:
     * 
     * @[<i>path</i>\]<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadmuistringa">RegLoadMUIString</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Localized strings are not supported until Windows Vista.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes may be set by the service control manager. Other error codes may be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the <b>SERVICE_CHANGE_CONFIG</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CIRCULAR_DEPENDENCY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A circular service dependency was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUPLICATE_SERVICE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display name already exists in the service controller manager database, either as a service name or as another display name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter that was specified is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_ACCOUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The account name does not exist, or a service is specified to share the same binary file as an already installed service but with an account name that is not the same as the installed service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_MARKED_FOR_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has been marked for deletion.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-changeserviceconfigw
     * @since windows5.1.2600
     */
    static ChangeServiceConfigW(hService, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword, lpDisplayName) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService
        lpBinaryPathName := lpBinaryPathName is String ? StrPtr(lpBinaryPathName) : lpBinaryPathName
        lpLoadOrderGroup := lpLoadOrderGroup is String ? StrPtr(lpLoadOrderGroup) : lpLoadOrderGroup
        lpDependencies := lpDependencies is String ? StrPtr(lpDependencies) : lpDependencies
        lpServiceStartName := lpServiceStartName is String ? StrPtr(lpServiceStartName) : lpServiceStartName
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName

        lpdwTagIdMarshal := lpdwTagId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ChangeServiceConfigW", "ptr", hService, "uint", dwServiceType, "uint", dwStartType, "uint", dwErrorControl, "ptr", lpBinaryPathName, "ptr", lpLoadOrderGroup, lpdwTagIdMarshal, lpdwTagId, "ptr", lpDependencies, "ptr", lpServiceStartName, "ptr", lpPassword, "ptr", lpDisplayName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the optional configuration parameters of a service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the <b>SERVICE_CHANGE_CONFIG</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * If the service controller handles the <b>SC_ACTION_RESTART</b> action, <i>hService</i> must have the <b>SERVICE_START</b> access right.
     * @param {Integer} dwInfoLevel 
     * @param {Pointer<Void>} lpInfo A pointer to the new value to be set for the configuration information. The format of this data depends on the value of the <i>dwInfoLevel</i> parameter. If this value is <b>NULL</b>, the information remains unchanged.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-changeserviceconfig2a
     * @since windows5.1.2600
     */
    static ChangeServiceConfig2A(hService, dwInfoLevel, lpInfo) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        lpInfoMarshal := lpInfo is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ChangeServiceConfig2A", "ptr", hService, "uint", dwInfoLevel, lpInfoMarshal, lpInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the optional configuration parameters of a service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the <b>SERVICE_CHANGE_CONFIG</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * If the service controller handles the <b>SC_ACTION_RESTART</b> action, <i>hService</i> must have the <b>SERVICE_START</b> access right.
     * @param {Integer} dwInfoLevel 
     * @param {Pointer<Void>} lpInfo A pointer to the new value to be set for the configuration information. The format of this data depends on the value of the <i>dwInfoLevel</i> parameter. If this value is <b>NULL</b>, the information remains unchanged.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-changeserviceconfig2w
     * @since windows5.1.2600
     */
    static ChangeServiceConfig2W(hService, dwInfoLevel, lpInfo) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        lpInfoMarshal := lpInfo is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ChangeServiceConfig2W", "ptr", hService, "uint", dwInfoLevel, lpInfoMarshal, lpInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes a handle to a service control manager or service object.
     * @param {SC_HANDLE} hSCObject A handle to the service control manager object or the service object to close. Handles to service control manager objects are returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and handles to service objects are returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error code can be set by the service control manager. Other error codes can be set by registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-closeservicehandle
     * @since windows5.1.2600
     */
    static CloseServiceHandle(hSCObject) {
        hSCObject := hSCObject is Win32Handle ? NumGet(hSCObject, "ptr") : hSCObject

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CloseServiceHandle", "ptr", hSCObject, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends a control code to a service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     *       <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The 
     *       <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">access rights</a> required for this handle 
     *       depend on the <i>dwControl</i> code requested.
     * @param {Integer} dwControl This parameter can be one of the following control codes.
     * 
     * <table>
     * <tr>
     * <th>Control code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_CONTINUE"></a><a id="service_control_continue"></a><dl>
     * <dt><b>SERVICE_CONTROL_CONTINUE</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a paused service that it should resume. The <i>hService</i> handle must have 
     *         the <b>SERVICE_PAUSE_CONTINUE</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_INTERROGATE"></a><a id="service_control_interrogate"></a><dl>
     * <dt><b>SERVICE_CONTROL_INTERROGATE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that it should report its current status information to the service control manager. 
     *         The <i>hService</i> handle must have the <b>SERVICE_INTERROGATE</b> 
     *         access right.
     *         
     * 
     * Note that this control is not generally useful as the SCM is aware of the current state of the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDADD"></a><a id="service_control_netbindadd"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDADD</b></dt>
     * <dt>0x00000007</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a network service that there is a new component for binding. The 
     *         <i>hService</i> handle must have the <b>SERVICE_PAUSE_CONTINUE</b> 
     *         access right. However, this control code has been deprecated; use Plug and Play functionality instead.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDDISABLE"></a><a id="service_control_netbinddisable"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDDISABLE</b></dt>
     * <dt>0x0000000A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a network service that one of its bindings has been disabled. The 
     *         <i>hService</i> handle must have the <b>SERVICE_PAUSE_CONTINUE</b> 
     *         access right. However, this control code has been deprecated; use Plug and Play functionality instead.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDENABLE"></a><a id="service_control_netbindenable"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDENABLE</b></dt>
     * <dt>0x00000009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a network service that a disabled binding has been enabled. The 
     *         <i>hService</i> handle must have the <b>SERVICE_PAUSE_CONTINUE</b> 
     *         access right. However, this control code has been deprecated; use Plug and Play functionality instead.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDREMOVE"></a><a id="service_control_netbindremove"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDREMOVE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a network service that a component for binding has been removed. The 
     *         <i>hService</i> handle must have the <b>SERVICE_PAUSE_CONTINUE</b> 
     *         access right. However, this control code has been deprecated; use Plug and Play functionality instead.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_PARAMCHANGE"></a><a id="service_control_paramchange"></a><dl>
     * <dt><b>SERVICE_CONTROL_PARAMCHANGE</b></dt>
     * <dt>0x00000006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that its startup parameters have changed. The <i>hService</i> 
     *         handle must have the <b>SERVICE_PAUSE_CONTINUE</b> access right.
     *         
     *        
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_PAUSE"></a><a id="service_control_pause"></a><dl>
     * <dt><b>SERVICE_CONTROL_PAUSE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that it should pause. The <i>hService</i> handle must have the 
     *         <b>SERVICE_PAUSE_CONTINUE</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_STOP"></a><a id="service_control_stop"></a><dl>
     * <dt><b>SERVICE_CONTROL_STOP</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that it should stop. The <i>hService</i> handle must have the 
     *         <b>SERVICE_STOP</b> access right.
     *         
     * 
     * After sending the stop request to a service, you should not send other controls to the service.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This value can also be a user-defined control code, as described in the following table.
     * 
     * <table>
     * <tr>
     * <th>Control code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>Range 128 to 255</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service defines the action associated with the control code. The <i>hService</i> 
     *         handle must have the <b>SERVICE_USER_DEFINED_CONTROL</b> access right.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<SERVICE_STATUS>} lpServiceStatus A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status">SERVICE_STATUS</a> structure that 
     *       receives the latest service status information. The information returned reflects the most recent status that 
     *       the service reported to the service control manager.
     *       
     * 
     * The service control manager fills in the structure only when 
     *        [GetLastError](/windows/win32/api/errhandlingapi/nf-errhandlingapi-getlasterror) returns one of the following error 
     *        codes: <b>NO_ERROR</b>, <b>ERROR_INVALID_SERVICE_CONTROL</b>, 
     *        <b>ERROR_SERVICE_CANNOT_ACCEPT_CTRL</b>, or 
     *        <b>ERROR_SERVICE_NOT_ACTIVE</b>. Otherwise, the structure is not filled in.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the 
     *        registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the required access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEPENDENT_SERVICES_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service cannot be stopped because other running services are dependent on it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle was not obtained using 
     *         <a href="/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> or 
     *         <a href="/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a>, or the handle is no longer 
     *         valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code is undefined.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_CONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code is not valid, or it is unacceptable to the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_CANNOT_ACCEPT_CTRL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code cannot be sent to the service because the state of the service is 
     *         <b>SERVICE_STOPPED</b>, <b>SERVICE_START_PENDING</b>, or 
     *         <b>SERVICE_STOP_PENDING</b>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_REQUEST_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process for the service was started, but it did not call 
     *         <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the 
     *         thread that called 
     *         <b>StartServiceCtrlDispatcher</b> may be 
     *         blocked in a control handler function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is shutting down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-controlservice
     * @since windows5.1.2600
     */
    static ControlService(hService, dwControl, lpServiceStatus) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ControlService", "ptr", hService, "uint", dwControl, "ptr", lpServiceStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a service object and adds it to the specified service control manager database.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function and must have the <b>SC_MANAGER_CREATE_SERVICE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {PSTR} lpServiceName The name of the service to install. The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are not valid service name characters.
     * @param {PSTR} lpDisplayName The display name to be used by user interface programs to identify the service. This string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
     * @param {Integer} dwDesiredAccess The access to the service. Before granting the requested access, the system checks the access token of the calling process. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceType 
     * @param {Integer} dwStartType 
     * @param {Integer} dwErrorControl 
     * @param {PSTR} lpBinaryPathName The fully qualified path to the service binary file. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"". 
     * 
     * 
     * 
     * 
     * The path can also include arguments for an auto-start service. For example, "d:\\myshare\\myservice.exe arg1 arg2". These arguments are passed to the service entry point (typically the <b>main</b> function).
     * 
     * If you specify a path on another computer, the share must be accessible by the computer account of the local computer because this is the security context used in the remote call. However, this requirement allows any potential vulnerabilities in the remote computer to affect the local computer. Therefore, it is best to use a local file.
     * @param {PSTR} lpLoadOrderGroup The names of the load ordering group of which this service is a member. Specify NULL or an empty string if the service does not belong to a group. 
     * 
     * 
     * 
     * 
     * The startup program uses load ordering groups to load groups of services in a specified order with respect to the other groups. The list of load ordering groups is contained in the following registry value: <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ServiceGroupOrder</b>
     * @param {Pointer<Integer>} lpdwTagId A pointer to a variable that receives a tag value that is unique in the group specified in the <i>lpLoadOrderGroup</i> parameter. Specify NULL if you are not changing the existing tag. 
     * 
     * 
     * 
     * 
     * You can use a tag for ordering service startup within a load ordering group by specifying a tag order vector in the following registry value:<b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\GroupOrderList</b>
     * 
     * 
     * 
     * Tags are only evaluated for driver services that have <b>SERVICE_BOOT_START</b> or <b>SERVICE_SYSTEM_START</b> start types.
     * @param {PSTR} lpDependencies A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service. Specify NULL or an empty string if the service has no dependencies. Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group. 
     * 
     * 
     * 
     * 
     * You must prefix group names with <b>SC_GROUP_IDENTIFIER</b> so that they can be distinguished from a service name, because services and service groups share the same name space.
     * @param {PSTR} lpServiceStartName The name of the account under which the service should run. If the service type is SERVICE_WIN32_OWN_PROCESS, use an account name in the form <i>DomainName</i>&#92;<i>UserName</i>. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .&#92;<i>UserName</i>. 
     * 
     * 
     * 
     * 
     * If this parameter is NULL, 
     * <b>CreateService</b> uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a>. If the service type specifies <b>SERVICE_INTERACTIVE_PROCESS</b>, the service must run in the LocalSystem account.
     * 
     * If this parameter is NT AUTHORITY\LocalService, 
     * <b>CreateService</b> uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/localservice-account">LocalService account</a>. If the parameter is NT AUTHORITY\NetworkService, 
     * <b>CreateService</b> uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>.
     * 
     * A shared process can run as any user.
     * 
     * If the service type is <b>SERVICE_KERNEL_DRIVER</b> or <b>SERVICE_FILE_SYSTEM_DRIVER</b>, the name is the driver object name that the system uses to load the device driver. Specify NULL if the driver is to use a default object name created by the I/O system.
     * 
     * A service can be configured to use a managed account or a virtual  account. If the service is configured to use a managed service account, the name is the managed service account name. If the service is configured to use a virtual  account, specify the name as NT SERVICE&#92;<i>ServiceName</i>. For more information about managed service accounts and virtual accounts, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd548356(v=ws.10)">Service Accounts Step-by-Step Guide</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>Managed service accounts and virtual accounts are not supported until Windows 7 and Windows Server 2008 R2.
     * @param {PSTR} lpPassword The password to the account name specified by the <i>lpServiceStartName</i> parameter. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-record-list">Service Record List</a>. 
     * 
     * 
     * 
     * 
     * If the account name specified by the  <i>lpServiceStartName</i> parameter is the name of  a managed service account or virtual account name, the <i>lpPassword</i> parameter must be NULL. 
     * 
     * Passwords are ignored for driver services.
     * @returns {SC_HANDLE} If the function succeeds, the return value is a handle to the service.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the SCM database does not have the <b>SC_MANAGER_CREATE_SERVICE</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CIRCULAR_DEPENDENCY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A circular service dependency was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUPLICATE_SERVICE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display name already exists in the service control manager database either as a service name or as another display name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the specified service control manager database is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter that was specified is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_ACCOUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account name specified in the <i>lpServiceStartName</i> parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service already exists in this database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_MARKED_FOR_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service already exists in this database and has been marked for deletion.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-createservicea
     * @since windows5.1.2600
     */
    static CreateServiceA(hSCManager, lpServiceName, lpDisplayName, dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName
        lpBinaryPathName := lpBinaryPathName is String ? StrPtr(lpBinaryPathName) : lpBinaryPathName
        lpLoadOrderGroup := lpLoadOrderGroup is String ? StrPtr(lpLoadOrderGroup) : lpLoadOrderGroup
        lpDependencies := lpDependencies is String ? StrPtr(lpDependencies) : lpDependencies
        lpServiceStartName := lpServiceStartName is String ? StrPtr(lpServiceStartName) : lpServiceStartName
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword

        lpdwTagIdMarshal := lpdwTagId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateServiceA", "ptr", hSCManager, "ptr", lpServiceName, "ptr", lpDisplayName, "uint", dwDesiredAccess, "uint", dwServiceType, "uint", dwStartType, "uint", dwErrorControl, "ptr", lpBinaryPathName, "ptr", lpLoadOrderGroup, lpdwTagIdMarshal, lpdwTagId, "ptr", lpDependencies, "ptr", lpServiceStartName, "ptr", lpPassword, "ptr")
        if(A_LastError)
            throw OSError()

        return SC_HANDLE({Value: result}, True)
    }

    /**
     * Creates a service object and adds it to the specified service control manager database.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function and must have the <b>SC_MANAGER_CREATE_SERVICE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {PWSTR} lpServiceName The name of the service to install. The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are not valid service name characters.
     * @param {PWSTR} lpDisplayName The display name to be used by user interface programs to identify the service. This string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
     * @param {Integer} dwDesiredAccess The access to the service. Before granting the requested access, the system checks the access token of the calling process. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceType 
     * @param {Integer} dwStartType 
     * @param {Integer} dwErrorControl 
     * @param {PWSTR} lpBinaryPathName The fully qualified path to the service binary file. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"". 
     * 
     * 
     * 
     * 
     * The path can also include arguments for an auto-start service. For example, "d:\\myshare\\myservice.exe arg1 arg2". These arguments are passed to the service entry point (typically the <b>main</b> function).
     * 
     * If you specify a path on another computer, the share must be accessible by the computer account of the local computer because this is the security context used in the remote call. However, this requirement allows any potential vulnerabilities in the remote computer to affect the local computer. Therefore, it is best to use a local file.
     * @param {PWSTR} lpLoadOrderGroup The names of the load ordering group of which this service is a member. Specify NULL or an empty string if the service does not belong to a group. 
     * 
     * 
     * 
     * 
     * The startup program uses load ordering groups to load groups of services in a specified order with respect to the other groups. The list of load ordering groups is contained in the following registry value: <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ServiceGroupOrder</b>
     * @param {Pointer<Integer>} lpdwTagId A pointer to a variable that receives a tag value that is unique in the group specified in the <i>lpLoadOrderGroup</i> parameter. Specify NULL if you are not changing the existing tag. 
     * 
     * 
     * 
     * 
     * You can use a tag for ordering service startup within a load ordering group by specifying a tag order vector in the following registry value:<b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\GroupOrderList</b>
     * 
     * 
     * 
     * Tags are only evaluated for driver services that have <b>SERVICE_BOOT_START</b> or <b>SERVICE_SYSTEM_START</b> start types.
     * @param {PWSTR} lpDependencies A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service. Specify NULL or an empty string if the service has no dependencies. Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group. 
     * 
     * 
     * 
     * 
     * You must prefix group names with <b>SC_GROUP_IDENTIFIER</b> so that they can be distinguished from a service name, because services and service groups share the same name space.
     * @param {PWSTR} lpServiceStartName The name of the account under which the service should run. If the service type is SERVICE_WIN32_OWN_PROCESS, use an account name in the form <i>DomainName</i>&#92;<i>UserName</i>. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .&#92;<i>UserName</i>. 
     * 
     * 
     * 
     * 
     * If this parameter is NULL, 
     * <b>CreateService</b> uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a>. If the service type specifies <b>SERVICE_INTERACTIVE_PROCESS</b>, the service must run in the LocalSystem account.
     * 
     * If this parameter is NT AUTHORITY\LocalService, 
     * <b>CreateService</b> uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/localservice-account">LocalService account</a>. If the parameter is NT AUTHORITY\NetworkService, 
     * <b>CreateService</b> uses the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/networkservice-account">NetworkService account</a>.
     * 
     * A shared process can run as any user.
     * 
     * If the service type is <b>SERVICE_KERNEL_DRIVER</b> or <b>SERVICE_FILE_SYSTEM_DRIVER</b>, the name is the driver object name that the system uses to load the device driver. Specify NULL if the driver is to use a default object name created by the I/O system.
     * 
     * A service can be configured to use a managed account or a virtual  account. If the service is configured to use a managed service account, the name is the managed service account name. If the service is configured to use a virtual  account, specify the name as NT SERVICE&#92;<i>ServiceName</i>. For more information about managed service accounts and virtual accounts, see the <a href="https://docs.microsoft.com/previous-versions/windows/it-pro/windows-server-2008-R2-and-2008/dd548356(v=ws.10)">Service Accounts Step-by-Step Guide</a>.
     * 
     * <b>Windows Server 2008, Windows Vista, Windows Server 2003 and Windows XP:  </b>Managed service accounts and virtual accounts are not supported until Windows 7 and Windows Server 2008 R2.
     * @param {PWSTR} lpPassword The password to the account name specified by the <i>lpServiceStartName</i> parameter. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-record-list">Service Record List</a>. 
     * 
     * 
     * 
     * 
     * If the account name specified by the  <i>lpServiceStartName</i> parameter is the name of  a managed service account or virtual account name, the <i>lpPassword</i> parameter must be NULL. 
     * 
     * Passwords are ignored for driver services.
     * @returns {SC_HANDLE} If the function succeeds, the return value is a handle to the service.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the SCM database does not have the <b>SC_MANAGER_CREATE_SERVICE</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_CIRCULAR_DEPENDENCY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A circular service dependency was specified.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DUPLICATE_SERVICE_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The display name already exists in the service control manager database either as a service name or as another display name.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle to the specified service control manager database is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter that was specified is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_ACCOUNT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user account name specified in the <i>lpServiceStartName</i> parameter does not exist.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_EXISTS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service already exists in this database.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_MARKED_FOR_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service already exists in this database and has been marked for deletion.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-createservicew
     * @since windows5.1.2600
     */
    static CreateServiceW(hSCManager, lpServiceName, lpDisplayName, dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName
        lpBinaryPathName := lpBinaryPathName is String ? StrPtr(lpBinaryPathName) : lpBinaryPathName
        lpLoadOrderGroup := lpLoadOrderGroup is String ? StrPtr(lpLoadOrderGroup) : lpLoadOrderGroup
        lpDependencies := lpDependencies is String ? StrPtr(lpDependencies) : lpDependencies
        lpServiceStartName := lpServiceStartName is String ? StrPtr(lpServiceStartName) : lpServiceStartName
        lpPassword := lpPassword is String ? StrPtr(lpPassword) : lpPassword

        lpdwTagIdMarshal := lpdwTagId is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateServiceW", "ptr", hSCManager, "ptr", lpServiceName, "ptr", lpDisplayName, "uint", dwDesiredAccess, "uint", dwServiceType, "uint", dwStartType, "uint", dwErrorControl, "ptr", lpBinaryPathName, "ptr", lpLoadOrderGroup, lpdwTagIdMarshal, lpdwTagId, "ptr", lpDependencies, "ptr", lpServiceStartName, "ptr", lpPassword, "ptr")
        if(A_LastError)
            throw OSError()

        return SC_HANDLE({Value: result}, True)
    }

    /**
     * Marks the specified service for deletion from the service control manager database.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the DELETE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes may be set by the service control manager. Others may be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the DELETE access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_MARKED_FOR_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service has already been marked for deletion.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-deleteservice
     * @since windows5.1.2600
     */
    static DeleteService(hService) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\DeleteService", "ptr", hService, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name and status of each service that depends on the specified service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the <b>SERVICE_ENUMERATE_DEPENDENTS</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceState 
     * @param {Pointer} lpServices A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-enum_service_statusa">ENUM_SERVICE_STATUS</a> structures that receives the name and service status information for each dependent service in the database. The buffer must be large enough to hold the structures, plus the strings to which their members point.
     * 
     * The order of the services in this array is the reverse of the start order of the services. In other words, the first service in the array is the one that would be started last, and the last service in the array is the one that would be started first.
     * 
     * The maximum size of this array is 64,000 bytes. To determine the required size, specify <b>NULL</b> for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_MORE_DATA</b>. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServices</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store the array of service entries. The variable only receives this value if the buffer pointed to by <i>lpServices</i> is too small, indicated by function failure and the <b>ERROR_MORE_DATA</b> error; otherwise, the contents of <i>pcbBytesNeeded</i> are undefined.
     * @param {Pointer<Integer>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes may be set by the service control manager. Other error codes may be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the <b>SERVICE_ENUMERATE_DEPENDENTS</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter that was specified is invalid.
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
     * The buffer pointed to by <i>lpServices</i> is not large enough. The function sets the variable pointed to by <i>lpServicesReturned</i> to the actual number of service entries stored into the buffer. The function sets the variable pointed to by <i>pcbBytesNeeded</i> to the number of bytes required to store all of the service entries.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-enumdependentservicesa
     * @since windows5.1.2600
     */
    static EnumDependentServicesA(hService, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"
        lpServicesReturnedMarshal := lpServicesReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumDependentServicesA", "ptr", hService, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, lpServicesReturnedMarshal, lpServicesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name and status of each service that depends on the specified service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the <b>SERVICE_ENUMERATE_DEPENDENTS</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceState 
     * @param {Pointer} lpServices A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-enum_service_statusa">ENUM_SERVICE_STATUS</a> structures that receives the name and service status information for each dependent service in the database. The buffer must be large enough to hold the structures, plus the strings to which their members point.
     * 
     * The order of the services in this array is the reverse of the start order of the services. In other words, the first service in the array is the one that would be started last, and the last service in the array is the one that would be started first.
     * 
     * The maximum size of this array is 64,000 bytes. To determine the required size, specify <b>NULL</b> for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_MORE_DATA</b>. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServices</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store the array of service entries. The variable only receives this value if the buffer pointed to by <i>lpServices</i> is too small, indicated by function failure and the <b>ERROR_MORE_DATA</b> error; otherwise, the contents of <i>pcbBytesNeeded</i> are undefined.
     * @param {Pointer<Integer>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes may be set by the service control manager. Other error codes may be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the <b>SERVICE_ENUMERATE_DEPENDENTS</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter that was specified is invalid.
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
     * The buffer pointed to by <i>lpServices</i> is not large enough. The function sets the variable pointed to by <i>lpServicesReturned</i> to the actual number of service entries stored into the buffer. The function sets the variable pointed to by <i>pcbBytesNeeded</i> to the number of bytes required to store all of the service entries.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-enumdependentservicesw
     * @since windows5.1.2600
     */
    static EnumDependentServicesW(hService, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"
        lpServicesReturnedMarshal := lpServicesReturned is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumDependentServicesW", "ptr", hService, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, lpServicesReturnedMarshal, lpServicesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates services in the specified service control manager database. The name and status of each service are provided.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and must have the SC_MANAGER_ENUMERATE_SERVICE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceType 
     * @param {Integer} dwServiceState 
     * @param {Pointer} lpServices A pointer to a buffer that contains an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-enum_service_statusa">ENUM_SERVICE_STATUS</a> structures that receive the name and service status information for each service in the database. The buffer must be large enough to hold the structures, plus the strings to which their members point.
     * 
     * The maximum size of this array is 256K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return ERROR_INSUFFICIENT_BUFFER. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The maximum size of this array is 64K bytes. This limit was increased as of Windows Server 2003 with SP1 and Windows XP with SP2.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServices</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
     * @param {Pointer<Integer>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @param {Pointer<Integer>} lpResumeHandle A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time this function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns ERROR_MORE_DATA, this value is used to indicate the next service entry to be read when the function is called to retrieve the additional data.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SC_MANAGER_ENUMERATE_SERVICE access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter that was specified is invalid.
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
     * There are more service entries than would fit into the <i>lpServices</i> buffer. The actual number of service entries written to <i>lpServices</i> is returned in the <i>lpServicesReturned</i> parameter. The number of bytes required to get the remaining entries is returned in the <i>pcbBytesNeeded</i> parameter. The remaining services can be enumerated by additional calls to 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-enumservicesstatusa">EnumServicesStatus</a> with the <i>lpResumeHandle</i> parameter indicating the next service to read.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-enumservicesstatusa
     * @since windows5.1.2600
     */
    static EnumServicesStatusA(hSCManager, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"
        lpServicesReturnedMarshal := lpServicesReturned is VarRef ? "uint*" : "ptr"
        lpResumeHandleMarshal := lpResumeHandle is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumServicesStatusA", "ptr", hSCManager, "uint", dwServiceType, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, lpServicesReturnedMarshal, lpServicesReturned, lpResumeHandleMarshal, lpResumeHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates services in the specified service control manager database. The name and status of each service are provided.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and must have the SC_MANAGER_ENUMERATE_SERVICE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceType 
     * @param {Integer} dwServiceState 
     * @param {Pointer} lpServices A pointer to a buffer that contains an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-enum_service_statusa">ENUM_SERVICE_STATUS</a> structures that receive the name and service status information for each service in the database. The buffer must be large enough to hold the structures, plus the strings to which their members point.
     * 
     * The maximum size of this array is 256K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return ERROR_INSUFFICIENT_BUFFER. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The maximum size of this array is 64K bytes. This limit was increased as of Windows Server 2003 with SP1 and Windows XP with SP2.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServices</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
     * @param {Pointer<Integer>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @param {Pointer<Integer>} lpResumeHandle A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time this function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns ERROR_MORE_DATA, this value is used to indicate the next service entry to be read when the function is called to retrieve the additional data.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SC_MANAGER_ENUMERATE_SERVICE access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A parameter that was specified is invalid.
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
     * There are more service entries than would fit into the <i>lpServices</i> buffer. The actual number of service entries written to <i>lpServices</i> is returned in the <i>lpServicesReturned</i> parameter. The number of bytes required to get the remaining entries is returned in the <i>pcbBytesNeeded</i> parameter. The remaining services can be enumerated by additional calls to 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-enumservicesstatusa">EnumServicesStatus</a> with the <i>lpResumeHandle</i> parameter indicating the next service to read.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-enumservicesstatusw
     * @since windows5.1.2600
     */
    static EnumServicesStatusW(hSCManager, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"
        lpServicesReturnedMarshal := lpServicesReturned is VarRef ? "uint*" : "ptr"
        lpResumeHandleMarshal := lpResumeHandle is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumServicesStatusW", "ptr", hSCManager, "uint", dwServiceType, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, lpServicesReturnedMarshal, lpServicesReturned, lpResumeHandleMarshal, lpResumeHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates services in the specified service control manager database. The name and status of each service are provided, along with additional data based on the specified information level.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and must have the <b>SC_MANAGER_ENUMERATE_SERVICE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} InfoLevel The service attributes that are to be returned. Use <b>SC_ENUM_PROCESS_INFO</b> to retrieve the name and service status information for each service in the database. The <i>lpServices</i> parameter is a pointer to a buffer that receives an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-enum_service_status_processa">ENUM_SERVICE_STATUS_PROCESS</a> structures. The buffer must be large enough to hold the structures as well as the strings to which their members point.
     * 
     * Currently, no other information levels are defined.
     * @param {Integer} dwServiceType 
     * @param {Integer} dwServiceState 
     * @param {Pointer} lpServices A pointer to the buffer that receives the status information. The format of this data depends on the value of the <i>InfoLevel</i> parameter.
     * 
     * The maximum size of this array is 256K bytes. To determine the required size, specify <b>NULL</b> for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_MORE_DATA</b>. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The maximum size of this array is 64K bytes. This limit was increased as of Windows Server 2003 with SP1 and Windows XP with SP2.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServices</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
     * @param {Pointer<Integer>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @param {Pointer<Integer>} lpResumeHandle A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time the 
     * <b>EnumServicesStatusEx</b> function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_MORE_DATA</b>, this value indicates the next service entry to be read when the 
     * <b>EnumServicesStatusEx</b> function is called to retrieve the additional data.
     * @param {PSTR} pszGroupName The load-order group name. If this parameter is a string, the only services enumerated are those that belong to the group that has the name specified by the string. If this parameter is an empty string, only services that do not belong to any group are enumerated. If this parameter is <b>NULL</b>, group membership is ignored and all services are enumerated.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following errors may be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the <b>SC_MANAGER_ENUMERATE_SERVICE</b> access right.
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
     * The buffer is too small. Not all data in the active database could be returned. The <i>pcbBytesNeeded</i> parameter contains the number of bytes required to receive the remaining entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An illegal parameter value was used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>InfoLevel</i> parameter contains an unsupported value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is shutting down; this function cannot be called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-enumservicesstatusexa
     * @since windows5.1.2600
     */
    static EnumServicesStatusExA(hSCManager, InfoLevel, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle, pszGroupName) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        pszGroupName := pszGroupName is String ? StrPtr(pszGroupName) : pszGroupName

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"
        lpServicesReturnedMarshal := lpServicesReturned is VarRef ? "uint*" : "ptr"
        lpResumeHandleMarshal := lpResumeHandle is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumServicesStatusExA", "ptr", hSCManager, "int", InfoLevel, "uint", dwServiceType, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, lpServicesReturnedMarshal, lpServicesReturned, lpResumeHandleMarshal, lpResumeHandle, "ptr", pszGroupName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates services in the specified service control manager database. The name and status of each service are provided, along with additional data based on the specified information level.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and must have the <b>SC_MANAGER_ENUMERATE_SERVICE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} InfoLevel The service attributes that are to be returned. Use <b>SC_ENUM_PROCESS_INFO</b> to retrieve the name and service status information for each service in the database. The <i>lpServices</i> parameter is a pointer to a buffer that receives an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-enum_service_status_processa">ENUM_SERVICE_STATUS_PROCESS</a> structures. The buffer must be large enough to hold the structures as well as the strings to which their members point.
     * 
     * Currently, no other information levels are defined.
     * @param {Integer} dwServiceType 
     * @param {Integer} dwServiceState 
     * @param {Pointer} lpServices A pointer to the buffer that receives the status information. The format of this data depends on the value of the <i>InfoLevel</i> parameter.
     * 
     * The maximum size of this array is 256K bytes. To determine the required size, specify <b>NULL</b> for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_MORE_DATA</b>. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>The maximum size of this array is 64K bytes. This limit was increased as of Windows Server 2003 with SP1 and Windows XP with SP2.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServices</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
     * @param {Pointer<Integer>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @param {Pointer<Integer>} lpResumeHandle A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time the 
     * <b>EnumServicesStatusEx</b> function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_MORE_DATA</b>, this value indicates the next service entry to be read when the 
     * <b>EnumServicesStatusEx</b> function is called to retrieve the additional data.
     * @param {PWSTR} pszGroupName The load-order group name. If this parameter is a string, the only services enumerated are those that belong to the group that has the name specified by the string. If this parameter is an empty string, only services that do not belong to any group are enumerated. If this parameter is <b>NULL</b>, group membership is ignored and all services are enumerated.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following errors may be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the <b>SC_MANAGER_ENUMERATE_SERVICE</b> access right.
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
     * The buffer is too small. Not all data in the active database could be returned. The <i>pcbBytesNeeded</i> parameter contains the number of bytes required to receive the remaining entries.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An illegal parameter value was used.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>InfoLevel</i> parameter contains an unsupported value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is shutting down; this function cannot be called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-enumservicesstatusexw
     * @since windows5.1.2600
     */
    static EnumServicesStatusExW(hSCManager, InfoLevel, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle, pszGroupName) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        pszGroupName := pszGroupName is String ? StrPtr(pszGroupName) : pszGroupName

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"
        lpServicesReturnedMarshal := lpServicesReturned is VarRef ? "uint*" : "ptr"
        lpResumeHandleMarshal := lpResumeHandle is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumServicesStatusExW", "ptr", hSCManager, "int", InfoLevel, "uint", dwServiceType, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, lpServicesReturnedMarshal, lpServicesReturned, lpResumeHandleMarshal, lpResumeHandle, "ptr", pszGroupName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the service name of the specified service.
     * @param {SC_HANDLE} hSCManager A handle to the computer's service control manager database, as returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a>.
     * @param {PSTR} lpDisplayName The service display name. This string has a maximum length of 256 characters.
     * @param {PSTR} lpServiceName A pointer to a buffer that receives the service name. If the function fails, this buffer will contain an empty string.
     * 
     * The maximum size of this array is 4K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>lpcchBuffer</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>lpcchBuffer</i> parameter will receive the required size.
     * @param {Pointer<Integer>} lpcchBuffer A pointer to variable that specifies the size of the buffer pointed to by the <i>lpServiceName</i> parameter, in <b>TCHARs</b>. When the function returns, this parameter contains the size of the service name, in <b>TCHARs</b>, excluding the null-terminating character.
     * 
     * If the buffer pointed to by <i>lpServiceName</i> is too small to contain the service name, the function stores no data in it. When the function returns, <i>lpcchBuffer</i> contains the size of the service name, excluding the NULL terminator.
     * @returns {BOOL} If the functions succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-getservicekeynamea
     * @since windows5.1.2600
     */
    static GetServiceKeyNameA(hSCManager, lpDisplayName, lpServiceName, lpcchBuffer) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName

        lpcchBufferMarshal := lpcchBuffer is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetServiceKeyNameA", "ptr", hSCManager, "ptr", lpDisplayName, "ptr", lpServiceName, lpcchBufferMarshal, lpcchBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the service name of the specified service.
     * @param {SC_HANDLE} hSCManager A handle to the computer's service control manager database, as returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a>.
     * @param {PWSTR} lpDisplayName The service display name. This string has a maximum length of 256 characters.
     * @param {PWSTR} lpServiceName A pointer to a buffer that receives the service name. If the function fails, this buffer will contain an empty string.
     * 
     * The maximum size of this array is 4K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>lpcchBuffer</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>lpcchBuffer</i> parameter will receive the required size.
     * @param {Pointer<Integer>} lpcchBuffer A pointer to variable that specifies the size of the buffer pointed to by the <i>lpServiceName</i> parameter, in <b>TCHARs</b>. When the function returns, this parameter contains the size of the service name, in <b>TCHARs</b>, excluding the null-terminating character.
     * 
     * If the buffer pointed to by <i>lpServiceName</i> is too small to contain the service name, the function stores no data in it. When the function returns, <i>lpcchBuffer</i> contains the size of the service name, excluding the NULL terminator.
     * @returns {BOOL} If the functions succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-getservicekeynamew
     * @since windows5.1.2600
     */
    static GetServiceKeyNameW(hSCManager, lpDisplayName, lpServiceName, lpcchBuffer) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName

        lpcchBufferMarshal := lpcchBuffer is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetServiceKeyNameW", "ptr", hSCManager, "ptr", lpDisplayName, "ptr", lpServiceName, lpcchBufferMarshal, lpcchBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name of the specified service.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database, as returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function.
     * @param {PSTR} lpServiceName The service name. This name is the same as the service's registry key name. It is best to choose a name that is less than 256 characters.
     * @param {PSTR} lpDisplayName A pointer to a buffer that receives the service's display name. If the function fails, this buffer will contain an empty string.
     * 
     * The maximum size of this array is 4K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>lpcchBuffer</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>lpcchBuffer</i> parameter will receive the required size.
     * 
     * This parameter can specify a localized string using the following format:
     * 
     * @[<i>path</i>\]<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadmuistringa">RegLoadMUIString</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Localized strings are not supported until Windows Vista.
     * @param {Pointer<Integer>} lpcchBuffer A pointer to a variable that specifies the size of the buffer pointed to by <i>lpDisplayName</i>, in <b>TCHARs</b>. 
     * 
     * On output, this variable receives the size of the service's display name, in characters, excluding the null-terminating character.
     * 
     * If the buffer pointed to by <i>lpDisplayName</i> is too small to contain the display name, the function does not store it. When the function returns, <i>lpcchBuffer</i> contains the size of the service's display name, excluding the null-terminating character.
     * @returns {BOOL} If the functions succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-getservicedisplaynamea
     * @since windows5.1.2600
     */
    static GetServiceDisplayNameA(hSCManager, lpServiceName, lpDisplayName, lpcchBuffer) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName

        lpcchBufferMarshal := lpcchBuffer is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetServiceDisplayNameA", "ptr", hSCManager, "ptr", lpServiceName, "ptr", lpDisplayName, lpcchBufferMarshal, lpcchBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name of the specified service.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database, as returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function.
     * @param {PWSTR} lpServiceName The service name. This name is the same as the service's registry key name. It is best to choose a name that is less than 256 characters.
     * @param {PWSTR} lpDisplayName A pointer to a buffer that receives the service's display name. If the function fails, this buffer will contain an empty string.
     * 
     * The maximum size of this array is 4K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>lpcchBuffer</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>lpcchBuffer</i> parameter will receive the required size.
     * 
     * This parameter can specify a localized string using the following format:
     * 
     * @[<i>path</i>\]<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadmuistringa">RegLoadMUIString</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Localized strings are not supported until Windows Vista.
     * @param {Pointer<Integer>} lpcchBuffer A pointer to a variable that specifies the size of the buffer pointed to by <i>lpDisplayName</i>, in <b>TCHARs</b>. 
     * 
     * 
     * On output, this variable receives the size of the service's display name, in characters, excluding the null-terminating character.
     * 
     * If the buffer pointed to by <i>lpDisplayName</i> is too small to contain the display name, the function does not store it. When the function returns, <i>lpcchBuffer</i> contains the size of the service's display name, excluding the null-terminating character.
     * @returns {BOOL} If the functions succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-getservicedisplaynamew
     * @since windows5.1.2600
     */
    static GetServiceDisplayNameW(hSCManager, lpServiceName, lpDisplayName, lpcchBuffer) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName
        lpDisplayName := lpDisplayName is String ? StrPtr(lpDisplayName) : lpDisplayName

        lpcchBufferMarshal := lpcchBuffer is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetServiceDisplayNameW", "ptr", hSCManager, "ptr", lpServiceName, "ptr", lpDisplayName, lpcchBufferMarshal, lpcchBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Requests ownership of the service control manager (SCM) database lock. Only one process can own the lock at any specified time.
     * @param {SC_HANDLE} hSCManager A handle to the SCM database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and must have the <b>SC_MANAGER_LOCK</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a lock to the specified SCM database.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the SCM. Other error codes can be set by registry functions that are called by the SCM.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the <b>SC_MANAGER_LOCK</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DATABASE_LOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database is locked.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-lockservicedatabase
     * @since windows5.1.2600
     */
    static LockServiceDatabase(hSCManager) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LockServiceDatabase", "ptr", hSCManager, "ptr")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reports the boot status to the service control manager. It is used by boot verification programs.
     * @param {BOOL} BootAcceptable If the value is TRUE, the system saves the configuration as the last-known good configuration. If the value is FALSE, the system immediately reboots, using the previously saved last-known good configuration.
     * @returns {BOOL} If the <i>BootAcceptable</i> parameter is FALSE, the function does not return.
     * 
     * If the last-known good configuration was successfully saved, the return value is nonzero.
     * 
     * If an error occurs, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes may be set by the service control manager. Other error codes may be set by the registry functions that are called by the service control manager to set parameters in the configuration registry.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The user does not have permission to perform this operation. Only the system and members of the Administrator's group can do so.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-notifybootconfigstatus
     * @since windows5.1.2600
     */
    static NotifyBootConfigStatus(BootAcceptable) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\NotifyBootConfigStatus", "int", BootAcceptable, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Establishes a connection to the service control manager on the specified computer and opens the specified service control manager database.
     * @param {PSTR} lpMachineName The name of the target computer. If the pointer is NULL or points to an empty string, the function connects to the service control manager on the local computer.
     * @param {PSTR} lpDatabaseName The name of the service control manager database. This parameter should be set to SERVICES_ACTIVE_DATABASE. If it is NULL, the SERVICES_ACTIVE_DATABASE database is opened by default.
     * @param {Integer} dwDesiredAccess The access to the service control manager. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Before granting the requested access rights, the system checks the access token of the calling process against the discretionary access-control list of the security descriptor associated with the service control manager.
     * 
     * The SC_MANAGER_CONNECT access right is implicitly specified by calling this function.
     * @returns {SC_HANDLE} If the function succeeds, the return value is a handle to the specified service control manager database.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the SCM. Other error codes can be set by the registry functions that are called by the SCM.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested access was denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DATABASE_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified database does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-openscmanagera
     * @since windows5.1.2600
     */
    static OpenSCManagerA(lpMachineName, lpDatabaseName, dwDesiredAccess) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName
        lpDatabaseName := lpDatabaseName is String ? StrPtr(lpDatabaseName) : lpDatabaseName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenSCManagerA", "ptr", lpMachineName, "ptr", lpDatabaseName, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return SC_HANDLE({Value: result}, True)
    }

    /**
     * Establishes a connection to the service control manager on the specified computer and opens the specified service control manager database.
     * @param {PWSTR} lpMachineName The name of the target computer. If the pointer is NULL or points to an empty string, the function connects to the service control manager on the local computer.
     * @param {PWSTR} lpDatabaseName The name of the service control manager database. This parameter should be set to SERVICES_ACTIVE_DATABASE. If it is NULL, the SERVICES_ACTIVE_DATABASE database is opened by default.
     * @param {Integer} dwDesiredAccess The access to the service control manager. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Before granting the requested access rights, the system checks the access token of the calling process against the discretionary access-control list of the security descriptor associated with the service control manager.
     * 
     * The SC_MANAGER_CONNECT access right is implicitly specified by calling this function.
     * @returns {SC_HANDLE} If the function succeeds, the return value is a handle to the specified service control manager database.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the SCM. Other error codes can be set by the registry functions that are called by the SCM.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested access was denied.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DATABASE_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified database does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-openscmanagerw
     * @since windows5.1.2600
     */
    static OpenSCManagerW(lpMachineName, lpDatabaseName, dwDesiredAccess) {
        lpMachineName := lpMachineName is String ? StrPtr(lpMachineName) : lpMachineName
        lpDatabaseName := lpDatabaseName is String ? StrPtr(lpDatabaseName) : lpDatabaseName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenSCManagerW", "ptr", lpMachineName, "ptr", lpDatabaseName, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return SC_HANDLE({Value: result}, True)
    }

    /**
     * Opens an existing service.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function returns this handle. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {PSTR} lpServiceName The name of the service to be opened. This is the name specified by the <i>lpServiceName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when the service object was created, not the service display name that is shown by user interface applications to identify the service. 
     * 
     * The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are invalid service name characters.
     * @param {Integer} dwDesiredAccess The access to the service. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Before granting the requested access, the system checks the access token of the calling process against the discretionary access-control list of the security descriptor associated with the service object.
     * @returns {SC_HANDLE} If the function succeeds, the return value is a handle to the service.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Others can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have access to the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-openservicea
     * @since windows5.1.2600
     */
    static OpenServiceA(hSCManager, lpServiceName, dwDesiredAccess) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenServiceA", "ptr", hSCManager, "ptr", lpServiceName, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return SC_HANDLE({Value: result}, True)
    }

    /**
     * Opens an existing service.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function returns this handle. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {PWSTR} lpServiceName The name of the service to be opened. This is the name specified by the <i>lpServiceName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when the service object was created, not the service display name that is shown by user interface applications to identify the service. 
     * 
     * The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are invalid service name characters.
     * @param {Integer} dwDesiredAccess The access to the service. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Before granting the requested access, the system checks the access token of the calling process against the discretionary access-control list of the security descriptor associated with the service object.
     * @returns {SC_HANDLE} If the function succeeds, the return value is a handle to the service.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Others can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have access to the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_NAME</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service name is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DOES_NOT_EXIST</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service does not exist.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-openservicew
     * @since windows5.1.2600
     */
    static OpenServiceW(hSCManager, lpServiceName, dwDesiredAccess) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenServiceW", "ptr", hSCManager, "ptr", lpServiceName, "uint", dwDesiredAccess, "ptr")
        if(A_LastError)
            throw OSError()

        return SC_HANDLE({Value: result}, True)
    }

    /**
     * Retrieves the configuration parameters of the specified service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_QUERY_CONFIG access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer} lpServiceConfig A pointer to a buffer that receives the service configuration information. The format of the data is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_configa">QUERY_SERVICE_CONFIG</a> structure.
     * 
     * The maximum size of this array is 8K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return ERROR_INSUFFICIENT_BUFFER. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServiceConfig</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store all the configuration information, if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Others can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SERVICE_QUERY_CONFIG access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is more service configuration information than would fit into the <i>lpServiceConfig</i> buffer. The number of bytes required to get all the information is returned in the <i>pcbBytesNeeded</i> parameter. Nothing is written to <i>lpServiceConfig</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryserviceconfiga
     * @since windows5.1.2600
     */
    static QueryServiceConfigA(hService, lpServiceConfig, cbBufSize, pcbBytesNeeded) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceConfigA", "ptr", hService, "ptr", lpServiceConfig, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the configuration parameters of the specified service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_QUERY_CONFIG access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer} lpServiceConfig A pointer to a buffer that receives the service configuration information. The format of the data is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_configa">QUERY_SERVICE_CONFIG</a> structure.
     * 
     * The maximum size of this array is 8K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return ERROR_INSUFFICIENT_BUFFER. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServiceConfig</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store all the configuration information, if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Others can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SERVICE_QUERY_CONFIG access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is more service configuration information than would fit into the <i>lpServiceConfig</i> buffer. The number of bytes required to get all the information is returned in the <i>pcbBytesNeeded</i> parameter. Nothing is written to <i>lpServiceConfig</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryserviceconfigw
     * @since windows5.1.2600
     */
    static QueryServiceConfigW(hService, lpServiceConfig, cbBufSize, pcbBytesNeeded) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceConfigW", "ptr", hService, "ptr", lpServiceConfig, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the optional configuration parameters of the specified service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the <b>SERVICE_QUERY_CONFIG</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwInfoLevel 
     * @param {Pointer} lpBuffer A pointer to the buffer that receives the service configuration information. The format of this data depends on the value of the <i>dwInfoLevel</i> parameter.
     * 
     * The maximum size of this array is 8K bytes. To determine the required size, specify <b>NULL</b> for this parameter and 0 for the <i>cbBufSize</i> parameter. The function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>pcbBytesNeeded</i> parameter receives the needed size.
     * @param {Integer} cbBufSize The size of the structure pointed to by the <i>lpBuffer</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes required to store the configuration information, if the function fails with  <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Others can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the <b>SERVICE_QUERY_CONFIG</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is more service configuration information than would fit into the <i>lpBuffer</i> buffer. The number of bytes required to get all the information is returned in the <i>pcbBytesNeeded</i> parameter. Nothing is written to <i>lpBuffer</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryserviceconfig2a
     * @since windows5.1.2600
     */
    static QueryServiceConfig2A(hService, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceConfig2A", "ptr", hService, "uint", dwInfoLevel, "ptr", lpBuffer, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the optional configuration parameters of the specified service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the <b>SERVICE_QUERY_CONFIG</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwInfoLevel 
     * @param {Pointer} lpBuffer A pointer to the buffer that receives the service configuration information. The format of this data depends on the value of the <i>dwInfoLevel</i> parameter.
     * 
     * The maximum size of this array is 8K bytes. To determine the required size, specify <b>NULL</b> for this parameter and 0 for the <i>cbBufSize</i> parameter. The function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>pcbBytesNeeded</i> parameter receives the needed size.
     * @param {Integer} cbBufSize The size of the structure pointed to by the <i>lpBuffer</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes required to store the configuration information, if the function fails with  <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Others can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the <b>SERVICE_QUERY_CONFIG</b> access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is more service configuration information than would fit into the <i>lpBuffer</i> buffer. The number of bytes required to get all the information is returned in the <i>pcbBytesNeeded</i> parameter. Nothing is written to <i>lpBuffer</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryserviceconfig2w
     * @since windows5.1.2600
     */
    static QueryServiceConfig2W(hService, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceConfig2W", "ptr", hService, "uint", dwInfoLevel, "ptr", lpBuffer, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the lock status of the specified service control manager database.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function returns this handle, which must have the SC_MANAGER_QUERY_LOCK_STATUS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer} lpLockStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_lock_statusa">QUERY_SERVICE_LOCK_STATUS</a> structure that receives the lock status of the specified database is returned, plus the strings to which its members point.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpLockStatus</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return all the lock status information, if the function fails.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SC_MANAGER_QUERY_LOCK_STATUS access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is more lock status information than would fit into the <i>lpLockStatus</i> buffer. The number of bytes required to get all the information is returned in the <i>pcbBytesNeeded</i> parameter. Nothing is written to <i>lpLockStatus</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryservicelockstatusa
     * @since windows5.1.2600
     */
    static QueryServiceLockStatusA(hSCManager, lpLockStatus, cbBufSize, pcbBytesNeeded) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceLockStatusA", "ptr", hSCManager, "ptr", lpLockStatus, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the lock status of the specified service control manager database.
     * @param {SC_HANDLE} hSCManager A handle to the service control manager database. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function returns this handle, which must have the SC_MANAGER_QUERY_LOCK_STATUS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer} lpLockStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_lock_statusa">QUERY_SERVICE_LOCK_STATUS</a> structure that receives the lock status of the specified database is returned, plus the strings to which its members point.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpLockStatus</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return all the lock status information, if the function fails.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SC_MANAGER_QUERY_LOCK_STATUS access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * There is more lock status information than would fit into the <i>lpLockStatus</i> buffer. The number of bytes required to get all the information is returned in the <i>pcbBytesNeeded</i> parameter. Nothing is written to <i>lpLockStatus</i>.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryservicelockstatusw
     * @since windows5.1.2600
     */
    static QueryServiceLockStatusW(hSCManager, lpLockStatus, cbBufSize, pcbBytesNeeded) {
        hSCManager := hSCManager is Win32Handle ? NumGet(hSCManager, "ptr") : hSCManager

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceLockStatusW", "ptr", hSCManager, "ptr", lpLockStatus, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a copy of the security descriptor associated with a service object.
     * @param {SC_HANDLE} hService A handle to the service control manager or the service. Handles to the service control manager are returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and handles to a service are returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The handle must have the READ_CONTROL access right.
     * @param {Integer} dwSecurityInformation A set of 
     * bit flags that indicate the type of security information to retrieve. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags, with the exception that this function does not support the <b>LABEL_SECURITY_INFORMATION</b> value.
     * @param {Pointer} lpSecurityDescriptor A pointer to a buffer that receives a copy of the security descriptor of the specified service object. The calling process must have the appropriate access to view the specified aspects of the  security descriptor of the object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure is returned in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> format.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpSecurityDescriptor</i> parameter, in bytes. The largest size allowed is 8 kilobytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the requested security descriptor information, if the function fails.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes may be set by the service control manager. Other error codes may be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle was not opened with READ_CONTROL access, or the calling process is not the owner of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The security descriptor information is too large for the <i>lpSecurityDescriptor</i> buffer. The number of bytes required to get all the information is returned in the <i>pcbBytesNeeded</i> parameter. Nothing is written to the <i>lpSecurityDescriptor</i> buffer.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified security information is not valid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryserviceobjectsecurity
     * @since windows5.1.2600
     */
    static QueryServiceObjectSecurity(hService, dwSecurityInformation, lpSecurityDescriptor, cbBufSize, pcbBytesNeeded) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceObjectSecurity", "ptr", hService, "uint", dwSecurityInformation, "ptr", lpSecurityDescriptor, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current status of the specified service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_QUERY_STATUS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer<SERVICE_STATUS>} lpServiceStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status">SERVICE_STATUS</a> structure that receives the status information.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SERVICE_QUERY_STATUS access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryservicestatus
     * @since windows5.1.2600
     */
    static QueryServiceStatus(hService, lpServiceStatus) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceStatus", "ptr", hService, "ptr", lpServiceStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current status of the specified service based on the specified information level.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> function, and it must have the SERVICE_QUERY_STATUS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} InfoLevel The service attributes to be returned. Use SC_STATUS_PROCESS_INFO to retrieve the service status information. The <i>lpBuffer</i> parameter is a pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure. 
     * 
     * 
     * 
     * 
     * Currently, no other information levels are defined.
     * @param {Pointer} lpBuffer A pointer to the buffer that receives the status information. The format of this data depends on the value of the <i>InfoLevel</i> parameter.
     * 
     * The maximum size of this array is 8K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return ERROR_INSUFFICIENT_BUFFER. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpBuffer</i> parameter, in bytes.
     * @param {Pointer<Integer>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store all status information, if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following errors can be returned.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SERVICE_QUERY_STATUS access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INSUFFICIENT_BUFFER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The buffer is too small for the 
     * <a href="/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure. Nothing was written to the structure.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <b>cbSize</b> member of 
     * <a href="/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_LEVEL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The <i>InfoLevel</i> parameter contains an unsupported value.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is shutting down; this function cannot be called.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryservicestatusex
     * @since windows5.1.2600
     */
    static QueryServiceStatusEx(hService, InfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pcbBytesNeededMarshal := pcbBytesNeeded is VarRef ? "uint*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceStatusEx", "ptr", hService, "int", InfoLevel, "ptr", lpBuffer, "uint", cbBufSize, pcbBytesNeededMarshal, pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a function to handle service control requests.
     * @param {PSTR} lpServiceName The name of the service run by the calling thread. This is the service name that the service control program specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when creating the service. 
     * 
     * 
     * 
     * 
     * If the service type is SERVICE_WIN32_OWN_PROCESS, the function does not verify that the specified name is valid, because there is only one registered service in the process.
     * @param {Pointer<LPHANDLER_FUNCTION>} lpHandlerProc A pointer to the handler function to be registered. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function">Handler</a>.
     * @returns {SERVICE_STATUS_HANDLE} If the function succeeds, the return value is a service status handle.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to convert an ANSI string parameter to Unicode. This error does not occur for Unicode string parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_IN_EXE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service entry was specified incorrectly when the process called the <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-registerservicectrlhandlera
     * @since windows5.1.2600
     */
    static RegisterServiceCtrlHandlerA(lpServiceName, lpHandlerProc) {
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterServiceCtrlHandlerA", "ptr", lpServiceName, "ptr", lpHandlerProc, "ptr")
        if(A_LastError)
            throw OSError()

        return SERVICE_STATUS_HANDLE({Value: result}, True)
    }

    /**
     * Registers a function to handle service control requests.
     * @param {PWSTR} lpServiceName The name of the service run by the calling thread. This is the service name that the service control program specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when creating the service. 
     * 
     * 
     * 
     * 
     * If the service type is SERVICE_WIN32_OWN_PROCESS, the function does not verify that the specified name is valid, because there is only one registered service in the process.
     * @param {Pointer<LPHANDLER_FUNCTION>} lpHandlerProc A pointer to the handler function to be registered. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function">Handler</a>.
     * @returns {SERVICE_STATUS_HANDLE} If the function succeeds, the return value is a service status handle.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to convert an ANSI string parameter to Unicode. This error does not occur for Unicode string parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_IN_EXE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service entry was specified incorrectly when the process called the <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-registerservicectrlhandlerw
     * @since windows5.1.2600
     */
    static RegisterServiceCtrlHandlerW(lpServiceName, lpHandlerProc) {
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterServiceCtrlHandlerW", "ptr", lpServiceName, "ptr", lpHandlerProc, "ptr")
        if(A_LastError)
            throw OSError()

        return SERVICE_STATUS_HANDLE({Value: result}, True)
    }

    /**
     * Registers a function to handle extended service control requests.
     * @param {PSTR} lpServiceName The name of the service run by the calling thread. This is the service name that the service control program specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when creating the service.
     * @param {Pointer<LPHANDLER_FUNCTION_EX>} lpHandlerProc A pointer to the handler function to be registered. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a>.
     * @param {Pointer<Void>} lpContext Any user-defined data. This parameter, which is passed to the handler function, can help identify the service when multiple services share a process.
     * @returns {SERVICE_STATUS_HANDLE} If the function succeeds, the return value is a service status handle.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to convert an ANSI string parameter to Unicode. This error does not occur for Unicode string parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_IN_EXE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service entry was specified incorrectly when the process called the <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-registerservicectrlhandlerexa
     * @since windows5.1.2600
     */
    static RegisterServiceCtrlHandlerExA(lpServiceName, lpHandlerProc, lpContext) {
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName

        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterServiceCtrlHandlerExA", "ptr", lpServiceName, "ptr", lpHandlerProc, lpContextMarshal, lpContext, "ptr")
        if(A_LastError)
            throw OSError()

        return SERVICE_STATUS_HANDLE({Value: result}, True)
    }

    /**
     * Registers a function to handle extended service control requests.
     * @param {PWSTR} lpServiceName The name of the service run by the calling thread. This is the service name that the service control program specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when creating the service.
     * @param {Pointer<LPHANDLER_FUNCTION_EX>} lpHandlerProc A pointer to the handler function to be registered. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a>.
     * @param {Pointer<Void>} lpContext Any user-defined data. This parameter, which is passed to the handler function, can help identify the service when multiple services share a process.
     * @returns {SERVICE_STATUS_HANDLE} If the function succeeds, the return value is a service status handle.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. 
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_NOT_ENOUGH_MEMORY</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Not enough memory is available to convert an ANSI string parameter to Unicode. This error does not occur for Unicode string parameters.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_IN_EXE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service entry was specified incorrectly when the process called the <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-registerservicectrlhandlerexw
     * @since windows5.1.2600
     */
    static RegisterServiceCtrlHandlerExW(lpServiceName, lpHandlerProc, lpContext) {
        lpServiceName := lpServiceName is String ? StrPtr(lpServiceName) : lpServiceName

        lpContextMarshal := lpContext is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterServiceCtrlHandlerExW", "ptr", lpServiceName, "ptr", lpHandlerProc, lpContextMarshal, lpContext, "ptr")
        if(A_LastError)
            throw OSError()

        return SERVICE_STATUS_HANDLE({Value: result}, True)
    }

    /**
     * Sets the security descriptor of a service object.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The access required for this handle depends on the security information specified in the <i>dwSecurityInformation</i> parameter.
     * @param {Integer} dwSecurityInformation 
     * @param {PSECURITY_DESCRIPTOR} lpSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the new security information.
     * @returns {BOOL} If the function succeeds, the function returns nonzero. 
     * 
     * If the function fails, it  returns zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle was not opened with the required access, or the calling process is not the owner of the object.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified security information or security descriptor is not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_MARKED_FOR_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service has been marked for deletion.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-setserviceobjectsecurity
     * @since windows5.1.2600
     */
    static SetServiceObjectSecurity(hService, dwSecurityInformation, lpSecurityDescriptor) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService
        lpSecurityDescriptor := lpSecurityDescriptor is Win32Handle ? NumGet(lpSecurityDescriptor, "ptr") : lpSecurityDescriptor

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetServiceObjectSecurity", "ptr", hService, "uint", dwSecurityInformation, "ptr", lpSecurityDescriptor, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Updates the service control manager's status information for the calling service.
     * @param {SERVICE_STATUS_HANDLE} hServiceStatus A handle to the status information structure for the current service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a> function.
     * @param {Pointer<SERVICE_STATUS>} lpServiceStatus A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status">SERVICE_STATUS</a> structure the contains the latest status information for the calling service.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified service status structure is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-setservicestatus
     * @since windows5.1.2600
     */
    static SetServiceStatus(hServiceStatus, lpServiceStatus) {
        hServiceStatus := hServiceStatus is Win32Handle ? NumGet(hServiceStatus, "ptr") : hServiceStatus

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetServiceStatus", "ptr", hServiceStatus, "ptr", lpServiceStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Connects the main thread of a service process to the service control manager, which causes the thread to be the service control dispatcher thread for the calling process.
     * @param {Pointer<SERVICE_TABLE_ENTRYA>} lpServiceStartTable A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_table_entrya">SERVICE_TABLE_ENTRY</a> structures containing one entry for each service that can execute in the calling process. The members of the last entry in the table must have NULL values to designate the end of the table.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error code can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FAILED_SERVICE_CONTROLLER_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error is returned if the program is being run as a console application rather than as a service. 
     * 
     * 
     * If the program will be run as a console application for debugging purposes, structure it such that service-specific code is not called when this error is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified dispatch table contains entries that are not in the proper format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_ALREADY_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The process has already called 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>. Each process can call 
     * <b>StartServiceCtrlDispatcher</b> only one time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-startservicectrldispatchera
     * @since windows5.1.2600
     */
    static StartServiceCtrlDispatcherA(lpServiceStartTable) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\StartServiceCtrlDispatcherA", "ptr", lpServiceStartTable, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Connects the main thread of a service process to the service control manager, which causes the thread to be the service control dispatcher thread for the calling process.
     * @param {Pointer<SERVICE_TABLE_ENTRYW>} lpServiceStartTable A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_table_entrya">SERVICE_TABLE_ENTRY</a> structures containing one entry for each service that can execute in the calling process. The members of the last entry in the table must have NULL values to designate the end of the table.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error code can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_FAILED_SERVICE_CONTROLLER_CONNECT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * This error is returned if the program is being run as a console application rather than as a service. 
     * 
     * 
     * If the program will be run as a console application for debugging purposes, structure it such that service-specific code is not called when this error is returned.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_DATA</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified dispatch table contains entries that are not in the proper format.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_ALREADY_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  The process has already called 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>. Each process can call 
     * <b>StartServiceCtrlDispatcher</b> only one time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-startservicectrldispatcherw
     * @since windows5.1.2600
     */
    static StartServiceCtrlDispatcherW(lpServiceStartTable) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\StartServiceCtrlDispatcherW", "ptr", lpServiceStartTable, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Starts a service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_START access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwNumServiceArgs The number of strings in the <i>lpServiceArgVectors</i> array. If <i>lpServiceArgVectors</i> is NULL, this parameter can be zero.
     * @param {Pointer<PSTR>} lpServiceArgVectors The null-terminated strings to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function for the service as arguments. If there are no arguments, this parameter can be NULL. Otherwise, the first argument (lpServiceArgVectors[0]) is the name of the service, followed by any additional arguments (lpServiceArgVectors[1] through lpServiceArgVectors[dwNumServiceArgs-1]).
     * 
     * Driver services do not receive these arguments.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Others can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SERVICE_START access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service binary file could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_ALREADY_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An instance of the service is already running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DATABASE_LOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database is locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DEPENDENCY_DELETED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service depends on a service that does not exist or has been marked for deletion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DEPENDENCY_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service depends on another service that has failed to start.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has been disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_LOGON_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service did not start due to a logon failure. This error occurs if the service is configured to run under an account that does not have the "Log on as a service" right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_MARKED_FOR_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has been marked for deletion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NO_THREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A thread could not be created for the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_REQUEST_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process for the service was started, but it did not call 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the thread that called 
     * <b>StartServiceCtrlDispatcher</b> may be blocked in a control handler function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-startservicea
     * @since windows5.1.2600
     */
    static StartServiceA(hService, dwNumServiceArgs, lpServiceArgVectors) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        lpServiceArgVectorsMarshal := lpServiceArgVectors is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\StartServiceA", "ptr", hService, "uint", dwNumServiceArgs, lpServiceArgVectorsMarshal, lpServiceArgVectors, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Starts a service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_START access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwNumServiceArgs The number of strings in the <i>lpServiceArgVectors</i> array. If <i>lpServiceArgVectors</i> is NULL, this parameter can be zero.
     * @param {Pointer<PWSTR>} lpServiceArgVectors The null-terminated strings to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function for the service as arguments. If there are no arguments, this parameter can be NULL. Otherwise, the first argument (lpServiceArgVectors[0]) is the name of the service, followed by any additional arguments (lpServiceArgVectors[1] through lpServiceArgVectors[dwNumServiceArgs-1]).
     * 
     * Driver services do not receive these arguments.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Others can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the SERVICE_START access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle is invalid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_PATH_NOT_FOUND</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service binary file could not be found.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_ALREADY_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * An instance of the service is already running.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DATABASE_LOCKED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The database is locked.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DEPENDENCY_DELETED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service depends on a service that does not exist or has been marked for deletion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DEPENDENCY_FAIL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service depends on another service that has failed to start.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_DISABLED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has been disabled.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_LOGON_FAILED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service did not start due to a logon failure. This error occurs if the service is configured to run under an account that does not have the "Log on as a service" right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_MARKED_FOR_DELETE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has been marked for deletion.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NO_THREAD</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * A thread could not be created for the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_REQUEST_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process for the service was started, but it did not call 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the thread that called 
     * <b>StartServiceCtrlDispatcher</b> may be blocked in a control handler function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-startservicew
     * @since windows5.1.2600
     */
    static StartServiceW(hService, dwNumServiceArgs, lpServiceArgVectors) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        lpServiceArgVectorsMarshal := lpServiceArgVectors is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\StartServiceW", "ptr", hService, "uint", dwNumServiceArgs, lpServiceArgVectorsMarshal, lpServiceArgVectors, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unlocks a service control manager database by releasing the specified lock.
     * @param {Pointer<Void>} ScLock The lock, which is obtained from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-lockservicedatabase">LockServiceDatabase</a> function.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_LOCK</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified lock is invalid.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-unlockservicedatabase
     * @since windows5.1.2600
     */
    static UnlockServiceDatabase(ScLock) {
        ScLockMarshal := ScLock is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\UnlockServiceDatabase", ScLockMarshal, ScLock, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables an application to receive notification when the specified service is created or deleted or when its status changes.
     * @param {SC_HANDLE} hService A handle to the service or the service control manager. Handles to services are returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the SERVICE_QUERY_STATUS access right. Handles to the service control manager are returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function and must have the SC_MANAGER_ENUMERATE_SERVICE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * 
     * There can only be one outstanding notification request per service.
     * @param {Integer} dwNotifyMask 
     * @param {Pointer<SERVICE_NOTIFY_2A>} pNotifyBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_notify_2a">SERVICE_NOTIFY</a> structure that contains notification information, such as a pointer to the callback function. This structure must remain valid until the callback function is invoked or the calling thread cancels the notification request.
     * 
     * Do not make multiple calls to <b>NotifyServiceStatusChange</b> with the same buffer parameter until the callback function from the first call has finished with the buffer or the first notification request has been canceled. Otherwise, there is no guarantee which version of the buffer the callback function will receive.
     * 
     * <b>Windows Vista:  </b>The address of the callback function must be within the address range of a loaded module. Therefore, the callback function cannot be code that is generated at run time (such as managed code generated by the JIT compiler) or native code that is decompressed at run time. This restriction was removed in Windows Server 2008 and Windows Vista with SP1.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS. If the service has been marked for deletion, the return value is ERROR_SERVICE_MARKED_FOR_DELETE and the handle to the service must be closed. If service notification is lagging too far behind the system state, the function returns ERROR_SERVICE_NOTIFY_CLIENT_LAGGING. In this case, the client should close the handle to the SCM, open a new handle,  and call this function again. 
     * 
     * If the function fails, the return value is one of the <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-notifyservicestatuschangea
     * @since windows6.0.6000
     */
    static NotifyServiceStatusChangeA(hService, dwNotifyMask, pNotifyBuffer) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        result := DllCall("ADVAPI32.dll\NotifyServiceStatusChangeA", "ptr", hService, "uint", dwNotifyMask, "ptr", pNotifyBuffer, "uint")
        return result
    }

    /**
     * Enables an application to receive notification when the specified service is created or deleted or when its status changes.
     * @param {SC_HANDLE} hService A handle to the service or the service control manager. Handles to services are returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the SERVICE_QUERY_STATUS access right. Handles to the service control manager are returned by the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function and must have the SC_MANAGER_ENUMERATE_SERVICE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * 
     * There can only be one outstanding notification request per service.
     * @param {Integer} dwNotifyMask 
     * @param {Pointer<SERVICE_NOTIFY_2W>} pNotifyBuffer A pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_notify_2a">SERVICE_NOTIFY</a> structure that contains notification information, such as a pointer to the callback function. This structure must remain valid until the callback function is invoked or the calling thread cancels the notification request.
     * 
     * Do not make multiple calls to <b>NotifyServiceStatusChange</b> with the same buffer parameter until the callback function from the first call has finished with the buffer or the first notification request has been canceled. Otherwise, there is no guarantee which version of the buffer the callback function will receive.
     * 
     * <b>Windows Vista:  </b>The address of the callback function must be within the address range of a loaded module. Therefore, the callback function cannot be code that is generated at run time (such as managed code generated by the JIT compiler) or native code that is decompressed at run time. This restriction was removed in Windows Server 2008 and Windows Vista with SP1.
     * @returns {Integer} If the function succeeds, the return value is ERROR_SUCCESS. If the service has been marked for deletion, the return value is ERROR_SERVICE_MARKED_FOR_DELETE and the handle to the service must be closed. If service notification is lagging too far behind the system state, the function returns ERROR_SERVICE_NOTIFY_CLIENT_LAGGING. In this case, the client should close the handle to the SCM, open a new handle,  and call this function again. 
     * 
     * If the function fails, the return value is one of the <a href="/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-notifyservicestatuschangew
     * @since windows6.0.6000
     */
    static NotifyServiceStatusChangeW(hService, dwNotifyMask, pNotifyBuffer) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        result := DllCall("ADVAPI32.dll\NotifyServiceStatusChangeW", "ptr", hService, "uint", dwNotifyMask, "ptr", pNotifyBuffer, "uint")
        return result
    }

    /**
     * Sends a control code to a service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">access rights</a> required for this handle depend on the <i>dwControl</i> code requested.
     * @param {Integer} dwControl This parameter can be one of the following control codes.
     * 
     * <table>
     * <tr>
     * <th>Control code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_CONTINUE"></a><a id="service_control_continue"></a><dl>
     * <dt><b>SERVICE_CONTROL_CONTINUE</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a paused service that it should resume. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_INTERROGATE"></a><a id="service_control_interrogate"></a><dl>
     * <dt><b>SERVICE_CONTROL_INTERROGATE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that it should report its current status information to the service control manager. The <i>hService</i> handle must have the SERVICE_INTERROGATE access right.
     * 
     * Note that this control is not generally useful as the SCM is aware of the current state of the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDADD"></a><a id="service_control_netbindadd"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDADD</b></dt>
     * <dt>0x00000007</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a network service that there is a new component for binding. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right. However,  this control code has been deprecated; use Plug and Play functionality instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDDISABLE"></a><a id="service_control_netbinddisable"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDDISABLE</b></dt>
     * <dt>0x0000000A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a network service that one of its bindings has been disabled. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right. However,  this control code has been deprecated; use Plug and Play functionality instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDENABLE"></a><a id="service_control_netbindenable"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDENABLE</b></dt>
     * <dt>0x00000009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a network service that a disabled binding has been enabled. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right. However,  this control code has been deprecated; use Plug and Play functionality instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDREMOVE"></a><a id="service_control_netbindremove"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDREMOVE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a network service that a component for binding has been removed. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right. However,  this control code has been deprecated; use Plug and Play functionality instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_PARAMCHANGE"></a><a id="service_control_paramchange"></a><dl>
     * <dt><b>SERVICE_CONTROL_PARAMCHANGE</b></dt>
     * <dt>0x00000006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a service that its startup parameters have changed. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_PAUSE"></a><a id="service_control_pause"></a><dl>
     * <dt><b>SERVICE_CONTROL_PAUSE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that it should pause. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_STOP"></a><a id="service_control_stop"></a><dl>
     * <dt><b>SERVICE_CONTROL_STOP</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that it should stop. The <i>hService</i> handle must have the SERVICE_STOP access right.
     * 
     * After sending the stop request to a service, you should not send other controls to the service.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can also be a user-defined control code, as described in the following table.
     * 
     * <table>
     * <tr>
     * <th>Control code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>Range 128 to 255</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service defines the action associated with the control code. The <i>hService</i> handle must have the SERVICE_USER_DEFINED_CONTROL access right.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwInfoLevel The information level for the service control parameters. This parameter must be set to SERVICE_CONTROL_STATUS_REASON_INFO (1).
     * @param {Pointer<Void>} pControlParams A pointer to the service control parameters. If <i>dwInfoLevel</i> is SERVICE_CONTROL_STATUS_REASON_INFO, this member is a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_control_status_reason_paramsa">SERVICE_CONTROL_STATUS_REASON_PARAMS</a> structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the required access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEPENDENT_SERVICES_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service cannot be stopped because other running services are dependent on it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle was not obtained using 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> or 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a>, or the handle is no longer valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code in the <i>dwControl</i> parameter is undefined, or <i>dwControl</i> is SERVICE_CONTROL_STOP but the <b>dwReason</b> or <b>pszComment</b> members of the <a href="/windows/win32/api/winsvc/ns-winsvc-service_control_status_reason_paramsa">SERVICE_CONTROL_STATUS_REASON_PARAMS</a> structure are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_CONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code is not valid, or it is unacceptable to the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_CANNOT_ACCEPT_CTRL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code cannot be sent to the service because the state of the service is SERVICE_STOPPED, SERVICE_START_PENDING, or SERVICE_STOP_PENDING.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_REQUEST_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process for the service was started, but it did not call 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the thread that called 
     * <b>StartServiceCtrlDispatcher</b> may be blocked in a control handler function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is shutting down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-controlserviceexa
     * @since windows6.0.6000
     */
    static ControlServiceExA(hService, dwControl, dwInfoLevel, pControlParams) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pControlParamsMarshal := pControlParams is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ControlServiceExA", "ptr", hService, "uint", dwControl, "uint", dwInfoLevel, pControlParamsMarshal, pControlParams, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends a control code to a service.
     * @param {SC_HANDLE} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">access rights</a> required for this handle depend on the <i>dwControl</i> code requested.
     * @param {Integer} dwControl This parameter can be one of the following control codes.
     * 
     * <table>
     * <tr>
     * <th>Control code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_CONTINUE"></a><a id="service_control_continue"></a><dl>
     * <dt><b>SERVICE_CONTROL_CONTINUE</b></dt>
     * <dt>0x00000003</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a paused service that it should resume. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_INTERROGATE"></a><a id="service_control_interrogate"></a><dl>
     * <dt><b>SERVICE_CONTROL_INTERROGATE</b></dt>
     * <dt>0x00000004</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that it should report its current status information to the service control manager. The <i>hService</i> handle must have the SERVICE_INTERROGATE access right.
     * 
     * Note that this control is not generally useful as the SCM is aware of the current state of the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDADD"></a><a id="service_control_netbindadd"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDADD</b></dt>
     * <dt>0x00000007</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a network service that there is a new component for binding. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right. However,  this control code has been deprecated; use Plug and Play functionality instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDDISABLE"></a><a id="service_control_netbinddisable"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDDISABLE</b></dt>
     * <dt>0x0000000A</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a network service that one of its bindings has been disabled. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right. However,  this control code has been deprecated; use Plug and Play functionality instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDENABLE"></a><a id="service_control_netbindenable"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDENABLE</b></dt>
     * <dt>0x00000009</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a network service that a disabled binding has been enabled. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right. However,  this control code has been deprecated; use Plug and Play functionality instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_NETBINDREMOVE"></a><a id="service_control_netbindremove"></a><dl>
     * <dt><b>SERVICE_CONTROL_NETBINDREMOVE</b></dt>
     * <dt>0x00000008</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a network service that a component for binding has been removed. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right. However,  this control code has been deprecated; use Plug and Play functionality instead.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_PARAMCHANGE"></a><a id="service_control_paramchange"></a><dl>
     * <dt><b>SERVICE_CONTROL_PARAMCHANGE</b></dt>
     * <dt>0x00000006</dt>
     * </dl>
     * </td>
     * <td width="60%">
     *  Notifies a service that its startup parameters have changed. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_PAUSE"></a><a id="service_control_pause"></a><dl>
     * <dt><b>SERVICE_CONTROL_PAUSE</b></dt>
     * <dt>0x00000002</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that it should pause. The <i>hService</i> handle must have the SERVICE_PAUSE_CONTINUE access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_CONTROL_STOP"></a><a id="service_control_stop"></a><dl>
     * <dt><b>SERVICE_CONTROL_STOP</b></dt>
     * <dt>0x00000001</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Notifies a service that it should stop. The <i>hService</i> handle must have the SERVICE_STOP access right.
     * 
     * After sending the stop request to a service, you should not send other controls to the service.
     * 
     * </td>
     * </tr>
     * </table>
     *  
     * 
     * This parameter can also be a user-defined control code, as described in the following table.
     * 
     * <table>
     * <tr>
     * <th>Control code</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt>Range 128 to 255</dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service defines the action associated with the control code. The <i>hService</i> handle must have the SERVICE_USER_DEFINED_CONTROL access right.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Integer} dwInfoLevel The information level for the service control parameters. This parameter must be set to SERVICE_CONTROL_STATUS_REASON_INFO (1).
     * @param {Pointer<Void>} pControlParams A pointer to the service control parameters. If <i>dwInfoLevel</i> is SERVICE_CONTROL_STATUS_REASON_INFO, this member is a pointer to a <a href="https://docs.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_control_status_reason_paramsa">SERVICE_CONTROL_STATUS_REASON_PARAMS</a> structure.
     * @returns {BOOL} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * 
     * The following error codes can be set by the service control manager. Other error codes can be set by the registry functions that are called by the service control manager.
     * 
     * <table>
     * <tr>
     * <th>Return code</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_ACCESS_DENIED</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The handle does not have the required access right.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_DEPENDENT_SERVICES_RUNNING</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service cannot be stopped because other running services are dependent on it.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_HANDLE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The specified handle was not obtained using 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> or 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a>, or the handle is no longer valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_PARAMETER</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code in the <i>dwControl</i> parameter is undefined, or <i>dwControl</i> is SERVICE_CONTROL_STOP but the <b>dwReason</b> or <b>pszComment</b> members of the <a href="/windows/win32/api/winsvc/ns-winsvc-service_control_status_reason_paramsa">SERVICE_CONTROL_STATUS_REASON_PARAMS</a> structure are not valid.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_INVALID_SERVICE_CONTROL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code is not valid, or it is unacceptable to the service.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_CANNOT_ACCEPT_CTRL</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The requested control code cannot be sent to the service because the state of the service is SERVICE_STOPPED, SERVICE_START_PENDING, or SERVICE_STOP_PENDING.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_NOT_ACTIVE</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The service has not been started.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SERVICE_REQUEST_TIMEOUT</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The process for the service was started, but it did not call 
     * <a href="/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the thread that called 
     * <b>StartServiceCtrlDispatcher</b> may be blocked in a control handler function.
     * 
     * </td>
     * </tr>
     * <tr>
     * <td width="40%">
     * <dl>
     * <dt><b>ERROR_SHUTDOWN_IN_PROGRESS</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * The system is shutting down.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-controlserviceexw
     * @since windows6.0.6000
     */
    static ControlServiceExW(hService, dwControl, dwInfoLevel, pControlParams) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pControlParamsMarshal := pControlParams is VarRef ? "ptr" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ControlServiceExW", "ptr", hService, "uint", dwControl, "uint", dwInfoLevel, pControlParamsMarshal, pControlParams, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves dynamic information related to the current service start.
     * @param {SERVICE_STATUS_HANDLE} hServiceStatus A service status handle provided by <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a>
     * @param {Integer} dwInfoLevel Indicates the information level.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Meaning</th>
     * </tr>
     * <tr>
     * <td width="40%"><a id="SERVICE_DYNAMIC_INFORMATION_LEVEL_START_REASON"></a><a id="service_dynamic_information_level_start_reason"></a><dl>
     * <dt><b>SERVICE_DYNAMIC_INFORMATION_LEVEL_START_REASON</b></dt>
     * </dl>
     * </td>
     * <td width="60%">
     * Indicates a request for dynamic information related to the current service start.
     * 
     * </td>
     * </tr>
     * </table>
     * @param {Pointer<Pointer<Void>>} ppDynamicInfo A dynamic information buffer. If this parameter is valid, the callback function must free the          buffer after use with the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {BOOL} If the function succeeds, the return value is TRUE.
     * 
     * If the function fails, the return value is FALSE. When this happens the <a href="/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function should be called to retrieve the error code.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-queryservicedynamicinformation
     * @since windows8.0
     */
    static QueryServiceDynamicInformation(hServiceStatus, dwInfoLevel, ppDynamicInfo) {
        hServiceStatus := hServiceStatus is Win32Handle ? NumGet(hServiceStatus, "ptr") : hServiceStatus

        ppDynamicInfoMarshal := ppDynamicInfo is VarRef ? "ptr*" : "ptr"

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceDynamicInformation", "ptr", hServiceStatus, "uint", dwInfoLevel, ppDynamicInfoMarshal, ppDynamicInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * 
     * @param {SC_HANDLE} hService 
     * @param {Integer} eEventType 
     * @param {Pointer<PSC_NOTIFICATION_CALLBACK>} pCallback 
     * @param {Pointer<Void>} pCallbackContext 
     * @param {Pointer<PSC_NOTIFICATION_REGISTRATION>} pSubscription 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/Services/subscribeservicechangenotifications
     */
    static SubscribeServiceChangeNotifications(hService, eEventType, pCallback, pCallbackContext, pSubscription) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService

        pCallbackContextMarshal := pCallbackContext is VarRef ? "ptr" : "ptr"
        pSubscriptionMarshal := pSubscription is VarRef ? "ptr*" : "ptr"

        result := DllCall("SecHost.dll\SubscribeServiceChangeNotifications", "ptr", hService, "int", eEventType, "ptr", pCallback, pCallbackContextMarshal, pCallbackContext, pSubscriptionMarshal, pSubscription, "uint")
        return result
    }

    /**
     * 
     * @param {PSC_NOTIFICATION_REGISTRATION} pSubscription 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Services/unsubscribeservicechangenotifications
     */
    static UnsubscribeServiceChangeNotifications(pSubscription) {
        DllCall("SecHost.dll\UnsubscribeServiceChangeNotifications", "ptr", pSubscription)
    }

    /**
     * 
     * @param {SC_HANDLE} hService 
     * @param {Integer} dwNotify 
     * @param {Integer} dwTimeout 
     * @param {HANDLE} hCancelEvent 
     * @returns {Integer} 
     */
    static WaitServiceState(hService, dwNotify, dwTimeout, hCancelEvent) {
        hService := hService is Win32Handle ? NumGet(hService, "ptr") : hService
        hCancelEvent := hCancelEvent is Win32Handle ? NumGet(hCancelEvent, "ptr") : hCancelEvent

        result := DllCall("ADVAPI32.dll\WaitServiceState", "ptr", hService, "uint", dwNotify, "uint", dwTimeout, "ptr", hCancelEvent, "uint")
        return result
    }

    /**
     * Returns a handle for a registry key for a service to read and/or write state to.
     * @param {SERVICE_STATUS_HANDLE} ServiceStatusHandle A handle to the status information structure for the current service. This handle is returned by the [RegisterServiceCtrlHandler](./nf-winsvc-registerservicectrlhandlera.md) function.
     * @param {Integer} StateType A member of the [SERVICE_REGISTRY_STATE_TYPE](./ne-winsvc-service_registry_state_type.md) specifying the state type for which the service registry key is retreived.
     * @param {Integer} AccessMask The access mask with which to attempt to open the state key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<HKEY>} ServiceStateKey Receives the output registry key handle.
     * @returns {Integer} ERROR_SUCCESS when all operations complete successfully; otherwise, a Win32 error code.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-getserviceregistrystatekey
     * @since windows10.0.19041
     */
    static GetServiceRegistryStateKey(ServiceStatusHandle, StateType, AccessMask, ServiceStateKey) {
        ServiceStatusHandle := ServiceStatusHandle is Win32Handle ? NumGet(ServiceStatusHandle, "ptr") : ServiceStatusHandle

        result := DllCall("api-ms-win-service-core-l1-1-3.dll\GetServiceRegistryStateKey", "ptr", ServiceStatusHandle, "int", StateType, "uint", AccessMask, "ptr", ServiceStateKey, "uint")
        return result
    }

    /**
     * Returns a path for a per-service filesystem location for a service to read and/or write state to.
     * @param {SERVICE_STATUS_HANDLE} hServiceStatus A handle to the status information structure for the current service. This handle is returned by the [RegisterServiceCtrlHandler](./nf-winsvc-registerservicectrlhandlera.md) function.
     * @param {Integer} eDirectoryType A member of the [SERVICE_DIRECTORY_TYPE](./ne-winsvc-service_directory_type.md) enumeration that identifies the type of per-service directory path to retrieve.
     * @param {PWSTR} lpPathBuffer A caller-allocated buffer into which the path string will be copied. If NULL, the function call will fail with ERROR_INSUFFICIENT_BUFFER and return the required buffer length, in WCHARs, in *lpcchRequiredBufferLength*. If non-NULL, the length of the buffer should be specified in *cchPathBufferLength*. The path, if written, will be NULL terminated.
     * @param {Integer} cchPathBufferLength The length of the buffer supplied in *lpPathBuffer*, in units of WCHARS. This argument is ignored if *lpPathBuffer* is NULL.
     * @param {Pointer<Integer>} lpcchRequiredBufferLength This value is set to the required length of the buffer in units of WCHARs. This length includes the terminating NULL character.
     * @returns {Integer} Returns ERROR_SUCCESS when all operations complete successfully and the NULL-terminated state path is written to lpPathBuffer. Returns ERROR_INSUFFICIENT_BUFFER is returned if *lpPathBuffer* was not large enough to contain the state path, or if *lpPathBuffer* was NULL. In this case the required buffer length in WCHARs is returned via *lpcchRequiredBufferLength*. If some other failure occurs, a Win32 error code is returned.
     * @see https://docs.microsoft.com/windows/win32/api//winsvc/nf-winsvc-getservicedirectory
     * @since windows10.0.19041
     */
    static GetServiceDirectory(hServiceStatus, eDirectoryType, lpPathBuffer, cchPathBufferLength, lpcchRequiredBufferLength) {
        hServiceStatus := hServiceStatus is Win32Handle ? NumGet(hServiceStatus, "ptr") : hServiceStatus
        lpPathBuffer := lpPathBuffer is String ? StrPtr(lpPathBuffer) : lpPathBuffer

        lpcchRequiredBufferLengthMarshal := lpcchRequiredBufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-service-core-l1-1-4.dll\GetServiceDirectory", "ptr", hServiceStatus, "int", eDirectoryType, "ptr", lpPathBuffer, "uint", cchPathBufferLength, lpcchRequiredBufferLengthMarshal, lpcchRequiredBufferLength, "uint")
        return result
    }

    /**
     * 
     * @param {SC_HANDLE} ServiceHandle 
     * @param {Integer} StateType 
     * @param {Integer} AccessMask 
     * @param {Pointer<HKEY>} ServiceStateKey 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getsharedserviceregistrystatekey
     */
    static GetSharedServiceRegistryStateKey(ServiceHandle, StateType, AccessMask, ServiceStateKey) {
        ServiceHandle := ServiceHandle is Win32Handle ? NumGet(ServiceHandle, "ptr") : ServiceHandle

        result := DllCall("api-ms-win-service-core-l1-1-5.dll\GetSharedServiceRegistryStateKey", "ptr", ServiceHandle, "int", StateType, "uint", AccessMask, "ptr", ServiceStateKey, "uint")
        return result
    }

    /**
     * 
     * @param {SC_HANDLE} ServiceHandle 
     * @param {Integer} DirectoryType 
     * @param {PWSTR} PathBuffer 
     * @param {Integer} PathBufferLength 
     * @param {Pointer<Integer>} RequiredBufferLength 
     * @returns {Integer} 
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getsharedservicedirectory
     */
    static GetSharedServiceDirectory(ServiceHandle, DirectoryType, PathBuffer, PathBufferLength, RequiredBufferLength) {
        ServiceHandle := ServiceHandle is Win32Handle ? NumGet(ServiceHandle, "ptr") : ServiceHandle
        PathBuffer := PathBuffer is String ? StrPtr(PathBuffer) : PathBuffer

        RequiredBufferLengthMarshal := RequiredBufferLength is VarRef ? "uint*" : "ptr"

        result := DllCall("api-ms-win-service-core-l1-1-5.dll\GetSharedServiceDirectory", "ptr", ServiceHandle, "int", DirectoryType, "ptr", PathBuffer, "uint", PathBufferLength, RequiredBufferLengthMarshal, RequiredBufferLength, "uint")
        return result
    }

;@endregion Methods
}
