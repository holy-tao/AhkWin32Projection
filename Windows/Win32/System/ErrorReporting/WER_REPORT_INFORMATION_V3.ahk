#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.ErrorReporting
 * @version v4.0.30319
 */
class WER_REPORT_INFORMATION_V3 extends Win32Struct
{
    static sizeof => 2464

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hProcess {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {String}
     */
    wzConsentKey {
        get => StrGet(this.ptr + 16, 63, "UTF-16")
        set => StrPut(value, this.ptr + 16, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzFriendlyEventName {
        get => StrGet(this.ptr + 144, 127, "UTF-16")
        set => StrPut(value, this.ptr + 144, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzApplicationName {
        get => StrGet(this.ptr + 400, 127, "UTF-16")
        set => StrPut(value, this.ptr + 400, 127, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzApplicationPath {
        get => StrGet(this.ptr + 656, 259, "UTF-16")
        set => StrPut(value, this.ptr + 656, 259, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzDescription {
        get => StrGet(this.ptr + 1176, 511, "UTF-16")
        set => StrPut(value, this.ptr + 1176, 511, "UTF-16")
    }

    /**
     * @type {Pointer<Ptr>}
     */
    hwndParent {
        get => NumGet(this, 2200, "ptr")
        set => NumPut("ptr", value, this, 2200)
    }

    /**
     * @type {String}
     */
    wzNamespacePartner {
        get => StrGet(this.ptr + 2208, 63, "UTF-16")
        set => StrPut(value, this.ptr + 2208, 63, "UTF-16")
    }

    /**
     * @type {String}
     */
    wzNamespaceGroup {
        get => StrGet(this.ptr + 2336, 63, "UTF-16")
        set => StrPut(value, this.ptr + 2336, 63, "UTF-16")
    }
}
