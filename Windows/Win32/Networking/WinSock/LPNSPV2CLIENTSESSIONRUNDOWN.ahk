#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies a namespace service provider version-2 (NSPv2) provider that the client session is terminating.
 * @remarks
 * The 
 * **NSPv2ClientSessionRundown** function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPv2ClientSessionRundown** function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a> function is called each time a new client process begins using namespace provider.  Providers may use the 
 * client session argument pointed to by the <i>ppvClientSessionArg</i> parameter to store information about this session. If a value was specified for the client session argument in the call to the **NSPv2Startup** function, then this same client session argument is passed in the  <i>pvClientSessionArg</i> parameter to the **NSPv2ClientSessionRundown** function.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a>,  **NSPv2ClientSessionRundown**, and  <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2cleanup">NSPv2Cleanup</a> functions are optional, dependent on the requirements of the NSPv2 provider.
 * 
 *  If the **NSPv2ClientSessionRundown** function isn't implemented, then calls to that function should be intercepted by a stub function that returns <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.  The NSPv2 function pointer to the unimplemented **NSPv2ClientSessionRundown** function in the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/ns-ws2spi-nspv2_routine">NSPV2_ROUTINE</a> structure should point be to the stub function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspv2clientsessionrundown
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPV2CLIENTSESSIONRUNDOWN extends IUnknown {

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
     * @param {Pointer<Void>} pvClientSessionArg 
     * @returns {String} Nothing - always returns an empty string
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpProviderId, pvClientSessionArg) {
        pvClientSessionArgMarshal := pvClientSessionArg is VarRef ? "ptr" : "ptr"

        ComCall(3, this, "ptr", lpProviderId, pvClientSessionArgMarshal, pvClientSessionArg)
    }
}
