#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * @namespace Windows.Win32.UI.Controls
 * @version v4.0.30319
 * @charset ANSI
 */
class CCINFOA extends Win32Struct
{
    static sizeof => 384

    static packingSize => 8

    /**
     * @type {Array<SByte>}
     */
    szClass{
        get {
            if(!this.HasProp("__szClassProxyArray"))
                this.__szClassProxyArray := Win32FixedArray(this.ptr + 0, 32, Primitive, "char")
            return this.__szClassProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    flOptions {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Array<SByte>}
     */
    szDesc{
        get {
            if(!this.HasProp("__szDescProxyArray"))
                this.__szDescProxyArray := Win32FixedArray(this.ptr + 36, 32, Primitive, "char")
            return this.__szDescProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    cxDefault {
        get => NumGet(this, 68, "uint")
        set => NumPut("uint", value, this, 68)
    }

    /**
     * @type {Integer}
     */
    cyDefault {
        get => NumGet(this, 72, "uint")
        set => NumPut("uint", value, this, 72)
    }

    /**
     * @type {Integer}
     */
    flStyleDefault {
        get => NumGet(this, 76, "uint")
        set => NumPut("uint", value, this, 76)
    }

    /**
     * @type {Integer}
     */
    flExtStyleDefault {
        get => NumGet(this, 80, "uint")
        set => NumPut("uint", value, this, 80)
    }

    /**
     * @type {Integer}
     */
    flCtrlTypeMask {
        get => NumGet(this, 84, "uint")
        set => NumPut("uint", value, this, 84)
    }

    /**
     * @type {Array<SByte>}
     */
    szTextDefault{
        get {
            if(!this.HasProp("__szTextDefaultProxyArray"))
                this.__szTextDefaultProxyArray := Win32FixedArray(this.ptr + 88, 256, Primitive, "char")
            return this.__szTextDefaultProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    cStyleFlags {
        get => NumGet(this, 344, "int")
        set => NumPut("int", value, this, 344)
    }

    /**
     * @type {Pointer<CCSTYLEFLAGA>}
     */
    aStyleFlags {
        get => NumGet(this, 352, "ptr")
        set => NumPut("ptr", value, this, 352)
    }

    /**
     * @type {Pointer<LPFNCCSTYLEA>}
     */
    lpfnStyle {
        get => NumGet(this, 360, "ptr")
        set => NumPut("ptr", value, this, 360)
    }

    /**
     * @type {Pointer<LPFNCCSIZETOTEXTA>}
     */
    lpfnSizeToText {
        get => NumGet(this, 368, "ptr")
        set => NumPut("ptr", value, this, 368)
    }

    /**
     * @type {Integer}
     */
    dwReserved1 {
        get => NumGet(this, 376, "uint")
        set => NumPut("uint", value, this, 376)
    }

    /**
     * @type {Integer}
     */
    dwReserved2 {
        get => NumGet(this, 380, "uint")
        set => NumPut("uint", value, this, 380)
    }
}
