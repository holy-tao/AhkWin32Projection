#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains red, green, and blue ramp data.
 * @see https://learn.microsoft.com/windows/win32/direct3d9/d3dgammaramp
 * @namespace Windows.Win32.Graphics.Direct3D9
 * @version v4.0.30319
 */
class D3DGAMMARAMP extends Win32Struct
{
    static sizeof => 1536

    static packingSize => 2

    /**
     * Type: **[**WORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Array of 256 WORD element that describes the red gamma ramp.
     * @type {Array<UInt16>}
     */
    red{
        get {
            if(!this.HasProp("__redProxyArray"))
                this.__redProxyArray := Win32FixedArray(this.ptr + 0, 2, Primitive, "ushort")
            return this.__redProxyArray
        }
    }

    /**
     * Type: **[**WORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Array of 256 WORD element that describes the green gamma ramp.
     * @type {Array<UInt16>}
     */
    green{
        get {
            if(!this.HasProp("__greenProxyArray"))
                this.__greenProxyArray := Win32FixedArray(this.ptr + 512, 2, Primitive, "ushort")
            return this.__greenProxyArray
        }
    }

    /**
     * Type: **[**WORD**](../winprog/windows-data-types.md)**
     * 
     * 
     * Array of 256 WORD element that describes the blue gamma ramp.
     * @type {Array<UInt16>}
     */
    blue{
        get {
            if(!this.HasProp("__blueProxyArray"))
                this.__blueProxyArray := Win32FixedArray(this.ptr + 1024, 2, Primitive, "ushort")
            return this.__blueProxyArray
        }
    }
}
