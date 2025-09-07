#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class NSP_ROUTINE extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * Type: **DWORD**
     * 
     * The size, in bytes, of the structure. Note that the size of the **NSP_ROUTINE** structure changed on Windows XP and later.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: **DWORD**
     * 
     * The major version of the service provider specification supported by this provider.
     * @type {Integer}
     */
    dwMajorVersion {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: **DWORD**
     * 
     * The minor version of the service provider specification supported by this provider.
     * @type {Integer}
     */
    dwMinorVersion {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: **LPNSPCLEANUP**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspcleanup">NSPCleanup</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPCleanup** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * @type {Pointer<Ptr>}
     */
    NSPCleanup {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * Type: **LPNSPLOOKUPSERVICEBEGIN**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPLookupServiceBegin</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPLookupServiceBegin** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * @type {Pointer<Ptr>}
     */
    NSPLookupServiceBegin {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Type: **LPNSPLOOKUPSERVICENEXT**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicenext">NSPLookupServiceNext</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPLookupServiceNext** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * @type {Pointer<Ptr>}
     */
    NSPLookupServiceNext {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: **LPNSPLOOKUPSERVICEEND**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupserviceend">NSPLookupServiceEnd</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPLookupServiceEnd** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * @type {Pointer<Ptr>}
     */
    NSPLookupServiceEnd {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: **LPNSPSETSERVICE**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspsetservice">NSPSetService</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPSetService** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * @type {Pointer<Ptr>}
     */
    NSPSetService {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: **LPNSPINSTALLSERVICECLASS**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspinstallserviceclass">NSPInstallServiceClass</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPInstallServiceClass** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * @type {Pointer<Ptr>}
     */
    NSPInstallServiceClass {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * Type: **LPNSPREMOVESERVICECLASS**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspremoveserviceclass">NSPRemoveServiceClass</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPRemoveServiceClass** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * @type {Pointer<Ptr>}
     */
    NSPRemoveServiceClass {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: **LPNSPGETSERVICECLASSINFO**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspgetserviceclassinfo">NSPGetServiceClassInfo</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPGetServiceClassInfo** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * @type {Pointer<Ptr>}
     */
    NSPGetServiceClassInfo {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: **LPNSPIOCTL**
     * 
     * A pointer to the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspioctl">NSPIoctl</a> function implemented by the namespace provider. Every NSP function entry must point to a valid function. If the provider does not implement this function, the **NSPIoctl** function should return <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.
     * 
     * <div class="alert">**Note**  This structure member is only available on Windows XP and later.
     * </div>
     * <div> </div>
     * @type {Pointer<Ptr>}
     */
    NSPIoctl {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * Initializes the struct. `cbSize` must always contain the size of the struct.
     * @param {Integer} ptr The location at which to create the struct, or 0 to create a new `Buffer`
     */
    __New(ptr := 0){
        super.__New(ptr)
        this.cbSize := 88
    }
}
