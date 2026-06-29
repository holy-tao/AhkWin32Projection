#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Devices.Display
 */
export default struct VIDEO_MONITOR_DESCRIPTOR {
    #StructPack 4

    DescriptorSize : UInt32

    Descriptor : Int8[1]

}
