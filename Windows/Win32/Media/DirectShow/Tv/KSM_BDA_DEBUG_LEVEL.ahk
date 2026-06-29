#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\..\..\Guid.ahk
#Include ..\..\KernelStreaming\KSIDENTIFIER.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow.Tv
 */
class KSM_BDA_DEBUG_LEVEL extends Win32Struct {
    static sizeof => 40

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
    ucDebugLevel {
        get => NumGet(this, 24, "char")
        set => NumPut("char", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    ulDebugStringSize {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Array<Integer>}
     */
    argbDebugString {
        get {
            if(!this.HasProp("__argbDebugStringProxyArray"))
                this.__argbDebugStringProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__argbDebugStringProxyArray
        }
    }
}
