#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk
#Include .\HCONV.ahk
#Include .\HSZ.ahk
#Include .\HDDEDATA.ahk
#Include ..\..\Security\SECURITY_QUALITY_OF_SERVICE.ahk
#Include .\CONVCONTEXT.ahk

/**
 * Contains information about the current Dynamic Data Exchange (DDE) transaction. A DDE debugging application can use this structure when monitoring transactions that the system passes to the DDE callback functions of other applications.
 * @see https://learn.microsoft.com/windows/win32/api/ddeml/ns-ddeml-moncbstruct
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class MONCBSTRUCT extends Win32Struct
{
    static sizeof => 152

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
     * The Windows time at which the transaction occurred. Windows time is the number of milliseconds that have elapsed since the system was booted.
     * @type {Integer}
     */
    dwTime {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * Type: <b>HANDLE</b>
     * 
     * A handle to the task (application instance) containing the DDE callback function that received the transaction.
     * @type {HANDLE}
     */
    hTask{
        get {
            if(!this.HasProp("__hTask"))
                this.__hTask := HANDLE(8, this)
            return this.__hTask
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The value returned by the DDE callback function that processed the transaction.
     * @type {Integer}
     */
    dwRet {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The transaction type.
     * @type {Integer}
     */
    wType {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The format of the data exchanged (if any) during the transaction.
     * @type {Integer}
     */
    wFmt {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * Type: <b>HCONV</b>
     * 
     * A handle to the conversation in which the transaction took place.
     * @type {HCONV}
     */
    hConv{
        get {
            if(!this.HasProp("__hConv"))
                this.__hConv := HCONV(32, this)
            return this.__hConv
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to a string.
     * @type {HSZ}
     */
    hsz1{
        get {
            if(!this.HasProp("__hsz1"))
                this.__hsz1 := HSZ(40, this)
            return this.__hsz1
        }
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to a string.
     * @type {HSZ}
     */
    hsz2{
        get {
            if(!this.HasProp("__hsz2"))
                this.__hsz2 := HSZ(48, this)
            return this.__hsz2
        }
    }

    /**
     * Type: <b>HDDEDATA</b>
     * 
     * A handle to the data exchanged (if any) during the transaction.
     * @type {HDDEDATA}
     */
    hData{
        get {
            if(!this.HasProp("__hData"))
                this.__hData := HDDEDATA(56, this)
            return this.__hData
        }
    }

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional data.
     * @type {Pointer}
     */
    dwData1 {
        get => NumGet(this, 64, "ptr")
        set => NumPut("ptr", value, this, 64)
    }

    /**
     * Type: <b>ULONG_PTR</b>
     * 
     * Additional data.
     * @type {Pointer}
     */
    dwData2 {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/desktop/api/ddeml/ns-ddeml-convcontext">CONVCONTEXT</a></b>
     * 
     * The language information used to share data in different languages.
     * @type {CONVCONTEXT}
     */
    cc{
        get {
            if(!this.HasProp("__cc"))
                this.__cc := CONVCONTEXT(80, this)
            return this.__cc
        }
    }

    /**
     * Type: <b>DWORD</b>
     * 
     * The amount, in bytes, of data being passed with the transaction. This value can be more than 32 bytes.
     * @type {Integer}
     */
    cbData {
        get => NumGet(this, 116, "uint")
        set => NumPut("uint", value, this, 116)
    }

    /**
     * Type: <b>DWORD[8]</b>
     * 
     * Contains the first 32 bytes of data being passed with the transaction (<c>8 * sizeof(DWORD)</c>).
     * @type {Array<UInt32>}
     */
    Data{
        get {
            if(!this.HasProp("__DataProxyArray"))
                this.__DataProxyArray := Win32FixedArray(this.ptr + 120, 8, Primitive, "uint")
            return this.__DataProxyArray
        }
    }
}
