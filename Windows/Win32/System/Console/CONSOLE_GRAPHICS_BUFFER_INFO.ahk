#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\BITMAPINFO.ahk
#Include ..\..\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Win32.System.Console
 */
class CONSOLE_GRAPHICS_BUFFER_INFO extends Win32Struct {
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwBitMapInfoLength {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<BITMAPINFO>}
     */
    lpBitMapInfo {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    dwUsage {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {HANDLE}
     */
    hMutex {
        get {
            if(!this.HasProp("__hMutex"))
                this.__hMutex := HANDLE(24, this)
            return this.__hMutex
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    lpBitMap {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }
}
