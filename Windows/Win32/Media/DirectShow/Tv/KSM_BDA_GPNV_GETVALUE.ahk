#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_GPNV_GETVALUE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Method{
        get {
            if(!this.HasProp("__Method"))
                this.__Method := KSIDENTIFIER(0, this)
            return this.__Method
        }
    }

    /**
     * @type {Integer}
     */
    ulNameLength {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    cLanguage {
        get => StrGet(this.ptr + 20, 11, "UTF-16")
        set => StrPut(value, this.ptr + 20, 11, "UTF-16")
    }

    /**
     * @type {Array<Byte>}
     */
    argbData{
        get {
            if(!this.HasProp("__argbDataProxyArray"))
                this.__argbDataProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__argbDataProxyArray
        }
    }
}
