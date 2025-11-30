#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Gdi\HDC.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_CREATEDCFROMMEMORY extends Win32Struct
{
    static sizeof => 56

    static packingSize => 8

    /**
     * @type {Pointer<Void>}
     */
    pMemory {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    Format {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 12, "uint")
        set => NumPut("uint", value, this, 12)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Pitch {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {HDC}
     */
    hDeviceDc{
        get {
            if(!this.HasProp("__hDeviceDc"))
                this.__hDeviceDc := HDC(24, this)
            return this.__hDeviceDc
        }
    }

    /**
     * @type {Pointer<PALETTEENTRY>}
     */
    pColorTable {
        get => NumGet(this, 32, "ptr")
        set => NumPut("ptr", value, this, 32)
    }

    /**
     * @type {HDC}
     */
    hDc{
        get {
            if(!this.HasProp("__hDc"))
                this.__hDc := HDC(40, this)
            return this.__hDc
        }
    }

    /**
     * @type {HANDLE}
     */
    hBitmap{
        get {
            if(!this.HasProp("__hBitmap"))
                this.__hBitmap := HANDLE(48, this)
            return this.__hBitmap
        }
    }
}
