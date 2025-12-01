#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DSOP_UPLEVEL_FILTER_FLAGS.ahk

/**
 * Contains flags that indicate the types of objects presented to the user for a specified scope or scopes.
 * @see https://learn.microsoft.com/windows/win32/api/objsel/ns-objsel-dsop_filter_flags
 * @namespace Windows.Win32.Networking.ActiveDirectory
 * @version v4.0.30319
 */
class DSOP_FILTER_FLAGS extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Contains a <a href="https://docs.microsoft.com/windows/desktop/api/objsel/ns-objsel-dsop_uplevel_filter_flags">DSOP_UPLEVEL_FILTER_FLAGS</a> structure that contains the filter flags to use for up-level scopes. An up-level scope is a scope that supports the ADSI LDAP provider. For more information, see 
     * <a href="https://docs.microsoft.com/windows/desktop/ADSI/adsi-ldap-provider">ADSI LDAP Provider</a>.
     * @type {DSOP_UPLEVEL_FILTER_FLAGS}
     */
    Uplevel{
        get {
            if(!this.HasProp("__Uplevel"))
                this.__Uplevel := DSOP_UPLEVEL_FILTER_FLAGS(0, this)
            return this.__Uplevel
        }
    }

    /**
     * Contains the filter flags to use for down-level scopes. This member can be a combination of the following flags.
     * @type {Integer}
     */
    flDownlevel {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }
}
