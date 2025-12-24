#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Graphics\Gdi\BLENDFUNCTION.ahk

/**
 * The BLENDOBJ structure controls blending by specifying the blending functions for source and destination bitmaps.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-blendobj
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class BLENDOBJ extends Win32Struct
{
    static sizeof => 4

    static packingSize => 1

    /**
     * Is a BLENDFUNCTION structure (described in the Microsoft Window SDK documentation) that specifies the blending operation to use, the alpha transparency for the source bitmap, and the way the source and destination bitmaps are interpreted.
     * @type {BLENDFUNCTION}
     */
    BlendFunction{
        get {
            if(!this.HasProp("__BlendFunction"))
                this.__BlendFunction := BLENDFUNCTION(0, this)
            return this.__BlendFunction
        }
    }
}
