#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PWSTR.ahk" { PWSTR }

/**
 * Contains pointers to the module name and module path values associated with a TCP connection. The TCPIP_OWNER_MODULE_BASIC_INFO structure is returned by the GetOwnerModuleFromTcpEntry and GetOwnerModuleFromTcp6Entry functions.
 * @remarks
 * If the module owner is the system kernel, the <b>lpModuleName</b> and <b>lpModulePath</b> members point to a wide character string that contains "System".
 * 
 * On Windows Vista and later as well as on the Microsoft Windows Software Development Kit (SDK), the organization of header files has changed and the <b>TCPIP_OWNER_MODULE_BASIC_INFO</b> structure is defined in the <i>Iprtrmib.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/iprtrmib/ns-iprtrmib-tcpip_owner_module_basic_info
 * @namespace Windows.Win32.NetworkManagement.IpHelper
 */
export default struct TCPIP_OWNER_MODULE_BASIC_INFO {
    #StructPack 8

    /**
     * A pointer to the name of the module. This field should be a <b>NULL</b> pointer when passed to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getownermodulefromtcpentry">GetOwnerModuleFromTcpEntry</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getownermodulefromtcp6entry">GetOwnerModuleFromTcp6Entry</a> function.
     */
    pModuleName : PWSTR

    /**
     * A pointer to the full path of the module, including the module name. This field should be a <b>NULL</b> pointer when passed to <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getownermodulefromtcpentry">GetOwnerModuleFromTcpEntry</a> or <a href="https://docs.microsoft.com/windows/desktop/api/iphlpapi/nf-iphlpapi-getownermodulefromtcp6entry">GetOwnerModuleFromTcp6Entry</a> function.
     */
    pModulePath : PWSTR

}
