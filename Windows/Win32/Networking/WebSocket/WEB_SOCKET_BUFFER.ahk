#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains data for a specific WebSocket action.
 * @remarks
 * Application must use the <b>Data</b> struct for all buffer types except <b>WEB_SOCKET_CLOSE_BUFFER_TYPE</b>. The <b>CloseStatus</b> struct is used for <b>WEB_SOCKET_CLOSE_BUFFER_TYPE</b>.
 * @see https://learn.microsoft.com/windows/win32/api/websocket/ns-websocket-web_socket_buffer
 * @namespace Windows.Win32.Networking.WebSocket
 */
export default struct WEB_SOCKET_BUFFER {
    #StructPack 8


    struct _Data {
        pbBuffer : IntPtr

        ulBufferLength : UInt32

    }

    struct _CloseStatus {
        pbReason : IntPtr

        ulReasonLength : UInt32

        usStatus : UInt16

    }

    Data : WEB_SOCKET_BUFFER._Data

    static __New() {
        DefineProp(this.Prototype, 'CloseStatus', { type: WEB_SOCKET_BUFFER._CloseStatus, offset: 0 })
        this.DeleteProp("__New")
    }
}
