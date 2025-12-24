#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\UNICODE_STRING.ahk

/**
 * @namespace Windows.Wdk.Storage.FileSystem
 * @version v4.0.30319
 */
class FSRTL_MUP_PROVIDER_INFO_LEVEL_2 extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Integer}
     */
    ProviderId {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {UNICODE_STRING}
     */
    ProviderName{
        get {
            if(!this.HasProp("__ProviderName"))
                this.__ProviderName := UNICODE_STRING(8, this)
            return this.__ProviderName
        }
    }
}
