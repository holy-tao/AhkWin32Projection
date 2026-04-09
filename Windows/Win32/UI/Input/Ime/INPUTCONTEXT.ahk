#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Foundation\HWND.ahk
#Include ..\..\..\Foundation\POINT.ahk
#Include ..\..\..\Graphics\Gdi\LOGFONTA.ahk
#Include ..\..\..\Graphics\Gdi\FONT_CHARSET.ahk
#Include ..\..\..\Graphics\Gdi\FONT_OUTPUT_PRECISION.ahk
#Include ..\..\..\Graphics\Gdi\FONT_CLIP_PRECISION.ahk
#Include ..\..\..\Graphics\Gdi\FONT_QUALITY.ahk
#Include ..\..\..\Graphics\Gdi\LOGFONTW.ahk
#Include .\COMPOSITIONFORM.ahk
#Include ..\..\..\Foundation\RECT.ahk
#Include .\CANDIDATEFORM.ahk
#Include .\HIMCC.ahk

/**
 * @namespace Windows.Win32.UI.Input.Ime
 */
class INPUTCONTEXT extends Win32Struct {
    static sizeof => 352

    static packingSize => 8

    class _lfFont_e__Union extends Win32Struct {
        static sizeof => 92
        static packingSize => 4

        /**
         * @type {LOGFONTA}
         */
        A {
            get {
                if(!this.HasProp("__A"))
                    this.__A := LOGFONTA(0, this)
                return this.__A
            }
        }

        /**
         * @type {LOGFONTW}
         */
        W {
            get {
                if(!this.HasProp("__W"))
                    this.__W := LOGFONTW(0, this)
                return this.__W
            }
        }
    }

    /**
     * @type {HWND}
     */
    hWnd {
        get {
            if(!this.HasProp("__hWnd"))
                this.__hWnd := HWND(0, this)
            return this.__hWnd
        }
    }

    /**
     * @type {BOOL}
     */
    fOpen {
        get => NumGet(this, 8, "int")
        set => NumPut("int", value, this, 8)
    }

    /**
     * @type {POINT}
     */
    ptStatusWndPos {
        get {
            if(!this.HasProp("__ptStatusWndPos"))
                this.__ptStatusWndPos := POINT(12, this)
            return this.__ptStatusWndPos
        }
    }

    /**
     * @type {POINT}
     */
    ptSoftKbdPos {
        get {
            if(!this.HasProp("__ptSoftKbdPos"))
                this.__ptSoftKbdPos := POINT(20, this)
            return this.__ptSoftKbdPos
        }
    }

    /**
     * @type {Integer}
     */
    fdwConversion {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    fdwSentence {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * @type {_lfFont_e__Union}
     */
    lfFont {
        get {
            if(!this.HasProp("__lfFont"))
                this.__lfFont := INPUTCONTEXT._lfFont_e__Union(36, this)
            return this.__lfFont
        }
    }

    /**
     * @type {COMPOSITIONFORM}
     */
    cfCompForm {
        get {
            if(!this.HasProp("__cfCompForm"))
                this.__cfCompForm := COMPOSITIONFORM(128, this)
            return this.__cfCompForm
        }
    }

    /**
     * @type {CANDIDATEFORM}
     */
    cfCandForm {
        get {
            if(!this.HasProp("__cfCandFormProxyArray"))
                this.__cfCandFormProxyArray := Win32FixedArray(this.ptr + 156, 4, CANDIDATEFORM, "")
            return this.__cfCandFormProxyArray
        }
    }

    /**
     * @type {HIMCC}
     */
    hCompStr {
        get {
            if(!this.HasProp("__hCompStr"))
                this.__hCompStr := HIMCC(288, this)
            return this.__hCompStr
        }
    }

    /**
     * @type {HIMCC}
     */
    hCandInfo {
        get {
            if(!this.HasProp("__hCandInfo"))
                this.__hCandInfo := HIMCC(296, this)
            return this.__hCandInfo
        }
    }

    /**
     * @type {HIMCC}
     */
    hGuideLine {
        get {
            if(!this.HasProp("__hGuideLine"))
                this.__hGuideLine := HIMCC(304, this)
            return this.__hGuideLine
        }
    }

    /**
     * @type {HIMCC}
     */
    hPrivate {
        get {
            if(!this.HasProp("__hPrivate"))
                this.__hPrivate := HIMCC(312, this)
            return this.__hPrivate
        }
    }

    /**
     * @type {Integer}
     */
    dwNumMsgBuf {
        get => NumGet(this, 320, "uint")
        set => NumPut("uint", value, this, 320)
    }

    /**
     * @type {HIMCC}
     */
    hMsgBuf {
        get {
            if(!this.HasProp("__hMsgBuf"))
                this.__hMsgBuf := HIMCC(328, this)
            return this.__hMsgBuf
        }
    }

    /**
     * @type {Integer}
     */
    fdwInit {
        get => NumGet(this, 336, "uint")
        set => NumPut("uint", value, this, 336)
    }

    /**
     * @type {Array<Integer>}
     */
    dwReserve {
        get {
            if(!this.HasProp("__dwReserveProxyArray"))
                this.__dwReserveProxyArray := Win32FixedArray(this.ptr + 340, 3, Primitive, "uint")
            return this.__dwReserveProxyArray
        }
    }
}
