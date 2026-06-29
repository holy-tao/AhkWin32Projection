#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct ATTRIBUTE_INFO_4 {
    #StructPack 4

    dwJobNumberOfPagesPerSide : UInt32

    dwDrvNumberOfPagesPerSide : UInt32

    dwNupBorderFlags : UInt32

    dwJobPageOrderFlags : UInt32

    dwDrvPageOrderFlags : UInt32

    dwJobNumberOfCopies : UInt32

    dwDrvNumberOfCopies : UInt32

    dwColorOptimization : UInt32

    dmPrintQuality : Int16

    dmYResolution : Int16

    dwDuplexFlags : UInt32

    dwNupDirection : UInt32

    dwBookletFlags : UInt32

    dwScalingPercentX : UInt32

    dwScalingPercentY : UInt32

}
