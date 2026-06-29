#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct MIPI_DSI_CAPS {
    #StructPack 2

    DSITypeMajor : Int8

    DSITypeMinor : Int8

    SpecVersionMajor : Int8

    SpecVersionMinor : Int8

    SpecVersionPatch : Int8

    TargetMaximumReturnPacketSize : UInt16

    ResultCodeFlags : Int8

    ResultCodeStatus : Int8

    Revision : Int8

    Level : Int8

    DeviceClassHi : Int8

    DeviceClassLo : Int8

    ManufacturerHi : Int8

    ManufacturerLo : Int8

    ProductHi : Int8

    ProductLo : Int8

    LengthHi : Int8

    LengthLo : Int8

}
