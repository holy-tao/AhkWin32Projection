#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * Terminates the use of a particular Windows Sockets namespace service provider.
 * @remarks
 * The **NSPCleanup** function is called when an application is finished using a Windows Sockets namespace service provider. The **NSPCleanup** function deregisters a particular namespace provider and allows the transport service provider to free any of the namespace provider's allocated resources.
 * 
 * The <a href="https://docs.microsoft.com/windows/desktop/api/ws2spi/nf-ws2spi-nspstartup">NSPStartup</a> function must be called successfully before using any namespace providers. It is permissible to make more than one 
 * **NSPStartup** call. However, for each 
 * **NSPStartup** call, a corresponding 
 * **NSPCleanup** call must also be issued. Only the final 
 * **NSPCleanup** for the service provider does the actual cleanup; the preceding calls decrement an internal reference count in the service provider.
 * 
 * This function should not return until the namespace service provider DLL can be unloaded from memory.
 * @see https://learn.microsoft.com/windows/win32/api//content/ws2spi/nc-ws2spi-lpnspcleanup
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class LPNSPCLEANUP extends IUnknown {

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
     * @returns {Integer} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(lpProviderId) {
        result := ComCall(3, this, "ptr", lpProviderId, "int")
        return result
    }
}
