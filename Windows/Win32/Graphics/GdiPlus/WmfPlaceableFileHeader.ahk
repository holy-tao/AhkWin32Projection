#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\PWMFRect16.ahk" { PWMFRect16 }

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct WmfPlaceableFileHeader {
    #StructPack 4

    Key : UInt32

    Hmf : Int16

    BoundingBox : PWMFRect16

    Inch : Int16

    Reserved : UInt32

    Checksum : Int16

}
