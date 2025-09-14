#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset ANSI
 */
class DIDEVICEIMAGEINFOA extends Win32Struct
{
    static sizeof => 360

    static packingSize => 8

    /**
     * @type {Array<SByte>}
     */
    tszImagePath{
        get {
            if(!this.HasProp("__tszImagePathProxyArray"))
                this.__tszImagePathProxyArray := Win32FixedArray(this.ptr + 0, 260, Primitive, "char")
            return this.__tszImagePathProxyArray
        }
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 260, "uint")
        set => NumPut("uint", value, this, 260)
    }

    /**
     * @type {Integer}
     */
    dwViewID {
        get => NumGet(this, 264, "uint")
        set => NumPut("uint", value, this, 264)
    }

    /**
     * @type {RECT}
     */
    rcOverlay{
        get {
            if(!this.HasProp("__rcOverlay"))
                this.__rcOverlay := RECT(this.ptr + 272)
            return this.__rcOverlay
        }
    }

    /**
     * @type {Integer}
     */
    dwObjID {
        get => NumGet(this, 288, "uint")
        set => NumPut("uint", value, this, 288)
    }

    /**
     * @type {Integer}
     */
    dwcValidPts {
        get => NumGet(this, 292, "uint")
        set => NumPut("uint", value, this, 292)
    }

    /**
     * @type {Array<POINT>}
     */
    rgptCalloutLine{
        get {
            if(!this.HasProp("__rgptCalloutLineProxyArray"))
                this.__rgptCalloutLineProxyArray := Win32FixedArray(this.ptr + 296, 5, POINT, "")
            return this.__rgptCalloutLineProxyArray
        }
    }

    /**
     * @type {RECT}
     */
    rcCalloutRect{
        get {
            if(!this.HasProp("__rcCalloutRect"))
                this.__rcCalloutRect := RECT(this.ptr + 336)
            return this.__rcCalloutRect
        }
    }

    /**
     * @type {Integer}
     */
    dwTextAlign {
        get => NumGet(this, 352, "uint")
        set => NumPut("uint", value, this, 352)
    }
}
