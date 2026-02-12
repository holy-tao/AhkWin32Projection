#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Notifies a namespace service provider version-2 (NSPv2) provider that a client session has terminated.
 * @remarks
 * The 
 * **NSPv2Cleanup** function is used as part of the namespace service provider version-2 (NSPv2) architecture available on Windows Vista and later. 
 * 
 * On Windows Vista and Windows Server 2008, the **NSPv2Cleanup** function can only be used for operations on NS_EMAIL namespace providers.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a> function is called each time a new client process begins using namespace provider.  Providers may use the 
 * client session argument pointed to by the <i>ppvClientSessionArg</i> parameter to store information about this session. If a value was specified for the client session argument in the call to the **NSPv2Startup** function, then this same client session argument can be passed in the  pvClientSessionArg parameter to the **NSPv2Cleanup** function to notify namespace provider that the client session has terminated.
 * 
 * The 
 * **NSPv2Cleanup** function is called when an application is finished using a Windows Sockets namespace service provider. The 
 * **NSPv2Cleanup** allows the namespace provider to free any of namespace provider resources that were allocated for the client session.
 * 
 * The 
 * <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a> function must be called successfully before calling the **NSPv2Cleanup** function. It is permissible to make more than one 
 * **NSPv2Startup** call. However, for each 
 * **NSPv2Startup** call, a corresponding 
 * **NSPv2Cleanup** call must also be issued. Only the final 
 * **NSPv2Cleanup** for the service provider does the actual cleanup; the preceding calls decrement an internal reference count in the service provider.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2startup">NSPv2Startup</a>,  <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nc-ws2spi-lpnspv2clientsessionrundown">NSPv2ClientSessionRundown</a>, and  **NSPv2Cleanup** functions are optional, dependent on the requirements of the NSPv2 provider.
 * 
 *  If the **NSPv2Cleanup** function isn't implemented, then calls to that function should be intercepted by a stub function that returns <a href="https://docs.microsoft.com/windows/desktop/WinSock/windows-sockets-error-codes-2#WSAEOPNOTSUPP">WSAEOPNOTSUPP</a>.  The NSPv2 function pointer to the unimplemented **NSPv2Cleanup** function in the <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/ns-ws2spi-nspv2_routine">NSPV2_ROUTINE</a> structure should point be to the stub function.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspv2cleanup
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPV2CLEANUP extends IUnknown {

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
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpProviderId, pvClientSessionArg) {
        pvClientSessionArgMarshal := pvClientSessionArg is VarRef ? "ptr" : "ptr"

        result := ComCall(3, this, "ptr", lpProviderId, pvClientSessionArgMarshal, pvClientSessionArg, "int")
        return result
    }
}
