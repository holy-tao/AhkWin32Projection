#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Enum.ahk

/**
 * Contains values that correspond to the types of Windows objects that support security.
 * @see https://learn.microsoft.com/windows/win32/api/accctrl/ne-accctrl-se_object_type
 * @namespace Windows.Win32.Security.Authorization
 */
class SE_OBJECT_TYPE extends Win32Enum {

    /**
     * Unknown object type.
     * Native name: SE_UNKNOWN_OBJECT_TYPE
     * @type {Integer (Int32)}
     */
    static UNKNOWN_OBJECT_TYPE => 0

    /**
     * Indicates a file or directory. The name string that identifies a file or directory object can be in one of the following formats:
     * 
     * <ul>
     * <li>A relative path, such as <i>FileName.dat</i> or ..&#92;<i>FileName</i></li>
     * <li>An absolute path, such as <i>FileName.dat</i>, C:&#92;<i>DirectoryName</i>&#92;<i>FileName.dat</i>, or G:&#92;<i>RemoteDirectoryName</i>&#92;<i>FileName.dat</i>.</li>
     * <li>A UNC name, such as &#92;&#92;<i>ComputerName</i>&#92;<i>ShareName</i>&#92;<i>FileName.dat</i>.</li>
     * </ul>
     * Native name: SE_FILE_OBJECT
     * @type {Integer (Int32)}
     */
    static FILE_OBJECT => 1

    /**
     * Indicates a Windows service. A service object can be a local service, such as <i>ServiceName</i>, or a remote service, such as &#92;&#92;<i>ComputerName</i>&#92;<i>ServiceName</i>.
     * Native name: SE_SERVICE
     * @type {Integer (Int32)}
     */
    static SERVICE => 2

    /**
     * Indicates a printer. A printer object can be a local printer, such as <i>PrinterName</i>, or a remote printer, such as &#92;&#92;<i>ComputerName</i>&#92;<i>PrinterName</i>.
     * Native name: SE_PRINTER
     * @type {Integer (Int32)}
     */
    static PRINTER => 3

    /**
     * Indicates a registry key. A registry key object can be in the local registry, such as <b>CLASSES_ROOT</b>&#92;<i>SomePath</i> or in a remote registry, such as &#92;&#92;<i>ComputerName</i>&#92;<b>CLASSES_ROOT</b>&#92;<i>SomePath</i>. 
     * 
     * 
     * 
     * 
     * The names of registry keys must use the following literal strings to identify the predefined registry keys: "CLASSES_ROOT", "CURRENT_USER", "MACHINE", and "USERS".
     * Native name: SE_REGISTRY_KEY
     * @type {Integer (Int32)}
     */
    static REGISTRY_KEY => 4

    /**
     * Indicates a network share. A share object can be local, such as <i>ShareName</i>, or remote, such as &#92;&#92;<i>ComputerName</i>&#92;<i>ShareName</i>.
     * Native name: SE_LMSHARE
     * @type {Integer (Int32)}
     */
    static LMSHARE => 5

    /**
     * Indicates a local 
     * <a href="https://docs.microsoft.com/windows/desktop/SysInfo/kernel-objects">kernel object</a>. 
     * 
     * 
     * 
     * 
     * The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getsecurityinfo">GetSecurityInfo</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setsecurityinfo">SetSecurityInfo</a> functions support all types of kernel objects. The 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getnamedsecurityinfoa">GetNamedSecurityInfo</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setnamedsecurityinfoa">SetNamedSecurityInfo</a> functions work only with the following kernel objects: semaphore, event, mutex, waitable timer, and file mapping.
     * Native name: SE_KERNEL_OBJECT
     * @type {Integer (Int32)}
     */
    static KERNEL_OBJECT => 6

    /**
     * Indicates a window station or desktop object on the local computer. You cannot use 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-getnamedsecurityinfoa">GetNamedSecurityInfo</a> and 
     * <a href="https://docs.microsoft.com/windows/desktop/api/aclapi/nf-aclapi-setnamedsecurityinfoa">SetNamedSecurityInfo</a> with these objects because the names of window stations or desktops are not unique.
     * Native name: SE_WINDOW_OBJECT
     * @type {Integer (Int32)}
     */
    static WINDOW_OBJECT => 7

    /**
     * Indicates a directory service object or a property set or property of a directory service object. 
     * 
     * The name string for a directory service object must be  in <a href="https://docs.microsoft.com/windows/desktop/SecGloss/x-gly">X.500</a> form, for example:
     * 
     * CN=<i>SomeObject</i>,OU=<i>ou2</i>,OU=<i>ou1</i>,DC=<i>DomainName</i>,DC=<i>CompanyName</i>,DC=com,O=internet
     * Native name: SE_DS_OBJECT
     * @type {Integer (Int32)}
     */
    static DS_OBJECT => 8

    /**
     * Indicates a directory service object and all of its property sets and properties.
     * Native name: SE_DS_OBJECT_ALL
     * @type {Integer (Int32)}
     */
    static DS_OBJECT_ALL => 9

    /**
     * Indicates a provider-defined object.
     * Native name: SE_PROVIDER_DEFINED_OBJECT
     * @type {Integer (Int32)}
     */
    static PROVIDER_DEFINED_OBJECT => 10

    /**
     * Indicates a WMI object.
     * Native name: SE_WMIGUID_OBJECT
     * @type {Integer (Int32)}
     */
    static WMIGUID_OBJECT => 11

    /**
     * Indicates an object for a registry entry under WOW64.
     * Native name: SE_REGISTRY_WOW64_32KEY
     * @type {Integer (Int32)}
     */
    static REGISTRY_WOW64_32KEY => 12

    /**
     * Native name: SE_REGISTRY_WOW64_64KEY
     * @type {Integer (Int32)}
     */
    static REGISTRY_WOW64_64KEY => 13
}
