#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Hypervisor
 */
export default struct WHV_EMULATOR_MEMORY_ACCESS_INFO {
    #StructPack 8

    GpaAddress : Int64

    Direction : Int8

    AccessSize : Int8

    Data : Int8[8]

}
