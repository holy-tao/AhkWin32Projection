#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\..\..\Guid.ahk" { Guid }

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDMONITORINFO {
    #StructPack 4

    Manufacturer : UInt16

    Product : UInt16

    SerialNumber : UInt32

    DeviceIdentifier : Guid

    Mode640x480 : Int32

    Mode800x600 : Int32

    Mode1024x768 : Int32

    Mode1280x1024 : Int32

    Mode1600x1200 : Int32

    ModeReserved1 : Int32

    ModeReserved2 : Int32

    ModeReserved3 : Int32

}
