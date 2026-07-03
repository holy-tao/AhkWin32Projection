#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains information on the functions implemented by a namespace service provider version-2 (NSPv2) provider.
 * @remarks
 * The 
 * **NSPV2_ROUTINE** structure is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPV2_ROUTINE** structure can only be used for operations on NS_EMAIL namespace providers.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wsaadvertiseprovider">WSAAdvertiseProvider</a> function advertises an instance of a NSPv2 provider for clients to find. The **WSAAdvertiseProvider** caller passes a pointer to an **NSPV2_ROUTINE**  structure in the <i>pNSPv2Routine</i> parameter with the NSPv2 entry points supported by the provider. 
 * 
 * 
 * A NSPv2 provider is required to implement the following functions: 
 * - 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a>
 *  
 * - 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2lookupservicenextex">NSPv2LookupServiceNextEx</a>
 *  
 * - 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2lookupserviceend">NSPv2LookupServiceEnd</a>
 *  
 *  All other functions are optional, dependent on the requirements of the NSPv2 provider. 
 * 
 *  If a function isn't implemented, then calls to that function should be intercepted by a stub function that returns <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.  The NSPv2 function pointer to the unimplemented function in the **NSPV2_ROUTINE** structure should point be to the stub function. 
 * 
 * In general, NSPv2 providers are implemented in processes other than the calling applications. NSPv2 providers are not activated as a result of client activity. Each provider hosting application decides when to make a specific provider available or unavailable by calling the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wsaadvertiseprovider">WSAAdvertiseProvider</a> and <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wsaunadvertiseprovider">WSAUnadvertiseProvider</a> functions. The client activity only results in attempts to contact the provider, when available (when the namespace provider is advertised).
 * 
 * A process can implement and advertise multiple providers at the same time. Windows Sockets will manage the namespace providers by dispatching calls to the correct one. It will also hide RPC interface details and translates cross-process calls into in-process calls. So that the NSPv2 provider has only to implement a table of entry point functions similar to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/ns-ws2spi-nsp_routine">NSP_ROUTINE</a> structure used by an NSPv1 provider. A NSPv2 provider does not have to worry about RPC specific requirements (data marshalling and serialization, for example).
 * 
 * 
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-wsaunadvertiseprovider">WSAUnadvertiseProvider</a> function makes a specific namespace provider no longer available for clients.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-nspv2_routine
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NSPV2_ROUTINE {
    #StructPack 8

    /**
     * Type: **DWORD**
     * 
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * Type: **DWORD**
     * 
     * The major version of the service provider specification supported by this provider.
     */
    dwMajorVersion : UInt32

    /**
     * Type: **DWORD**
     * 
     * The minor version of the service provider specification supported by this provider.
     */
    dwMinorVersion : UInt32

    /**
     * Type: ** LPNSPV2STARTUP**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a> function for this NSPv2 provider.
     */
    NSPv2Startup : IntPtr

    /**
     * Type: **LPNSPV2CLEANUP**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2cleanup">NSPv2Cleanup</a> function for this NSPv2 provider.
     */
    NSPv2Cleanup : IntPtr

    /**
     * Type: **LPNSPV2LOOKUPSERVICEBEGIN**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> function for this NSPv2 provider.
     */
    NSPv2LookupServiceBegin : IntPtr

    /**
     * Type: **LPNSPV2LOOKUPSERVICENEXTEX**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2lookupservicenextex">NSPv2LookupServiceNextEx</a> function for this NSPv2 provider.
     */
    NSPv2LookupServiceNextEx : IntPtr

    /**
     * Type: **LPNSPV2LOOKUPSERVICEEND**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2lookupserviceend">NSPv2LookupServiceEnd</a> function for this NSPv2 provider.
     */
    NSPv2LookupServiceEnd : IntPtr

    /**
     * Type: **LPNSPV2SETSERVICEEX**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2setserviceex">NSPv2SetServiceEx</a> function for this NSPv2 provider.
     */
    NSPv2SetServiceEx : IntPtr

    /**
     * Type: **LPNSPV2CLIENTSESSIONRUNDOWN**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2clientsessionrundown">NSPv2ClientSessionRundown</a> function for this NSPv2 provider.
     */
    NSPv2ClientSessionRundown : IntPtr

}
