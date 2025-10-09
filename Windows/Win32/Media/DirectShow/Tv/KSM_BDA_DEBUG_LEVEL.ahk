#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 * @version v4.0.30319
 */
class KSM_BDA_DEBUG_LEVEL extends Win32Struct
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
    ucDebugLevel {
        get => NumGet(this, 16, "char")
        set => NumPut("char", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    ulDebugStringSize {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Array<Byte>}
     */
    argbDebugString{
        get {
            if(!this.HasProp("__argbDebugStringProxyArray"))
                this.__argbDebugStringProxyArray := Win32FixedArray(this.ptr + 24, 1, Primitive, "char")
            return this.__argbDebugStringProxyArray
        }
    }
}
