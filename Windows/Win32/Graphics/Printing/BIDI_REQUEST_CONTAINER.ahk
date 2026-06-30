#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\BINARY_CONTAINER.ahk
#Include ..\..\Foundation\PWSTR.ahk
#Include .\BIDI_DATA.ahk
#Include .\BIDI_REQUEST_DATA.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
class BIDI_REQUEST_CONTAINER extends Win32Struct {
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Version {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * @type {Integer}
     */
    Count {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {BIDI_REQUEST_DATA}
     */
    aData {
        get {
            if(!this.HasProp("__aDataProxyArray"))
                this.__aDataProxyArray := Win32FixedArray(this.ptr + 16, 1, BIDI_REQUEST_DATA, "")
            return this.__aDataProxyArray
        }
    }
}
