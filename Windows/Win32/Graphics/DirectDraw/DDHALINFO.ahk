#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\DDPIXELFORMAT.ahk
#Include .\VIDMEMINFO.ahk
#Include .\DDCORECAPS.ahk

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDHALINFO extends Win32Struct
{
    static sizeof => 528

    static packingSize => 8

    /**
     * @type {Integer}
     */
    dwSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<DDHAL_DDCALLBACKS>}
     */
    lpDDCallbacks {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * @type {Pointer<DDHAL_DDSURFACECALLBACKS>}
     */
    lpDDSurfaceCallbacks {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * @type {Pointer<DDHAL_DDPALETTECALLBACKS>}
     */
    lpDDPaletteCallbacks {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {VIDMEMINFO}
     */
    vmiData{
        get {
            if(!this.HasProp("__vmiData"))
                this.__vmiData := VIDMEMINFO(this.ptr + 32)
            return this.__vmiData
        }
    }

    /**
     * @type {DDCORECAPS}
     */
    ddCaps{
        get {
            if(!this.HasProp("__ddCaps"))
                this.__ddCaps := DDCORECAPS(this.ptr + 120)
            return this.__ddCaps
        }
    }

    /**
     * @type {Integer}
     */
    dwMonitorFrequency {
        get => NumGet(this, 436, "uint")
        set => NumPut("uint", value, this, 436)
    }

    /**
     * @type {Pointer<LPDDHAL_GETDRIVERINFO>}
     */
    GetDriverInfo {
        get => NumGet(this, 440, "ptr")
        set => NumPut("ptr", value, this, 440)
    }

    /**
     * @type {Integer}
     */
    dwModeIndex {
        get => NumGet(this, 448, "uint")
        set => NumPut("uint", value, this, 448)
    }

    /**
     * @type {Pointer<UInt32>}
     */
    lpdwFourCC {
        get => NumGet(this, 456, "ptr")
        set => NumPut("ptr", value, this, 456)
    }

    /**
     * @type {Integer}
     */
    dwNumModes {
        get => NumGet(this, 464, "uint")
        set => NumPut("uint", value, this, 464)
    }

    /**
     * @type {Pointer<DDHALMODEINFO>}
     */
    lpModeInfo {
        get => NumGet(this, 472, "ptr")
        set => NumPut("ptr", value, this, 472)
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 480, "uint")
        set => NumPut("uint", value, this, 480)
    }

    /**
     * @type {Pointer<Void>}
     */
    lpPDevice {
        get => NumGet(this, 488, "ptr")
        set => NumPut("ptr", value, this, 488)
    }

    /**
     * @type {Integer}
     */
    hInstance {
        get => NumGet(this, 496, "uint")
        set => NumPut("uint", value, this, 496)
    }

    /**
     * @type {Pointer}
     */
    lpD3DGlobalDriverData {
        get => NumGet(this, 504, "ptr")
        set => NumPut("ptr", value, this, 504)
    }

    /**
     * @type {Pointer}
     */
    lpD3DHALCallbacks {
        get => NumGet(this, 512, "ptr")
        set => NumPut("ptr", value, this, 512)
    }

    /**
     * @type {Pointer<DDHAL_DDEXEBUFCALLBACKS>}
     */
    lpDDExeBufCallbacks {
        get => NumGet(this, 520, "ptr")
        set => NumPut("ptr", value, this, 520)
    }
}
