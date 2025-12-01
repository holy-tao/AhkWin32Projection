#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

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
 * @version v4.0.30319
 */
class RIO_EXTENSION_FUNCTION_TABLE extends Win32Struct
{
    static sizeof => 112

    static packingSize => 8

    /**
     * The size, in bytes, of the structure.
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioreceive">RIOReceive</a> function.
     * @type {Pointer<LPFN_RIORECEIVE>}
     */
    RIOReceive {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioreceiveex">RIOReceiveEx</a> function.
     * @type {Pointer<LPFN_RIORECEIVEEX>}
     */
    RIOReceiveEx {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riosend">RIOSend</a> function.
     * @type {Pointer<LPFN_RIOSEND>}
     */
    RIOSend {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437216(v=vs.85)">RIOSendEx</a> function.
     * @type {Pointer<LPFN_RIOSENDEX>}
     */
    RIOSendEx {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh448837(v=vs.85)">RIOCloseCompletionQueue</a> function.
     * @type {Pointer<LPFN_RIOCLOSECOMPLETIONQUEUE>}
     */
    RIOCloseCompletionQueue {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreatecompletionqueue">RIOCreateCompletionQueue</a> function.
     * @type {Pointer<LPFN_RIOCREATECOMPLETIONQUEUE>}
     */
    RIOCreateCompletionQueue {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreaterequestqueue">RIOCreateRequestQueue</a> function.
     * @type {Pointer<LPFN_RIOCREATEREQUESTQUEUE>}
     */
    RIOCreateRequestQueue {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riodequeuecompletion">RIODequeueCompletion</a> function.
     * @type {Pointer<LPFN_RIODEQUEUECOMPLETION>}
     */
    RIODequeueCompletion {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioderegisterbuffer">RIODeregisterBuffer</a> function.
     * @type {Pointer<LPFN_RIODEREGISTERBUFFER>}
     */
    RIODeregisterBuffer {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rionotify">RIONotify</a> function.
     * @type {Pointer<LPFN_RIONOTIFY>}
     */
    RIONotify {
        get => NumGet(this, 80, "ptr")
        set => NumPut("ptr", value, this, 80)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437199(v=vs.85)">RIORegisterBuffer</a> function.
     * @type {Pointer<LPFN_RIOREGISTERBUFFER>}
     */
    RIORegisterBuffer {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437202(v=vs.85)">RIOResizeCompletionQueue</a> function.
     * @type {Pointer<LPFN_RIORESIZECOMPLETIONQUEUE>}
     */
    RIOResizeCompletionQueue {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }

    /**
     * A pointer to the <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437204(v=vs.85)">RIOResizeRequestQueue</a> function.
     * @type {Pointer<LPFN_RIORESIZEREQUESTQUEUE>}
     */
    RIOResizeRequestQueue {
        get => NumGet(this, 104, "ptr")
        set => NumPut("ptr", value, this, 104)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 112
    }
}
