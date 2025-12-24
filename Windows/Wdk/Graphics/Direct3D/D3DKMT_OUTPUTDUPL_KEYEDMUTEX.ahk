#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\..\Win32\Foundation\HANDLE.ahk

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 * @version v4.0.30319
 */
class D3DKMT_OUTPUTDUPL_KEYEDMUTEX extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * @type {HANDLE}
     */
    hSharedSurfaceNt{
        get {
            if(!this.HasProp("__hSharedSurfaceNt"))
                this.__hSharedSurfaceNt := HANDLE(0, this)
            return this.__hSharedSurfaceNt
        }
    }
}
