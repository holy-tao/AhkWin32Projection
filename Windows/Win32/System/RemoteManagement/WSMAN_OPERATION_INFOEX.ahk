#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_FRAGMENT.ahk
#Include .\WSMAN_FILTER.ahk
#Include .\WSMAN_SELECTOR_SET.ahk
#Include .\WSMAN_OPTION_SETEX.ahk

/**
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_OPERATION_INFOEX extends Win32Struct
{
    static sizeof => 104

    static packingSize => 8

    /**
     * @type {WSMAN_FRAGMENT}
     */
    fragment{
        get {
            if(!this.HasProp("__fragment"))
                this.__fragment := WSMAN_FRAGMENT(0, this)
            return this.__fragment
        }
    }

    /**
     * @type {WSMAN_FILTER}
     */
    filter{
        get {
            if(!this.HasProp("__filter"))
                this.__filter := WSMAN_FILTER(16, this)
            return this.__filter
        }
    }

    /**
     * @type {WSMAN_SELECTOR_SET}
     */
    selectorSet{
        get {
            if(!this.HasProp("__selectorSet"))
                this.__selectorSet := WSMAN_SELECTOR_SET(32, this)
            return this.__selectorSet
        }
    }

    /**
     * @type {WSMAN_OPTION_SETEX}
     */
    optionSet{
        get {
            if(!this.HasProp("__optionSet"))
                this.__optionSet := WSMAN_OPTION_SETEX(48, this)
            return this.__optionSet
        }
    }

    /**
     * @type {Integer}
     */
    version {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {PWSTR}
     */
    uiLocale {
        get => NumGet(this, 88, "ptr")
        set => NumPut("ptr", value, this, 88)
    }

    /**
     * @type {PWSTR}
     */
    dataLocale {
        get => NumGet(this, 96, "ptr")
        set => NumPut("ptr", value, this, 96)
    }
}
