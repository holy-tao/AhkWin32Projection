#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies a namespace service provider version-2 (NSPv2) provider that a new client process is to begin using the provider.
 * @remarks
 * The 
 * **NSPv2Startup** function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPv2Startup** function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * The 
 * **NSPv2Startup** function is called each time a new client process begins using namespace provider.  Providers may use the 
 * client session argument pointed to by the <i>ppvClientSessionArg</i> parameter to store information about this session. The value in the <i>ppvClientSessionArg</i> parameter will be passed to subsequent NSPv2 function calls in the same session. The client session argument may **NULL**, if the namespace provider does not require this information. 
 * 
 * The **NSPv2Startup** function is called when a new client session initializes. 
 * The **NSPv2Startup** and 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2cleanup">NSPv2Cleanup</a> functions must be called as pairs. 
 * 
 * The 
 * **NSPv2Startup** function must be called successfully before calling the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2cleanup">NSPv2Cleanup</a> function. It is permissible to make more than one 
 * **NSPv2Startup** call. However, for each 
 * **NSPv2Startup** call, a corresponding 
 * **NSPv2Cleanup** call must also be issued. Only the final 
 * **NSPv2Cleanup** for the service provider does the actual cleanup; the preceding calls decrement an internal reference count in the namespace service provider.
 * 
 * The **NSPv2Startup**,  <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2clientsessionrundown">NSPv2ClientSessionRundown</a>, and  <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2cleanup">NSPv2Cleanup</a> functions are optional, dependent on the requirements of the NSPv2 provider.
 * 
 *  If the **NSPv2Startup** function isn't implemented, then calls to that function should be intercepted by a stub function that returns <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.  The NSPv2 function pointer to the unimplemented **NSPv2Startup** function in the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/ns-ws2spi-nspv2_routine">NSPV2_ROUTINE</a> structure should point be to the stub function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspv2startup
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPV2STARTUP extends IUnknown {

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
     * @param {Pointer<Guid>} lpProviderId 
     * @param {Pointer<Pointer<Void>>} ppvClientSessionArg 
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpProviderId, ppvClientSessionArg) {
        ppvClientSessionArgMarshal := ppvClientSessionArg is VarRef ? "ptr*" : "ptr"

        result := ComCall(3, this, "ptr", lpProviderId, ppvClientSessionArgMarshal, ppvClientSessionArg, "int")
        return result
    }
}
