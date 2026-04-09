#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.Iis
 */
class HSE_VERSION_INFO extends Win32Struct {
    static sizeof => 260

    static packingSize => 4

    /**
     * @type {Integer}
     */
    dwExtensionVersion {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {String}
     */
    lpszExtensionDesc {
        get => StrGet(this.ptr + 4, 255, "UTF-8")
        set => StrPut(value, this.ptr + 4, 255, "UTF-8")
    }
}
