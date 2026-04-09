#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_GPNV_SETVALUE extends Win32Struct {
    static sizeof => 48

    static packingSize => 8

    /**
     * @type {KSIDENTIFIER}
     */
    Method {
        get {
            if(!this.HasProp("__Method"))
                this.__Method := KSIDENTIFIER(0, this)
            return this.__Method
        }
    }

    /**
     * @type {Integer}
     */
    ulDialogRequest {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {String}
     */
    cLanguage {
        get => StrGet(this.ptr + 20, 11, "UTF-8")
        set => StrPut(value, this.ptr + 20, 11, "UTF-8")
    }

    /**
     * @type {Integer}
     */
    ulNameLength {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    ulValueLength {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {Array<Integer>}
     */
    argbName {
        get {
            if(!this.HasProp("__argbNameProxyArray"))
                this.__argbNameProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__argbNameProxyArray
        }
    }
}
