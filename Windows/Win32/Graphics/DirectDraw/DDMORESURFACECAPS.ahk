#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DDSCAPSEX.ahk" { DDSCAPSEX }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDMORESURFACECAPS {
    #StructPack 4


    struct ExtendedHeapRestrictions {
        ddsCapsEx : DDSCAPSEX

        ddsCapsExAlt : DDSCAPSEX

    }

    dwSize : UInt32

    ddsCapsMore : DDSCAPSEX

    ddsExtendedHeapRestrictions : DDMORESURFACECAPS.ExtendedHeapRestrictions[1]

}
