#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\SECURITY_QUALITY_OF_SERVICE.ahk
#Include .\CONVCONTEXT.ahk

/**
 * Contains information about the current Dynamic Data Exchange (DDE) transaction. A DDE debugging application can use this structure when monitoring transactions that the system passes to the DDE callback functions of other applications.
 * @see https://docs.microsoft.com/windows/win32/api//ddeml/ns-ddeml-moncbstruct
 * @namespace Windows.Win32.System.DataExchange
 * @version v4.0.30319
 */
class MONCBSTRUCT extends Win32Struct
{
    static sizeof => 160

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
     * @type {Pointer<Void>}
     */
    hTask {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
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
     * @type {Pointer<Void>}
     */
    hConv {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to a string.
     * @type {Pointer<Void>}
     */
    hsz1 {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }

    /**
     * Type: <b>HSZ</b>
     * 
     * A handle to a string.
     * @type {Pointer<Void>}
     */
    hsz2 {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }

    /**
     * Type: <b>HDDEDATA</b>
     * 
     * A handle to the data exchanged (if any) during the transaction.
     * @type {Pointer<Void>}
     */
    hData {
        get => NumGet(this, 56, "ptr")
        set => NumPut("ptr", value, this, 56)
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
                this.__cc := CONVCONTEXT(this.ptr + 80)
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
        get => NumGet(this, 120, "uint")
        set => NumPut("uint", value, this, 120)
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
                this.__DataProxyArray := Win32FixedArray(this.ptr + 124, 8, Primitive, "uint")
            return this.__DataProxyArray
        }
    }
}
