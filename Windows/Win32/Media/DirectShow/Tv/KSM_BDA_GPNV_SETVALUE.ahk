#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_GPNV_SETVALUE extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Method{
        get {
            if(!this.HasProp("__Method"))
                this.__Method := KSIDENTIFIER(this.ptr + 0)
            return this.__Method
        }
    }

    /**
     * @type {Integer}
     */
    ulDialogRequest {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {String}
     */
    cLanguage {
        get => StrGet(this.ptr + 12, 11, "UTF-16")
        set => StrPut(value, this.ptr + 12, 11, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    ulNameLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Integer}
     */
    ulValueLength {
        get => NumGet(this, 40, "uint")
        set => NumPut("uint", value, this, 40)
    }

    /**
     * @type {Array<Byte>}
     */
    argbName{
        get {
            if(!this.HasProp("__argbNameProxyArray"))
                this.__argbNameProxyArray := Win32FixedArray(this.ptr + 44, 1, Primitive, "char")
            return this.__argbNameProxyArray
        }
    }
}
