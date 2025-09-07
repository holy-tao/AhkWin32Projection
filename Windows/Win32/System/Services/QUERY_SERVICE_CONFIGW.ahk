#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains configuration information for an installed service. It is used by the QueryServiceConfig function. (Unicode)
 * @remarks
 * The configuration information for a service is initially specified when the service is created by a call to the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-createservicea">CreateService</a> function. The information can be modified by calling the 
  * <a href="https://docs.microsoft.com/windows/desktop/api/winsvc/nf-winsvc-changeserviceconfiga">ChangeServiceConfig</a> function.
 * @see https://learn.microsoft.com/windows/win32/api/winsvc/ns-winsvc-query_service_configw
 * @namespace Windows.Win32.System.Services
 * @version v4.0.30319
 * @charset Unicode
 */
class QUERY_SERVICE_CONFIGW extends Win32Struct
{
    static sizeof => 64

    static packingSize => 8

    /**
     * 
     * @type {Integer}
     */
    dwServiceType {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * 
     * @type {Integer}
     */
    dwStartType {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * 
     * @type {Integer}
     */
    dwErrorControl {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The fully qualified path to the service binary file. 
     * 
     * 
     * 
     * 
     * The path can also include arguments for an auto-start service. These arguments are passed to the service entry point (typically the <b>main</b> function).
     * @type {Pointer<Ptr>}
     */
    lpBinaryPathName {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The name of the load ordering group to which this service belongs. If the member is NULL or an empty string, the service does not belong to a load ordering group. 
     * 
     * 
     * 
     * 
     * The startup program uses load ordering groups to load groups of services in a specified order with respect to the other groups. The list of load ordering groups is contained in the following registry value:
     * 
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\ServiceGroupOrder</b>
     * @type {Pointer<Ptr>}
     */
    lpLoadOrderGroup {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A unique tag value for this service in the group specified by the <i>lpLoadOrderGroup</i> parameter. A value of zero indicates that the service has not been assigned a tag. You can use a tag for ordering service startup within a load order group by specifying a tag order vector in the registry located at: 
     * 
     * 
     * <b>HKEY_LOCAL_MACHINE\System\CurrentControlSet\Control\GroupOrderList</b>
     * 
     * 
     * 
     * Tags are only evaluated for <b>SERVICE_KERNEL_DRIVER</b> and <b>SERVICE_FILE_SYSTEM_DRIVER</b> type services that have <b>SERVICE_BOOT_START</b> or <b>SERVICE_SYSTEM_START</b> start types.
     * @type {Integer}
     */
    dwTagId {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * A pointer to an array of null-separated names of services or load ordering groups that must start before this service. The array is doubly null-terminated. If the pointer is <b>NULL</b> or if it points to an empty string, the service has no dependencies. If a group name is specified, it must be prefixed by the <b>SC_GROUP_IDENTIFIER</b> (defined in WinSvc.h) character to differentiate it from a service name, because services and service groups share the same name space. Dependency on a service means that this service can only run if the service it depends on is running. Dependency on a group means that this service can run if at least one member of the group is running after an attempt to start all members of the group.
     * @type {Pointer<Ptr>}
     */
    lpDependencies {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * If the service type is <b>SERVICE_WIN32_OWN_PROCESS</b> or <b>SERVICE_WIN32_SHARE_PROCESS</b>, this member is the name of the account that the service process will be logged on as when it runs. This name can be of the form <i>Domain</i><b>\\</b><i>UserName</i>. If the account belongs to the built-in domain, the name can be of the form <b>.\\</b><i>UserName</i>. The name can also be "LocalSystem" if the process is running under the LocalSystem account.   
     * 
     * 
     * 
     * 						
     * 
     * If the service type is <b>SERVICE_KERNEL_DRIVER</b> or <b>SERVICE_FILE_SYSTEM_DRIVER</b>, this member is the driver object name (that is, \FileSystem\Rdr or \Driver\Xns) which the input and output (I/O) system uses to load the device driver. If this member is NULL, the driver is to be run with a default object name created by the I/O system, based on the service name.
     * @type {Pointer<Ptr>}
     */
    lpServiceStartName {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * The display name to be used by service control programs to identify the service. This string has a maximum length of 256 characters. The name is case-preserved in the service control manager. Display name comparisons are always case-insensitive.
     * 
     * This parameter can specify a localized string using the following format:
     * 
     * @[<i>Path</i>\]<i>DLLName</i>,-<i>StrID</i>
     * 
     * The string with identifier <i>StrID</i> is loaded from <i>DLLName</i>; the <i>Path</i> is optional. For more information, see <a href="https://docs.microsoft.com/windows/desktop/api/winreg/nf-winreg-regloadmuistringa">RegLoadMUIString</a>.
     * 
     * <b>Windows Server 2003 and Windows XP:  </b>Localized strings are not supported until Windows Vista.
     * @type {Pointer<Ptr>}
     */
    lpDisplayName {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }
}
