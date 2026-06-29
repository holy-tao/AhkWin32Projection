#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.System.SystemServices
 */
export default struct TAPE_WMI_OPERATIONS {
    #StructPack 8

    Method : UInt32

    DataBufferSize : UInt32

    DataBuffer : IntPtr

}
