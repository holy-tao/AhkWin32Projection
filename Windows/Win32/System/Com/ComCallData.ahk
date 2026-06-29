#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.Com
 */
export default struct ComCallData {
    #StructPack 8

    dwDispid : UInt32

    dwReserved : UInt32

    pUserDefined : IntPtr

}
