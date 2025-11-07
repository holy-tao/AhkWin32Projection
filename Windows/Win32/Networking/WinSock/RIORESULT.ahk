#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data used to indicate request completion results used with the Winsock registered I/O extensions.
 * @remarks
 * 
 * The <b>RIORESULT</b> structure defines the data format used to indicate request completion by the Winsock registered I/O extensions.  An application requests completion indications by allocating an array of <b>RIORESULT</b> structures  and passing the array of <b>RIORESULT</b> structures to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riodequeuecompletion">RIODequeueCompletion</a> function along with the element count.  The application need not perform any initialization of the <b>RIORESULT</b> structure elements before calling the <b>RIODequeueCompletion</b> function.
 * 
 * The <b>SocketContext</b> member of the <b>RIORESULT</b> structure can be used by an application to identify the <a href="https://docs.microsoft.com/windows/desktop/WinSock/riocqueue">RIO_CQ</a> object or the associated application object on which the Winsock registered I/O request was issued.  The <b>RequestContext</b> member of the <b>RIORESULT</b> structure can similarly be used to identify the particular Winsock registered I/O request that was completed.
 * 
 * The <b>RIORESULT</b> structure is defined in the <i>Mswsockdef.h</i> header file which is automatically included in the <i>Mswsock.h</i> header file. The <i>Mswsockdef.h</i> header file should never be used directly.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//mswsockdef/ns-mswsockdef-rioresult
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class RIORESULT extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * The completion status of the Winsock registered I/O request.
     * @type {Integer}
     */
    Status {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    /**
     * The number of bytes sent or received in the I/O request.
     * @type {Integer}
     */
    BytesTransferred {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * An application-provided context specified in call to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riocreaterequestqueue">RIOCreateRequestQueue</a> function.
     * @type {Integer}
     */
    SocketContext {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * An application-provided context specified with the registered I/O request to the <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioreceive">RIOReceive</a>, <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_rioreceiveex">RIOReceiveEx</a>, <a href="https://docs.microsoft.com/windows/win32/api/mswsock/nc-mswsock-lpfn_riosend">RIOSend</a>, and  <a href="https://docs.microsoft.com/previous-versions/windows/desktop/legacy/hh437216(v=vs.85)">RIOSendEx</a> functions.
     * @type {Integer}
     */
    RequestContext {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }
}
