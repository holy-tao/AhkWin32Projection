#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FaxClose function closes fax handles
 * @remarks
 * A fax client application must call the <b>FaxClose</b> function as the last function before it terminates. The <a href="https://docs.microsoft.com/windows/desktop/api/handleapi/nf-handleapi-closehandle">CloseHandle</a> function cannot close the handle to a fax server or a fax port.
 * 
 * When the <b>FaxClose</b> function closes a handle allocated by the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nf-winfax-faxconnectfaxservera">FaxConnectFaxServer</a> function, the function disconnects the calling application from the specified fax server.
 * 
 * A fax client application continues to receive fax events from the fax service after the application successfully calls the <b>FaxClose</b> function to close a fax server handle. This permits the fax service to shut down and conserve system resources when the service has been idle for an extended period. If you keep the handle to the fax server open, the fax service does not shut down.
 * 
 * For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-enabling-an-application-to-receive-notifications-of-fax-events">Enabling an Application to Receive Notifications of Fax Events</a>, <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-connecting-to-a-fax-server">Connecting to a Fax Server</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-disconnecting-from-a-fax-server">Disconnecting from a Fax Server</a>, and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxinitializeeventqueue">FaxInitializeEventQueue</a>.
 * @see https://learn.microsoft.com/windows/win32/api//content/winfax/nc-winfax-pfaxclose
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXCLOSE extends IUnknown {

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
     * @param {HANDLE} FaxHandle 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle

        result := ComCall(3, this, "ptr", FaxHandle, "int")
        return result
    }
}
