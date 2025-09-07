#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11EXT_IHV_PROFILE_PARAMS.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_IHV_PARAMS extends Win32Struct
{
    static sizeof => 552

    static packingSize => 8

    /**
     * @type {DOT11EXT_IHV_PROFILE_PARAMS}
     */
    dot11ExtIhvProfileParams{
        get {
            if(!this.HasProp("__dot11ExtIhvProfileParams"))
                this.__dot11ExtIhvProfileParams := DOT11EXT_IHV_PROFILE_PARAMS(this.ptr + 0)
            return this.__dot11ExtIhvProfileParams
        }
    }

    /**
     * @type {String}
     */
    wstrProfileName {
        get => StrGet(this.ptr + 24, 255, "UTF-16")
        set => StrPut(value, this.ptr + 24, 255, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwProfileTypeFlags {
        get => NumGet(this, 536, "uint")
        set => NumPut("uint", value, this, 536)
    }

    /**
     * @type {Pointer<Guid>}
     */
    interfaceGuid {
        get => NumGet(this, 544, "ptr")
        set => NumPut("ptr", value, this, 544)
    }
}
