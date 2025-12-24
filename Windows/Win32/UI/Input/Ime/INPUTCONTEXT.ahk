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
    static sizeof => 256

    static packingSize => 8

    class _lfFont_e__Union extends Win32Struct {
        static sizeof => 92
        static packingSize => 4

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
                this.__ptStatusWndPos := POINT(12, this)
            return this.__ptStatusWndPos
        }
    }

    /**
     * @type {POINT}
     */
    ptSoftKbdPos{
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
    lfFont{
        get {
            if(!this.HasProp("__lfFont"))
                this.__lfFont := %this.__Class%._lfFont_e__Union(36, this)
            return this.__lfFont
        }
    }

    /**
     * @type {COMPOSITIONFORM}
     */
    cfCompForm{
        get {
            if(!this.HasProp("__cfCompForm"))
                this.__cfCompForm := COMPOSITIONFORM(128, this)
            return this.__cfCompForm
        }
    }

    /**
     * @type {Array<CANDIDATEFORM>}
     */
    cfCandForm{
        get {
            if(!this.HasProp("__cfCandFormProxyArray"))
                this.__cfCandFormProxyArray := Win32FixedArray(this.ptr + 160, 4, CANDIDATEFORM, "")
            return this.__cfCandFormProxyArray
        }
    }

    /**
     * @type {HIMCC}
     */
    hCompStr{
        get {
            if(!this.HasProp("__hCompStr"))
                this.__hCompStr := HIMCC(192, this)
            return this.__hCompStr
        }
    }

    /**
     * @type {HIMCC}
     */
    hCandInfo{
        get {
            if(!this.HasProp("__hCandInfo"))
                this.__hCandInfo := HIMCC(200, this)
            return this.__hCandInfo
        }
    }

    /**
     * @type {HIMCC}
     */
    hGuideLine{
        get {
            if(!this.HasProp("__hGuideLine"))
                this.__hGuideLine := HIMCC(208, this)
            return this.__hGuideLine
        }
    }

    /**
     * @type {HIMCC}
     */
    hPrivate{
        get {
            if(!this.HasProp("__hPrivate"))
                this.__hPrivate := HIMCC(216, this)
            return this.__hPrivate
        }
    }

    /**
     * @type {Integer}
     */
    dwNumMsgBuf {
        get => NumGet(this, 224, "uint")
        set => NumPut("uint", value, this, 224)
    }

    /**
     * @type {HIMCC}
     */
    hMsgBuf{
        get {
            if(!this.HasProp("__hMsgBuf"))
                this.__hMsgBuf := HIMCC(232, this)
            return this.__hMsgBuf
        }
    }

    /**
     * @type {Integer}
     */
    fdwInit {
        get => NumGet(this, 240, "uint")
        set => NumPut("uint", value, this, 240)
    }

    /**
     * @type {Array<UInt32>}
     */
    dwReserve{
        get {
            if(!this.HasProp("__dwReserveProxyArray"))
                this.__dwReserveProxyArray := Win32FixedArray(this.ptr + 244, 3, Primitive, "uint")
            return this.__dwReserveProxyArray
        }
    }
}
