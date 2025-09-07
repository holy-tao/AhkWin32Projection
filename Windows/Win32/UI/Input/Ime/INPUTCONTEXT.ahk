#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include ..\..\..\Graphics\Gdi\LOGFONTA.ahk
#Include ..\..\..\Graphics\Gdi\LOGFONTW.ahk
#Include ..\..\..\Foundation\RECT.ahk
#Include .\COMPOSITIONFORM.ahk
#Include .\CANDIDATEFORM.ahk
#Include .\HIMCC.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 * @version v4.0.30319
 */
class INPUTCONTEXT extends Win32Struct
{
    static sizeof => 232

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hWnd{
        get {
            if(!this.HasProp("__hWnd"))
                this.__hWnd := HWND(this.ptr + 0)
            return this.__hWnd
        }
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
                this.__cfCandFormProxyArray := Win32FixedArray(this.ptr + 136, 8, CANDIDATEFORM, "")
            return this.__cfCandFormProxyArray
        }
    }

    /**
     * @type {HIMCC}
     */
    hCompStr{
        get {
            if(!this.HasProp("__hCompStr"))
                this.__hCompStr := HIMCC(this.ptr + 168)
            return this.__hCompStr
        }
    }

    /**
     * @type {HIMCC}
     */
    hCandInfo{
        get {
            if(!this.HasProp("__hCandInfo"))
                this.__hCandInfo := HIMCC(this.ptr + 176)
            return this.__hCandInfo
        }
    }

    /**
     * @type {HIMCC}
     */
    hGuideLine{
        get {
            if(!this.HasProp("__hGuideLine"))
                this.__hGuideLine := HIMCC(this.ptr + 184)
            return this.__hGuideLine
        }
    }

    /**
     * @type {HIMCC}
     */
    hPrivate{
        get {
            if(!this.HasProp("__hPrivate"))
                this.__hPrivate := HIMCC(this.ptr + 192)
            return this.__hPrivate
        }
    }

    /**
     * @type {Integer}
     */
    dwNumMsgBuf {
        get => NumGet(this, 200, "uint")
        set => NumPut("uint", value, this, 200)
    }

    /**
     * @type {HIMCC}
     */
    hMsgBuf{
        get {
            if(!this.HasProp("__hMsgBuf"))
                this.__hMsgBuf := HIMCC(this.ptr + 208)
            return this.__hMsgBuf
        }
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
                this.__dwReserveProxyArray := Win32FixedArray(this.ptr + 220, 4, Primitive, "uint")
            return this.__dwReserveProxyArray
        }
    }
}
