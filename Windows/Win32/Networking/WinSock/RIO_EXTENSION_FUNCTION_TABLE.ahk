#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\LPFN_RIOCLOSECOMPLETIONQUEUE.ahk" { LPFN_RIOCLOSECOMPLETIONQUEUE }
#Import ".\LPFN_RIOCREATECOMPLETIONQUEUE.ahk" { LPFN_RIOCREATECOMPLETIONQUEUE }
#Import ".\LPFN_RIOCREATEREQUESTQUEUE.ahk" { LPFN_RIOCREATEREQUESTQUEUE }
#Import ".\LPFN_RIODEQUEUECOMPLETION.ahk" { LPFN_RIODEQUEUECOMPLETION }
#Import ".\LPFN_RIODEREGISTERBUFFER.ahk" { LPFN_RIODEREGISTERBUFFER }
#Import ".\LPFN_RIONOTIFY.ahk" { LPFN_RIONOTIFY }
#Import ".\LPFN_RIORECEIVE.ahk" { LPFN_RIORECEIVE }
#Import ".\LPFN_RIORECEIVEEX.ahk" { LPFN_RIORECEIVEEX }
#Import ".\LPFN_RIOREGISTERBUFFER.ahk" { LPFN_RIOREGISTERBUFFER }
#Import ".\LPFN_RIORESIZECOMPLETIONQUEUE.ahk" { LPFN_RIORESIZECOMPLETIONQUEUE }
#Import ".\LPFN_RIORESIZEREQUESTQUEUE.ahk" { LPFN_RIORESIZEREQUESTQUEUE }
#Import ".\LPFN_RIOSEND.ahk" { LPFN_RIOSEND }
#Import ".\LPFN_RIOSENDEX.ahk" { LPFN_RIOSENDEX }

/**
 * Contains information on the functions that implement the Winsock registered I/O extensions.
 * @remarks
 * The <b>RIO_EXTENSION_FUNCTION_TABLE</b> structure contains information on the  functions that implement the Winsock registered I/O extensions.
 * 
 * The function pointers for the 
 * Winsock registered I/O extension functions must be obtained at run time by making a call to the 
 * <a href="https://docs.microsoft.com/windows/desktop/api/winsock2/nf-winsock2-wsaioctl">WSAIoctl</a> function with the <b>SIO_GET_MULTIPLE_EXTENSION_FUNCTION_POINTER</b> opcode specified. The input buffer passed to the <b>WSAIoctl</b> function must contain <b>WSAID_MULTIPLE_RIO</b>, a globally unique identifier (GUID) whose value identifies the Winsock registered I/O  extension functions. On success, the output returned by the <b>WSAIoctl</b> function contains a pointer to the <b>RIO_EXTENSION_FUNCTION_TABLE</b> structure that contains pointers to the Winsock registered I/O  extension functions. The <b>SIO_GET_MULTIPLE_EXTENSION_FUNCTION_POINTER</b> IOCTL is defined in the <i>Ws2def.h</i> header file.The <b>WSAID_MULTIPLE_RIO</b> GUID is defined in the <i>Mswsock.h</i> header file.
 * @see https://learn.microsoft.com/windows/win32/api/mswsock/ns-mswsock-rio_extension_function_table
 * @namespace Windows.Win32.Networking.WinSock
 */
export default struct RIO_EXTENSION_FUNCTION_TABLE {
    #StructPack 8

    /**
     * The size, in bytes, of the structure.
     */
    cbSize : UInt32 := this.Size

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioreceive">RIOReceive</a> function.
     */
    RIOReceive : LPFN_RIORECEIVE

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioreceiveex">RIOReceiveEx</a> function.
     */
    RIOReceiveEx : LPFN_RIORECEIVEEX

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riosend">RIOSend</a> function.
     */
    RIOSend : LPFN_RIOSEND

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437216(v=vs.85)">RIOSendEx</a> function.
     */
    RIOSendEx : LPFN_RIOSENDEX

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh448837(v=vs.85)">RIOCloseCompletionQueue</a> function.
     */
    RIOCloseCompletionQueue : LPFN_RIOCLOSECOMPLETIONQUEUE

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreatecompletionqueue">RIOCreateCompletionQueue</a> function.
     */
    RIOCreateCompletionQueue : LPFN_RIOCREATECOMPLETIONQUEUE

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreaterequestqueue">RIOCreateRequestQueue</a> function.
     */
    RIOCreateRequestQueue : LPFN_RIOCREATEREQUESTQUEUE

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riodequeuecompletion">RIODequeueCompletion</a> function.
     */
    RIODequeueCompletion : LPFN_RIODEQUEUECOMPLETION

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioderegisterbuffer">RIODeregisterBuffer</a> function.
     */
    RIODeregisterBuffer : LPFN_RIODEREGISTERBUFFER

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> function.
     */
    RIONotify : LPFN_RIONOTIFY

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437199(v=vs.85)">RIORegisterBuffer</a> function.
     */
    RIORegisterBuffer : LPFN_RIOREGISTERBUFFER

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437202(v=vs.85)">RIOResizeCompletionQueue</a> function.
     */
    RIOResizeCompletionQueue : LPFN_RIORESIZECOMPLETIONQUEUE

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437204(v=vs.85)">RIOResizeRequestQueue</a> function.
     */
    RIOResizeRequestQueue : LPFN_RIORESIZEREQUESTQUEUE

}
