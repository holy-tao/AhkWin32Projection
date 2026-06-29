#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\RGBCOLOR.ahk" { RGBCOLOR }
#Import ".\CMYKCOLOR.ahk" { CMYKCOLOR }
#Import ".\GRAYCOLOR.ahk" { GRAYCOLOR }
#Import ".\XYZCOLOR.ahk" { XYZCOLOR }
#Import ".\YxyCOLOR.ahk" { YxyCOLOR }
#Import ".\HiFiCOLOR.ahk" { HiFiCOLOR }
#Import ".\GENERIC3CHANNEL.ahk" { GENERIC3CHANNEL }
#Import ".\NAMEDCOLOR.ahk" { NAMEDCOLOR }
#Import ".\LabCOLOR.ahk" { LabCOLOR }

/**
 * Description of the COLOR union.
 * @remarks
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
 * @see https://learn.microsoft.com/windows/win32/api/icm/ns-icm-color
 * @namespace Windows.Win32.UI.ColorSystem
 */
export default struct COLOR {
    #StructPack 8

    /**
     * TBD
     */
    gray : GRAYCOLOR

    reserved2 : IntPtr

    static __New() {
        DefineProp(this.Prototype, 'rgb', { type: RGBCOLOR, offset: 0 })
        DefineProp(this.Prototype, 'cmyk', { type: CMYKCOLOR, offset: 0 })
        DefineProp(this.Prototype, 'XYZ', { type: XYZCOLOR, offset: 0 })
        DefineProp(this.Prototype, 'Yxy', { type: YxyCOLOR, offset: 0 })
        DefineProp(this.Prototype, 'Lab', { type: LabCOLOR, offset: 0 })
        DefineProp(this.Prototype, 'gen3ch', { type: GENERIC3CHANNEL, offset: 0 })
        DefineProp(this.Prototype, 'named', { type: NAMEDCOLOR, offset: 0 })
        DefineProp(this.Prototype, 'hifi', { type: HiFiCOLOR, offset: 0 })
        DefineProp(this.Prototype, 'reserved1', { type: UInt32, offset: 0 })
        this.DeleteProp("__New")
    }
}
