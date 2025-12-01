#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\SOCKET.ahk

/**
 * Represents info supplied to the [ProcessSocketNotifications](/windows/win32/api/winsock2/nf-winsock2-processsocketnotifications) function.
 * @remarks
 * 
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-sock_notify_registration
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class SOCK_NOTIFY_REGISTRATION extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Type: **SOCKET**
     * 
     * A handle to a Winsock socket opened by any of the [WSASocket](/windows/win32/api/winsock2/nf-winsock2-wsasocketw), [socket](/windows/win32/api/winsock2/nf-winsock2-socket), [WSAAccept](/windows/win32/api/winsock2/nf-winsock2-wsaaccept), [accept](/windows/win32/api/winsock2/nf-winsock2-accept), or [WSADuplicateSocket](/windows/win32/api/winsock2/nf-winsock2-wsaduplicatesocketw) functions. Only Microsoft [Winsock](/windows/win32/winsock/windows-sockets-start-page-2) provider sockets are supported.
     * @type {SOCKET}
     */
    socket{
        get {
            if(!this.HasProp("__socket"))
                this.__socket := SOCKET(0, this)
            return this.__socket
        }
    }

    /**
     * Type: **PVOID**
     * 
     * The value to use in the *dwCompletionKey* parameter of the [PostQueuedCompletionStatus](/windows/win32/fileio/postqueuedcompletionstatus) function when notifications are sent on behalf of the socket. This parameter is used upon registration creation. To change the completion key, remove the registration and re-register it.
     * @type {Pointer<Void>}
     */
    completionKey {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: **[UINT16](/windows/win32/winprog/windows-data-types)**
     * @type {Integer}
     */
    eventFilter {
        get => NumGet(this, 16, "ushort")
        set => NumPut("ushort", value, this, 16)
    }

    /**
     * Type: **[UINT8](/windows/win32/winprog/windows-data-types)**
     * 
     * Indicates the operation to perform on a registration. At most one operation may be performed at a time. These values are defined in `WinSock2.h`.
     * 
     * **SOCK_NOTIFY_OP_NONE**. No registration operations should take place. Use this if your application calls [ProcessSocketNotifications](/windows/win32/api/winsock2/nf-winsock2-processsocketnotifications) and is only interested in receiving notifications.
     * **SOCK_NOTIFY_OP_ENABLE**. Enables the registration. Notifications must not be re-enabled until the **SOCK_NOTIFY_EVENT_DISABLE** notification is received. 
     * **SOCK_NOTIFY_OP_DISABLE**. Disables the registration, but doesn't destroy the underlying data structures. Note that this doesn't remove the registration, it merely suppresses queuing of new notifications. Notifications that have already been queued might still be delivered until the **SOCK_NOTIFY_EVENT_DISABLE** event is received. 
     * **SOCK_NOTIFY_OP_REMOVE**. Removes a previously-registered notification. Both enabled and disabled notifications may be removed. The **SOCK_NOTIFY_EVENT_REMOVE** notification is issued, with the guarantee that no more notifications will be issued afterwards for that completion key unless it is re-registered.
     * @type {Integer}
     */
    operation {
        get => NumGet(this, 18, "char")
        set => NumPut("char", value, this, 18)
    }

    /**
     * Type: **[UINT8](/windows/win32/winprog/windows-data-types)**
     * 
     * A set of flags indicating the trigger behavior (defined in `WinSock2.h`).
     * 
     * **SOCK_NOTIFY_TRIGGER_ONESHOT**. The registration will be disabled (not removed) upon delivery of the next notification.
     * **SOCK_NOTIFY_TRIGGER_PERSISTENT**. The registration will remain active until it is explicitly disabled or removed.
     * **SOCK_NOTIFY_TRIGGER_LEVEL**. The registration is for level-triggered notifications. Not compatible with edge-triggered. One of edge- or level-triggered must be supplied.
     * **SOCK_NOTIFY_TRIGGER_EDGE**. The registration is for edge-triggered notifications. Not compatible with level-triggered. One of edge- or level-triggered must be supplied.
     * 
     * Notifications are only supplied when the registration is enabled. Notifications are not queued up while the registration is disabled. As notifications are queued up for a given socket, they are coalesced into a single notification. Therefore, multiple events may be described by a single event mask for the socket.
     * 
     * Given the registration is enabled, level-triggered notifications are supplied whenever the desired conditions hold.
     * 
     * Given the registration is enabled, edge-triggered notifications are supplied whenever a condition changes from not holding to holding. The condition must change while the registration is enabled for a notification to be queued. As such, after registering, the socket's receive buffer must be completely drained to ensure a notification is received.
     * @type {Integer}
     */
    triggerFlags {
        get => NumGet(this, 19, "char")
        set => NumPut("char", value, this, 19)
    }

    /**
     * Type: **[DWORD](/windows/win32/winprog/windows-data-types)**
     * 
     * After a successful call to [ProcessSocketNotifications](/windows/win32/api/winsock2/nf-winsock2-processsocketnotifications), *registrationResult* contains a code indicating the success or failure of the registration. A value of **ERROR_SUCCESS** indicates that registration was successful.
     * @type {Integer}
     */
    registrationResult {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }
}
