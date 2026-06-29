#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.NetworkManagement.Rras
 */
export default struct RASPPPCCP {
    #StructPack 4

    dwSize : UInt32

    dwError : UInt32

    dwCompressionAlgorithm : UInt32

    dwOptions : UInt32

    dwServerCompressionAlgorithm : UInt32

    dwServerOptions : UInt32

}
