#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HWND.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_CHECKOCCLUSION extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {HWND}
     */
    hWindow{
        get {
            if(!this.HasProp("__hWindow"))
                this.__hWindow := HWND(0, this)
            return this.__hWindow
        }
    }
}
