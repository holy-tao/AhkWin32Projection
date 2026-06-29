#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import "..\..\Foundation\BOOLEAN.ahk" { BOOLEAN }

/**
 * @namespace Windows.Win32.Devices.HumanInterfaceDevice
 */
export default struct HID_COLLECTION_INFORMATION {
    #StructPack 4

    DescriptorSize : UInt32

    Polled : BOOLEAN

    Reserved1 : Int8[1]

    VendorID : UInt16

    ProductID : UInt16

    VersionNumber : UInt16

}
