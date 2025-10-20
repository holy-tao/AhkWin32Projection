#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains data for a specific WebSocket action.
 * @remarks
 * 
  * Application must use the <b>Data</b> struct for all buffer types except <b>WEB_SOCKET_CLOSE_BUFFER_TYPE</b>. The <b>CloseStatus</b> struct is used for <b>WEB_SOCKET_CLOSE_BUFFER_TYPE</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//websocket/ns-websocket-web_socket_buffer
 * @namespace Windows.Win32.Networking.WebSocket
 * @version v4.0.30319
 */
class WEB_SOCKET_BUFFER extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    class _Data extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Pointer<Integer>}
         */
        pbBuffer {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ulBufferLength {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
    }

    class _CloseStatus extends Win32Struct {
        static sizeof => 32
        static packingSize => 8

        /**
         * @type {Pointer<Integer>}
         */
        pbReason {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        ulReasonLength {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Integer}
         */
        usStatus {
            get => NumGet(this, 12, "ushort")
            set => NumPut("ushort", value, this, 12)
        }
    
    }

    /**
     * 
     * @type {_Data}
     */
    Data{
        get {
            if(!this.HasProp("__Data"))
                this.__Data := %this.__Class%._Data(0, this)
            return this.__Data
        }
    }

    /**
     * 
     * @type {_CloseStatus}
     */
    CloseStatus{
        get {
            if(!this.HasProp("__CloseStatus"))
                this.__CloseStatus := %this.__Class%._CloseStatus(0, this)
            return this.__CloseStatus
        }
    }
}
