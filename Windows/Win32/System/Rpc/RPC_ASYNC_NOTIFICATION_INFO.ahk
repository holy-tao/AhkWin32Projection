#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\HANDLE.ahk" { HANDLE }
#Import "..\IO\OVERLAPPED.ahk" { OVERLAPPED }
#Import "..\..\Foundation\HWND.ahk" { HWND }

/**
 * Contains notification information for asynchronous remote procedure calls. This notification information can be configured for I/O completion ports (IOC), Windows asynchronous procedure calls (APC), Windows messaging, and Windows event notification.
 * @remarks
 * Prior to Windows Vista and earlier versions of Windows, the <b>RPC_ASYNC_NOTIFICATION_INFO</b> union was part of the <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_state">RPC_ASYNC_STATE</a> structure. Please see the <b>RPC_ASYNC_STATE</b> topic for additional information.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ns-rpcasync-rpc_async_notification_info
 * @namespace Windows.Win32.System.Rpc
 */
export default struct RPC_ASYNC_NOTIFICATION_INFO {
    #StructPack 8


    struct _APC {
        NotificationRoutine : IntPtr

        hThread : HANDLE

    }

    struct _IOC {
        hIOPort : HANDLE

        dwNumberOfBytesTransferred : UInt32

        dwCompletionKey : IntPtr

        lpOverlapped : OVERLAPPED.Ptr

    }

    struct _IntPtr {
        hWnd : HWND

        Msg : UInt32

    }

    /**
     * Structure used for Windows asynchronous procedure call (APC) notifications.
     */
    APC : RPC_ASYNC_NOTIFICATION_INFO._APC

    static __New() {
        DefineProp(this.Prototype, 'IOC', { type: RPC_ASYNC_NOTIFICATION_INFO._IOC, offset: 0 })
        DefineProp(this.Prototype, 'IntPtr', { type: RPC_ASYNC_NOTIFICATION_INFO._IntPtr, offset: 0 })
        DefineProp(this.Prototype, 'hEvent', { type: HANDLE, offset: 0 })
        DefineProp(this.Prototype, 'NotificationRoutine', { type: IntPtr, offset: 0 })
        this.DeleteProp("__New")
    }
}
