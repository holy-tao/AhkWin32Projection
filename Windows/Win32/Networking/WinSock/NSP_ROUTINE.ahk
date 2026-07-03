#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPNSPCLEANUP.ahk" { LPNSPCLEANUP }
#Import ".\LPNSPGETSERVICECLASSINFO.ahk" { LPNSPGETSERVICECLASSINFO }
#Import ".\LPNSPINSTALLSERVICECLASS.ahk" { LPNSPINSTALLSERVICECLASS }
#Import ".\LPNSPIOCTL.ahk" { LPNSPIOCTL }
#Import ".\LPNSPLOOKUPSERVICEBEGIN.ahk" { LPNSPLOOKUPSERVICEBEGIN }
#Import ".\LPNSPLOOKUPSERVICEEND.ahk" { LPNSPLOOKUPSERVICEEND }
#Import ".\LPNSPLOOKUPSERVICENEXT.ahk" { LPNSPLOOKUPSERVICENEXT }
#Import ".\LPNSPREMOVESERVICECLASS.ahk" { LPNSPREMOVESERVICECLASS }
#Import ".\LPNSPSETSERVICE.ahk" { LPNSPSETSERVICE }

/**
 * Contains information regarding the functions implemented by a namespace service provider version 1 (NSPv1) provider.
 * @remarks
 * The size of the **NSP_ROUTINE** structure changed on Windows XP and later. The **cbSize** member should be used to determine which version of the **NSP_ROUTINE** structure is being used. 
 * 
 * 
 * 
 * The version of the **NSP_ROUTINE** structure on Windows XP and later has the following new member added: **NSPIoctl**.
 * @see https://learn.microsoft.com/windows/win32/api/ws2spi/ns-ws2spi-nsp_routine
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct NSP_ROUTINE {
    #StructPack 8

    /**
     * Type: **DWORD**
     * 
     * The size, in bytes, of the structure. Note that the size of the **NSP_ROUTINE** structure changed on Windows XP and later.
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
     * Type: **LPNSPCLEANUP**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspcleanup">NSPCleanup</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPCleanup** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     */
    NSPCleanup : LPNSPCLEANUP

    /**
     * Type: **LPNSPLOOKUPSERVICEBEGIN**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPLookupServiceBegin** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     */
    NSPLookupServiceBegin : LPNSPLOOKUPSERVICEBEGIN

    /**
     * Type: **LPNSPLOOKUPSERVICENEXT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicenext">NSPLookupServiceNext</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPLookupServiceNext** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     */
    NSPLookupServiceNext : LPNSPLOOKUPSERVICENEXT

    /**
     * Type: **LPNSPLOOKUPSERVICEEND**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupserviceend">NSPLookupServiceEnd</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPLookupServiceEnd** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     */
    NSPLookupServiceEnd : LPNSPLOOKUPSERVICEEND

    /**
     * Type: **LPNSPSETSERVICE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspsetservice">NSPSetService</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPSetService** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     */
    NSPSetService : LPNSPSETSERVICE

    /**
     * Type: **LPNSPINSTALLSERVICECLASS**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspinstallserviceclass">NSPInstallServiceClass</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPInstallServiceClass** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     */
    NSPInstallServiceClass : LPNSPINSTALLSERVICECLASS

    /**
     * Type: **LPNSPREMOVESERVICECLASS**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspremoveserviceclass">NSPRemoveServiceClass</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPRemoveServiceClass** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     */
    NSPRemoveServiceClass : LPNSPREMOVESERVICECLASS

    /**
     * Type: **LPNSPGETSERVICECLASSINFO**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspgetserviceclassinfo">NSPGetServiceClassInfo</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPGetServiceClassInfo** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     */
    NSPGetServiceClassInfo : LPNSPGETSERVICECLASSINFO

    /**
     * Type: **LPNSPIOCTL**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspioctl">NSPIoctl</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPIoctl** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * 
     * <div class="alert">**Note**  This structure member is only available on Windows XP and later.
     * </div>
     * <div> </div>
     */
    NSPIoctl : LPNSPIOCTL

}
