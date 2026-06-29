#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA_BufferDescription {
    #StructPack 4

    dwTypeIndex : UInt32

    dwBufferIndex : UInt32

    dwDataOffset : UInt32

    dwDataSize : UInt32

    dwFirstMBaddress : UInt32

    dwNumMBsInBuffer : UInt32

    dwWidth : UInt32

    dwHeight : UInt32

    dwStride : UInt32

    dwReservedBits : UInt32

}
