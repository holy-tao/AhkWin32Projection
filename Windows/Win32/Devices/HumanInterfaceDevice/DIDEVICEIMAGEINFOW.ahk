#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Foundation\RECT.ahk
#Include ..\..\Foundation\POINT.ahk

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 * @version v4.0.30319
 * @charset Unicode
 */
class DIDEVICEIMAGEINFOW extends Win32Struct
{
    static sizeof => 616

    static packingSize => 8

    /**
     * @type {String}
     */
    tszImagePath {
        get => StrGet(this.ptr + 0, 259, "UTF-16")
        set => StrPut(value, this.ptr + 0, 259, "UTF-16")
    }

    /**
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 520, "uint")
        set => NumPut("uint", value, this, 520)
    }

    /**
     * @type {Integer}
     */
    dwViewID {
        get => NumGet(this, 524, "uint")
        set => NumPut("uint", value, this, 524)
    }

    /**
     * @type {RECT}
     */
    rcOverlay{
        get {
            if(!this.HasProp("__rcOverlay"))
                this.__rcOverlay := RECT(this.ptr + 528)
            return this.__rcOverlay
        }
    }

    /**
     * @type {Integer}
     */
    dwObjID {
        get => NumGet(this, 544, "uint")
        set => NumPut("uint", value, this, 544)
    }

    /**
     * @type {Integer}
     */
    dwcValidPts {
        get => NumGet(this, 548, "uint")
        set => NumPut("uint", value, this, 548)
    }

    /**
     * @type {Array<POINT>}
     */
    rgptCalloutLine{
        get {
            if(!this.HasProp("__rgptCalloutLineProxyArray"))
                this.__rgptCalloutLineProxyArray := Win32FixedArray(this.ptr + 552, 8, POINT, "")
            return this.__rgptCalloutLineProxyArray
        }
    }

    /**
     * @type {RECT}
     */
    rcCalloutRect{
        get {
            if(!this.HasProp("__rcCalloutRect"))
                this.__rcCalloutRect := RECT(this.ptr + 592)
            return this.__rcCalloutRect
        }
    }

    /**
     * @type {Integer}
     */
    dwTextAlign {
        get => NumGet(this, 608, "uint")
        set => NumPut("uint", value, this, 608)
    }
}
