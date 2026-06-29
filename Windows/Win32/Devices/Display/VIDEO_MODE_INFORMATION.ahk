#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_MODE_INFORMATION {
    #StructPack 4

    Length : UInt32

    ModeIndex : UInt32

    VisScreenWidth : UInt32

    VisScreenHeight : UInt32

    ScreenStride : UInt32

    NumberOfPlanes : UInt32

    BitsPerPlane : UInt32

    Frequency : UInt32

    XMillimeter : UInt32

    YMillimeter : UInt32

    NumberRedBits : UInt32

    NumberGreenBits : UInt32

    NumberBlueBits : UInt32

    RedMask : UInt32

    GreenMask : UInt32

    BlueMask : UInt32

    AttributeFlags : UInt32

    VideoMemoryBitmapWidth : UInt32

    VideoMemoryBitmapHeight : UInt32

    DriverSpecificAttributeFlags : UInt32

}
