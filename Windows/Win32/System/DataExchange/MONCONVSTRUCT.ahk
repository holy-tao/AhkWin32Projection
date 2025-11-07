#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\HSZ.ahk
#Include .\HCONV.ahk

/**
 * Contains information about a Dynamic Data Exchange (DDE) conversation. A DDE monitoring application can use this structure to obtain information about a conversation that has been established or has terminated.
 * @remarks
 * 
 * Because string handles are local to the process, the <b>hszSvc</b> and <b>hszTopic</b> members are global atoms. Similarly, conversation handles are local to the instance; therefore, the <b>hConvClient</b> and <b>hConvServer</b> members are window handles. 
 * 
 * The <b>hConvClient</b> and <b>hConvServer</b> members of the <b>MONCONVSTRUCT</b> structure do not hold the same value as would be seen by the applications engaged in the conversation. Instead, they hold a globally unique pair of values that identify the conversation.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//ddeml/ns-ddeml-monconvstruct
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class MONCONVSTRUCT extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * Type: <b>UINT</b>
     * 
     * The structure's size, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether the conversation is currently established. A value of <b>TRUE</b> indicates the conversation is established; <b>FALSE</b> indicates it is not.
     * @type {BOOL}
     */
    fConnect {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The Windows time at which the conversation was established or terminated. Windows time is the number of milliseconds that have elapsed since the system was booted.
     * @type {Integer}
     */
    dwTime {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to a task (application instance) that is a partner in the conversation.
     * @type {HANDLE}
     */
    hTask{
        get {
            if(!this.HasProp("__hTask"))
                this.__hTask := HANDLE(16, this)
            return this.__hTask
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name on which the conversation is established.
     * @type {HSZ}
     */
    hszSvc{
        get {
            if(!this.HasProp("__hszSvc"))
                this.__hszSvc := HSZ(24, this)
            return this.__hszSvc
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the topic name on which the conversation is established.
     * @type {HSZ}
     */
    hszTopic{
        get {
            if(!this.HasProp("__hszTopic"))
                this.__hszTopic := HSZ(32, this)
            return this.__hszTopic
        }
    }

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the client conversation.
     * @type {HCONV}
     */
    hConvClient{
        get {
            if(!this.HasProp("__hConvClient"))
                this.__hConvClient := HCONV(40, this)
            return this.__hConvClient
        }
    }

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the server conversation.
     * @type {HCONV}
     */
    hConvServer{
        get {
            if(!this.HasProp("__hConvServer"))
                this.__hConvServer := HCONV(48, this)
            return this.__hConvServer
        }
    }
}
