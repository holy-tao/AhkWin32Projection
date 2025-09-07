#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset Unicode
 */
class PRODUCT_INFOW extends Win32Struct
{
    static sizeof => 520

    static packingSize => 2

    /**
     * @type {String}
     */
    CompanyName {
        get => StrGet(this.ptr + 0, 255, "UTF-16")
        set => StrPut(value, this.ptr + 0, 255, "UTF-16")
    }

    /**
     * @type {String}
     */
    ProductID {
        get => StrGet(this.ptr + 512, 3, "UTF-16")
        set => StrPut(value, this.ptr + 512, 3, "UTF-16")
    }
}
