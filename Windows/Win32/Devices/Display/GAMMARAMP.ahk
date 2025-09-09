#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GAMMARAMP structure is used by DrvIcmSetDeviceGammaRamp to set the hardware gamma ramp of a particular display device.
 * @see https://learn.microsoft.com/windows/win32/api/winddi/ns-winddi-gammaramp
 * @namespace Windows.Win32.Devices.Display
 * @version v4.0.30319
 */
class GAMMARAMP extends Win32Struct
{
    static sizeof => 1536

    static packingSize => 2

    /**
     * Is the 256-entry ramp for the red color channel.
     * @type {Array<UInt16>}
     */
    Red{
        get {
            if(!this.HasProp("__RedProxyArray"))
                this.__RedProxyArray := Win32FixedArray(this.ptr + 0, 256, Primitive, "ushort")
            return this.__RedProxyArray
        }
    }

    /**
     * Is the 256-entry ramp for the green color channel.
     * @type {Array<UInt16>}
     */
    Green{
        get {
            if(!this.HasProp("__GreenProxyArray"))
                this.__GreenProxyArray := Win32FixedArray(this.ptr + 512, 256, Primitive, "ushort")
            return this.__GreenProxyArray
        }
    }

    /**
     * Is the 256-entry ramp for the blue color channel.
     * @type {Array<UInt16>}
     */
    Blue{
        get {
            if(!this.HasProp("__BlueProxyArray"))
                this.__BlueProxyArray := Win32FixedArray(this.ptr + 1024, 256, Primitive, "ushort")
            return this.__BlueProxyArray
        }
    }
}
