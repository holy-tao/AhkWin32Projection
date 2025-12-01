#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Defines a set of keys that represent the identity of a resource.
 * @see https://learn.microsoft.com/windows/win32/api/wsman/ns-wsman-wsman_selector_set
 * @namespace Windows.Win32.System.RemoteManagement
 * @version v4.0.30319
 */
class WSMAN_SELECTOR_SET extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Specifies the number of keys (selectors).
     * @type {Integer}
     */
    numberKeys {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * An array of <a href="https://docs.microsoft.com/windows/desktop/api/wsman/ns-wsman-wsman_key">WSMAN_KEY</a>  structures that specify key names and values.
     * @type {Pointer<WSMAN_KEY>}
     */
    keys {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
