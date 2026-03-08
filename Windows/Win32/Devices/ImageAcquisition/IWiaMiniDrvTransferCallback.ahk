#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\Foundation\BSTR.ahk
#Include ..\..\System\Com\IStream.ahk
#Include ..\..\System\Com\IUnknown.ahk

/**
 * @namespace Windows.Win32.Devices.ImageAcquisition
 * @version v4.0.30319
 */
class IWiaMiniDrvTransferCallback extends IUnknown{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IWiaMiniDrvTransferCallback
     * @type {Guid}
     */
    static IID => Guid("{a9d2ee89-2ce5-4ff0-8adb-c961d1d774ca}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 3

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["GetNextStream", "SendMessage"]

    /**
     * 
     * @param {Integer} lFlags 
     * @param {BSTR} bstrItemName 
     * @param {BSTR} bstrFullItemName 
     * @returns {IStream} 
     */
    GetNextStream(lFlags, bstrItemName, bstrFullItemName) {
        bstrItemName := bstrItemName is String ? BSTR.Alloc(bstrItemName).Value : bstrItemName
        bstrFullItemName := bstrFullItemName is String ? BSTR.Alloc(bstrFullItemName).Value : bstrFullItemName

        result := ComCall(3, this, "int", lFlags, "ptr", bstrItemName, "ptr", bstrFullItemName, "ptr*", &ppIStream := 0, "HRESULT")
        return IStream(ppIStream)
    }

    /**
     * Sends the specified message to a window or windows. The SendMessage function calls the window procedure for the specified window and does not return until the window procedure has processed the message. (SendMessageW)
     * @remarks
     * When a message is blocked by UIPI the last error, retrieved with <a href="https://docs.microsoft.com/windows/desktop/api/errhandlingapi/nf-errhandlingapi-getlasterror">GetLastError</a>, is set to 5 (access denied).
     * 
     * Applications that need to communicate using <b>HWND_BROADCAST</b> should use the <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-registerwindowmessagea">RegisterWindowMessage</a> function to obtain a unique message for inter-application communication.
     * 
     * The system only does marshalling for system messages (those in the range 0 to (<a href="https://docs.microsoft.com/windows/desktop/winmsg/wm-user">WM_USER</a>-1)). To send other messages (those &gt;= <b>WM_USER</b>) to another process, you must do custom marshalling.
     * 
     * If the specified window was created by the calling thread, the window procedure is called immediately as a subroutine. If the specified window was created by a different thread, the system switches to that thread and calls the appropriate window procedure. Messages sent between threads are processed only when the receiving thread executes message retrieval code. The sending thread is blocked until the receiving thread processes the message. However, the sending thread will process incoming nonqueued messages while waiting for its message to be processed. To prevent this, use <a href="https://docs.microsoft.com/windows/desktop/api/winuser/nf-winuser-sendmessagetimeouta">SendMessageTimeout</a> with SMTO_BLOCK set. For more information on nonqueued messages, see <a href="https://docs.microsoft.com/windows/desktop/winmsg/about-messages-and-message-queues">Nonqueued Messages</a>.
     * 
     *  An accessibility application can use <b>SendMessage</b> to send <a href="https://docs.microsoft.com/windows/desktop/inputdev/wm-appcommand">WM_APPCOMMAND</a> messages  to the shell to launch applications. This  functionality is not guaranteed to work for other types of applications.
     * @param {Integer} lFlags 
     * @param {Pointer<WiaTransferParams>} pWiaTransferParams 
     * @returns {HRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://learn.microsoft.com/windows/win32/api/winuser/nf-winuser-sendmessage
     */
    SendMessage(lFlags, pWiaTransferParams) {
        result := ComCall(4, this, "int", lFlags, "ptr", pWiaTransferParams, "HRESULT")
        return result
    }
}
