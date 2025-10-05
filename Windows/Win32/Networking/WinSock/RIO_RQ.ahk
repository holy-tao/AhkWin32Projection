#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies a socket descriptor used by send and receive requests with the Winsock registered I/O extensions.
 * @remarks
 * The Winsock registered I/O extensions operate primarily on a **RIO\_RQ** object rather than a socket. An application obtains a **RIO\_RQ** for an existing socket using the [**RIOCreateRequestQueue**](/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreaterequestqueue) function. The input socket must have been created by calling the [**WSASocket**](/windows/desktop/api/Winsock2/nf-winsock2-wsasocketa) function with the **WSA\_FLAG\_RIO** flag set in the *dwFlags* parameter.
  * 
  * After obtaining a **RIO\_RQ** object, the underlying socket descriptor remains valid. An application may continue to use the underlying socket to set and query socket options, issue IOCTLs and ultimately close the socket.
  * 
  * > [!Note]  
  * > For purposes of efficiency, access to the completion queues ([**RIO\_CQ**](riocqueue.md) structs) and request queues (**RIO\_RQ** structs) are not protected by synchronization primitives. If you need to access a completion or request queue from multiple threads, access should be coordinated by a critical section, slim reader write lock or similar mechanism. This locking is not needed for access by a single thread. Different threads can access separate requests/completion queues without locks. The need for synchronization occurs only when multiple threads try to access the same queue. Synchronization is also required if multiple threads issue sends and receives on the same socket because the send and receive operations use the socket’s request queue.
  * 
  *  
  * 
  * The [**RIO\_RQ**](riocqueue.md) typedef is defined in the *Mswsockdef.h* header file which is automatically included in the *Mswsock.h* header file. The *Mswsockdef.h* header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/WinSock/riorqueue
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RIO_RQ extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {Pointer}
     */
    Value {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
