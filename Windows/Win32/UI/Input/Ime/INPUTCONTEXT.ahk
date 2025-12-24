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
    static sizeof => 264

    static packingSize => 8

    class _lfFont_e__Union extends Win32Struct {
        static sizeof => 96
        static packingSize => 8

        /**
         * @type {LOGFONTA}
         */
        A{
            get {
                if(!this.HasProp("__A"))
                    this.__A := LOGFONTA(0, this)
                return this.__A
            }
        }
    
        /**
         * @type {LOGFONTW}
         */
        W{
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
    hWnd{
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
    ptStatusWndPos{
        get {
            if(!this.HasProp("__ptStatusWndPos"))
                this.__ptStatusWndPos := POINT(16, this)
            return this.__ptStatusWndPos
        }
    }

    /**
     * @type {POINT}
     */
    ptSoftKbdPos{
        get {
            if(!this.HasProp("__ptSoftKbdPos"))
                this.__ptSoftKbdPos := POINT(24, this)
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
     * @type {_lfFont_e__Union}
     */
    lfFont{
        get {
            if(!this.HasProp("__lfFont"))
                this.__lfFont := %this.__Class%._lfFont_e__Union(40, this)
            return this.__lfFont
        }
    }

    /**
     * @type {COMPOSITIONFORM}
     */
    cfCompForm{
        get {
            if(!this.HasProp("__cfCompForm"))
                this.__cfCompForm := COMPOSITIONFORM(136, this)
            return this.__cfCompForm
        }
    }

    /**
     * @type {Array<CANDIDATEFORM>}
     */
    cfCandForm{
        get {
            if(!this.HasProp("__cfCandFormProxyArray"))
                this.__cfCandFormProxyArray := Win32FixedArray(this.ptr + 168, 4, CANDIDATEFORM, "")
            return this.__cfCandFormProxyArray
        }
    }

    /**
     * @type {HIMCC}
     */
    hCompStr{
        get {
            if(!this.HasProp("__hCompStr"))
                this.__hCompStr := HIMCC(200, this)
            return this.__hCompStr
        }
    }

    /**
     * @type {HIMCC}
     */
    hCandInfo{
        get {
            if(!this.HasProp("__hCandInfo"))
                this.__hCandInfo := HIMCC(208, this)
            return this.__hCandInfo
        }
    }

    /**
     * @type {HIMCC}
     */
    hGuideLine{
        get {
            if(!this.HasProp("__hGuideLine"))
                this.__hGuideLine := HIMCC(216, this)
            return this.__hGuideLine
        }
    }

    /**
     * @type {HIMCC}
     */
    hPrivate{
        get {
            if(!this.HasProp("__hPrivate"))
                this.__hPrivate := HIMCC(224, this)
            return this.__hPrivate
        }
    }

    /**
     * @type {Integer}
     */
    dwNumMsgBuf {
        get => NumGet(this, 232, "uint")
        set => NumPut("uint", value, this, 232)
    }

    /**
     * @type {HIMCC}
     */
    hMsgBuf{
        get {
            if(!this.HasProp("__hMsgBuf"))
                this.__hMsgBuf := HIMCC(240, this)
            return this.__hMsgBuf
        }
    }

    /**
     * @type {Integer}
     */
    fdwInit {
        get => NumGet(this, 248, "uint")
        set => NumPut("uint", value, this, 248)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReserve{
        get {
            if(!this.HasProp("__dwReserveProxyArray"))
                this.__dwReserveProxyArray := Win32FixedArray(this.ptr + 252, 3, Primitive, "uint")
            return this.__dwReserveProxyArray
        }
    }
}
