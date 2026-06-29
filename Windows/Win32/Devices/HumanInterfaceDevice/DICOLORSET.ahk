#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct DICOLORSET {
    #StructPack 4

    dwSize : UInt32

    cTextFore : UInt32

    cTextHighlight : UInt32

    cCalloutLine : UInt32

    cCalloutHighlight : UInt32

    cBorder : UInt32

    cControlFill : UInt32

    cHighlightFill : UInt32

    cAreaFill : UInt32

}
