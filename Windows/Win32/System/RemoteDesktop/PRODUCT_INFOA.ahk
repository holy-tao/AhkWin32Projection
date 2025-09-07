#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.System.RemoteDesktop
 * @version v4.0.30319
 * @charset ANSI
 */
class PRODUCT_INFOA extends Win32Struct
{
    static sizeof => 260

    static packingSize => 1

    /**
     * @type {String}
     */
    CompanyName {
        get => StrGet(this.ptr + 0, 255, "UTF-8")
        set => StrPut(value, this.ptr + 0, 255, "UTF-8")
    }

    /**
     * @type {String}
     */
    ProductID {
        get => StrGet(this.ptr + 256, 3, "UTF-8")
        set => StrPut(value, this.ptr + 256, 3, "UTF-8")
    }
}
