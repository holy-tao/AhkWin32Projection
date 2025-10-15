#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include .\GRAYCOLOR.ahk
#Include .\RGBCOLOR.ahk
#Include .\CMYKCOLOR.ahk
#Include .\XYZCOLOR.ahk
#Include .\YxyCOLOR.ahk
#Include .\LabCOLOR.ahk
#Include .\GENERIC3CHANNEL.ahk
#Include .\NAMEDCOLOR.ahk
#Include .\HiFiCOLOR.ahk

/**
 * Description of the COLOR union.
 * @remarks
 * 
  * A variable of type COLOR may be accessed as any of the supported color space colors by accessing the appropriate member of the union. For instance, given the following variable declaration:
  * 
  * `COLOR aColor;`
  * 
  * the red, green and blue values could be set in the following manner:
  * 
  * `aColor.rgb.red=100;`
  * 
  * `aColor.rgb.green=50;`
  * 
  * `aColor.rgb.blue=2;`
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//icm/ns-icm-color
 * @namespace Windows.Win32.UI.ColorSystem
 * @version v4.0.30319
 */
class COLOR extends Win32Struct
{
    static sizeof => 80

    static packingSize => 8

    /**
     * TBD
     * @type {GRAYCOLOR}
     */
    gray{
        get {
            if(!this.HasProp("__gray"))
                this.__gray := GRAYCOLOR(this.ptr + 0)
            return this.__gray
        }
    }

    /**
     * TBD
     * @type {RGBCOLOR}
     */
    rgb{
        get {
            if(!this.HasProp("__rgb"))
                this.__rgb := RGBCOLOR(this.ptr + 0)
            return this.__rgb
        }
    }

    /**
     * TBD
     * @type {CMYKCOLOR}
     */
    cmyk{
        get {
            if(!this.HasProp("__cmyk"))
                this.__cmyk := CMYKCOLOR(this.ptr + 0)
            return this.__cmyk
        }
    }

    /**
     * TBD
     * @type {XYZCOLOR}
     */
    XYZ{
        get {
            if(!this.HasProp("__XYZ"))
                this.__XYZ := XYZCOLOR(this.ptr + 0)
            return this.__XYZ
        }
    }

    /**
     * TBD
     * @type {YxyCOLOR}
     */
    Yxy{
        get {
            if(!this.HasProp("__Yxy"))
                this.__Yxy := YxyCOLOR(this.ptr + 0)
            return this.__Yxy
        }
    }

    /**
     * TBD
     * @type {LabCOLOR}
     */
    Lab{
        get {
            if(!this.HasProp("__Lab"))
                this.__Lab := LabCOLOR(this.ptr + 0)
            return this.__Lab
        }
    }

    /**
     * TBD
     * @type {GENERIC3CHANNEL}
     */
    gen3ch{
        get {
            if(!this.HasProp("__gen3ch"))
                this.__gen3ch := GENERIC3CHANNEL(this.ptr + 0)
            return this.__gen3ch
        }
    }

    /**
     * TBD
     * @type {NAMEDCOLOR}
     */
    named{
        get {
            if(!this.HasProp("__named"))
                this.__named := NAMEDCOLOR(this.ptr + 0)
            return this.__named
        }
    }

    /**
     * TBD
     * @type {HiFiCOLOR}
     */
    hifi{
        get {
            if(!this.HasProp("__hifi"))
                this.__hifi := HiFiCOLOR(this.ptr + 0)
            return this.__hifi
        }
    }

    /**
     * @type {Integer}
     */
    reserved1 {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * @type {Pointer<Void>}
     */
    reserved2 {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
