#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Storage.IscsiDisc
 */
export default struct HYBRID_REQUEST_BLOCK {
    #StructPack 4

    Version : UInt32

    Size : UInt32

    Function : UInt32

    Flags : UInt32

    DataBufferOffset : UInt32

    DataBufferLength : UInt32

}
