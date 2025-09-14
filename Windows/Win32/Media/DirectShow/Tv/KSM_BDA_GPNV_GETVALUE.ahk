#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_GPNV_GETVALUE extends Win32Struct
{
    static sizeof => 32

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
    ulNameLength {
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
     * @type {Array<Byte>}
     */
    argbData{
        get {
            if(!this.HasProp("__argbDataProxyArray"))
                this.__argbDataProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__argbDataProxyArray
        }
    }
}
