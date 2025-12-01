#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\HCONV.ahk
#Include .\HSZ.ahk
#Include .\HCONVLIST.ahk
#Include ..\..\Security\SECURITY_QUALITY_OF_SERVICE.ahk
#Include .\CONVCONTEXT.ahk
#Include ..\..\Foundation\HWND.ahk

/**
 * Contains information about a Dynamic Data Exchange (DDE) conversation.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-convinfo
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class CONVINFO extends Win32Struct
{
    static sizeof => 144

    static packingSize => 8

    /**
     * Type: <b>DWORD</b>
     * 
     * The structure's size, in bytes.
     * @type {Integer}
     */
    cb {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Type: <b>DWORD_PTR</b>
     * 
     * Application-defined data.
     * @type {Pointer}
     */
    hUser {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the partner application in the DDE conversation. This member is zero if the partner has not registered itself (using the <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddeinitializea">DdeInitialize</a> function) to make DDEML function calls. An application should not pass this member to any DDEML function except <a href="https://docs.microsoft.com/windows/desktop/api/ddeml/nf-ddeml-ddequeryconvinfo">DdeQueryConvInfo</a>.
     * @type {HCONV}
     */
    hConvPartner{
        get {
            if(!this.HasProp("__hConvPartner"))
                this.__hConvPartner := HCONV(16, this)
            return this.__hConvPartner
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name of the partner application.
     * @type {HSZ}
     */
    hszSvcPartner{
        get {
            if(!this.HasProp("__hszSvcPartner"))
                this.__hszSvcPartner := HSZ(24, this)
            return this.__hszSvcPartner
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the service name of the server application that was requested for connection.
     * @type {HSZ}
     */
    hszServiceReq{
        get {
            if(!this.HasProp("__hszServiceReq"))
                this.__hszServiceReq := HSZ(32, this)
            return this.__hszServiceReq
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the name of the requested topic.
     * @type {HSZ}
     */
    hszTopic{
        get {
            if(!this.HasProp("__hszTopic"))
                this.__hszTopic := HSZ(40, this)
            return this.__hszTopic
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to the name of the requested item. This member is transaction specific.
     * @type {HSZ}
     */
    hszItem{
        get {
            if(!this.HasProp("__hszItem"))
                this.__hszItem := HSZ(48, this)
            return this.__hszItem
        }
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The format of the data being exchanged. This member is transaction specific.
     * @type {Integer}
     */
    wFmt {
        get => NumGet(this, 56, "uint")
        set => NumPut("uint", value, this, 56)
    }

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 60, "uint")
        set => NumPut("uint", value, this, 60)
    }

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    wStatus {
        get => NumGet(this, 64, "uint")
        set => NumPut("uint", value, this, 64)
    }

    /**
     * Type: <b>UINT</b>
     * @type {Integer}
     */
    wConvst {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The error value associated with the last transaction.
     * @type {Integer}
     */
    wLastError {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * Type: <b>HCONVLIST</b>
     * 
     * A handle to the conversation list if the handle to the current conversation is in a conversation list. This member is <b>NULL</b> if the conversation is not in a conversation list.
     * @type {HCONVLIST}
     */
    hConvList{
        get {
            if(!this.HasProp("__hConvList"))
                this.__hConvList := HCONVLIST(80, this)
            return this.__hConvList
        }
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a></b>
     * 
     * The conversation context.
     * @type {CONVCONTEXT}
     */
    ConvCtxt{
        get {
            if(!this.HasProp("__ConvCtxt"))
                this.__ConvCtxt := CONVCONTEXT(88, this)
            return this.__ConvCtxt
        }
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window of the calling application involved in the conversation.
     * @type {HWND}
     */
    hwnd{
        get {
            if(!this.HasProp("__hwnd"))
                this.__hwnd := HWND(128, this)
            return this.__hwnd
        }
    }

    /**
     * Type: <b>HWND</b>
     * 
     * A handle to the window of the partner application involved in the current conversation.
     * @type {HWND}
     */
    hwndPartner{
        get {
            if(!this.HasProp("__hwndPartner"))
                this.__hwndPartner := HWND(136, this)
            return this.__hwndPartner
        }
    }
}
