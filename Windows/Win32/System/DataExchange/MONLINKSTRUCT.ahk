#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\HSZ.ahk
#Include .\HCONV.ahk

/**
 * Contains information about a Dynamic Data Exchange (DDE) advise loop. A DDE monitoring application can use this structure to obtain information about an advise loop that has started or ended.
 * @remarks
 * Because string handles are local to the process, the <b>hszSvc</b>, <b>hszTopic</b>, and <b>hszItem</b> members are global atoms. 
  * 
  * The 
  * 				<b>hConvClient</b> and <b>hConvServer</b> members of the <b>MONLINKSTRUCT</b> structure do not hold the same value as would be seen by the applications engaged in the conversation. Instead, they hold a globally unique pair of values that identify the conversation.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-monlinkstruct
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class MONLINKSTRUCT extends Win32Struct
{
    static sizeof => 72

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
     * Type: <b>DWORD</b>
     * 
     * The Windows time at which the advise loop was started or ended. Windows time is the number of milliseconds that have elapsed since the system was booted.
     * @type {Integer}
     */
    dwTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to a task (application instance) that is a partner in the advise loop.
     * @type {HANDLE}
     */
    hTask{
        get {
            if(!this.HasProp("__hTask"))
                this.__hTask := HANDLE(this.ptr + 8)
            return this.__hTask
        }
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether an advise loop was successfully established. A value of <b>TRUE</b> indicates an advise loop was established; <b>FALSE</b> indicates it was not.
     * @type {Integer}
     */
    fEstablished {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether the XTYPF_NODATA flag is set for the advise loop. A value of <b>TRUE</b> indicates the flag is set; <b>FALSE</b> indicates it is not.
     * @type {Integer}
     */
    fNoData {
        get => NumGet(this, 20, "int")
        set => NumPut("int", value, this, 20)
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name of the server in the advise loop.
     * @type {HSZ}
     */
    hszSvc{
        get {
            if(!this.HasProp("__hszSvc"))
                this.__hszSvc := HSZ(this.ptr + 24)
            return this.__hszSvc
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the topic name on which the advise loop is established.
     * @type {HSZ}
     */
    hszTopic{
        get {
            if(!this.HasProp("__hszTopic"))
                this.__hszTopic := HSZ(this.ptr + 32)
            return this.__hszTopic
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the item name that is the subject of the advise loop.
     * @type {HSZ}
     */
    hszItem{
        get {
            if(!this.HasProp("__hszItem"))
                this.__hszItem := HSZ(this.ptr + 40)
            return this.__hszItem
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The format of the data exchanged (if any) during the advise loop.
     * @type {Integer}
     */
    wFmt {
        get => NumGet(this, 48, "uint")
        set => NumPut("uint", value, this, 48)
    }

    /**
     * Type: <b>BOOL</b>
     * 
     * Indicates whether the link notification came from the server. A value of <b>TRUE</b> indicates the notification came from the server; <b>FALSE</b> indicates otherwise.
     * @type {Integer}
     */
    fServer {
        get => NumGet(this, 52, "int")
        set => NumPut("int", value, this, 52)
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
                this.__hConvServer := HCONV(this.ptr + 56)
            return this.__hConvServer
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
                this.__hConvClient := HCONV(this.ptr + 64)
            return this.__hConvClient
        }
    }
}
