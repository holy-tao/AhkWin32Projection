#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.Graphics.Printing
 * @version v4.0.30319
 */
class PSPINFO extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * @type {Integer}
     */
    cbSize {
        get => NumGet(this, 0, "ushort")
        set => NumPut("ushort", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    wReserved {
        get => NumGet(this, 2, "ushort")
        set => NumPut("ushort", value, this, 2)
    }

    /**
     * @type {HANDLE}
     */
    hComPropSheet{
        get {
            if(!this.HasProp("__hComPropSheet"))
                this.__hComPropSheet := HANDLE(8, this)
            return this.__hComPropSheet
        }
    }

    /**
     * @type {HANDLE}
     */
    hCPSUIPage{
        get {
            if(!this.HasProp("__hCPSUIPage"))
                this.__hCPSUIPage := HANDLE(16, this)
            return this.__hCPSUIPage
        }
    }

    /**
     * @type {Pointer<PFNCOMPROPSHEET>}
     */
    pfnComPropSheet {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    __New(ptrOrObj := 0, parent := ""){
        super.__New(ptrOrObj, parent)
        this.cbSize := 32
    }
}
