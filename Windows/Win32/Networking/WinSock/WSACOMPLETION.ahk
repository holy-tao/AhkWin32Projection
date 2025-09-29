#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies completion notification settings for I/O control calls made to a registered namespace.
 * @remarks
 * The <b>WSACOMPLETION</b> structure enables callbacks to be provided in any of the following formats, based on the value provided in <b>Type</b>:
  * 
  * <table>
  * <tr>
  * <th>Callback Format</th>
  * <th>Type value</th>
  * </tr>
  * <tr>
  * <td>Polling </td>
  * <td>NSP_NOTIFY_IMMEDIATELY</td>
  * </tr>
  * <tr>
  * <td>Window Message</td>
  * <td>NSP_NOTIFY_HWND</td>
  * </tr>
  * <tr>
  * <td>Event</td>
  * <td>NSP_NOTIFY_EVENT</td>
  * </tr>
  * <tr>
  * <td>APC</td>
  * <td>NSP_NOTIFY_APC</td>
  * </tr>
  * <tr>
  * <td>Completion Port</td>
  * <td>NSP_NOTIFY_PORT</td>
  * </tr>
  * </table>
  *  
  * 
  * For a blocking function, set the <b>WSACOMPLETION</b> structure to null.
 * @see https://learn.microsoft.com/windows/win32/api/winsock2/ns-winsock2-wsacompletion
 * @namespace Windows.Win32.Networking.WinSock
 * @version v4.0.30319
 */
class WSACOMPLETION extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>WSACOMPLETIONTYPE</b>
     * 
     * The type of completion notification required. See Remarks.
     * @type {Integer}
     */
    Type {
        get => NumGet(this, 0, "int")
        set => NumPut("int", value, this, 0)
    }

    class _WindowMessage extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<Void>}
         */
        hWnd {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Integer}
         */
        uMsg {
            get => NumGet(this, 8, "uint")
            set => NumPut("uint", value, this, 8)
        }
    
        /**
         * @type {Pointer}
         */
        context {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    class _Apc extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<OVERLAPPED>}
         */
        lpOverlapped {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<LPWSAOVERLAPPED_COMPLETION_ROUTINE>}
         */
        lpfnCompletionProc {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
    }

    class _Port extends Win32Struct {
        static sizeof => 8
        static packingSize => 8

        /**
         * @type {Pointer<OVERLAPPED>}
         */
        lpOverlapped {
            get => NumGet(this, 0, "ptr")
            set => NumPut("ptr", value, this, 0)
        }
    
        /**
         * @type {Pointer<Void>}
         */
        hPort {
            get => NumGet(this, 8, "ptr")
            set => NumPut("ptr", value, this, 8)
        }
    
        /**
         * @type {Pointer}
         */
        Key {
            get => NumGet(this, 16, "ptr")
            set => NumPut("ptr", value, this, 16)
        }
    
    }

    /**
     * @type {_WindowMessage}
     */
    WindowMessage{
        get {
            if(!this.HasProp("__WindowMessage"))
                this.__WindowMessage := %this.__Class%._WindowMessage(this.ptr + 8)
            return this.__WindowMessage
        }
    }

    /**
     * @type {Pointer<TypeHandle>}
     */
    Event {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {_Apc}
     */
    Apc{
        get {
            if(!this.HasProp("__Apc"))
                this.__Apc := %this.__Class%._Apc(this.ptr + 8)
            return this.__Apc
        }
    }

    /**
     * @type {_Port}
     */
    Port{
        get {
            if(!this.HasProp("__Port"))
                this.__Port := %this.__Class%._Port(this.ptr + 8)
            return this.__Port
        }
    }
}
