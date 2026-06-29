#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\PSTR.ahk" { PSTR }

/**
 * The HOSTENT (winsock.h) structure is used by functions to store information about a given host, such as host name, IPv4 address, and so forth.
 * @remarks
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-gethostbyaddr">gethostbyaddr</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-gethostbyname">gethostbyname</a> functions returns a pointer to a 
 * <b>hostent</b> structure—a structure allocated by Windows Sockets. The 
 * <b>hostent</b> structure contains the results of a successful search for the host specified in the <i>name</i> parameter. 
 * 
 * The memory for the <b>hostent</b> structure  returned by the <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-gethostbyaddr">gethostbyaddr</a> and <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-gethostbyname">gethostbyname</a> functions is allocated internally by the Winsock DLL from thread local storage. Only a single <b>hostent</b> structure is allocated and used, no matter how many times the <b>gethostbyaddr</b> or <b>gethostbyname</b> functions are called on the thread. The returned  <b>hostent</b> structure  must be copied to an application buffer if additional calls are to be made to the <b>gethostbyaddr</b> or <b>gethostbyname</b> functions on the same thread. Otherwise, the return value will be overwritten by subsequent <b>gethostbyaddr</b> or <b>gethostbyname</b> calls on the same thread. The internal memory allocated for the returned  <b>hostent</b> structure is released by the Winsock DLL when the thread exits. 
 * 
 * An application should not try to release the memory used by the returned <b>hostent</b> structure. The application must never attempt to modify this structure or to free any of its components. Furthermore, only one copy of this structure is allocated per thread, so the application should copy any information it needs before issuing any other function calls to <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-gethostbyaddr">gethostbyaddr</a> or <a href="https://docs.microsoft.com/windows/desktop/api/wsipv6ok/nf-wsipv6ok-gethostbyname">gethostbyname</a>.
 * @see https://learn.microsoft.com/windows/win32/api/winsock/ns-winsock-hostent
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct HOSTENT {
    #StructPack 8

    /**
     * The official name of the host (PC). If using the DNS or similar resolution system, it is the Fully Qualified Domain Name (FQDN) that caused the server to return a reply. If using a local hosts file, it is the first entry after the IPv4 address.
     */
    h_name : PSTR

    /**
     * A <b>NULL</b>-terminated array of alternate names.
     */
    h_aliases : IntPtr

    /**
     * The type of address being returned.
     */
    h_addrtype : Int16

    /**
     * The length, in bytes, of each address.
     */
    h_length : Int16

    /**
     * A <b>NULL</b>-terminated list of addresses for the host. Addresses are returned in network byte order. The macro <b>h_addr</b> is defined to be <c>h_addr_list[0]</c> for compatibility with older software.
     */
    h_addr_list : IntPtr

}
