#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\PWSTR.ahk

/**
 * @namespace Windows.Win32.System.Diagnostics.ClrProfiling
 * @version v4.0.30319
 */
class COR_PRF_EVENTPIPE_PROVIDER_CONFIG extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {PWSTR}
     */
    providerName{
        get {
            if(!this.HasProp("__providerName"))
                this.__providerName := PWSTR(this.ptr + 0)
            return this.__providerName
        }
    }

    /**
     * @type {Integer}
     */
    keywords {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    loggingLevel {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {PWSTR}
     */
    filterData{
        get {
            if(!this.HasProp("__filterData"))
                this.__filterData := PWSTR(this.ptr + 24)
            return this.__filterData
        }
    }
}
