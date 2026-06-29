#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_SERIALIZED_ROOT_SIGNATURE_DESC {
    #StructPack 8

    pSerializedBlob : IntPtr

    SerializedBlobSizeInBytes : IntPtr

}
