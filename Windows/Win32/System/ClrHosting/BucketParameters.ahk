#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\BOOL.ahk

/**
 * @namespace Windows.Win32.System.ClrHosting
 * @version v4.0.30319
 */
class BucketParameters extends Win32Struct
{
    static sizeof => 5616

    static packingSize => 4

    /**
     * @type {BOOL}
     */
    fInited{
        get {
            if(!this.HasProp("__fInited"))
                this.__fInited := BOOL(this.ptr + 0)
            return this.__fInited
        }
    }

    /**
     * @type {String}
     */
    pszEventTypeName {
        get => StrGet(this.ptr + 4, 254, "UTF-16")
        set => StrPut(value, this.ptr + 4, 254, "UTF-16")
    }

    /**
     * @type {String}
     */
    pszParams {
        get => StrGet(this.ptr + 514, 2549, "UTF-16")
        set => StrPut(value, this.ptr + 514, 2549, "UTF-16")
    }
}
