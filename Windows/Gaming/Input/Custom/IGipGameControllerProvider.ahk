#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32ComInterface.ahk
#Include ..\..\..\..\Guid.ahk
#Include ..\..\..\Foundation\IAsyncOperationWithProgress.ahk
#Include .\GipFirmwareUpdateResult.ahk
#Include ..\..\..\Foundation\IPropertyValue.ahk
#Include ..\..\..\Win32\System\WinRT\IInspectable.ahk

/**
 * @namespace Windows.Gaming.Input.Custom
 * @version WindowsRuntime 1.4
 */
class IGipGameControllerProvider extends IInspectable{

    static sizeof => A_PtrSize
    /**
     * The interface identifier for IGipGameControllerProvider
     * @type {Guid}
     */
    static IID => Guid("{dbcf1e19-1af5-45a8-bf02-a0ee50c823fc}")

    /**
     * The offset into the COM object's virtual function table at which this interface's methods begin.
     * @type {Integer}
     */
    static vTableOffset => 6

    /**
     * @readonly used when implementing interfaces to order function pointers
     * @type {Array<String>}
     */
    static VTableNames => ["SendMessage", "SendReceiveMessage", "UpdateFirmwareAsync"]

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
     * @param {Integer} messageClass 
     * @param {Integer} messageId 
     * @param {Integer} messageBuffer_length 
     * @param {Pointer<Integer>} messageBuffer 
     * @returns {HRESULT} Type: <b>LRESULT</b>
     * 
     * The return value specifies the result of the message processing; it depends on the message sent.
     * @see https://learn.microsoft.com/windows/win32/api//content/winuser/nf-winuser-sendmessage
     */
    SendMessage(messageClass, messageId, messageBuffer_length, messageBuffer) {
        messageBufferMarshal := messageBuffer is VarRef ? "char*" : "ptr"

        result := ComCall(6, this, "int", messageClass, "char", messageId, "uint", messageBuffer_length, messageBufferMarshal, messageBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {Integer} messageClass 
     * @param {Integer} messageId 
     * @param {Integer} requestMessageBuffer_length 
     * @param {Pointer<Integer>} requestMessageBuffer 
     * @param {Pointer<Integer>} responseMessageBuffer_length 
     * @param {Pointer<Pointer<Integer>>} responseMessageBuffer 
     * @returns {HRESULT} 
     */
    SendReceiveMessage(messageClass, messageId, requestMessageBuffer_length, requestMessageBuffer, responseMessageBuffer_length, responseMessageBuffer) {
        requestMessageBufferMarshal := requestMessageBuffer is VarRef ? "char*" : "ptr"
        responseMessageBuffer_lengthMarshal := responseMessageBuffer_length is VarRef ? "uint*" : "ptr"
        responseMessageBufferMarshal := responseMessageBuffer is VarRef ? "ptr*" : "ptr"

        result := ComCall(7, this, "int", messageClass, "char", messageId, "uint", requestMessageBuffer_length, requestMessageBufferMarshal, requestMessageBuffer, responseMessageBuffer_lengthMarshal, responseMessageBuffer_length, responseMessageBufferMarshal, responseMessageBuffer, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return result
    }

    /**
     * 
     * @param {IInputStream} firmwareImage 
     * @returns {IAsyncOperationWithProgress<GipFirmwareUpdateResult, GipFirmwareUpdateProgress>} 
     */
    UpdateFirmwareAsync(firmwareImage) {
        result := ComCall(8, this, "ptr", firmwareImage, "ptr*", &result_ := 0, "int")
        if(result != 0) {
            throw OSError(A_LastError || result)
        }

        return IAsyncOperationWithProgress(GipFirmwareUpdateResult, (ptr) => IPropertyValue(ptr).GetGipFirmwareUpdateProgress(), result_)
    }
}
