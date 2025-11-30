#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Gdi\HDC.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_CHANGESURFACEPOINTER extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * @type {HDC}
     */
    hDC{
        get {
            if(!this.HasProp("__hDC"))
                this.__hDC := HDC(0, this)
            return this.__hDC
        }
    }

    /**
     * @type {HANDLE}
     */
    hBitmap{
        get {
            if(!this.HasProp("__hBitmap"))
                this.__hBitmap := HANDLE(8, this)
            return this.__hBitmap
        }
    }

    /**
     * @type {Pointer<Void>}
     */
    pSurfacePointer {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Integer}
     */
    Width {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * @type {Integer}
     */
    Height {
        get => NumGet(this, 28, "uint")
        set => NumPut("uint", value, this, 28)
    }

    /**
     * @type {Integer}
     */
    Pitch {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
