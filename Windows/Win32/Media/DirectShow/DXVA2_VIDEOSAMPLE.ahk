#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\MediaFoundation\DXVA2_ExtendedFormat.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\MediaFoundation\DXVA2_AYUVSample8.ahk
#Include ..\MediaFoundation\DXVA2_Fixed32.ahk

/**
 * @namespace Windows.Win32.Media.DirectShow
 * @version v4.0.30319
 */
class DXVA2_VIDEOSAMPLE extends Win32Struct
{
    static sizeof => 200

    static packingSize => 8

    /**
     * @type {Integer}
     */
    Start {
        get => NumGet(this, 0, "int64")
        set => NumPut("int64", value, this, 0)
    }

    /**
     * @type {Integer}
     */
    End {
        get => NumGet(this, 8, "int64")
        set => NumPut("int64", value, this, 8)
    }

    /**
     * @type {DXVA2_ExtendedFormat}
     */
    SampleFormat{
        get {
            if(!this.HasProp("__SampleFormat"))
                this.__SampleFormat := DXVA2_ExtendedFormat(16, this)
            return this.__SampleFormat
        }
    }

    /**
     * @type {Integer}
     */
    SampleFlags {
        get => NumGet(this, 20, "uint")
        set => NumPut("uint", value, this, 20)
    }

    /**
     * @type {Pointer<Void>}
     */
    SrcResource {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * @type {RECT}
     */
    SrcRect{
        get {
            if(!this.HasProp("__SrcRect"))
                this.__SrcRect := RECT(32, this)
            return this.__SrcRect
        }
    }

    /**
     * @type {RECT}
     */
    DstRect{
        get {
            if(!this.HasProp("__DstRect"))
                this.__DstRect := RECT(48, this)
            return this.__DstRect
        }
    }

    /**
     * @type {Array<DXVA2_AYUVSample8>}
     */
    Pal{
        get {
            if(!this.HasProp("__PalProxyArray"))
                this.__PalProxyArray := Win32FixedArray(this.ptr + 64, 16, DXVA2_AYUVSample8, "")
            return this.__PalProxyArray
        }
    }

    /**
     * @type {DXVA2_Fixed32}
     */
    PlanarAlpha{
        get {
            if(!this.HasProp("__PlanarAlpha"))
                this.__PlanarAlpha := DXVA2_Fixed32(192, this)
            return this.__PlanarAlpha
        }
    }
}
