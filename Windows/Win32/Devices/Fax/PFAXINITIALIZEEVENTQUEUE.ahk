#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * The FaxInitializeEventQueue function creates a fax event queue for the calling fax client application. The queue enables the application to receive notifications of asynchronous events from the fax server.
 * @remarks
 * An application can specify how the fax server should inform the client application of events. The application can request that the fax server queue I/O completion packets to an I/O completion port, or it can specify notification messages.
 * 
 * A fax client application must call the <b>FaxInitializeEventQueue</b> function before calling <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> to retrieve the value to specify in the <i>CompletionKey</i> parameter. This value is useful to a message loop that retrieves I/O completion packets from multiple I/O completion ports, using calls to the <a href="https://docs.microsoft.com/windows/desktop/api/synchapi/nf-synchapi-waitformultipleobjects">WaitForMultipleObjects</a> function. If you specify a different completion key for each I/O completion port, you can identify the completion port associated with the completion packet.
 * 
 * An application can call the <a href="https://docs.microsoft.com/windows/desktop/api/ioapiset/nf-ioapiset-getqueuedcompletionstatus">GetQueuedCompletionStatus</a> function to retrieve the queued I/O completion packet for a completed I/O operation. A call to GetQueuedCompletionStatus also returns a pointer to a variable that the function sets to the address of a <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_eventa">FAX_EVENT</a> structure. The structure is associated with the I/O completion packet of interest. Call the <a href="https://docs.microsoft.com/windows/desktop/api/winbase/nf-winbase-localfree">LocalFree</a> function to free the memory allocated for the <b>FAX_EVENT</b> structure.
 * 
 * After a fax client application receives the <b>FEI_FAXSVC_ENDED</b> message, it will no longer receive fax events from the fax service. To resume receiving fax events, the application must call the <b>FaxInitializeEventQueue</b> function again when the fax service restarts. The application can determine if the fax service is running by using the service control manager. For more information, see <a href="https://docs.microsoft.com/previous-versions/windows/desktop/api/winfax/nc-winfax-pfaxclose">FaxClose</a> and <a href="https://docs.microsoft.com/previous-versions/windows/desktop/fax/-mfax-enabling-an-application-to-receive-notifications-of-fax-events">Enabling an Application to Receive Notifications of Fax Events</a>.
 * 
 * For a list of the asynchronous events that can occur within the fax server, see the <a href="https://docs.microsoft.com/windows/desktop/api/winfax/ns-winfax-fax_eventa">FAX_EVENT</a> topic.
 * @see https://learn.microsoft.com/windows/win32/api//content/winfax/nc-winfax-pfaxinitializeeventqueue
 * @namespace Windows.Win32.Devices.Fax
 * @version v4.0.30319
 */
class PFAXINITIALIZEEVENTQUEUE extends IUnknown {

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
     * @param {HANDLE} CompletionPort 
     * @param {Pointer} CompletionKey 
     * @param {HWND} hWnd_ 
     * @param {Integer} MessageStart 
     * @returns {BOOL} If the method succeeds, it returns S\_OK. If it fails, possible return codes include, but are not limited to, the values shown in the following table.
     * 
     * 
     * 
     * | Return code                                                                                  | Description                                      |
     * |----------------------------------------------------------------------------------------------|--------------------------------------------------|
     * | <dl> <dt>**E\_INVALIDARG**</dt> </dl> | The value for *pDispatch* is invalid.<br/> |
     * @see https://learn.microsoft.com/windows/win32/ktop-src/tablet/invokeidispatch
     */
    Invoke(FaxHandle, CompletionPort, CompletionKey, hWnd_, MessageStart) {
        FaxHandle := FaxHandle is Win32Handle ? NumGet(FaxHandle, "ptr") : FaxHandle
        CompletionPort := CompletionPort is Win32Handle ? NumGet(CompletionPort, "ptr") : CompletionPort
        hWnd_ := hWnd_ is Win32Handle ? NumGet(hWnd_, "ptr") : hWnd_

        result := ComCall(3, this, "ptr", FaxHandle, "ptr", CompletionPort, "ptr", CompletionKey, "ptr", hWnd_, "uint", MessageStart, "int")
        return result
    }
}
