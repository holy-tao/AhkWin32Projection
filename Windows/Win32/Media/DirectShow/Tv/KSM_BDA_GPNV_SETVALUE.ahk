#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_GPNV_SETVALUE extends Win32Struct
{
    static sizeof => 40

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
     * @type {Array<SByte>}
     */
    cLanguage{
        get {
            if(!this.HasProp("__cLanguageProxyArray"))
                this.__cLanguageProxyArray := Win32FixedArray(this.ptr + 12, 12, Primitive, "char")
            return this.__cLanguageProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    ulNameLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ulValueLength {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<Byte>}
     */
    argbName{
        get {
            if(!this.HasProp("__argbNameProxyArray"))
                this.__argbNameProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__argbNameProxyArray
        }
    }
}
