#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\WSMAN_FRAGMENT.ahk
#Include .\WSMAN_FILTER.ahk
#Include .\WSMAN_SELECTOR_SET.ahk
#Include .\WSMAN_OPTION_SET.ahk

/**
 * Represents a specific resource endpoint for which the plug-in must perform the request.
 * @see https://docs.microsoft.com/windows/win32/api//wsman/ns-wsman-wsman_operation_info
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_OPERATION_INFO extends Win32Struct
{
    static sizeof => 88

    static packingSize => 8

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_fragment">WSMAN_FRAGMENT</a> structure that specifies the subset of data to be used for the operation. This parameter is reserved for future use and is ignored on receipt.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_filter">WSMAN_FILTER</a> structure that specifies the filtering that is used for the operation. This parameter is reserved for future use and is ignored on receipt.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_selector_set">WSMAN_SELECTOR_SET</a> structure that identifies the specific resource to use for the request.
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
     * A <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_option_set">WSMAN_OPTION_SET</a> structure that specifies the set of options for the request.
     * @type {WSMAN_OPTION_SET}
     */
    optionSet{
        get {
            if(!this.HasProp("__optionSet"))
                this.__optionSet := WSMAN_OPTION_SET(48, this)
            return this.__optionSet
        }
    }

    /**
     * 
     * @type {Pointer<Void>}
     */
    reserved {
        get => NumGet(this, 72, "ptr")
        set => NumPut("ptr", value, this, 72)
    }

    /**
     * 
     * @type {Integer}
     */
    version {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }
}
