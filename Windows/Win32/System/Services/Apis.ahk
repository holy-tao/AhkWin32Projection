#Requires AutoHotkey v2.0.0 64-bit

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
     * @type {String}
     */
    static NETWORK_MANAGER_FIRST_IP_ADDRESS_ARRIVAL_GUID => "{4f27f2de-14e2-430b-a549-7cd48cbc8245}"

    /**
     * @type {String}
     */
    static NETWORK_MANAGER_LAST_IP_ADDRESS_REMOVAL_GUID => "{cc4ba62a-162e-4648-847a-b6bdf993e335}"

    /**
     * @type {String}
     */
    static DOMAIN_JOIN_GUID => "{1ce20aba-9851-4421-9430-1ddeb766e809}"

    /**
     * @type {String}
     */
    static DOMAIN_LEAVE_GUID => "{ddaf516e-58c2-4866-9574-c3b615d42ea1}"

    /**
     * @type {String}
     */
    static FIREWALL_PORT_OPEN_GUID => "{b7569e07-8421-4ee0-ad10-86915afdad09}"

    /**
     * @type {String}
     */
    static FIREWALL_PORT_CLOSE_GUID => "{a144ed38-8e12-4de4-9d96-e64740b1a524}"

    /**
     * @type {String}
     */
    static MACHINE_POLICY_PRESENT_GUID => "{659fcae6-5bdb-4da9-b1ff-ca2a178d46e0}"

    /**
     * @type {String}
     */
    static USER_POLICY_PRESENT_GUID => "{54fb46c8-f089-464c-b1fd-59d1b62c3b50}"

    /**
     * @type {String}
     */
    static RPC_INTERFACE_EVENT_GUID => "{bc90d167-9470-4139-a9ba-be0bbbf5b74d}"

    /**
     * @type {String}
     */
    static NAMED_PIPE_EVENT_GUID => "{1f81d131-3fac-4537-9e0c-7e7b0c2f4b55}"

    /**
     * @type {String}
     */
    static CUSTOM_SYSTEM_STATE_CHANGE_EVENT_GUID => "{2d7a2816-0c5e-45fc-9ce7-570e5ecde9c9}"

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
     * @param {Pointer<Void>} hServiceStatus A handle to the status information structure for the service. A service obtains the handle by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a> function.
     * @param {Integer} dwServiceBits The service type. 
     * 
     * 
     * 
     * 
     * Certain bit flags (0xC00F3F7B) are reserved for use by Microsoft. The 
     * <b>SetServiceBits</b> function fails with the error ERROR_INVALID_DATA if any of these bit flags are set in <i>dwServiceBits</i>. The following bit flags are reserved for use by Microsoft.
     * @param {Integer} bSetBitsOn If this value is TRUE, the bits in <i>dwServiceBit</i> are to be set. If this value is FALSE, the bits are to be cleared.
     * @param {Integer} bUpdateImmediately If this value is TRUE, the Server service is to perform an immediate update. If this value is FALSE, the update is not be performed immediately.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/lmserver/nf-lmserver-setservicebits
     * @since windows5.1.2600
     */
    static SetServiceBits(hServiceStatus, dwServiceBits, bSetBitsOn, bUpdateImmediately) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetServiceBits", "ptr", hServiceStatus, "uint", dwServiceBits, "int", bSetBitsOn, "int", bUpdateImmediately, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the configuration parameters of a service. (ANSI)
     * @remarks
     * The 
     * <b>ChangeServiceConfig</b> function changes the configuration information for the specified service in the service control manager database. You can obtain the current configuration information by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfiga">QueryServiceConfig</a> function.
     * 
     * If the configuration is changed for a service that is running, with the exception of <i>lpDisplayName</i>, the changes do not take effect until the service is stopped. To update the credentials without having to restart the service, use the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function.
     * 
     * <h3><a id="Security_Remarks"></a><a id="security_remarks"></a><a id="SECURITY_REMARKS"></a>Security Remarks</h3>
     * Setting the <i>lpServiceStartName</i> parameter changes the logon account of the service. This can cause problems. If you have registered a service principal name (SPN), it would now be registered on the wrong account. Similarly, if you have used an ACE to grant access to a service, it would now grant access to the wrong account.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @param {Pointer<Byte>} lpBinaryPathName The fully qualified path to the service binary file. Specify NULL if you are not changing the existing path. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"". 
     * 
     * 
     * 
     * 
     * The path can also include arguments for an auto-start service. For example, "d:\\myshare\\myservice.exe arg1 arg2". These arguments are passed to the service entry point (typically the <b>main</b> function).
     * 
     * If you specify a path on another computer, the share must be accessible by the computer account of the local computer because this is the security context used in the remote call. However, this requirement allows any potential vulnerabilities in the remote computer to affect the local computer. Therefore, it is best to use a local file.
     * @param {Pointer<Byte>} lpLoadOrderGroup The  name of the load ordering group of which this service is a member. Specify NULL if you are not changing the existing group. Specify an empty string if the service does not belong to a group. 
     * 
     * 
     * 
     * 
     * The startup program uses load ordering groups to load groups of services in a specified order with respect to the other groups. The list of load ordering groups is contained in the <b>ServiceGroupOrder</b> value of the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control</b>
     * @param {Pointer<UInt32>} lpdwTagId A pointer to a variable that receives a tag value that is unique in the group specified in the <i>lpLoadOrderGroup</i> parameter. Specify NULL if you are not changing the existing tag. 
     * 
     * 
     * 
     * 
     * You can use a tag for ordering service startup within a load ordering group by specifying a tag order vector in the <b>GroupOrderList</b> value of the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control</b>
     * 
     * Tags are only evaluated for driver services that have <b>SERVICE_BOOT_START</b> or <b>SERVICE_SYSTEM_START</b> start types.
     * @param {Pointer<Byte>} lpDependencies A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service can be started. (Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group.) Specify NULL if you are not changing the existing dependencies. Specify an empty string if the service has no dependencies. 
     * 
     * 
     * 
     * 
     * You must prefix group names with SC_GROUP_IDENTIFIER so that they can be distinguished from a service name, because services and service groups share the same name space.
     * @param {Pointer<Byte>} lpServiceStartName The name of the account under which the service should run. Specify <b>NULL</b> if you are not changing the existing account name. If the service type is <b>SERVICE_WIN32_OWN_PROCESS</b>, use an account name in the form <i>DomainName</i>&#92;<i>UserName</i>. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .&#92;<i>UserName</i> (note that the corresponding C/C++ string is ".&#92;&#92;<i>UserName</i>"). For more information, see 
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
     * @param {Pointer<Byte>} lpPassword The password to the account name specified by the <i>lpServiceStartName</i> parameter. Specify <b>NULL</b> if you are not changing the existing password. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-record-list">Service Record List</a>. 
     * 
     * 
     * 
     * 
     * If the account name specified by the  <i>lpServiceStartName</i> parameter is the name of  a managed service account or virtual account name, the <i>lpPassword</i> parameter must be <b>NULL</b>. 
     * 
     * Passwords are ignored for driver services.
     * @param {Pointer<Byte>} lpDisplayName The display name to be used by applications to identify the service for its users. Specify <b>NULL</b> if you are not changing the existing display name; otherwise, this string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
     * 
     * This parameter can specify a localized string using the following format:
     * 
     * @[<i>path</i>\]<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadmuistringa">RegLoadMUIString</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Localized strings are not supported until Windows Vista.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-changeserviceconfiga
     * @since windows5.1.2600
     */
    static ChangeServiceConfigA(hService, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword, lpDisplayName) {
        lpBinaryPathName := lpBinaryPathName is String? StrPtr(lpBinaryPathName) : lpBinaryPathName
        lpLoadOrderGroup := lpLoadOrderGroup is String? StrPtr(lpLoadOrderGroup) : lpLoadOrderGroup
        lpDependencies := lpDependencies is String? StrPtr(lpDependencies) : lpDependencies
        lpServiceStartName := lpServiceStartName is String? StrPtr(lpServiceStartName) : lpServiceStartName
        lpPassword := lpPassword is String? StrPtr(lpPassword) : lpPassword
        lpDisplayName := lpDisplayName is String? StrPtr(lpDisplayName) : lpDisplayName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ChangeServiceConfigA", "ptr", hService, "uint", dwServiceType, "uint", dwStartType, "uint", dwErrorControl, "ptr", lpBinaryPathName, "ptr", lpLoadOrderGroup, "uint*", lpdwTagId, "ptr", lpDependencies, "ptr", lpServiceStartName, "ptr", lpPassword, "ptr", lpDisplayName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the configuration parameters of a service. (Unicode)
     * @remarks
     * The 
     * <b>ChangeServiceConfig</b> function changes the configuration information for the specified service in the service control manager database. You can obtain the current configuration information by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfiga">QueryServiceConfig</a> function.
     * 
     * If the configuration is changed for a service that is running, with the exception of <i>lpDisplayName</i>, the changes do not take effect until the service is stopped. To update the credentials without having to restart the service, use the <a href="https://docs.microsoft.com/windows/desktop/api/ntsecapi/nf-ntsecapi-lsacallauthenticationpackage">LsaCallAuthenticationPackage</a> function.
     * 
     * <h3><a id="Security_Remarks"></a><a id="security_remarks"></a><a id="SECURITY_REMARKS"></a>Security Remarks</h3>
     * Setting the <i>lpServiceStartName</i> parameter changes the logon account of the service. This can cause problems. If you have registered a service principal name (SPN), it would now be registered on the wrong account. Similarly, if you have used an ACE to grant access to a service, it would now grant access to the wrong account.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @param {Pointer<Char>} lpBinaryPathName The fully qualified path to the service binary file. Specify NULL if you are not changing the existing path. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"". 
     * 
     * 
     * 
     * 
     * The path can also include arguments for an auto-start service. For example, "d:\\myshare\\myservice.exe arg1 arg2". These arguments are passed to the service entry point (typically the <b>main</b> function).
     * 
     * If you specify a path on another computer, the share must be accessible by the computer account of the local computer because this is the security context used in the remote call. However, this requirement allows any potential vulnerabilities in the remote computer to affect the local computer. Therefore, it is best to use a local file.
     * @param {Pointer<Char>} lpLoadOrderGroup The  name of the load ordering group of which this service is a member. Specify NULL if you are not changing the existing group. Specify an empty string if the service does not belong to a group. 
     * 
     * 
     * 
     * 
     * The startup program uses load ordering groups to load groups of services in a specified order with respect to the other groups. The list of load ordering groups is contained in the <b>ServiceGroupOrder</b> value of the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control</b>
     * @param {Pointer<UInt32>} lpdwTagId A pointer to a variable that receives a tag value that is unique in the group specified in the <i>lpLoadOrderGroup</i> parameter. Specify NULL if you are not changing the existing tag. 
     * 
     * 
     * 
     * 
     * You can use a tag for ordering service startup within a load ordering group by specifying a tag order vector in the <b>GroupOrderList</b> value of the following registry key:
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control</b>
     * 
     * Tags are only evaluated for driver services that have <b>SERVICE_BOOT_START</b> or <b>SERVICE_SYSTEM_START</b> start types.
     * @param {Pointer<Char>} lpDependencies A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service can be started. (Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group.) Specify NULL if you are not changing the existing dependencies. Specify an empty string if the service has no dependencies. 
     * 
     * 
     * 
     * 
     * You must prefix group names with SC_GROUP_IDENTIFIER so that they can be distinguished from a service name, because services and service groups share the same name space.
     * @param {Pointer<Char>} lpServiceStartName The name of the account under which the service should run. Specify <b>NULL</b> if you are not changing the existing account name. If the service type is <b>SERVICE_WIN32_OWN_PROCESS</b>, use an account name in the form <i>DomainName</i>&#92;<i>UserName</i>. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .&#92;<i>UserName</i> (note that the corresponding C/C++ string is ".&#92;&#92;<i>UserName</i>"). For more information, see 
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
     * @param {Pointer<Char>} lpPassword The password to the account name specified by the <i>lpServiceStartName</i> parameter. Specify <b>NULL</b> if you are not changing the existing password. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-record-list">Service Record List</a>. 
     * 
     * 
     * 
     * 
     * If the account name specified by the  <i>lpServiceStartName</i> parameter is the name of  a managed service account or virtual account name, the <i>lpPassword</i> parameter must be <b>NULL</b>. 
     * 
     * Passwords are ignored for driver services.
     * @param {Pointer<Char>} lpDisplayName The display name to be used by applications to identify the service for its users. Specify <b>NULL</b> if you are not changing the existing display name; otherwise, this string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
     * 
     * This parameter can specify a localized string using the following format:
     * 
     * @[<i>path</i>\]<i>dllname</i>,-<i>strID</i>
     * 
     * The string with identifier <i>strID</i> is loaded from <i>dllname</i>; the <i>path</i> is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadmuistringa">RegLoadMUIString</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Localized strings are not supported until Windows Vista.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-changeserviceconfigw
     * @since windows5.1.2600
     */
    static ChangeServiceConfigW(hService, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword, lpDisplayName) {
        lpBinaryPathName := lpBinaryPathName is String? StrPtr(lpBinaryPathName) : lpBinaryPathName
        lpLoadOrderGroup := lpLoadOrderGroup is String? StrPtr(lpLoadOrderGroup) : lpLoadOrderGroup
        lpDependencies := lpDependencies is String? StrPtr(lpDependencies) : lpDependencies
        lpServiceStartName := lpServiceStartName is String? StrPtr(lpServiceStartName) : lpServiceStartName
        lpPassword := lpPassword is String? StrPtr(lpPassword) : lpPassword
        lpDisplayName := lpDisplayName is String? StrPtr(lpDisplayName) : lpDisplayName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ChangeServiceConfigW", "ptr", hService, "uint", dwServiceType, "uint", dwStartType, "uint", dwErrorControl, "ptr", lpBinaryPathName, "ptr", lpLoadOrderGroup, "uint*", lpdwTagId, "ptr", lpDependencies, "ptr", lpServiceStartName, "ptr", lpPassword, "ptr", lpDisplayName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the optional configuration parameters of a service. (ANSI)
     * @remarks
     * The 
     * <b>ChangeServiceConfig2</b> function changes the optional configuration information for the specified service in the service control manager database. You can obtain the current optional configuration information by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfig2a">QueryServiceConfig2</a> function.
     * 
     * You cannot set the <b>SERVICE_CONFIG_FAILURE_ACTIONS</b> value for a service that shares the service control manager's process. This includes all services whose executable image is "Services.exe".
     * 
     * You can change and query additional configuration information using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfiga">QueryServiceConfig</a> functions, respectively.
     * 
     * If a service is configured to restart after it finishes with an error, the service control manager queues the restart action to occur after the specified time delay. A queued restart action cannot be canceled. If the service is manually restarted and then stopped before the queued restart action occurs, the service will restart unexpectedly when the time delay elapses. The service must be explicitly disabled to prevent it from restarting.
     * 
     * The <b>SERVICE_CONFIG_LAUNCH_PROTECTED</b> value can be used to launch the service as protected. In order to launch the service as protected, the service must be signed with a special certificate. 
     * 
     * 
     * SERVICE_CONFIG_LAUNCH_PROTECTED example:
     * 
     * 
     * ```cpp
     * SERVICE_LAUNCH_PROTECTED_INFO Info;
     * SC_HANDLE hService;
     * 
     * Info.dwLaunchProtected = SERVICE_LAUNCH_PROTECTED_ANTIMALWARE_LIGHT;
     * 
     * hService = CreateService (...);
     * 
     * if (ChangeServiceConfig2(hService, 
     *                         SERVICE_CONFIG_LAUNCH_PROTECTED,
     *                         &Info) == FALSE)
     * {
     *     Result = GetLastError();
     * }
     * 
     * ```
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-changeserviceconfig2a
     * @since windows5.1.2600
     */
    static ChangeServiceConfig2A(hService, dwInfoLevel, lpInfo) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ChangeServiceConfig2A", "ptr", hService, "uint", dwInfoLevel, "ptr", lpInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Changes the optional configuration parameters of a service. (Unicode)
     * @remarks
     * The 
     * <b>ChangeServiceConfig2</b> function changes the optional configuration information for the specified service in the service control manager database. You can obtain the current optional configuration information by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfig2a">QueryServiceConfig2</a> function.
     * 
     * You cannot set the <b>SERVICE_CONFIG_FAILURE_ACTIONS</b> value for a service that shares the service control manager's process. This includes all services whose executable image is "Services.exe".
     * 
     * You can change and query additional configuration information using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfiga">QueryServiceConfig</a> functions, respectively.
     * 
     * If a service is configured to restart after it finishes with an error, the service control manager queues the restart action to occur after the specified time delay. A queued restart action cannot be canceled. If the service is manually restarted and then stopped before the queued restart action occurs, the service will restart unexpectedly when the time delay elapses. The service must be explicitly disabled to prevent it from restarting.
     * 
     * The <b>SERVICE_CONFIG_LAUNCH_PROTECTED</b> value can be used to launch the service as protected. In order to launch the service as protected, the service must be signed with a special certificate. 
     * 
     * 
     * SERVICE_CONFIG_LAUNCH_PROTECTED example:
     * 
     * 
     * ```cpp
     * SERVICE_LAUNCH_PROTECTED_INFO Info;
     * SC_HANDLE hService;
     * 
     * Info.dwLaunchProtected = SERVICE_LAUNCH_PROTECTED_ANTIMALWARE_LIGHT;
     * 
     * hService = CreateService (...);
     * 
     * if (ChangeServiceConfig2(hService, 
     *                         SERVICE_CONFIG_LAUNCH_PROTECTED,
     *                         &Info) == FALSE)
     * {
     *     Result = GetLastError();
     * }
     * 
     * ```
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-changeserviceconfig2w
     * @since windows5.1.2600
     */
    static ChangeServiceConfig2W(hService, dwInfoLevel, lpInfo) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ChangeServiceConfig2W", "ptr", hService, "uint", dwInfoLevel, "ptr", lpInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Closes a handle to a service control manager or service object.
     * @remarks
     * The 
     * <b>CloseServiceHandle</b> function does not destroy the service control manager object referred to by the handle. A service control manager object cannot be destroyed. A service object can be destroyed by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-deleteservice">DeleteService</a> function.
     * @param {Pointer<Void>} hSCObject A handle to the service control manager object or the service object to close. Handles to service control manager objects are returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and handles to service objects are returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-closeservicehandle
     * @since windows5.1.2600
     */
    static CloseServiceHandle(hSCObject) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CloseServiceHandle", "ptr", hSCObject, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends a control code to a service. (ControlService)
     * @remarks
     * The <b>ControlService</b> function asks the Service 
     *     Control Manager (SCM) to send the requested control code to the service. The SCM sends the code  if the service 
     *     has specified that it will accept the code, and is in a state in which a control code can be sent to it.
     * 
     * The SCM processes service control notifications in a serial fashion—it will wait for one 
     *     service to complete processing a service control notification before sending the next one. Because of this, a call 
     *     to <b>ControlService</b> will block for 30 seconds if any 
     *     service is busy handling a control code. If the busy service still has not returned from its handler function when 
     *     the timeout expires, <b>ControlService</b> fails with 
     *     <b>ERROR_SERVICE_REQUEST_TIMEOUT</b>.
     * 
     * To stop and start a service requires a security descriptor that allows you to do so. The default security 
     *     descriptor allows the <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a>, and members 
     *     of the Administrators and Power Users groups to stop and start services. To change the security descriptor of a 
     *     service, see 
     *     <a href="https://docs.microsoft.com/windows/desktop/Services/modifying-the-dacl-for-a-service">Modifying the DACL for a Service</a>.
     * 
     * The <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryservicestatusex">QueryServiceStatusEx</a> function returns a 
     *     <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure 
     *     whose <b>dwCurrentState</b> and <b>dwControlsAccepted</b> members indicate 
     *     the current state and controls accepted by a running service. All running services accept the 
     *     <b>SERVICE_CONTROL_INTERROGATE</b> control code by default. Drivers do not accept control codes 
     *     other than <b>SERVICE_CONTROL_STOP</b> and 
     *     <b>SERVICE_CONTROL_INTERROGATE</b>. Each service specifies the other control codes that it 
     *     accepts when it calls the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function 
     *     to report its status. A service should always accept these codes when it is running, no matter what it is 
     *     doing.
     * 
     * The following table shows the action of the SCM  in each of the possible service states.
     * 
     * <table>
     * <tr>
     * <th>Service state</th>
     * <th>Stop</th>
     * <th>Other controls</th>
     * </tr>
     * <tr>
     * <td><b>STOPPED</b></td>
     * <td>(c)</td>
     * <td>(c)</td>
     * </tr>
     * <tr>
     * <td><b>STOP_PENDING</b></td>
     * <td>(b)</td>
     * <td>(b)</td>
     * </tr>
     * <tr>
     * <td><b>START_PENDING</b></td>
     * <td>(a)</td>
     * <td>(b)</td>
     * </tr>
     * <tr>
     * <td><b>RUNNING</b></td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * <tr>
     * <td><b>CONTINUE_PENDING</b></td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * <tr>
     * <td><b>PAUSE_PENDING</b></td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * <tr>
     * <td><b>PAUSED</b></td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * </table>
     * 
     * <dl>
     * <dt>(a)</dt>
     * <dd>
     * If the service accepts this control code, send the request to the service; otherwise, <b>ControlService</b> returns zero
     *     and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns
     *     <b>ERROR_INVALID_SERVICE_CONTROL</b>.
     * </dd>
     * <dt>(b)</dt>
     * <dd>
     * The service is not in a state in which a control can be sent to it, so <b>ControlService</b> returns zero and
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns
     *     <b>ERROR_SERVICE_CANNOT_ACCEPT_CTRL</b>.
     * </dd>
     * <dt>(c)</dt>
     * <dd>
     * The service is not active, so <b>ControlService</b> returns zero and
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns
     *     <b>ERROR_SERVICE_NOT_ACTIVE</b>.
     * </dd>
     * </dl>
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     *        <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> or 
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a>, or the handle is no longer 
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
     *         <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the 
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-controlservice
     * @since windows5.1.2600
     */
    static ControlService(hService, dwControl, lpServiceStatus) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ControlService", "ptr", hService, "uint", dwControl, "ptr", lpServiceStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a service object and adds it to the specified service control manager database. (ANSI)
     * @remarks
     * The 
     * <b>CreateService</b> function creates a service object and installs it in the service control manager database by creating a key with the same name as the service under the following registry key:<b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services</b>
     * 
     * 
     * 
     * Information specified by 
     * <b>CreateService</b>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a> is saved as values under this key. The following are examples of values stored for a service.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>DependOnGroup</b></td>
     * <td>Load-ordering groups on which this service depends, as specified by <i>lpDependencies</i>.</td>
     * </tr>
     * <tr>
     * <td><b>DependOnService</b></td>
     * <td>Services on which this service depends, as specified by <i>lpDependencies</i>.</td>
     * </tr>
     * <tr>
     * <td><b>Description</b></td>
     * <td>Description specified by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a>.</td>
     * </tr>
     * <tr>
     * <td><b>DisplayName</b></td>
     * <td>Display name specified by <i>lpDisplayName</i>.</td>
     * </tr>
     * <tr>
     * <td><b>ErrorControl</b></td>
     * <td>Error control specified by <i>dwErrorControl</i>.</td>
     * </tr>
     * <tr>
     * <td><b>FailureActions</b></td>
     * <td>Failure actions specified by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a>.</td>
     * </tr>
     * <tr>
     * <td><b>Group</b></td>
     * <td>Load ordering group specified by <i>lpLoadOrderGroup</i>. Note that setting this value can override the setting of the <b>DependOnService</b> value.</td>
     * </tr>
     * <tr>
     * <td><b>ImagePath</b></td>
     * <td>Name of binary file, as specified by <i>lpBinaryPathName</i>.</td>
     * </tr>
     * <tr>
     * <td><b>ObjectName</b></td>
     * <td>Account name specified by <i>lpServiceStartName</i>.</td>
     * </tr>
     * <tr>
     * <td><b>Start</b></td>
     * <td>When to start service, as specified by <i>dwStartType</i>.</td>
     * </tr>
     * <tr>
     * <td><b>Tag</b></td>
     * <td>Tag identifier specified by <i>lpdwTagId</i>.</td>
     * </tr>
     * <tr>
     * <td><b>Type</b></td>
     * <td>Service type specified by <i>dwServiceType</i>.</td>
     * </tr>
     * </table>
     *  
     * 
     * Setup programs and the service itself can create additional subkeys for service-specific information.
     * 
     * The returned handle is only valid for the process that called 
     * <b>CreateService</b>. It can be closed by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a> function.
     * 
     * If you are creating services that share a process, avoid calling functions with process-wide effects, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a>. In addition, do not unload your service DLL.
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function and must have the <b>SC_MANAGER_CREATE_SERVICE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer<Byte>} lpServiceName The name of the service to install. The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are not valid service name characters.
     * @param {Pointer<Byte>} lpDisplayName The display name to be used by user interface programs to identify the service. This string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
     * @param {Integer} dwDesiredAccess The access to the service. Before granting the requested access, the system checks the access token of the calling process. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceType 
     * @param {Integer} dwStartType 
     * @param {Integer} dwErrorControl 
     * @param {Pointer<Byte>} lpBinaryPathName The fully qualified path to the service binary file. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"". 
     * 
     * 
     * 
     * 
     * The path can also include arguments for an auto-start service. For example, "d:\\myshare\\myservice.exe arg1 arg2". These arguments are passed to the service entry point (typically the <b>main</b> function).
     * 
     * If you specify a path on another computer, the share must be accessible by the computer account of the local computer because this is the security context used in the remote call. However, this requirement allows any potential vulnerabilities in the remote computer to affect the local computer. Therefore, it is best to use a local file.
     * @param {Pointer<Byte>} lpLoadOrderGroup The names of the load ordering group of which this service is a member. Specify NULL or an empty string if the service does not belong to a group. 
     * 
     * 
     * 
     * 
     * The startup program uses load ordering groups to load groups of services in a specified order with respect to the other groups. The list of load ordering groups is contained in the following registry value: <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ServiceGroupOrder</b>
     * @param {Pointer<UInt32>} lpdwTagId A pointer to a variable that receives a tag value that is unique in the group specified in the <i>lpLoadOrderGroup</i> parameter. Specify NULL if you are not changing the existing tag. 
     * 
     * 
     * 
     * 
     * You can use a tag for ordering service startup within a load ordering group by specifying a tag order vector in the following registry value:<b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\GroupOrderList</b>
     * 
     * 
     * 
     * Tags are only evaluated for driver services that have <b>SERVICE_BOOT_START</b> or <b>SERVICE_SYSTEM_START</b> start types.
     * @param {Pointer<Byte>} lpDependencies A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service. Specify NULL or an empty string if the service has no dependencies. Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group. 
     * 
     * 
     * 
     * 
     * You must prefix group names with <b>SC_GROUP_IDENTIFIER</b> so that they can be distinguished from a service name, because services and service groups share the same name space.
     * @param {Pointer<Byte>} lpServiceStartName The name of the account under which the service should run. If the service type is SERVICE_WIN32_OWN_PROCESS, use an account name in the form <i>DomainName</i>&#92;<i>UserName</i>. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .&#92;<i>UserName</i>. 
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
     * @param {Pointer<Byte>} lpPassword The password to the account name specified by the <i>lpServiceStartName</i> parameter. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-record-list">Service Record List</a>. 
     * 
     * 
     * 
     * 
     * If the account name specified by the  <i>lpServiceStartName</i> parameter is the name of  a managed service account or virtual account name, the <i>lpPassword</i> parameter must be NULL. 
     * 
     * Passwords are ignored for driver services.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the service.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-createservicea
     * @since windows5.1.2600
     */
    static CreateServiceA(hSCManager, lpServiceName, lpDisplayName, dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName
        lpDisplayName := lpDisplayName is String? StrPtr(lpDisplayName) : lpDisplayName
        lpBinaryPathName := lpBinaryPathName is String? StrPtr(lpBinaryPathName) : lpBinaryPathName
        lpLoadOrderGroup := lpLoadOrderGroup is String? StrPtr(lpLoadOrderGroup) : lpLoadOrderGroup
        lpDependencies := lpDependencies is String? StrPtr(lpDependencies) : lpDependencies
        lpServiceStartName := lpServiceStartName is String? StrPtr(lpServiceStartName) : lpServiceStartName
        lpPassword := lpPassword is String? StrPtr(lpPassword) : lpPassword

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateServiceA", "ptr", hSCManager, "ptr", lpServiceName, "ptr", lpDisplayName, "uint", dwDesiredAccess, "uint", dwServiceType, "uint", dwStartType, "uint", dwErrorControl, "ptr", lpBinaryPathName, "ptr", lpLoadOrderGroup, "uint*", lpdwTagId, "ptr", lpDependencies, "ptr", lpServiceStartName, "ptr", lpPassword)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Creates a service object and adds it to the specified service control manager database. (Unicode)
     * @remarks
     * The 
     * <b>CreateService</b> function creates a service object and installs it in the service control manager database by creating a key with the same name as the service under the following registry key:<b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services</b>
     * 
     * 
     * 
     * Information specified by 
     * <b>CreateService</b>, 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a>, and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a> is saved as values under this key. The following are examples of values stored for a service.
     * 
     * <table>
     * <tr>
     * <th>Value</th>
     * <th>Description</th>
     * </tr>
     * <tr>
     * <td><b>DependOnGroup</b></td>
     * <td>Load-ordering groups on which this service depends, as specified by <i>lpDependencies</i>.</td>
     * </tr>
     * <tr>
     * <td><b>DependOnService</b></td>
     * <td>Services on which this service depends, as specified by <i>lpDependencies</i>.</td>
     * </tr>
     * <tr>
     * <td><b>Description</b></td>
     * <td>Description specified by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a>.</td>
     * </tr>
     * <tr>
     * <td><b>DisplayName</b></td>
     * <td>Display name specified by <i>lpDisplayName</i>.</td>
     * </tr>
     * <tr>
     * <td><b>ErrorControl</b></td>
     * <td>Error control specified by <i>dwErrorControl</i>.</td>
     * </tr>
     * <tr>
     * <td><b>FailureActions</b></td>
     * <td>Failure actions specified by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a>.</td>
     * </tr>
     * <tr>
     * <td><b>Group</b></td>
     * <td>Load ordering group specified by <i>lpLoadOrderGroup</i>. Note that setting this value can override the setting of the <b>DependOnService</b> value.</td>
     * </tr>
     * <tr>
     * <td><b>ImagePath</b></td>
     * <td>Name of binary file, as specified by <i>lpBinaryPathName</i>.</td>
     * </tr>
     * <tr>
     * <td><b>ObjectName</b></td>
     * <td>Account name specified by <i>lpServiceStartName</i>.</td>
     * </tr>
     * <tr>
     * <td><b>Start</b></td>
     * <td>When to start service, as specified by <i>dwStartType</i>.</td>
     * </tr>
     * <tr>
     * <td><b>Tag</b></td>
     * <td>Tag identifier specified by <i>lpdwTagId</i>.</td>
     * </tr>
     * <tr>
     * <td><b>Type</b></td>
     * <td>Service type specified by <i>dwServiceType</i>.</td>
     * </tr>
     * </table>
     *  
     * 
     * Setup programs and the service itself can create additional subkeys for service-specific information.
     * 
     * The returned handle is only valid for the process that called 
     * <b>CreateService</b>. It can be closed by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a> function.
     * 
     * If you are creating services that share a process, avoid calling functions with process-wide effects, such as 
     * <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-exitprocess">ExitProcess</a>. In addition, do not unload your service DLL.
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function and must have the <b>SC_MANAGER_CREATE_SERVICE</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer<Char>} lpServiceName The name of the service to install. The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are not valid service name characters.
     * @param {Pointer<Char>} lpDisplayName The display name to be used by user interface programs to identify the service. This string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
     * @param {Integer} dwDesiredAccess The access to the service. Before granting the requested access, the system checks the access token of the calling process. For a list of values, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwServiceType 
     * @param {Integer} dwStartType 
     * @param {Integer} dwErrorControl 
     * @param {Pointer<Char>} lpBinaryPathName The fully qualified path to the service binary file. If the path contains a space, it must be quoted so that it is correctly interpreted. For example, "d:\\my share\\myservice.exe" should be specified as "\"d:\\my share\\myservice.exe\"". 
     * 
     * 
     * 
     * 
     * The path can also include arguments for an auto-start service. For example, "d:\\myshare\\myservice.exe arg1 arg2". These arguments are passed to the service entry point (typically the <b>main</b> function).
     * 
     * If you specify a path on another computer, the share must be accessible by the computer account of the local computer because this is the security context used in the remote call. However, this requirement allows any potential vulnerabilities in the remote computer to affect the local computer. Therefore, it is best to use a local file.
     * @param {Pointer<Char>} lpLoadOrderGroup The names of the load ordering group of which this service is a member. Specify NULL or an empty string if the service does not belong to a group. 
     * 
     * 
     * 
     * 
     * The startup program uses load ordering groups to load groups of services in a specified order with respect to the other groups. The list of load ordering groups is contained in the following registry value: <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ServiceGroupOrder</b>
     * @param {Pointer<UInt32>} lpdwTagId A pointer to a variable that receives a tag value that is unique in the group specified in the <i>lpLoadOrderGroup</i> parameter. Specify NULL if you are not changing the existing tag. 
     * 
     * 
     * 
     * 
     * You can use a tag for ordering service startup within a load ordering group by specifying a tag order vector in the following registry value:<b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\GroupOrderList</b>
     * 
     * 
     * 
     * Tags are only evaluated for driver services that have <b>SERVICE_BOOT_START</b> or <b>SERVICE_SYSTEM_START</b> start types.
     * @param {Pointer<Char>} lpDependencies A pointer to a double null-terminated array of null-separated names of services or load ordering groups that the system must start before this service. Specify NULL or an empty string if the service has no dependencies. Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group. 
     * 
     * 
     * 
     * 
     * You must prefix group names with <b>SC_GROUP_IDENTIFIER</b> so that they can be distinguished from a service name, because services and service groups share the same name space.
     * @param {Pointer<Char>} lpServiceStartName The name of the account under which the service should run. If the service type is SERVICE_WIN32_OWN_PROCESS, use an account name in the form <i>DomainName</i>&#92;<i>UserName</i>. The service process will be logged on as this user. If the account belongs to the built-in domain, you can specify .&#92;<i>UserName</i>. 
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
     * @param {Pointer<Char>} lpPassword The password to the account name specified by the <i>lpServiceStartName</i> parameter. Specify an empty string if the account has no password or if the service runs in the LocalService, NetworkService, or LocalSystem account. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-record-list">Service Record List</a>. 
     * 
     * 
     * 
     * 
     * If the account name specified by the  <i>lpServiceStartName</i> parameter is the name of  a managed service account or virtual account name, the <i>lpPassword</i> parameter must be NULL. 
     * 
     * Passwords are ignored for driver services.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the service.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-createservicew
     * @since windows5.1.2600
     */
    static CreateServiceW(hSCManager, lpServiceName, lpDisplayName, dwDesiredAccess, dwServiceType, dwStartType, dwErrorControl, lpBinaryPathName, lpLoadOrderGroup, lpdwTagId, lpDependencies, lpServiceStartName, lpPassword) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName
        lpDisplayName := lpDisplayName is String? StrPtr(lpDisplayName) : lpDisplayName
        lpBinaryPathName := lpBinaryPathName is String? StrPtr(lpBinaryPathName) : lpBinaryPathName
        lpLoadOrderGroup := lpLoadOrderGroup is String? StrPtr(lpLoadOrderGroup) : lpLoadOrderGroup
        lpDependencies := lpDependencies is String? StrPtr(lpDependencies) : lpDependencies
        lpServiceStartName := lpServiceStartName is String? StrPtr(lpServiceStartName) : lpServiceStartName
        lpPassword := lpPassword is String? StrPtr(lpPassword) : lpPassword

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\CreateServiceW", "ptr", hSCManager, "ptr", lpServiceName, "ptr", lpDisplayName, "uint", dwDesiredAccess, "uint", dwServiceType, "uint", dwStartType, "uint", dwErrorControl, "ptr", lpBinaryPathName, "ptr", lpLoadOrderGroup, "uint*", lpdwTagId, "ptr", lpDependencies, "ptr", lpServiceStartName, "ptr", lpPassword)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Marks the specified service for deletion from the service control manager database.
     * @remarks
     * The 
     * <b>DeleteService</b> function marks a service for deletion from the service control manager database. The database entry is not removed until all open handles to the service have been closed by calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a> function, and the service is not running. A running service is stopped by a call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlservice">ControlService</a> function with the SERVICE_CONTROL_STOP control code. If the service cannot be stopped, the database entry is removed when the system is restarted.
     * 
     * The service control manager deletes the service by deleting the service key and its subkeys from the registry.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the DELETE access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-deleteservice
     * @since windows5.1.2600
     */
    static DeleteService(hService) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\DeleteService", "ptr", hService, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name and status of each service that depends on the specified service. (ANSI)
     * @remarks
     * The returned services entries are ordered in the reverse order of the start order, with group order taken into account. If you need to stop the dependent services, you can use the order of entries written to the <i>lpServices</i> buffer to stop the dependent services in the proper order.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store the array of service entries. The variable only receives this value if the buffer pointed to by <i>lpServices</i> is too small, indicated by function failure and the <b>ERROR_MORE_DATA</b> error; otherwise, the contents of <i>pcbBytesNeeded</i> are undefined.
     * @param {Pointer<UInt32>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-enumdependentservicesa
     * @since windows5.1.2600
     */
    static EnumDependentServicesA(hService, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumDependentServicesA", "ptr", hService, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, "uint*", pcbBytesNeeded, "uint*", lpServicesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the name and status of each service that depends on the specified service. (Unicode)
     * @remarks
     * The returned services entries are ordered in the reverse order of the start order, with group order taken into account. If you need to stop the dependent services, you can use the order of entries written to the <i>lpServices</i> buffer to stop the dependent services in the proper order.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store the array of service entries. The variable only receives this value if the buffer pointed to by <i>lpServices</i> is too small, indicated by function failure and the <b>ERROR_MORE_DATA</b> error; otherwise, the contents of <i>pcbBytesNeeded</i> are undefined.
     * @param {Pointer<UInt32>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-enumdependentservicesw
     * @since windows5.1.2600
     */
    static EnumDependentServicesW(hService, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumDependentServicesW", "ptr", hService, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, "uint*", pcbBytesNeeded, "uint*", lpServicesReturned, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates services in the specified service control manager database. The name and status of each service are provided. (ANSI)
     * @remarks
     * > [!NOTE]
     * > The winsvc.h header defines EnumServicesStatus as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. This handle is returned by the 
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
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
     * @param {Pointer<UInt32>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @param {Pointer<UInt32>} lpResumeHandle A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time this function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns ERROR_MORE_DATA, this value is used to indicate the next service entry to be read when the function is called to retrieve the additional data.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-enumservicesstatusa">EnumServicesStatus</a> with the <i>lpResumeHandle</i> parameter indicating the next service to read.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-enumservicesstatusa
     * @since windows5.1.2600
     */
    static EnumServicesStatusA(hSCManager, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumServicesStatusA", "ptr", hSCManager, "uint", dwServiceType, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, "uint*", pcbBytesNeeded, "uint*", lpServicesReturned, "uint*", lpResumeHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates services in the specified service control manager database. The name and status of each service are provided. (Unicode)
     * @remarks
     * > [!NOTE]
     * > The winsvc.h header defines EnumServicesStatus as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. This handle is returned by the 
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
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
     * @param {Pointer<UInt32>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @param {Pointer<UInt32>} lpResumeHandle A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time this function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns ERROR_MORE_DATA, this value is used to indicate the next service entry to be read when the function is called to retrieve the additional data.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-enumservicesstatusa">EnumServicesStatus</a> with the <i>lpResumeHandle</i> parameter indicating the next service to read.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-enumservicesstatusw
     * @since windows5.1.2600
     */
    static EnumServicesStatusW(hSCManager, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumServicesStatusW", "ptr", hSCManager, "uint", dwServiceType, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, "uint*", pcbBytesNeeded, "uint*", lpServicesReturned, "uint*", lpResumeHandle, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates services in the specified service control manager database. The name and status of each service are provided, along with additional data based on the specified information level. (ANSI)
     * @remarks
     * If the caller does not have the <b>SERVICE_QUERY_STATUS</b> access right to a service, the service is silently omitted from the list of services returned to the client.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines EnumServicesStatusEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. This handle is returned by the 
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
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
     * @param {Pointer<UInt32>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @param {Pointer<UInt32>} lpResumeHandle A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time the 
     * <b>EnumServicesStatusEx</b> function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_MORE_DATA</b>, this value indicates the next service entry to be read when the 
     * <b>EnumServicesStatusEx</b> function is called to retrieve the additional data.
     * @param {Pointer<Byte>} pszGroupName The load-order group name. If this parameter is a string, the only services enumerated are those that belong to the group that has the name specified by the string. If this parameter is an empty string, only services that do not belong to any group are enumerated. If this parameter is <b>NULL</b>, group membership is ignored and all services are enumerated.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following errors may be returned.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-enumservicesstatusexa
     * @since windows5.1.2600
     */
    static EnumServicesStatusExA(hSCManager, InfoLevel, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle, pszGroupName) {
        pszGroupName := pszGroupName is String? StrPtr(pszGroupName) : pszGroupName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumServicesStatusExA", "ptr", hSCManager, "int", InfoLevel, "uint", dwServiceType, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, "uint*", pcbBytesNeeded, "uint*", lpServicesReturned, "uint*", lpResumeHandle, "ptr", pszGroupName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enumerates services in the specified service control manager database. The name and status of each service are provided, along with additional data based on the specified information level. (Unicode)
     * @remarks
     * If the caller does not have the <b>SERVICE_QUERY_STATUS</b> access right to a service, the service is silently omitted from the list of services returned to the client.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines EnumServicesStatusEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. This handle is returned by the 
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
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the remaining service entries, if the buffer is too small.
     * @param {Pointer<UInt32>} lpServicesReturned A pointer to a variable that receives the number of service entries returned.
     * @param {Pointer<UInt32>} lpResumeHandle A pointer to a variable that, on input, specifies the starting point of enumeration. You must set this value to zero the first time the 
     * <b>EnumServicesStatusEx</b> function is called. On output, this value is zero if the function succeeds. However, if the function returns zero and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function returns <b>ERROR_MORE_DATA</b>, this value indicates the next service entry to be read when the 
     * <b>EnumServicesStatusEx</b> function is called to retrieve the additional data.
     * @param {Pointer<Char>} pszGroupName The load-order group name. If this parameter is a string, the only services enumerated are those that belong to the group that has the name specified by the string. If this parameter is an empty string, only services that do not belong to any group are enumerated. If this parameter is <b>NULL</b>, group membership is ignored and all services are enumerated.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following errors may be returned.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-enumservicesstatusexw
     * @since windows5.1.2600
     */
    static EnumServicesStatusExW(hSCManager, InfoLevel, dwServiceType, dwServiceState, lpServices, cbBufSize, pcbBytesNeeded, lpServicesReturned, lpResumeHandle, pszGroupName) {
        pszGroupName := pszGroupName is String? StrPtr(pszGroupName) : pszGroupName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\EnumServicesStatusExW", "ptr", hSCManager, "int", InfoLevel, "uint", dwServiceType, "uint", dwServiceState, "ptr", lpServices, "uint", cbBufSize, "uint*", pcbBytesNeeded, "uint*", lpServicesReturned, "uint*", lpResumeHandle, "ptr", pszGroupName, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the service name of the specified service. (ANSI)
     * @remarks
     * There are two names for a service: the service name and the display name. The service name is the name of the service's key in the registry. The display name is a user-friendly name that appears in the Services control panel application, and is used with the <b>NET START</b> command. Both names are specified with the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and can be modified with the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> function. Information specified for a service is stored in a key with the same name as the service name under the <b>HKEY_LOCAL_MACHINE</b>&#92;<b>System</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<i>ServiceName</i> registry key.
     * 
     * To map the service name to the display name, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-getservicedisplaynamea">GetServiceDisplayName</a> function. To map the display name to the service name, use the 
     * <b>GetServiceKeyName</b> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines GetServiceKeyName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the computer's service control manager database, as returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a>.
     * @param {Pointer<Byte>} lpDisplayName The service display name. This string has a maximum length of 256 characters.
     * @param {Pointer<Byte>} lpServiceName A pointer to a buffer that receives the service name. If the function fails, this buffer will contain an empty string.
     * 
     * The maximum size of this array is 4K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>lpcchBuffer</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>lpcchBuffer</i> parameter will receive the required size.
     * @param {Pointer<UInt32>} lpcchBuffer A pointer to variable that specifies the size of the buffer pointed to by the <i>lpServiceName</i> parameter, in <b>TCHARs</b>. When the function returns, this parameter contains the size of the service name, in <b>TCHARs</b>, excluding the null-terminating character.
     * 
     * If the buffer pointed to by <i>lpServiceName</i> is too small to contain the service name, the function stores no data in it. When the function returns, <i>lpcchBuffer</i> contains the size of the service name, excluding the NULL terminator.
     * @returns {Integer} If the functions succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getservicekeynamea
     * @since windows5.1.2600
     */
    static GetServiceKeyNameA(hSCManager, lpDisplayName, lpServiceName, lpcchBuffer) {
        lpDisplayName := lpDisplayName is String? StrPtr(lpDisplayName) : lpDisplayName
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetServiceKeyNameA", "ptr", hSCManager, "ptr", lpDisplayName, "ptr", lpServiceName, "uint*", lpcchBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the service name of the specified service. (Unicode)
     * @remarks
     * There are two names for a service: the service name and the display name. The service name is the name of the service's key in the registry. The display name is a user-friendly name that appears in the Services control panel application, and is used with the <b>NET START</b> command. Both names are specified with the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and can be modified with the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> function. Information specified for a service is stored in a key with the same name as the service name under the <b>HKEY_LOCAL_MACHINE</b>&#92;<b>System</b>&#92;<b>CurrentControlSet</b>&#92;<b>Services</b>&#92;<i>ServiceName</i> registry key.
     * 
     * To map the service name to the display name, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-getservicedisplaynamea">GetServiceDisplayName</a> function. To map the display name to the service name, use the 
     * <b>GetServiceKeyName</b> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines GetServiceKeyName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the computer's service control manager database, as returned by 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a>.
     * @param {Pointer<Char>} lpDisplayName The service display name. This string has a maximum length of 256 characters.
     * @param {Pointer<Char>} lpServiceName A pointer to a buffer that receives the service name. If the function fails, this buffer will contain an empty string.
     * 
     * The maximum size of this array is 4K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>lpcchBuffer</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>lpcchBuffer</i> parameter will receive the required size.
     * @param {Pointer<UInt32>} lpcchBuffer A pointer to variable that specifies the size of the buffer pointed to by the <i>lpServiceName</i> parameter, in <b>TCHARs</b>. When the function returns, this parameter contains the size of the service name, in <b>TCHARs</b>, excluding the null-terminating character.
     * 
     * If the buffer pointed to by <i>lpServiceName</i> is too small to contain the service name, the function stores no data in it. When the function returns, <i>lpcchBuffer</i> contains the size of the service name, excluding the NULL terminator.
     * @returns {Integer} If the functions succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getservicekeynamew
     * @since windows5.1.2600
     */
    static GetServiceKeyNameW(hSCManager, lpDisplayName, lpServiceName, lpcchBuffer) {
        lpDisplayName := lpDisplayName is String? StrPtr(lpDisplayName) : lpDisplayName
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetServiceKeyNameW", "ptr", hSCManager, "ptr", lpDisplayName, "ptr", lpServiceName, "uint*", lpcchBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name of the specified service. (ANSI)
     * @remarks
     * There are two names for a service: the service name and the display name. The service name is the name of the service's key in the registry. The display name is a user-friendly name that appears in the Services control panel application, and is used with the <b>NET START</b> command. To map the service name to the display name, use the 
     * <b>GetServiceDisplayName</b> function. To map the display name to the service name, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-getservicekeynamea">GetServiceKeyName</a> function.
     * 
     * > [!NOTE]
     * > The winsvc.h header defines GetServiceDisplayName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database, as returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function.
     * @param {Pointer<Byte>} lpServiceName The service name. This name is the same as the service's registry key name. It is best to choose a name that is less than 256 characters.
     * @param {Pointer<Byte>} lpDisplayName A pointer to a buffer that receives the service's display name. If the function fails, this buffer will contain an empty string.
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
     * @param {Pointer<UInt32>} lpcchBuffer A pointer to a variable that specifies the size of the buffer pointed to by <i>lpDisplayName</i>, in <b>TCHARs</b>. 
     * 
     * On output, this variable receives the size of the service's display name, in characters, excluding the null-terminating character.
     * 
     * If the buffer pointed to by <i>lpDisplayName</i> is too small to contain the display name, the function does not store it. When the function returns, <i>lpcchBuffer</i> contains the size of the service's display name, excluding the null-terminating character.
     * @returns {Integer} If the functions succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getservicedisplaynamea
     * @since windows5.1.2600
     */
    static GetServiceDisplayNameA(hSCManager, lpServiceName, lpDisplayName, lpcchBuffer) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName
        lpDisplayName := lpDisplayName is String? StrPtr(lpDisplayName) : lpDisplayName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetServiceDisplayNameA", "ptr", hSCManager, "ptr", lpServiceName, "ptr", lpDisplayName, "uint*", lpcchBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the display name of the specified service. (Unicode)
     * @remarks
     * There are two names for a service: the service name and the display name. The service name is the name of the service's key in the registry. The display name is a user-friendly name that appears in the Services control panel application, and is used with the <b>NET START</b> command. To map the service name to the display name, use the 
     * <b>GetServiceDisplayName</b> function. To map the display name to the service name, use the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-getservicekeynamea">GetServiceKeyName</a> function.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines GetServiceDisplayName as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database, as returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function.
     * @param {Pointer<Char>} lpServiceName The service name. This name is the same as the service's registry key name. It is best to choose a name that is less than 256 characters.
     * @param {Pointer<Char>} lpDisplayName A pointer to a buffer that receives the service's display name. If the function fails, this buffer will contain an empty string.
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
     * @param {Pointer<UInt32>} lpcchBuffer A pointer to a variable that specifies the size of the buffer pointed to by <i>lpDisplayName</i>, in <b>TCHARs</b>. 
     * 
     * 
     * On output, this variable receives the size of the service's display name, in characters, excluding the null-terminating character.
     * 
     * If the buffer pointed to by <i>lpDisplayName</i> is too small to contain the display name, the function does not store it. When the function returns, <i>lpcchBuffer</i> contains the size of the service's display name, excluding the null-terminating character.
     * @returns {Integer} If the functions succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getservicedisplaynamew
     * @since windows5.1.2600
     */
    static GetServiceDisplayNameW(hSCManager, lpServiceName, lpDisplayName, lpcchBuffer) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName
        lpDisplayName := lpDisplayName is String? StrPtr(lpDisplayName) : lpDisplayName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\GetServiceDisplayNameW", "ptr", hSCManager, "ptr", lpServiceName, "ptr", lpDisplayName, "uint*", lpcchBuffer, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Requests ownership of the service control manager (SCM) database lock. Only one process can own the lock at any specified time.
     * @remarks
     * A lock is a protocol used by setup and configuration programs and the SCM to serialize access to the service tree in the registry. The only time the SCM requests ownership of the lock is when it is starting a service.
     * 
     * A program that acquires the SCM database lock and fails to release it prevents the SCM from starting other services. Because of the severity of this issue, processes are no longer allowed to lock the database. For compatibility with older applications, the <b>LockServiceDatabase</b> function returns a lock but has no other effect. 
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Acquiring the SCM database lock prevents the SCM from starting a service until the lock is released. For example, a program that must configure several related services before any of them starts could call 
     * <b>LockServiceDatabase</b> before configuring the first service. Alternatively, it could ensure that none of the services are started until the configuration has been completed.
     * 
     * A call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicea">StartService</a> function to start a service in a locked database fails. No other SCM functions are affected by a lock.
     * 
     * The lock is held until the <b>SC_LOCK</b> handle is specified in a subsequent call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-unlockservicedatabase">UnlockServiceDatabase</a> function. If a process that owns a lock terminates, the SCM automatically cleans up and releases ownership of the lock. 
     * 
     * Failing to release the lock can cause system problems. A process that acquires  the lock should release it as soon as possible.
     * @param {Pointer<Void>} hSCManager A handle to the SCM database. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and must have the <b>SC_MANAGER_LOCK</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a lock to the specified SCM database.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-lockservicedatabase
     * @since windows5.1.2600
     */
    static LockServiceDatabase(hSCManager) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\LockServiceDatabase", "ptr", hSCManager)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Reports the boot status to the service control manager. It is used by boot verification programs.
     * @remarks
     * Saving the configuration of a running system with this function is an acceptable method for saving the last-known good configuration. If the boot configuration is unacceptable, use this function to reboot the system using the existing last-known good configuration.
     * 
     * This function call requires the caller's token to have permission to acquire the SC_MANAGER_MODIFY_BOOT_CONFIG access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} BootAcceptable If the value is TRUE, the system saves the configuration as the last-known good configuration. If the value is FALSE, the system immediately reboots, using the previously saved last-known good configuration.
     * @returns {Integer} If the <i>BootAcceptable</i> parameter is FALSE, the function does not return.
     * 
     * If the last-known good configuration was successfully saved, the return value is nonzero.
     * 
     * If an error occurs, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-notifybootconfigstatus
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
     * Establishes a connection to the service control manager on the specified computer and opens the specified service control manager database. (ANSI)
     * @remarks
     * When a process uses the 
     * <b>OpenSCManager</b> function to open a handle to a service control manager database, the system performs a security check before granting the requested access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * 
     * If the current user does not have proper access when connecting to a service on another computer, the  <b>OpenSCManager</b> function call fails. To connect to a service remotely, call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function with LOGON32_LOGON_NEW_CREDENTIALS and then call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser">ImpersonateLoggedOnUser</a> before calling <b>OpenSCManager</b>. For more information about connecting to services remotely, see <a href="https://docs.microsoft.com/windows/desktop/Services/services-and-rpc-tcp">Services and RPC/TCP</a>.
     * 
     * Only processes with Administrator privileges are able to open a database handle that can be used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function.
     * 
     * The returned handle is only valid for the process that called the 
     * <b>OpenSCManager</b> function. It can be closed by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a> function.
     * @param {Pointer<Byte>} lpMachineName The name of the target computer. If the pointer is NULL or points to an empty string, the function connects to the service control manager on the local computer.
     * @param {Pointer<Byte>} lpDatabaseName The name of the service control manager database. This parameter should be set to SERVICES_ACTIVE_DATABASE. If it is NULL, the SERVICES_ACTIVE_DATABASE database is opened by default.
     * @param {Integer} dwDesiredAccess The access to the service control manager. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Before granting the requested access rights, the system checks the access token of the calling process against the discretionary access-control list of the security descriptor associated with the service control manager.
     * 
     * The SC_MANAGER_CONNECT access right is implicitly specified by calling this function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the specified service control manager database.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-openscmanagera
     * @since windows5.1.2600
     */
    static OpenSCManagerA(lpMachineName, lpDatabaseName, dwDesiredAccess) {
        lpMachineName := lpMachineName is String? StrPtr(lpMachineName) : lpMachineName
        lpDatabaseName := lpDatabaseName is String? StrPtr(lpDatabaseName) : lpDatabaseName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenSCManagerA", "ptr", lpMachineName, "ptr", lpDatabaseName, "uint", dwDesiredAccess)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Establishes a connection to the service control manager on the specified computer and opens the specified service control manager database. (Unicode)
     * @remarks
     * When a process uses the 
     * <b>OpenSCManager</b> function to open a handle to a service control manager database, the system performs a security check before granting the requested access. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * 
     * If the current user does not have proper access when connecting to a service on another computer, the  <b>OpenSCManager</b> function call fails. To connect to a service remotely, call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-logonusera">LogonUser</a> function with LOGON32_LOGON_NEW_CREDENTIALS and then call <a href="https://docs.microsoft.com/windows/desktop/api/securitybaseapi/nf-securitybaseapi-impersonateloggedonuser">ImpersonateLoggedOnUser</a> before calling <b>OpenSCManager</b>. For more information about connecting to services remotely, see <a href="https://docs.microsoft.com/windows/desktop/Services/services-and-rpc-tcp">Services and RPC/TCP</a>.
     * 
     * Only processes with Administrator privileges are able to open a database handle that can be used by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function.
     * 
     * The returned handle is only valid for the process that called the 
     * <b>OpenSCManager</b> function. It can be closed by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a> function.
     * @param {Pointer<Char>} lpMachineName The name of the target computer. If the pointer is NULL or points to an empty string, the function connects to the service control manager on the local computer.
     * @param {Pointer<Char>} lpDatabaseName The name of the service control manager database. This parameter should be set to SERVICES_ACTIVE_DATABASE. If it is NULL, the SERVICES_ACTIVE_DATABASE database is opened by default.
     * @param {Integer} dwDesiredAccess The access to the service control manager. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Before granting the requested access rights, the system checks the access token of the calling process against the discretionary access-control list of the security descriptor associated with the service control manager.
     * 
     * The SC_MANAGER_CONNECT access right is implicitly specified by calling this function.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the specified service control manager database.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-openscmanagerw
     * @since windows5.1.2600
     */
    static OpenSCManagerW(lpMachineName, lpDatabaseName, dwDesiredAccess) {
        lpMachineName := lpMachineName is String? StrPtr(lpMachineName) : lpMachineName
        lpDatabaseName := lpDatabaseName is String? StrPtr(lpDatabaseName) : lpDatabaseName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenSCManagerW", "ptr", lpMachineName, "ptr", lpDatabaseName, "uint", dwDesiredAccess)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens an existing service. (ANSI)
     * @remarks
     * The returned handle is only valid for the process that called 
     * <b>OpenService</b>. It can be closed by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a> function.
     * 
     * To use <b>OpenService</b>, no privileges are required aside from <b>SC_MANAGER_CONNECT</b>.
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function returns this handle. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer<Byte>} lpServiceName The name of the service to be opened. This is the name specified by the <i>lpServiceName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when the service object was created, not the service display name that is shown by user interface applications to identify the service. 
     * 
     * The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are invalid service name characters.
     * @param {Integer} dwDesiredAccess The access to the service. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Before granting the requested access, the system checks the access token of the calling process against the discretionary access-control list of the security descriptor associated with the service object.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the service.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-openservicea
     * @since windows5.1.2600
     */
    static OpenServiceA(hSCManager, lpServiceName, dwDesiredAccess) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenServiceA", "ptr", hSCManager, "ptr", lpServiceName, "uint", dwDesiredAccess)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Opens an existing service. (Unicode)
     * @remarks
     * The returned handle is only valid for the process that called 
     * <b>OpenService</b>. It can be closed by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a> function.
     * 
     * To use <b>OpenService</b>, no privileges are required aside from <b>SC_MANAGER_CONNECT</b>.
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function returns this handle. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer<Char>} lpServiceName The name of the service to be opened. This is the name specified by the <i>lpServiceName</i> parameter of the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when the service object was created, not the service display name that is shown by user interface applications to identify the service. 
     * 
     * The maximum string length is 256 characters. The service control manager database preserves the case of the characters, but service name comparisons are always case insensitive. Forward-slash (/) and backslash (\\) are invalid service name characters.
     * @param {Integer} dwDesiredAccess The access to the service. For a list of access rights, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * 
     * 
     * 
     * Before granting the requested access, the system checks the access token of the calling process against the discretionary access-control list of the security descriptor associated with the service object.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a handle to the service.
     * 
     * If the function fails, the return value is NULL. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-openservicew
     * @since windows5.1.2600
     */
    static OpenServiceW(hSCManager, lpServiceName, dwDesiredAccess) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\OpenServiceW", "ptr", hSCManager, "ptr", lpServiceName, "uint", dwDesiredAccess)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the configuration parameters of the specified service. (ANSI)
     * @remarks
     * The 
     * <b>QueryServiceConfig</b> function returns the service configuration information kept in the registry for a particular service. This configuration information is first set by a service control program using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. This information may have been updated by a service configuration program using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> function.
     * 
     * If the service was running when the configuration information was last changed, the information returned by 
     * <b>QueryServiceConfig</b> will not reflect the current configuration of the service. Instead, it will reflect the configuration of the service when it is next run. The <b>DisplayName</b> key is an exception to this. When the <b>DisplayName</b> key is changed, it takes effect immediately, regardless of whether the service is running.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_QUERY_CONFIG access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer} lpServiceConfig A pointer to a buffer that receives the service configuration information. The format of the data is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_configa">QUERY_SERVICE_CONFIG</a> structure.
     * 
     * The maximum size of this array is 8K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return ERROR_INSUFFICIENT_BUFFER. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServiceConfig</i> parameter, in bytes.
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store all the configuration information, if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryserviceconfiga
     * @since windows5.1.2600
     */
    static QueryServiceConfigA(hService, lpServiceConfig, cbBufSize, pcbBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceConfigA", "ptr", hService, "ptr", lpServiceConfig, "uint", cbBufSize, "uint*", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the configuration parameters of the specified service. (Unicode)
     * @remarks
     * The 
     * <b>QueryServiceConfig</b> function returns the service configuration information kept in the registry for a particular service. This configuration information is first set by a service control program using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. This information may have been updated by a service configuration program using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> function.
     * 
     * If the service was running when the configuration information was last changed, the information returned by 
     * <b>QueryServiceConfig</b> will not reflect the current configuration of the service. Instead, it will reflect the configuration of the service when it is next run. The <b>DisplayName</b> key is an exception to this. When the <b>DisplayName</b> key is changed, it takes effect immediately, regardless of whether the service is running.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_QUERY_CONFIG access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer} lpServiceConfig A pointer to a buffer that receives the service configuration information. The format of the data is a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_configa">QUERY_SERVICE_CONFIG</a> structure.
     * 
     * The maximum size of this array is 8K bytes. To determine the required size, specify NULL for this parameter and 0 for the <i>cbBufSize</i> parameter. The function will fail and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> will return ERROR_INSUFFICIENT_BUFFER. The <i>pcbBytesNeeded</i> parameter will receive the required size.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpServiceConfig</i> parameter, in bytes.
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store all the configuration information, if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryserviceconfigw
     * @since windows5.1.2600
     */
    static QueryServiceConfigW(hService, lpServiceConfig, cbBufSize, pcbBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceConfigW", "ptr", hService, "ptr", lpServiceConfig, "uint", cbBufSize, "uint*", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the optional configuration parameters of the specified service. (ANSI)
     * @remarks
     * The 
     * <b>QueryServiceConfig2</b> function returns the optional configuration information stored in the service control manager database for the specified service. You can change this configuration information by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a> function.
     * 
     * You can change and query additional configuration information using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfiga">QueryServiceConfig</a> functions, respectively.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the <b>SERVICE_QUERY_CONFIG</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwInfoLevel 
     * @param {Pointer} lpBuffer A pointer to the buffer that receives the service configuration information. The format of this data depends on the value of the <i>dwInfoLevel</i> parameter.
     * 
     * The maximum size of this array is 8K bytes. To determine the required size, specify <b>NULL</b> for this parameter and 0 for the <i>cbBufSize</i> parameter. The function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>pcbBytesNeeded</i> parameter receives the needed size.
     * @param {Integer} cbBufSize The size of the structure pointed to by the <i>lpBuffer</i> parameter, in bytes.
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes required to store the configuration information, if the function fails with  <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryserviceconfig2a
     * @since windows5.1.2600
     */
    static QueryServiceConfig2A(hService, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceConfig2A", "ptr", hService, "uint", dwInfoLevel, "ptr", lpBuffer, "uint", cbBufSize, "uint*", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the optional configuration parameters of the specified service. (Unicode)
     * @remarks
     * The 
     * <b>QueryServiceConfig2</b> function returns the optional configuration information stored in the service control manager database for the specified service. You can change this configuration information by using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfig2a">ChangeServiceConfig2</a> function.
     * 
     * You can change and query additional configuration information using the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceconfiga">QueryServiceConfig</a> functions, respectively.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function and must have the <b>SERVICE_QUERY_CONFIG</b> access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwInfoLevel 
     * @param {Pointer} lpBuffer A pointer to the buffer that receives the service configuration information. The format of this data depends on the value of the <i>dwInfoLevel</i> parameter.
     * 
     * The maximum size of this array is 8K bytes. To determine the required size, specify <b>NULL</b> for this parameter and 0 for the <i>cbBufSize</i> parameter. The function fails and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns <b>ERROR_INSUFFICIENT_BUFFER</b>. The <i>pcbBytesNeeded</i> parameter receives the needed size.
     * @param {Integer} cbBufSize The size of the structure pointed to by the <i>lpBuffer</i> parameter, in bytes.
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes required to store the configuration information, if the function fails with  <b>ERROR_INSUFFICIENT_BUFFER</b>.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryserviceconfig2w
     * @since windows5.1.2600
     */
    static QueryServiceConfig2W(hService, dwInfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceConfig2W", "ptr", hService, "uint", dwInfoLevel, "ptr", lpBuffer, "uint", cbBufSize, "uint*", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the lock status of the specified service control manager database. (ANSI)
     * @remarks
     * The 
     * <b>QueryServiceLockStatus</b> function returns a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_lock_statusa">QUERY_SERVICE_LOCK_STATUS</a> structure that indicates whether the specified database is locked. If the database is locked, the structure provides the account name of the user that owns the lock and the length of time that the lock has been held.
     * 
     * A process calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-lockservicedatabase">LockServiceDatabase</a> function to acquire ownership of a service control manager database lock and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-unlockservicedatabase">UnlockServiceDatabase</a> function to release the lock.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines QueryServiceLockStatus as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function returns this handle, which must have the SC_MANAGER_QUERY_LOCK_STATUS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer} lpLockStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_lock_statusa">QUERY_SERVICE_LOCK_STATUS</a> structure that receives the lock status of the specified database is returned, plus the strings to which its members point.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpLockStatus</i> parameter, in bytes.
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return all the lock status information, if the function fails.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryservicelockstatusa
     * @since windows5.1.2600
     */
    static QueryServiceLockStatusA(hSCManager, lpLockStatus, cbBufSize, pcbBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceLockStatusA", "ptr", hSCManager, "ptr", lpLockStatus, "uint", cbBufSize, "uint*", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the lock status of the specified service control manager database. (Unicode)
     * @remarks
     * The 
     * <b>QueryServiceLockStatus</b> function returns a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_lock_statusa">QUERY_SERVICE_LOCK_STATUS</a> structure that indicates whether the specified database is locked. If the database is locked, the structure provides the account name of the user that owns the lock and the length of time that the lock has been held.
     * 
     * A process calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-lockservicedatabase">LockServiceDatabase</a> function to acquire ownership of a service control manager database lock and the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-unlockservicedatabase">UnlockServiceDatabase</a> function to release the lock.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines QueryServiceLockStatus as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hSCManager A handle to the service control manager database. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function returns this handle, which must have the SC_MANAGER_QUERY_LOCK_STATUS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer} lpLockStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-query_service_lock_statusa">QUERY_SERVICE_LOCK_STATUS</a> structure that receives the lock status of the specified database is returned, plus the strings to which its members point.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpLockStatus</i> parameter, in bytes.
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return all the lock status information, if the function fails.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryservicelockstatusw
     * @since windows5.1.2600
     */
    static QueryServiceLockStatusW(hSCManager, lpLockStatus, cbBufSize, pcbBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceLockStatusW", "ptr", hSCManager, "ptr", lpLockStatus, "uint", cbBufSize, "uint*", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves a copy of the security descriptor associated with a service object.
     * @remarks
     * When a service is created, the service control manager assigns a default security descriptor to the service object. To retrieve a copy of the security descriptor for a service object, call the <b>QueryServiceObjectSecurity</b> function. To change the security descriptor, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setserviceobjectsecurity">SetServiceObjectSecurity</a> function. For a description of the default security descriptor for a service object, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * 
     * To read the owner, group, or DACL from the security descriptor of the service object, the calling process must have been granted READ_CONTROL access when the handle was opened. To get READ_CONTROL access, the caller must be the owner of the object or the DACL of the object must grant the access.
     * 
     * To read the SACL from the security descriptor, the calling process must have been granted ACCESS_SYSTEM_SECURITY access when the handle was opened. The correct way to get this access is to enable the SE_SECURITY_NAME privilege in the caller's current token, open the handle for ACCESS_SYSTEM_SECURITY access, and then disable the privilege.
     * @param {Pointer<Void>} hService A handle to the service control manager or the service. Handles to the service control manager are returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openscmanagera">OpenSCManager</a> function, and handles to a service are returned by either the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The handle must have the READ_CONTROL access right.
     * @param {Integer} dwSecurityInformation A set of 
     * bit flags that indicate the type of security information to retrieve. This parameter can be a combination of the 
     * <a href="https://docs.microsoft.com/windows/desktop/SecAuthZ/security-information">SECURITY_INFORMATION</a> bit flags, with the exception that this function does not support the <b>LABEL_SECURITY_INFORMATION</b> value.
     * @param {Pointer} lpSecurityDescriptor A pointer to a buffer that receives a copy of the security descriptor of the specified service object. The calling process must have the appropriate access to view the specified aspects of the  security descriptor of the object. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure is returned in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">self-relative</a> format.
     * @param {Integer} cbBufSize The size of the buffer pointed to by the <i>lpSecurityDescriptor</i> parameter, in bytes. The largest size allowed is 8 kilobytes.
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to return the requested security descriptor information, if the function fails.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryserviceobjectsecurity
     * @since windows5.1.2600
     */
    static QueryServiceObjectSecurity(hService, dwSecurityInformation, lpSecurityDescriptor, cbBufSize, pcbBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceObjectSecurity", "ptr", hService, "uint", dwSecurityInformation, "ptr", lpSecurityDescriptor, "uint", cbBufSize, "uint*", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current status of the specified service.
     * @remarks
     * The 
     * <b>QueryServiceStatus</b> function returns the most recent service status information reported to the service control manager. If the service just changed its status, it may not have updated the service control manager yet.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_QUERY_STATUS access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Pointer<SERVICE_STATUS>} lpServiceStatus A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status">SERVICE_STATUS</a> structure that receives the status information.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryservicestatus
     * @since windows5.1.2600
     */
    static QueryServiceStatus(hService, lpServiceStatus) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceStatus", "ptr", hService, "ptr", lpServiceStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves the current status of the specified service based on the specified information level.
     * @remarks
     * The 
     * <b>QueryServiceStatusEx</b> function returns the most recent service status information reported to the service control manager. If the service just changed its status, it may not have updated the service control manager yet.
     * 
     * The process identifier returned in the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure is valid provided that the state of the service is one of SERVICE_RUNNING, SERVICE_PAUSE_PENDING, SERVICE_PAUSED, or SERVICE_CONTINUE_PENDING. If the service is in a SERVICE_START_PENDING or SERVICE_STOP_PENDING state, however, the process identifier may not be valid, and if the service is in the SERVICE_STOPPED state, it is never valid.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @param {Pointer<UInt32>} pcbBytesNeeded A pointer to a variable that receives the number of bytes needed to store all status information, if the function fails with ERROR_INSUFFICIENT_BUFFER.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 						
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>. The following errors can be returned.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure. Nothing was written to the structure.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> is not valid.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryservicestatusex
     * @since windows5.1.2600
     */
    static QueryServiceStatusEx(hService, InfoLevel, lpBuffer, cbBufSize, pcbBytesNeeded) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceStatusEx", "ptr", hService, "int", InfoLevel, "ptr", lpBuffer, "uint", cbBufSize, "uint*", pcbBytesNeeded, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a function to handle service control requests. (ANSI)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function of a new service should immediately call the 
     * <b>RegisterServiceCtrlHandler</b> function to register a control handler function with the control dispatcher. This enables the control dispatcher to invoke the specified function when it receives control requests for this service. For a list of possible control codes, see <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function">Handler</a>. The threads of the calling process can use the service status handle returned by this function to identify the service in subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function.
     * 
     * The 
     * <b>RegisterServiceCtrlHandler</b> function must be called before the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> call because 
     * <b>RegisterServiceCtrlHandler</b> returns a service status handle for the caller to use so that no other service can inadvertently set this service status. In addition, the control handler must be in place to receive control requests by the time the service specifies the controls it accepts through the 
     * <b>SetServiceStatus</b> function.
     * 
     * When the control handler function is invoked with a control request, the service must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> to report status to the service control manager only if the service status has changed, such as when the service is processing stop or shutdown controls. If the service status has not changed, the service should not report status to the service control manager. 
     * 
     * The service status handle does not have to be closed.
     * @param {Pointer<Byte>} lpServiceName The name of the service run by the calling thread. This is the service name that the service control program specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when creating the service. 
     * 
     * 
     * 
     * 
     * If the service type is SERVICE_WIN32_OWN_PROCESS, the function does not verify that the specified name is valid, because there is only one registered service in the process.
     * @param {Pointer<LPHANDLER_FUNCTION>} lpHandlerProc A pointer to the handler function to be registered. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function">Handler</a>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a service status handle.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * The service entry was specified incorrectly when the process called the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-registerservicectrlhandlera
     * @since windows5.1.2600
     */
    static RegisterServiceCtrlHandlerA(lpServiceName, lpHandlerProc) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterServiceCtrlHandlerA", "ptr", lpServiceName, "ptr", lpHandlerProc)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a function to handle service control requests. (Unicode)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function of a new service should immediately call the 
     * <b>RegisterServiceCtrlHandler</b> function to register a control handler function with the control dispatcher. This enables the control dispatcher to invoke the specified function when it receives control requests for this service. For a list of possible control codes, see <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function">Handler</a>. The threads of the calling process can use the service status handle returned by this function to identify the service in subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function.
     * 
     * The 
     * <b>RegisterServiceCtrlHandler</b> function must be called before the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> call because 
     * <b>RegisterServiceCtrlHandler</b> returns a service status handle for the caller to use so that no other service can inadvertently set this service status. In addition, the control handler must be in place to receive control requests by the time the service specifies the controls it accepts through the 
     * <b>SetServiceStatus</b> function.
     * 
     * When the control handler function is invoked with a control request, the service must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> to report status to the service control manager only if the service status has changed, such as when the service is processing stop or shutdown controls. If the service status has not changed, the service should not report status to the service control manager. 
     * 
     * The service status handle does not have to be closed.
     * @param {Pointer<Char>} lpServiceName The name of the service run by the calling thread. This is the service name that the service control program specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when creating the service. 
     * 
     * 
     * 
     * 
     * If the service type is SERVICE_WIN32_OWN_PROCESS, the function does not verify that the specified name is valid, because there is only one registered service in the process.
     * @param {Pointer<LPHANDLER_FUNCTION>} lpHandlerProc A pointer to the handler function to be registered. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function">Handler</a>.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a service status handle.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * The service entry was specified incorrectly when the process called the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-registerservicectrlhandlerw
     * @since windows5.1.2600
     */
    static RegisterServiceCtrlHandlerW(lpServiceName, lpHandlerProc) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterServiceCtrlHandlerW", "ptr", lpServiceName, "ptr", lpHandlerProc)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a function to handle extended service control requests. (ANSI)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function of a new service should immediately call the 
     * <b>RegisterServiceCtrlHandlerEx</b> function to register a control handler function with the control dispatcher. This enables the control dispatcher to invoke the specified function when it receives control requests for this service. For a list of possible control codes, see <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a>. The threads of the calling process can use the service status handle returned by this function to identify the service in subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function. 
     * 
     * The 
     * <b>RegisterServiceCtrlHandlerEx</b> function must be called before the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> call because 
     * <b>RegisterServiceCtrlHandlerEx</b> returns a service status handle for the caller to use so that no other service can inadvertently set this service status. In addition, the control handler must be in place to receive control requests by the time the service specifies the controls it accepts through the 
     * <b>SetServiceStatus</b> function.
     * 
     * When the control handler function is invoked with a control request, the service must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> to report status to the service control manager only if the service status has changed, such as when the service is processing stop or shutdown controls. If the service status has not changed, the service should not report status to the service control manager. 
     * 
     * The service status handle does not have to be closed.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines RegisterServiceCtrlHandlerEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Byte>} lpServiceName The name of the service run by the calling thread. This is the service name that the service control program specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when creating the service.
     * @param {Pointer<LPHANDLER_FUNCTION_EX>} lpHandlerProc A pointer to the handler function to be registered. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a>.
     * @param {Pointer<Void>} lpContext Any user-defined data. This parameter, which is passed to the handler function, can help identify the service when multiple services share a process.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a service status handle.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * The service entry was specified incorrectly when the process called the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-registerservicectrlhandlerexa
     * @since windows5.1.2600
     */
    static RegisterServiceCtrlHandlerExA(lpServiceName, lpHandlerProc, lpContext) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterServiceCtrlHandlerExA", "ptr", lpServiceName, "ptr", lpHandlerProc, "ptr", lpContext)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Registers a function to handle extended service control requests. (Unicode)
     * @remarks
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function of a new service should immediately call the 
     * <b>RegisterServiceCtrlHandlerEx</b> function to register a control handler function with the control dispatcher. This enables the control dispatcher to invoke the specified function when it receives control requests for this service. For a list of possible control codes, see <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a>. The threads of the calling process can use the service status handle returned by this function to identify the service in subsequent calls to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function. 
     * 
     * The 
     * <b>RegisterServiceCtrlHandlerEx</b> function must be called before the first 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> call because 
     * <b>RegisterServiceCtrlHandlerEx</b> returns a service status handle for the caller to use so that no other service can inadvertently set this service status. In addition, the control handler must be in place to receive control requests by the time the service specifies the controls it accepts through the 
     * <b>SetServiceStatus</b> function.
     * 
     * When the control handler function is invoked with a control request, the service must call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> to report status to the service control manager only if the service status has changed, such as when the service is processing stop or shutdown controls. If the service status has not changed, the service should not report status to the service control manager. 
     * 
     * The service status handle does not have to be closed.
     * 
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines RegisterServiceCtrlHandlerEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Char>} lpServiceName The name of the service run by the calling thread. This is the service name that the service control program specified in the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when creating the service.
     * @param {Pointer<LPHANDLER_FUNCTION_EX>} lpHandlerProc A pointer to the handler function to be registered. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a>.
     * @param {Pointer<Void>} lpContext Any user-defined data. This parameter, which is passed to the handler function, can help identify the service when multiple services share a process.
     * @returns {Pointer<Void>} If the function succeeds, the return value is a service status handle.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * The service entry was specified incorrectly when the process called the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a> function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-registerservicectrlhandlerexw
     * @since windows5.1.2600
     */
    static RegisterServiceCtrlHandlerExW(lpServiceName, lpHandlerProc, lpContext) {
        lpServiceName := lpServiceName is String? StrPtr(lpServiceName) : lpServiceName

        A_LastError := 0

        result := DllCall("ADVAPI32.dll\RegisterServiceCtrlHandlerExW", "ptr", lpServiceName, "ptr", lpHandlerProc, "ptr", lpContext)
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sets the security descriptor of a service object.
     * @remarks
     * The <b>SetServiceObjectSecurity</b> function sets the specified portions of the <a href="https://docs.microsoft.com/windows/desktop/SecGloss/s-gly">security descriptor</a> of the service object based on the information specified in the <i>lpSecurityDescriptor</i> buffer. This function replaces any or all of the security information associated with the service object, according to the flags set in the <i>dwSecurityInformation</i> parameter and subject to the access rights of the calling <a href="https://docs.microsoft.com/windows/desktop/SecGloss/p-gly">process</a>.
     * 
     * When a service is created, the service control manager assigns a default security descriptor to the service object. To retrieve a copy of the security descriptor for a service object, call the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryserviceobjectsecurity">QueryServiceObjectSecurity</a> function. For a description of the default security descriptor for a service object, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>. 
     * 
     * Note that granting certain access to untrusted users (such as SERVICE_CHANGE_CONFIG or SERVICE_STOP) can allow them to interfere with the execution of your service and possibly allow them to run applications under the LocalSystem account.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The access required for this handle depends on the security information specified in the <i>dwSecurityInformation</i> parameter.
     * @param {Integer} dwSecurityInformation 
     * @param {Pointer<Void>} lpSecurityDescriptor A pointer to a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-security_descriptor">SECURITY_DESCRIPTOR</a> structure that contains the new security information.
     * @returns {Integer} If the function succeeds, the function returns nonzero. 
     * 
     * If the function fails, it  returns zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-setserviceobjectsecurity
     * @since windows5.1.2600
     */
    static SetServiceObjectSecurity(hService, dwSecurityInformation, lpSecurityDescriptor) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetServiceObjectSecurity", "ptr", hService, "uint", dwSecurityInformation, "ptr", lpSecurityDescriptor, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Updates the service control manager's status information for the calling service.
     * @remarks
     * A 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function first calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a> function to get the service's SERVICE_STATUS_HANDLE. Then it immediately calls the 
     * <b>SetServiceStatus</b> function to notify the service control manager that its status is SERVICE_START_PENDING. During initialization, the service can provide updated status to indicate that it is making progress but it needs more time. A common bug is for the service to have the main thread perform the initialization while a separate thread continues to call 
     * <b>SetServiceStatus</b> to prevent the service control manager from marking it as hung. However, if the main thread hangs, then the service start ends up in an infinite loop because the worker thread continues to report that the main thread is making progress.
     * 
     * After processing a control request, the service's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">Handler</a> function must call 
     * <b>SetServiceStatus</b> if the service status changes to report its new status to the service control manager. It is only necessary to do so when the service is changing state, such as when it is processing stop or shutdown controls. A service can also use this function at any time from any thread of the service to notify the service control manager of state changes, such as when the service must stop due to a recoverable error.
     * 
     * A service can call this function only after it has called 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a> to get a service status handle.
     * 
     * If a service calls 
     * <b>SetServiceStatus</b> with the <b>dwCurrentState</b> member set to SERVICE_STOPPED and the <b>dwWin32ExitCode</b> member set to a nonzero value, the following entry is written into the System event log:
     * 
     * 
     * ``` syntax
     *    Event ID    = 7023
     *    Source      = Service Control Manager
     *    Type        = Error
     *    Description = &lt;ServiceName&gt; terminated with the following error:
     *                  &lt;ExitCode&gt;.
     * ```
     * 
     * The following are best practices when calling this function:
     * 
     * <ul>
     * <li>Initialize all fields in the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status">SERVICE_STATUS</a> structure, ensuring that there are valid check-point and wait hint values for pending states. Use reasonable wait hints.</li>
     * <li>Do not register to accept controls while the status is SERVICE_START_PENDING or the service can crash. After initialization is completed, accept the SERVICE_CONTROL_STOP code.</li>
     * <li>Call this function with checkpoint and wait-hint values only if the service is making progress on the tasks related to the pending start, stop, pause, or continue operation. Otherwise, SCM cannot detect if your service is hung.</li>
     * <li>Enter the stopped state with an appropriate exit code if <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> fails.</li>
     * <li>If the status is SERVICE_STOPPED, perform all necessary cleanup and call <b>SetServiceStatus</b> one time only. This function makes an LRPC call to the SCM. The first call to the function in the SERVICE_STOPPED state closes the RPC context handle and any subsequent calls can cause the process to crash. </li>
     * <li>Do not attempt to perform any additional work after calling <b>SetServiceStatus</b> with SERVICE_STOPPED, because the service process can be terminated at any time.</li>
     * </ul>
     * @param {Pointer<Void>} hServiceStatus A handle to the status information structure for the current service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a> function.
     * @param {Pointer<SERVICE_STATUS>} lpServiceStatus A pointer to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status">SERVICE_STATUS</a> structure the contains the latest status information for the calling service.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-setservicestatus
     * @since windows5.1.2600
     */
    static SetServiceStatus(hServiceStatus, lpServiceStatus) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\SetServiceStatus", "ptr", hServiceStatus, "ptr", lpServiceStatus, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Connects the main thread of a service process to the service control manager, which causes the thread to be the service control dispatcher thread for the calling process. (ANSI)
     * @remarks
     * When the service control manager starts a service process, it waits for the process to call the 
     * <b>StartServiceCtrlDispatcher</b> function. The main thread of a service process should make this call as soon as possible after it starts up (within 30 seconds). If 
     * <b>StartServiceCtrlDispatcher</b> succeeds, it connects the calling thread to the service control manager and does not return until all running services in the process have entered the SERVICE_STOPPED state. The service control manager uses this connection to send control and service start requests to the main thread of the service process. The main thread acts as a dispatcher by invoking the appropriate 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> function to handle control requests, or by creating a new thread to execute the appropriate 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function when a new service is started.
     * 
     * The <i>lpServiceTable</i> parameter contains an entry for each service that can run in the calling process. Each entry specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function for that service. For SERVICE_WIN32_SHARE_PROCESS services, each entry must contain the name of a service. This name is the service name that was specified by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when the service was installed. For SERVICE_WIN32_OWN_PROCESS services, the service name in the table entry is ignored.
     * 
     * If a service runs in its own process, the main thread of the service process should immediately call 
     * <b>StartServiceCtrlDispatcher</b>. All initialization tasks are done in the service's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function when the service is started.
     * 
     * If multiple services share a process and some common process-wide initialization needs to be done before any 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function is called, the main thread can do the work before calling 
     * <b>StartServiceCtrlDispatcher</b>, as long as it takes less than 30 seconds. Otherwise, another thread must be created to do the process-wide initialization, while the main thread calls 
     * <b>StartServiceCtrlDispatcher</b> and becomes the service control dispatcher. Any service-specific initialization should still be done in the individual service main functions.
     * 
     * Services should not attempt to display a user interface directly. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Services/interactive-services">Interactive Services</a>.
     * @param {Pointer<SERVICE_TABLE_ENTRYA>} lpServiceStartTable A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_table_entrya">SERVICE_TABLE_ENTRY</a> structures containing one entry for each service that can execute in the calling process. The members of the last entry in the table must have NULL values to designate the end of the table.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>. Each process can call 
     * <b>StartServiceCtrlDispatcher</b> only one time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-startservicectrldispatchera
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
     * Connects the main thread of a service process to the service control manager, which causes the thread to be the service control dispatcher thread for the calling process. (Unicode)
     * @remarks
     * When the service control manager starts a service process, it waits for the process to call the 
     * <b>StartServiceCtrlDispatcher</b> function. The main thread of a service process should make this call as soon as possible after it starts up (within 30 seconds). If 
     * <b>StartServiceCtrlDispatcher</b> succeeds, it connects the calling thread to the service control manager and does not return until all running services in the process have entered the SERVICE_STOPPED state. The service control manager uses this connection to send control and service start requests to the main thread of the service process. The main thread acts as a dispatcher by invoking the appropriate 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lphandler_function_ex">HandlerEx</a> function to handle control requests, or by creating a new thread to execute the appropriate 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function when a new service is started.
     * 
     * The <i>lpServiceTable</i> parameter contains an entry for each service that can run in the calling process. Each entry specifies the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function for that service. For SERVICE_WIN32_SHARE_PROCESS services, each entry must contain the name of a service. This name is the service name that was specified by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function when the service was installed. For SERVICE_WIN32_OWN_PROCESS services, the service name in the table entry is ignored.
     * 
     * If a service runs in its own process, the main thread of the service process should immediately call 
     * <b>StartServiceCtrlDispatcher</b>. All initialization tasks are done in the service's 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function when the service is started.
     * 
     * If multiple services share a process and some common process-wide initialization needs to be done before any 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function is called, the main thread can do the work before calling 
     * <b>StartServiceCtrlDispatcher</b>, as long as it takes less than 30 seconds. Otherwise, another thread must be created to do the process-wide initialization, while the main thread calls 
     * <b>StartServiceCtrlDispatcher</b> and becomes the service control dispatcher. Any service-specific initialization should still be done in the individual service main functions.
     * 
     * Services should not attempt to display a user interface directly. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Services/interactive-services">Interactive Services</a>.
     * @param {Pointer<SERVICE_TABLE_ENTRYW>} lpServiceStartTable A pointer to an array of 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_table_entrya">SERVICE_TABLE_ENTRY</a> structures containing one entry for each service that can execute in the calling process. The members of the last entry in the table must have NULL values to designate the end of the table.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>. Each process can call 
     * <b>StartServiceCtrlDispatcher</b> only one time.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-startservicectrldispatcherw
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
     * Starts a service. (ANSI)
     * @remarks
     * When a driver service is started, the 
     * <b>StartService</b> function does not return until the device driver has finished initializing.
     * 
     * When a service is started, the Service Control Manager (SCM) spawns the service process, if necessary. If the specified service shares a process with other services, the required process may already exist. The 
     * <b>StartService</b> function does not wait for the first status update from the new service, because it can take a while. Instead, it returns when the SCM receives notification from the service control dispatcher that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> thread for this service was created successfully.
     * 
     * The SCM sets the following default status values before returning from 
     * <b>StartService</b>:
     * 
     * <ul>
     * <li>Current state of the service is set to SERVICE_START_PENDING.</li>
     * <li>Controls accepted is set to none (zero).</li>
     * <li>The CheckPoint value is set to zero.</li>
     * <li>The WaitHint time is set to 2 seconds.</li>
     * </ul>
     * The calling process can determine if the new service has finished its initialization by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryservicestatus">QueryServiceStatus</a> function periodically to query the service's status.
     * 
     * A service cannot call 
     * <b>StartService</b> during initialization. The reason is that the SCM  locks the service control database during initialization, so a call to 
     * <b>StartService</b> will block. After the service reports to the SCM that it has successfully started, it can call 
     * <b>StartService</b>.
     * 
     * As with   <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlservice">ControlService</a>, <b>StartService</b> will block for 30 seconds if any service is busy handling a control code. If the busy service still has not returned from its handler function when the timeout expires,  <b>StartService</b> fails with ERROR_SERVICE_REQUEST_TIMEOUT. This is because the SCM processes only one service control notification at a time.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_START access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwNumServiceArgs The number of strings in the <i>lpServiceArgVectors</i> array. If <i>lpServiceArgVectors</i> is NULL, this parameter can be zero.
     * @param {Pointer<Byte>} lpServiceArgVectors The null-terminated strings to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function for the service as arguments. If there are no arguments, this parameter can be NULL. Otherwise, the first argument (lpServiceArgVectors[0]) is the name of the service, followed by any additional arguments (lpServiceArgVectors[1] through lpServiceArgVectors[dwNumServiceArgs-1]).
     * 
     * Driver services do not receive these arguments.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the thread that called 
     * <b>StartServiceCtrlDispatcher</b> may be blocked in a control handler function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-startservicea
     * @since windows5.1.2600
     */
    static StartServiceA(hService, dwNumServiceArgs, lpServiceArgVectors) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\StartServiceA", "ptr", hService, "uint", dwNumServiceArgs, "ptr", lpServiceArgVectors, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Starts a service. (Unicode)
     * @remarks
     * When a driver service is started, the 
     * <b>StartService</b> function does not return until the device driver has finished initializing.
     * 
     * When a service is started, the Service Control Manager (SCM) spawns the service process, if necessary. If the specified service shares a process with other services, the required process may already exist. The 
     * <b>StartService</b> function does not wait for the first status update from the new service, because it can take a while. Instead, it returns when the SCM receives notification from the service control dispatcher that the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> thread for this service was created successfully.
     * 
     * The SCM sets the following default status values before returning from 
     * <b>StartService</b>:
     * 
     * <ul>
     * <li>Current state of the service is set to SERVICE_START_PENDING.</li>
     * <li>Controls accepted is set to none (zero).</li>
     * <li>The CheckPoint value is set to zero.</li>
     * <li>The WaitHint time is set to 2 seconds.</li>
     * </ul>
     * The calling process can determine if the new service has finished its initialization by calling the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryservicestatus">QueryServiceStatus</a> function periodically to query the service's status.
     * 
     * A service cannot call 
     * <b>StartService</b> during initialization. The reason is that the SCM  locks the service control database during initialization, so a call to 
     * <b>StartService</b> will block. After the service reports to the SCM that it has successfully started, it can call 
     * <b>StartService</b>.
     * 
     * As with   <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-controlservice">ControlService</a>, <b>StartService</b> will block for 30 seconds if any service is busy handling a control code. If the busy service still has not returned from its handler function when the timeout expires,  <b>StartService</b> fails with ERROR_SERVICE_REQUEST_TIMEOUT. This is because the SCM processes only one service control notification at a time.
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function, and it must have the SERVICE_START access right. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/service-security-and-access-rights">Service Security and Access Rights</a>.
     * @param {Integer} dwNumServiceArgs The number of strings in the <i>lpServiceArgVectors</i> array. If <i>lpServiceArgVectors</i> is NULL, this parameter can be zero.
     * @param {Pointer<Char>} lpServiceArgVectors The null-terminated strings to be passed to the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nc-winsvc-lpservice_main_functiona">ServiceMain</a> function for the service as arguments. If there are no arguments, this parameter can be NULL. Otherwise, the first argument (lpServiceArgVectors[0]) is the name of the service, followed by any additional arguments (lpServiceArgVectors[1] through lpServiceArgVectors[dwNumServiceArgs-1]).
     * 
     * Driver services do not receive these arguments.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the thread that called 
     * <b>StartServiceCtrlDispatcher</b> may be blocked in a control handler function.
     * 
     * </td>
     * </tr>
     * </table>
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-startservicew
     * @since windows5.1.2600
     */
    static StartServiceW(hService, dwNumServiceArgs, lpServiceArgVectors) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\StartServiceW", "ptr", hService, "uint", dwNumServiceArgs, "ptr", lpServiceArgVectors, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Unlocks a service control manager database by releasing the specified lock.
     * @param {Pointer<Void>} ScLock The lock, which is obtained from a previous call to the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-lockservicedatabase">LockServiceDatabase</a> function.
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-unlockservicedatabase
     * @since windows5.1.2600
     */
    static UnlockServiceDatabase(ScLock) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\UnlockServiceDatabase", "ptr", ScLock, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Enables an application to receive notification when the specified service is created or deleted or when its status changes. (ANSI)
     * @remarks
     * The <b>NotifyServiceStatusChange</b> function can be used to receive notifications about service applications. It cannot be used to receive notifications about driver services. 
     * 
     * When the service status changes, the system invokes the specified callback function as an asynchronous procedure call (APC) queued to the calling thread. The calling thread must enter an alertable wait (for example, by calling the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-sleepex">SleepEx</a> function) to receive notification. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">Asynchronous Procedure Calls</a>. 
     * 
     * If the service is already in any of the requested states when <b>NotifyServiceStatusChange</b> is called, the callback function is queued immediately. If the service state has not changed by the next time the function is called with the same service and state, the callback function is not queued immediately; the callback function is queued the next time the service enters the requested state.
     * 
     * The <b>NotifyServiceStatusChange</b> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthread">OpenThread</a> function on the calling thread with the THREAD_SET_CONTEXT access right. If the calling thread does not have this access right, <b>NotifyServiceStatusChange</b> fails. If the calling thread is impersonating another user, it may not have sufficient permission to set context.
     * 
     * It is more efficient to call <b>NotifyServiceStatusChange</b> from a thread that performs a wait than to create an additional thread. 
     * 
     * After the callback function is invoked, the caller must call <b>NotifyServiceStatusChange</b> to receive additional notifications. Note that certain functions in the Windows API, including <b>NotifyServiceStatusChange</b> and other SCM functions,  use remote procedure calls (RPC); these functions might perform an alertable wait operation, so they are not safe to call from within the callback function. Instead, the callback function should save the notification parameters and perform any additional work outside the callback.
     * 
     * To cancel outstanding notifications, close the service handle using the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a> function. After <b>CloseServiceHandle</b> succeeds, no more notification APCs will be queued. If the calling  thread exits without closing the service handle or waiting until the APC  is generated, a memory leak can occur.
     * 
     * <div class="alert"><b>Important</b>  If the calling thread is in a DLL and the DLL is unloaded before the thread receives the notification or calls <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a>, the notification will cause unpredictable results and might cause the process to stop responding.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines NotifyServiceStatusChange as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hService A handle to the service or the service control manager. Handles to services are returned by the 
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
     * If the function fails, the return value is one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-notifyservicestatuschangea
     * @since windows6.0.6000
     */
    static NotifyServiceStatusChangeA(hService, dwNotifyMask, pNotifyBuffer) {
        result := DllCall("ADVAPI32.dll\NotifyServiceStatusChangeA", "ptr", hService, "uint", dwNotifyMask, "ptr", pNotifyBuffer, "uint")
        return result
    }

    /**
     * Enables an application to receive notification when the specified service is created or deleted or when its status changes. (Unicode)
     * @remarks
     * The <b>NotifyServiceStatusChange</b> function can be used to receive notifications about service applications. It cannot be used to receive notifications about driver services. 
     * 
     * When the service status changes, the system invokes the specified callback function as an asynchronous procedure call (APC) queued to the calling thread. The calling thread must enter an alertable wait (for example, by calling the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-sleepex">SleepEx</a> function) to receive notification. For more information, see <a href="https://docs.microsoft.com/windows/desktop/Sync/asynchronous-procedure-calls">Asynchronous Procedure Calls</a>. 
     * 
     * If the service is already in any of the requested states when <b>NotifyServiceStatusChange</b> is called, the callback function is queued immediately. If the service state has not changed by the next time the function is called with the same service and state, the callback function is not queued immediately; the callback function is queued the next time the service enters the requested state.
     * 
     * The <b>NotifyServiceStatusChange</b> function calls the <a href="https://docs.microsoft.com/windows/desktop/api/processthreadsapi/nf-processthreadsapi-openthread">OpenThread</a> function on the calling thread with the THREAD_SET_CONTEXT access right. If the calling thread does not have this access right, <b>NotifyServiceStatusChange</b> fails. If the calling thread is impersonating another user, it may not have sufficient permission to set context.
     * 
     * It is more efficient to call <b>NotifyServiceStatusChange</b> from a thread that performs a wait than to create an additional thread. 
     * 
     * After the callback function is invoked, the caller must call <b>NotifyServiceStatusChange</b> to receive additional notifications. Note that certain functions in the Windows API, including <b>NotifyServiceStatusChange</b> and other SCM functions,  use remote procedure calls (RPC); these functions might perform an alertable wait operation, so they are not safe to call from within the callback function. Instead, the callback function should save the notification parameters and perform any additional work outside the callback.
     * 
     * To cancel outstanding notifications, close the service handle using the <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a> function. After <b>CloseServiceHandle</b> succeeds, no more notification APCs will be queued. If the calling  thread exits without closing the service handle or waiting until the APC  is generated, a memory leak can occur.
     * 
     * <div class="alert"><b>Important</b>  If the calling thread is in a DLL and the DLL is unloaded before the thread receives the notification or calls <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-closeservicehandle">CloseServiceHandle</a>, the notification will cause unpredictable results and might cause the process to stop responding.</div>
     * <div> </div>
     * 
     * 
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines NotifyServiceStatusChange as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hService A handle to the service or the service control manager. Handles to services are returned by the 
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
     * If the function fails, the return value is one of the <a href="https://docs.microsoft.com/windows/desktop/Debug/system-error-codes">system error codes</a>.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-notifyservicestatuschangew
     * @since windows6.0.6000
     */
    static NotifyServiceStatusChangeW(hService, dwNotifyMask, pNotifyBuffer) {
        result := DllCall("ADVAPI32.dll\NotifyServiceStatusChangeW", "ptr", hService, "uint", dwNotifyMask, "ptr", pNotifyBuffer, "uint")
        return result
    }

    /**
     * Sends a control code to a service. (ControlServiceExA)
     * @remarks
     * The 
     * <b>ControlServiceEx</b> function asks the Service Control Manager (SCM) to send the requested control code to the service. The SCM sends the code  if the service has specified that it will accept the code, and is in a state in which a control code can be sent to it.
     * 
     * The SCM processes service control notifications in a serial fashion — it waits for one service to complete processing a service control notification before sending the next one. Because of this, a call to <b>ControlServiceEx</b> blocks for 30 seconds if any service is busy handling a control code. If the busy service still has not returned from its handler function when the timeout expires, <b>ControlServiceEx</b> fails with ERROR_SERVICE_REQUEST_TIMEOUT.
     * 
     * To stop and start a service requires a security descriptor that allows you to do so. The default security descriptor allows the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a>, and members of the Administrators and Power Users groups to stop and start services. To change the security descriptor of a service, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/modifying-the-dacl-for-a-service">Modifying the DACL for a Service</a>.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryservicestatusex">QueryServiceStatusEx</a> function returns a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure whose <b>dwCurrentState</b> and <b>dwControlsAccepted</b> members indicate the current state and controls accepted by a running service. All running services accept the SERVICE_CONTROL_INTERROGATE control code by default. Drivers do not accept control codes other than SERVICE_CONTROL_STOP and SERVICE_CONTROL_INTERROGATE. Each service specifies the other control codes that it accepts when it calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function to report its status. A service should always accept these codes when it is running, no matter what it is doing.
     * 
     * The following table shows the action of the SCM  in each of the possible service states.
     * 
     * <table>
     * <tr>
     * <th>Service state</th>
     * <th>Stop</th>
     * <th>Other controls</th>
     * </tr>
     * <tr>
     * <td>STOPPED</td>
     * <td>(c)</td>
     * <td>(c)</td>
     * </tr>
     * <tr>
     * <td>STOP_PENDING</td>
     * <td>(b)</td>
     * <td>(b)</td>
     * </tr>
     * <tr>
     * <td>START_PENDING</td>
     * <td>(a)</td>
     * <td>(b)</td>
     * </tr>
     * <tr>
     * <td>RUNNING</td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * <tr>
     * <td>CONTINUE_PENDING</td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * <tr>
     * <td>PAUSE_PENDING</td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * <tr>
     * <td>PAUSED</td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * </table>
     * 
     * <dl>
     * <dt>(a)</dt>
     * <dd>
     * If the service accepts this control code, send the request to the service; otherwise, <b>ControlServiceEx</b> returns
     *     zero and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns
     *     <b>ERROR_INVALID_SERVICE_CONTROL</b>.
     * </dd>
     * <dt>(b)</dt>
     * <dd>
     * The service is not in a state in which a control can be sent to it, so <b>ControlServiceEx</b> returns zero and
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns
     *     <b>ERROR_SERVICE_CANNOT_ACCEPT_CTRL</b>.
     * </dd>
     * <dt>(c)</dt>
     * <dd>
     * The service is not active, so <b>ControlServiceEx</b> returns zero and
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns
     *     <b>ERROR_SERVICE_NOT_ACTIVE</b>.
     * </dd>
     * </dl>
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines ControlServiceEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a>, or the handle is no longer valid.
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
     * The requested control code in the <i>dwControl</i> parameter is undefined, or <i>dwControl</i> is SERVICE_CONTROL_STOP but the <b>dwReason</b> or <b>pszComment</b> members of the <a href="https://docs.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_control_status_reason_paramsa">SERVICE_CONTROL_STATUS_REASON_PARAMS</a> structure are not valid.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the thread that called 
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-controlserviceexa
     * @since windows6.0.6000
     */
    static ControlServiceExA(hService, dwControl, dwInfoLevel, pControlParams) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ControlServiceExA", "ptr", hService, "uint", dwControl, "uint", dwInfoLevel, "ptr", pControlParams, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Sends a control code to a service. (ControlServiceExW)
     * @remarks
     * The 
     * <b>ControlServiceEx</b> function asks the Service Control Manager (SCM) to send the requested control code to the service. The SCM sends the code  if the service has specified that it will accept the code, and is in a state in which a control code can be sent to it.
     * 
     * The SCM processes service control notifications in a serial fashion — it waits for one service to complete processing a service control notification before sending the next one. Because of this, a call to <b>ControlServiceEx</b> blocks for 30 seconds if any service is busy handling a control code. If the busy service still has not returned from its handler function when the timeout expires, <b>ControlServiceEx</b> fails with ERROR_SERVICE_REQUEST_TIMEOUT.
     * 
     * To stop and start a service requires a security descriptor that allows you to do so. The default security descriptor allows the 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/localsystem-account">LocalSystem account</a>, and members of the Administrators and Power Users groups to stop and start services. To change the security descriptor of a service, see 
     * <a href="https://docs.microsoft.com/windows/desktop/Services/modifying-the-dacl-for-a-service">Modifying the DACL for a Service</a>.
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-queryservicestatusex">QueryServiceStatusEx</a> function returns a 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/ns-winsvc-service_status_process">SERVICE_STATUS_PROCESS</a> structure whose <b>dwCurrentState</b> and <b>dwControlsAccepted</b> members indicate the current state and controls accepted by a running service. All running services accept the SERVICE_CONTROL_INTERROGATE control code by default. Drivers do not accept control codes other than SERVICE_CONTROL_STOP and SERVICE_CONTROL_INTERROGATE. Each service specifies the other control codes that it accepts when it calls the 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-setservicestatus">SetServiceStatus</a> function to report its status. A service should always accept these codes when it is running, no matter what it is doing.
     * 
     * The following table shows the action of the SCM  in each of the possible service states.
     * 
     * <table>
     * <tr>
     * <th>Service state</th>
     * <th>Stop</th>
     * <th>Other controls</th>
     * </tr>
     * <tr>
     * <td>STOPPED</td>
     * <td>(c)</td>
     * <td>(c)</td>
     * </tr>
     * <tr>
     * <td>STOP_PENDING</td>
     * <td>(b)</td>
     * <td>(b)</td>
     * </tr>
     * <tr>
     * <td>START_PENDING</td>
     * <td>(a)</td>
     * <td>(b)</td>
     * </tr>
     * <tr>
     * <td>RUNNING</td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * <tr>
     * <td>CONTINUE_PENDING</td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * <tr>
     * <td>PAUSE_PENDING</td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * <tr>
     * <td>PAUSED</td>
     * <td>(a)</td>
     * <td>(a)</td>
     * </tr>
     * </table>
     * 
     * <dl>
     * <dt>(a)</dt>
     * <dd>
     * If the service accepts this control code, send the request to the service; otherwise, <b>ControlServiceEx</b> returns
     *     zero and <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns
     *     <b>ERROR_INVALID_SERVICE_CONTROL</b>.
     * </dd>
     * <dt>(b)</dt>
     * <dd>
     * The service is not in a state in which a control can be sent to it, so <b>ControlServiceEx</b> returns zero and
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns
     *     <b>ERROR_SERVICE_CANNOT_ACCEPT_CTRL</b>.
     * </dd>
     * <dt>(c)</dt>
     * <dd>
     * The service is not active, so <b>ControlServiceEx</b> returns zero and
     *     <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> returns
     *     <b>ERROR_SERVICE_NOT_ACTIVE</b>.
     * </dd>
     * </dl>
     * 
     * 
     * > [!NOTE]
     * > The winsvc.h header defines ControlServiceEx as an alias which automatically selects the ANSI or Unicode version of this function based on the definition of the UNICODE preprocessor constant. Mixing usage of the encoding-neutral alias with code that not encoding-neutral can lead to mismatches that result in compilation or runtime errors. For more information, see [Conventions for Function Prototypes](/windows/win32/intl/conventions-for-function-prototypes).
     * @param {Pointer<Void>} hService A handle to the service. This handle is returned by the 
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
     * @returns {Integer} If the function succeeds, the return value is nonzero.
     * 
     * If the function fails, the return value is zero. To get extended error information, call 
     * <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> or 
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-openservicea">OpenService</a>, or the handle is no longer valid.
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
     * The requested control code in the <i>dwControl</i> parameter is undefined, or <i>dwControl</i> is SERVICE_CONTROL_STOP but the <b>dwReason</b> or <b>pszComment</b> members of the <a href="https://docs.microsoft.com/windows/win32/api/winsvc/ns-winsvc-service_control_status_reason_paramsa">SERVICE_CONTROL_STATUS_REASON_PARAMS</a> structure are not valid.
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
     * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-startservicectrldispatchera">StartServiceCtrlDispatcher</a>, or the thread that called 
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
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-controlserviceexw
     * @since windows6.0.6000
     */
    static ControlServiceExW(hService, dwControl, dwInfoLevel, pControlParams) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\ControlServiceExW", "ptr", hService, "uint", dwControl, "uint", dwInfoLevel, "ptr", pControlParams, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Retrieves dynamic information related to the current service start.
     * @param {Pointer<Void>} hServiceStatus A service status handle provided by <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-registerservicectrlhandlerexa">RegisterServiceCtrlHandlerEx</a>
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
     * @param {Pointer<Void>} ppDynamicInfo A dynamic information buffer. If this parameter is valid, the callback function must free the          buffer after use with the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function.
     * @returns {Integer} If the function succeeds, the return value is TRUE.
     * 
     * If the function fails, the return value is FALSE. When this happens the <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a> function should be called to retrieve the error code.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-queryservicedynamicinformation
     * @since windows8.0
     */
    static QueryServiceDynamicInformation(hServiceStatus, dwInfoLevel, ppDynamicInfo) {
        A_LastError := 0

        result := DllCall("ADVAPI32.dll\QueryServiceDynamicInformation", "ptr", hServiceStatus, "uint", dwInfoLevel, "ptr", ppDynamicInfo, "int")
        if(A_LastError)
            throw OSError()

        return result
    }

    /**
     * Subscribes for service status change notifications using a callback function.
     * @remarks
     * The callback function is declared as follows:
     * 
     * 
     * ```C++
     * typedef VOID CALLBACK SC_NOTIFICATION_CALLBACK(
     *     _In_    DWORD                   dwNotify,
     *     _In_    PVOID                   pCallbackContext
     * );
     * typedef SC_NOTIFICATION_CALLBACK* PSC_NOTIFICATION_CALLBACK;
     * ```
     * 
     * 
     * 
     * The callback function receives a pointer to the context provided by the caller. The callback is invoked as a result of the service status change event. When the callback is invoked, it is provided with a bitmask of **SERVICE\_NOTIFY\_*XXX*** values that indicating the type of service status change. When the callback is provided with zero instead of a valid **SERVICE\_NOTIFY\_*XXX*** value, the application must verify what was changed.
     * 
     * The callback function must not block execution. If you expect the execution of the callback function to take time, offload the work that you perform in the callback function to a separate thread by queuing a work item to a thread in a thread pool. Some types of work that can make the callback function take time include performing file I/O, waiting on an event, and making external remote procedure calls.
     * @param {Pointer<Void>} hService A handle to the service or a handle to the service control manager (SCM) to monitor for changes.
     * 
     * Handles to services are returned by the [**OpenService**](/windows/desktop/api/Winsvc/nf-winsvc-openservicea) and [**CreateService**](/windows/desktop/api/Winsvc/nf-winsvc-createservicea) function and must have the **SERVICE\_QUERY\_STATUS** access right. Handles to the service control manager are returned by the [**OpenSCManager**](/windows/desktop/api/Winsvc/nf-winsvc-openscmanagera) function and must have the **SC\_MANAGER\_ENUMERATE\_SERVICE** access right.
     * @param {Integer} eEventType Specifies the type of status changes that should be reported. This parameter is set to one of the values specified in [**SC\_EVENT\_TYPE**](sc-event-type.md). The behavior for this function is different depending on the event type as follows.
     * 
     * 
     * 
     * | Value                                                                                                                                                                                                                                                   | Meaning                                                                                                                |
     * |---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------|
     * | <span id="SC_EVENT_DATABASE_CHANGE"></span><span id="sc_event_database_change"></span><dl> <dt>**SC\_EVENT\_DATABASE\_CHANGE**</dt> <dt>0</dt> </dl> | A service has been added or deleted. The *hService* parameter must be a handle to the SCM.<br/>                  |
     * | <span id="SC_EVENT_PROPERTY_CHANGE"></span><span id="sc_event_property_change"></span><dl> <dt>**SC\_EVENT\_PROPERTY\_CHANGE**</dt> <dt>1</dt> </dl> | One or more service properties have been updated. The *hService* parameter must be a handle to the service.<br/> |
     * | <span id="SC_EVENT_STATUS_CHANGE"></span><span id="sc_event_status_change"></span><dl> <dt>**SC\_EVENT\_STATUS\_CHANGE**</dt> <dt>2</dt> </dl>       | The status of a service has changed. The *hService* parameter must be a handle to the service.<br/>              |
     * @param {Pointer<PSC_NOTIFICATION_CALLBACK>} pCallback Specifies the callback function. The callback must be defined as having a type of **SC\_NOTIFICATION\_CALLBACK**. For more information, see Remarks.
     * @param {Pointer<Void>} pCallbackContext A pointer representing the context for this notification callback.
     * @param {Pointer<IntPtr>} pSubscription Returns a pointer to the subscription resulting from the notification callback registration. The caller is responsible for calling [**UnsubscribeServiceChangeNotifications**](unsubscribeservicechangenotifications.md) to stop receiving notifications.
     * @returns {Integer} If the function succeeds, the return value is **ERROR\_SUCCESS**.
     * 
     * If the function fails, the return value is one of the [system error codes](/windows/desktop/Debug/system-error-codes).
     * @see https://learn.microsoft.com/windows/win32/Services/subscribeservicechangenotifications
     */
    static SubscribeServiceChangeNotifications(hService, eEventType, pCallback, pCallbackContext, pSubscription) {
        result := DllCall("SecHost.dll\SubscribeServiceChangeNotifications", "ptr", hService, "int", eEventType, "ptr", pCallback, "ptr", pCallbackContext, "ptr*", pSubscription, "uint")
        return result
    }

    /**
     * Unsubscribes from service status change notifications.
     * @remarks
     * **UnsubscribeServiceChangeNotifications** does not return until outstanding in-process callbacks are complete. So, you cannot call **UnsubscribeServiceChangeNotifications** within the callback without causing a deadlock.
     * @param {Pointer} pSubscription A pointer to the subscription to be unsubscribed.
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/Services/unsubscribeservicechangenotifications
     */
    static UnsubscribeServiceChangeNotifications(pSubscription) {
        DllCall("SecHost.dll\UnsubscribeServiceChangeNotifications", "ptr", pSubscription)
    }

    /**
     * 
     * @param {Pointer<Void>} hService 
     * @param {Integer} dwNotify 
     * @param {Integer} dwTimeout 
     * @param {Pointer<Void>} hCancelEvent 
     * @returns {Integer} 
     */
    static WaitServiceState(hService, dwNotify, dwTimeout, hCancelEvent) {
        result := DllCall("ADVAPI32.dll\WaitServiceState", "ptr", hService, "uint", dwNotify, "uint", dwTimeout, "ptr", hCancelEvent, "uint")
        return result
    }

    /**
     * Returns a handle for a registry key for a service to read and/or write state to.
     * @remarks
     * For **ServiceRegistryStatePersistent**, the security of the directory is set to only provide write access to the local system account and the service SID. Ensure service SIDs are enabled for any service that calls this API. For more information, see [SERVICE_SID_INFO](./ns-winsvc-service_sid_info.md).
     * 
     * For a similar API that provides service state that can be shared with associated programs, see [GetSharedServiceRegistryStateKey](nf-winsvc-getsharedserviceregistrystatekey.md).
     * 
     * All service state registry keys are deleted by the service control manager once the service is uninstalled.
     * @param {Pointer<Void>} ServiceStatusHandle A handle to the status information structure for the current service. This handle is returned by the [RegisterServiceCtrlHandler](./nf-winsvc-registerservicectrlhandlera.md) function.
     * @param {Integer} StateType A member of the [SERVICE_REGISTRY_STATE_TYPE](./ne-winsvc-service_registry_state_type.md) specifying the state type for which the service registry key is retreived.
     * @param {Integer} AccessMask The access mask with which to attempt to open the state key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<Void>} ServiceStateKey Receives the output registry key handle.
     * @returns {Integer} ERROR_SUCCESS when all operations complete successfully; otherwise, a Win32 error code.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getserviceregistrystatekey
     * @since windows10.0.19041
     */
    static GetServiceRegistryStateKey(ServiceStatusHandle, StateType, AccessMask, ServiceStateKey) {
        result := DllCall("api-ms-win-service-core-l1-1-3.dll\GetServiceRegistryStateKey", "ptr", ServiceStatusHandle, "int", StateType, "uint", AccessMask, "ptr", ServiceStateKey, "uint")
        return result
    }

    /**
     * Returns a path for a per-service filesystem location for a service to read and/or write state to.
     * @remarks
     * For **ServiceDirectoryPersistentState**, the security of the directory is set to only provide write access to the local system account and the service SID. Ensure service SIDs are enabled for any service that calls this API. For more information, see [SERVICE_SID_INFO](./ns-winsvc-service_sid_info.md).
     * 
     * For a similar API that provides service state that can be shared with associated programs, see [GetSharedServiceDirectory](nf-winsvc-getsharedservicedirectory.md).
     * 
     * All service state directories are deleted by the service control manager once the service is uninstalled.
     * @param {Pointer<Void>} hServiceStatus A handle to the status information structure for the current service. This handle is returned by the [RegisterServiceCtrlHandler](./nf-winsvc-registerservicectrlhandlera.md) function.
     * @param {Integer} eDirectoryType A member of the [SERVICE_DIRECTORY_TYPE](./ne-winsvc-service_directory_type.md) enumeration that identifies the type of per-service directory path to retrieve.
     * @param {Pointer<Char>} lpPathBuffer A caller-allocated buffer into which the path string will be copied. If NULL, the function call will fail with ERROR_INSUFFICIENT_BUFFER and return the required buffer length, in WCHARs, in *lpcchRequiredBufferLength*. If non-NULL, the length of the buffer should be specified in *cchPathBufferLength*. The path, if written, will be NULL terminated.
     * @param {Integer} cchPathBufferLength The length of the buffer supplied in *lpPathBuffer*, in units of WCHARS. This argument is ignored if *lpPathBuffer* is NULL.
     * @param {Pointer<UInt32>} lpcchRequiredBufferLength This value is set to the required length of the buffer in units of WCHARs. This length includes the terminating NULL character.
     * @returns {Integer} Returns ERROR_SUCCESS when all operations complete successfully and the NULL-terminated state path is written to *lpPathBuffer*. Returns ERROR_INSUFFICIENT_BUFFER if *lpPathBuffer* was not large enough to contain the state path, or if *lpPathBuffer* was NULL. In this case the required buffer length in WCHARs is returned via *lpcchRequiredBufferLength*. If some other failure occurs, a Win32 error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getservicedirectory
     * @since windows10.0.19041
     */
    static GetServiceDirectory(hServiceStatus, eDirectoryType, lpPathBuffer, cchPathBufferLength, lpcchRequiredBufferLength) {
        lpPathBuffer := lpPathBuffer is String? StrPtr(lpPathBuffer) : lpPathBuffer

        result := DllCall("api-ms-win-service-core-l1-1-4.dll\GetServiceDirectory", "ptr", hServiceStatus, "int", eDirectoryType, "ptr", lpPathBuffer, "uint", cchPathBufferLength, "uint*", lpcchRequiredBufferLength, "uint")
        return result
    }

    /**
     * Returns a handle for a registry key for a service and associated programs to read and/or write state to.
     * @remarks
     * For **ServiceSharedRegistryStatePersistent**, the security of the directory is set to only provide write access to the local system account, the service SID, and local administrators. Ensure service SIDs are enabled for any service that calls this API. For more information, see [SERVICE_SID_INFO](./ns-winsvc-service_sid_info.md).
     * 
     * For a similar API that provides service state exclusively for use by the service itself, see [GetServiceRegistryStateKey](nf-winsvc-getserviceregistrystatekey.md).
     * 
     * All service state registry keys are deleted by the service control manager once the service is uninstalled.
     * @param {Pointer<Void>} ServiceHandle 
     * @param {Integer} StateType A member of the [SERVICE_SHARED_REGISTRY_STATE_TYPE](./ne-winsvc-service_shared_registry_state_type.md) specifying the shared state type for which the service registry key is retrieved.
     * @param {Integer} AccessMask The access mask with which to attempt to open the state key. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/registry-key-security-and-access-rights">Registry Key Security and Access Rights</a>.
     * @param {Pointer<Void>} ServiceStateKey Receives the output registry key handle.
     * @returns {Integer} ERROR_SUCCESS when all operations complete successfully; otherwise, a Win32 error code.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getsharedserviceregistrystatekey
     */
    static GetSharedServiceRegistryStateKey(ServiceHandle, StateType, AccessMask, ServiceStateKey) {
        result := DllCall("api-ms-win-service-core-l1-1-5.dll\GetSharedServiceRegistryStateKey", "ptr", ServiceHandle, "int", StateType, "uint", AccessMask, "ptr", ServiceStateKey, "uint")
        return result
    }

    /**
     * Returns a path for a per-service filesystem location for a service and associated programs to read and/or write state to.
     * @remarks
     * For **ServiceSharedDirectoryPersistentState**, the security of the directory is set to only provide write access to the local system account, the service SID, and to local administrators. Ensure service SIDs are enabled for any service that calls this API. For more information, see [SERVICE_SID_INFO](./ns-winsvc-service_sid_info.md).
     * 
     * For a similar API that provides service state exclusively for use by the service itself, see [GetServiceDirectory](nf-winsvc-getservicedirectory.md).
     * 
     * All service state directories are deleted by the service control manager once the service is uninstalled.
     * @param {Pointer<Void>} ServiceHandle A handle to the service. This handle is returned by the [OpenService](./nf-winsvc-openservicea.md) function.
     * @param {Integer} DirectoryType A member of the [SERVICE_SHARED_DIRECTORY_TYPE](./ne-winsvc-service_shared_directory_type.md) enumeration that identifies the type of per-service shared directory path to retrieve.
     * @param {Pointer<Char>} PathBuffer A caller-allocated buffer into which the path string will be copied. If NULL, the function call will fail with ERROR_INSUFFICIENT_BUFFER and return the required buffer length, in WCHARs, in *RequiredBufferLength*. If non-NULL, the length of the buffer should be specified in *PathBufferLength*. The path, if written, will be NULL terminated.
     * @param {Integer} PathBufferLength The length of the buffer supplied in *PathBuffer*, in units of WCHARS. This argument is ignored if *PathBuffer* is NULL.
     * @param {Pointer<UInt32>} RequiredBufferLength This value is set to the required length of the buffer in units of WCHARs. This length includes the terminating NULL character.
     * @returns {Integer} Returns ERROR_SUCCESS when all operations complete successfully and the NULL-terminated state path is written to *PathBuffer*. Returns ERROR_INSUFFICIENT_BUFFER if *PathBuffer* was not large enough to contain the state path, or if *PathBuffer* was NULL. In this case the required buffer length in WCHARs is returned via *RequiredBufferLength*. If some other failure occurs, a Win32 error code is returned.
     * @see https://learn.microsoft.com/windows/win32/api/winsvc/nf-winsvc-getsharedservicedirectory
     */
    static GetSharedServiceDirectory(ServiceHandle, DirectoryType, PathBuffer, PathBufferLength, RequiredBufferLength) {
        PathBuffer := PathBuffer is String? StrPtr(PathBuffer) : PathBuffer

        result := DllCall("api-ms-win-service-core-l1-1-5.dll\GetSharedServiceDirectory", "ptr", ServiceHandle, "int", DirectoryType, "ptr", PathBuffer, "uint", PathBufferLength, "uint*", RequiredBufferLength, "uint")
        return result
    }

;@endregion Methods
}
