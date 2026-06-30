#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_GPNV_GETVALUE extends Win32Struct {
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
    ulNameLength {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {String}
     */
    cLanguage {
        get => StrGet(this.ptr + 28, 11, "UTF-8")
        set => StrPut(value, this.ptr + 28, 11, "UTF-8")
    }

    /**
     * @type {Array<Integer>}
     */
    argbData {
        get {
            if(!this.HasProp("__argbDataProxyArray"))
                this.__argbDataProxyArray := Win32FixedArray(this.ptr + 40, 1, Primitive, "char")
            return this.__argbDataProxyArray
        }
    }
}
