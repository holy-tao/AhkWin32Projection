#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct EISA_DMA_CONFIGURATION {
    #StructPack 8

    ConfigurationByte0 : IntPtr

    ConfigurationByte1 : IntPtr

}
