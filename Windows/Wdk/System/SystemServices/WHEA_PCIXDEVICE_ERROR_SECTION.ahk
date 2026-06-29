#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.System.SystemServices
 */
export default struct WHEA_PCIXDEVICE_ERROR_SECTION {
    #StructPack 8

    ValidBits : IntPtr

    ErrorStatus : IntPtr

    IdInfo : IntPtr

    MemoryNumber : UInt32

    IoNumber : UInt32

    RegisterDataPairs : IntPtr[1]

}
