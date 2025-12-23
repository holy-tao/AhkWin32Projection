#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDGAMMARAMP structure contains red, green, and blue ramp data for the IDirectDrawGammaControl::GetGammaRamp and IDirectDrawGammaControl::SetGammaRamp methods.
 * @see https://learn.microsoft.com/windows/win32/api/ddraw/ns-ddraw-ddgammaramp
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDGAMMARAMP extends Win32Struct
{
    static sizeof => 1536

    static packingSize => 2

    /**
     * Array of 256 WORD elements that describe the red gamma ramp.
     * @type {Array<UInt16>}
     */
    red{
        get {
            if(!this.HasProp("__redProxyArray"))
                this.__redProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "ushort")
            return this.__redProxyArray
        }
    }

    /**
     * Array of 256 WORD elements that describe the green gamma ramp.
     * @type {Array<UInt16>}
     */
    green{
        get {
            if(!this.HasProp("__greenProxyArray"))
                this.__greenProxyArray := Win32FixedArray(this.ptr + 512, 256, Primitive, "ushort")
            return this.__greenProxyArray
        }
    }

    /**
     * Array of 256 WORD elements that describe the blue gamma ramp.
     * @type {Array<UInt16>}
     */
    blue{
        get {
            if(!this.HasProp("__blueProxyArray"))
                this.__blueProxyArray := Win32FixedArray(this.ptr + 1024, 256, Primitive, "ushort")
            return this.__blueProxyArray
        }
    }
}
