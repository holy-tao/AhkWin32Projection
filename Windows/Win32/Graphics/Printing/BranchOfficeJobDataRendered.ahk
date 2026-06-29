#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct BranchOfficeJobDataRendered {
    #StructPack 8

    Size : Int64

    ICMMethod : UInt32

    Color : Int16

    PrintQuality : Int16

    YResolution : Int16

    Copies : Int16

    TTOption : Int16

}
