#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Specifies a registered buffer descriptor used with the Winsock registered I/O extensions.
 * @remarks
 * The Winsock registered I/O extensions operate primarily on registered buffers using **RIO\_BUFFERID** objects. An application obtains a **RIO\_BUFFERID** for an existing buffer using the [**RIORegisterBuffer**](/previous-versions/windows/desktop/legacy/hh437199(v=vs.85)) function. An application can release a registration using the [**RIODeregisterBuffer**](/windows/win32/api/mswsock/nc-mswsock-lpfn_rioderegisterbuffer) function.
 * 
 * When an existing buffer is registered as a **RIO\_BUFFERID** object using the [**RIORegisterBuffer**](/previous-versions/windows/desktop/legacy/hh437199(v=vs.85)) function, certain internal resources are allocated from physical memory, and the existing application buffer will be locked into physical memory. The [**RIODeregisterBuffer**](/windows/win32/api/mswsock/nc-mswsock-lpfn_rioderegisterbuffer) function is called to deregister the buffer, free these internal resources, and allow the buffer to be unlocked and released from physical memory.
 * 
 * Repeated registration and deregistration of application buffers using the Winsock registered I/O extensions may cause significant performance degradation. The following buffer management approaches should be considered when designing an application using the Winsock registered I/O extensions to minimize repeated registration and deregistration of application buffers:
 * 
 * -   • Maximize the reuse of buffers.
 * -   • Maintain a limited pool of unused registered buffers for use by the application.
 * -   • Maintain a limited pool of registered buffers and perform buffer copies between these registered buffers and other unregistered buffers.
 * 
 * The **RIO\_BUFFERID** typedef is defined in the *Mswsockdef.h* header file which is automatically included in the *Mswsock.h* header file. The *Mswsockdef.h* header file should never be used directly.
 * @see https://learn.microsoft.com/windows/win32/WinSock/rio-bufferid
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct RIO_BUFFERID {
    value : IntPtr

    __value {
        set {
            if (value is RIO_BUFFERID) {
                this.value := value.value
            }
            else {
                this.value := value
            }
        }
    }

    __New(value := 0) {
        this.value := value
    }
}
