#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\..\System\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import "..\..\Foundation\HWND.ahk" { HWND }
#Import ".\WSACOMPLETIONTYPE.ahk" { WSACOMPLETIONTYPE }
#Import "..\..\Foundation\WPARAM.ahk" { WPARAM }

/**
 * Specifies completion notification settings for I/O control calls made to a registered namespace.
 * @remarks
 * The <b>WSACOMPLETION</b> structure enables callbacks to be provided in any of the following formats, based on the value provided in <b>Type</b>:
 * 
 * <table>
 * <tr>
 * <th>Callback Format</th>
 * <th>Type value</th>
 * </tr>
 * <tr>
 * <td>Polling </td>
 * <td>NSP_NOTIFY_IMMEDIATELY</td>
 * </tr>
 * <tr>
 * <td>Window Message</td>
 * <td>NSP_NOTIFY_HWND</td>
 * </tr>
 * <tr>
 * <td>Event</td>
 * <td>NSP_NOTIFY_EVENT</td>
 * </tr>
 * <tr>
 * <td>APC</td>
 * <td>NSP_NOTIFY_APC</td>
 * </tr>
 * <tr>
 * <td>Completion Port</td>
 * <td>NSP_NOTIFY_PORT</td>
 * </tr>
 * </table>
 *  
 * 
 * For a blocking function, set the <b>WSACOMPLETION</b> structure to null.
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsacompletion
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct WSACOMPLETION {
    #StructPack 8


    struct _Parameters {

        struct _WindowMessage {
            hWnd : HWND

            uMsg : UInt32

            context : WPARAM

        }

        struct _Event {
            lpOverlapped : OVERLAPPED.Ptr

        }

        struct _Apc {
            lpOverlapped : OVERLAPPED.Ptr

            lpfnCompletionProc : IntPtr

        }

        struct _Port {
            lpOverlapped : OVERLAPPED.Ptr

            hPort : HANDLE

            Key : IntPtr

        }

        WindowMessage : WSACOMPLETION._Parameters._WindowMessage

        static __New() {
            DefineProp(this.Prototype, 'Event', { type: WSACOMPLETION._Parameters._Event, offset: 0 })
            DefineProp(this.Prototype, 'Apc', { type: WSACOMPLETION._Parameters._Apc, offset: 0 })
            DefineProp(this.Prototype, 'Port', { type: WSACOMPLETION._Parameters._Port, offset: 0 })
            this.DeleteProp("__New")
        }
    }

    /**
     * Type: <b>WSACOMPLETIONTYPE</b>
     * 
     * The type of completion notification required. See Remarks.
     */
    Type : WSACOMPLETIONTYPE

    /**
     * The parameters required to complete the callback. The structures within the Parameters union specify information required for completing the callback of each given type. For example, the <b>WindowMessage</b> structure must be filled  when <b>Type</b> is set to NSP_NOTIFY_HWND.
     */
    Parameters : WSACOMPLETION._Parameters

}
