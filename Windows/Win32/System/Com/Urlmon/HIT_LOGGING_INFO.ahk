#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\SYSTEMTIME.ahk

/**
 * @namespace Windows.Win32.System.Com.Urlmon
 * @version v4.0.30319
 */
class HIT_LOGGING_INFO extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwStructSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    lpszLoggedUrlName {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {SYSTEMTIME}
     */
    StartTime{
        get {
            if(!this.HasProp("__StartTime"))
                this.__StartTime := SYSTEMTIME(this.ptr + 16)
            return this.__StartTime
        }
    }

    /**
     * @type {SYSTEMTIME}
     */
    EndTime{
        get {
            if(!this.HasProp("__EndTime"))
                this.__EndTime := SYSTEMTIME(this.ptr + 32)
            return this.__EndTime
        }
    }

    /**
     * @type {Pointer<Ptr>}
     */
    lpszExtendedInfo {
        get => NumGet(this, 48, "ptr")
        set => NumPut("ptr", value, this, 48)
    }
}
