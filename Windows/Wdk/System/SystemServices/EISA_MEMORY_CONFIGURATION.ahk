#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EISA_MEMORY_CONFIGURATION {
    #StructPack 8

    ConfigurationByte : IntPtr

    DataSize : Int8

    AddressLowWord : UInt16

    AddressHighByte : Int8

    MemorySize : UInt16

}
