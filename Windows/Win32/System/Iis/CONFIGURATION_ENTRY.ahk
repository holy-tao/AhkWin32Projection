#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BSTR.ahk

/**
 * @namespace Windows.Win32.System.Iis
 * @version v4.0.30319
 */
class CONFIGURATION_ENTRY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {BSTR}
     */
    bstrKey{
        get {
            if(!this.HasProp("__bstrKey"))
                this.__bstrKey := BSTR(0, this)
            return this.__bstrKey
        }
    }

    /**
     * @type {BSTR}
     */
    bstrValue{
        get {
            if(!this.HasProp("__bstrValue"))
                this.__bstrValue := BSTR(8, this)
            return this.__bstrValue
        }
    }
}
