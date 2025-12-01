#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include ..\..\Foundation\HWND.ahk

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

    class _APC extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {Pointer<PFN_RPCNOTIFICATION_ROUTINE>}
         */
        NotificationRoutine {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {HANDLE}
         */
        hThread{
            get {
                if(!this.HasProp("__hThread"))
                    this.__hThread := HANDLE(8, this)
                return this.__hThread
            }
        }
    
    }

    class _IOC extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {HANDLE}
         */
        hIOPort{
            get {
                if(!this.HasProp("__hIOPort"))
                    this.__hIOPort := HANDLE(0, this)
                return this.__hIOPort
            }
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
    
    }

    class _IntPtr extends Win32Struct {
        static sizeof => 16
        static packingSize => 8

        /**
         * @type {HWND}
         */
        hWnd{
            get {
                if(!this.HasProp("__hWnd"))
                    this.__hWnd := HWND(0, this)
                return this.__hWnd
            }
        }
    
        /**
         * @type {Integer}
         */
        Msg {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    /**
     * Structure used for Windows asynchronous procedure call (APC) notifications.
     * @type {_APC}
     */
    APC{
        get {
            if(!this.HasProp("__APC"))
                this.__APC := %this.__Class%._APC(0, this)
            return this.__APC
        }
    }

    /**
     * Structure used for notification on an I/O completion port.
     * @type {_IOC}
     */
    IOC{
        get {
            if(!this.HasProp("__IOC"))
                this.__IOC := %this.__Class%._IOC(0, this)
            return this.__IOC
        }
    }

    /**
     * @type {_IntPtr}
     */
    IntPtr{
        get {
            if(!this.HasProp("__IntPtr"))
                this.__IntPtr := %this.__Class%._IntPtr(0, this)
            return this.__IntPtr
        }
    }

    /**
     * Handle used for notification by an event.
     * @type {HANDLE}
     */
    hEvent{
        get {
            if(!this.HasProp("__hEvent"))
                this.__hEvent := HANDLE(0, this)
            return this.__hEvent
        }
    }

    /**
     * Calls the user-defined APC notification routine.
     * @type {Pointer<PFN_RPCNOTIFICATION_ROUTINE>}
     */
    NotificationRoutine {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
