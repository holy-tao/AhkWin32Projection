#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Graphics\Gdi\HDC.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_DESTROYDCFROMMEMORY extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * @type {HDC}
     */
    hDc{
        get {
            if(!this.HasProp("__hDc"))
                this.__hDc := HDC(0, this)
            return this.__hDc
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
}
