#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include ..\..\..\Graphics\Gdi\LOGFONTA.ahk
#Include ..\..\..\Graphics\Gdi\LOGFONTW.ahk
#Include ..\..\..\Foundation\RECT.ahk
#Include .\COMPOSITIONFORM.ahk
#Include .\CANDIDATEFORM.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class INPUTCONTEXT extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    hWnd {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    fOpen {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {POINT}
     */
    ptStatusWndPos{
        get {
            if(!this.HasProp("__ptStatusWndPos"))
                this.__ptStatusWndPos := POINT(this.ptr + 16)
            return this.__ptStatusWndPos
        }
    }

    /**
     * @type {POINT}
     */
    ptSoftKbdPos{
        get {
            if(!this.HasProp("__ptSoftKbdPos"))
                this.__ptSoftKbdPos := POINT(this.ptr + 24)
            return this.__ptSoftKbdPos
        }
    }

    /**
     * @type {Integer}
     */
    fdwConversion {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {Integer}
     */
    fdwSentence {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * @type {LOGFONTA}
     */
    A{
        get {
            if(!this.HasProp("__A"))
                this.__A := LOGFONTA(this.ptr + 40)
            return this.__A
        }
    }

    /**
     * @type {LOGFONTW}
     */
    W{
        get {
            if(!this.HasProp("__W"))
                this.__W := LOGFONTW(this.ptr + 40)
            return this.__W
        }
    }

    /**
     * @type {COMPOSITIONFORM}
     */
    cfCompForm{
        get {
            if(!this.HasProp("__cfCompForm"))
                this.__cfCompForm := COMPOSITIONFORM(this.ptr + 104)
            return this.__cfCompForm
        }
    }

    /**
     * @type {Array<CANDIDATEFORM>}
     */
    cfCandForm{
        get {
            if(!this.HasProp("__cfCandFormProxyArray"))
                this.__cfCandFormProxyArray := Win32FixedArray(this.ptr + 136, 4, CANDIDATEFORM, "")
            return this.__cfCandFormProxyArray
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    hCompStr {
        get => NumGet(this, 168, "ptr")
        set => NumPut("ptr", value, this, 168)
    }

    /**
     * @type {Pointer<Void>}
     */
    hCandInfo {
        get => NumGet(this, 176, "ptr")
        set => NumPut("ptr", value, this, 176)
    }

    /**
     * @type {Pointer<Void>}
     */
    hGuideLine {
        get => NumGet(this, 184, "ptr")
        set => NumPut("ptr", value, this, 184)
    }

    /**
     * @type {Pointer<Void>}
     */
    hPrivate {
        get => NumGet(this, 192, "ptr")
        set => NumPut("ptr", value, this, 192)
    }

    /**
     * @type {Integer}
     */
    dwNumMsgBuf {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {Pointer<Void>}
     */
    hMsgBuf {
        get => NumGet(this, 208, "ptr")
        set => NumPut("ptr", value, this, 208)
    }

    /**
     * @type {Integer}
     */
    fdwInit {
        get => NumGet(this, 216, "uint")
        set => NumPut("uint", value, this, 216)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReserve{
        get {
            if(!this.HasProp("__dwReserveProxyArray"))
                this.__dwReserveProxyArray := Win32FixedArray(this.ptr + 220, 3, Primitive, "uint")
            return this.__dwReserveProxyArray
        }
    }
}
