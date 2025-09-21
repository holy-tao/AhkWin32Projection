#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DOT11EXT_IHV_SECURITY_PROFILE.ahk

/**
 * @namespace Windows.Win32.NetworkManagement.WiFi
 * @version v4.0.30319
 */
class DOT11EXT_IHV_DISCOVERY_PROFILE extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * @type {Pointer<Char>}
     */
    IhvConnectivityProfile {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {DOT11EXT_IHV_SECURITY_PROFILE}
     */
    IhvSecurityProfile{
        get {
            if(!this.HasProp("__IhvSecurityProfile"))
                this.__IhvSecurityProfile := DOT11EXT_IHV_SECURITY_PROFILE(this.ptr + 8)
            return this.__IhvSecurityProfile
        }
    }
}
