#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains notification information for asynchronous remote procedure calls. This notification information can be configured for I/O completion ports (IOC), Windows asynchronous procedure calls (APC), Windows messaging, and Windows event notification.
 * @remarks
 * Prior to Windows Vista and earlier versions of Windows, the <b>RPC_ASYNC_NOTIFICATION_INFO</b> union was part of the <a href="https://docs.microsoft.com/windows/desktop/api/rpcasync/ns-rpcasync-rpc_async_state">RPC_ASYNC_STATE</a> structure. Please see the <b>RPC_ASYNC_STATE</b> topic for additional information.
 * @see https://learn.microsoft.com/windows/win32/api/rpcasync/ns-rpcasync-rpc_async_notification_info
 * @namespace Windows.Win32.System.Rpc
 * @version v4.0.30319
 */
class RPC_ASYNC_NOTIFICATION_INFO extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * @type {Pointer<PFN_RPCNOTIFICATION_ROUTINE>}
     */
    NotificationRoutine {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    hThread {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<HANDLE>}
     */
    hIOPort {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    dwNumberOfBytesTransferred {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Pointer}
     */
    dwCompletionKey {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<OVERLAPPED>}
     */
    lpOverlapped {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {Pointer<HWND>}
     */
    hWnd {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Msg {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Handle used for notification by an event.
     * @type {Pointer<HANDLE>}
     */
    hEvent {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
