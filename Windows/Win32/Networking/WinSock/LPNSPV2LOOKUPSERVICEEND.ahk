#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Called to free the handle after previous calls to NSPv2LookupServiceBegin and NSPv2LookupServiceNextEx.
 * @remarks
 * The 
 * **NSPv2LookupServiceEnd** function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPv2LookupServiceEnd** function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * It is possible to receive an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnsplookupservicebegin">NSPv2LookupServiceBegin</a> function call on another thread while processing an 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2lookupservicenextex">NSPv2LookupServiceNextEx</a>. This indicates that the client has canceled the request and the provider should close the handle and return from the 
 * **NSPv2LookupServiceNextEx** function call as well, setting the last error to **WSA_E_CANCELLED**.
 * 
 * In Windows Sockets 2, conflicting error codes are defined for **WSAECANCELLED** and <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2">WSA_E_CANCELLED</a>. The error code **WSAECANCELLED** will be removed in a future version and only WSA_E_CANCELLED will remain. Namespace Providers should use the WSA_E_CANCELLED error code to maintain compatibility with the widest possible range of applications.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspv2lookupserviceend
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPV2LOOKUPSERVICEEND extends IUnknown {

    static sizeof => A_PtrSize

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["Invoke"]

    /**
     * Invokes helper functionality for the IDispatch interface.
     * @param {HANDLE} hLookup 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(hLookup) {
        hLookup := hLookup is Win32Handle ? NumGet(hLookup, "ptr") : hLookup

        result := ComCall(3, this, "ptr", hLookup, "int")
        return result
    }
}
