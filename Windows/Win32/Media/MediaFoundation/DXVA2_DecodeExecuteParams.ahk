#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\DXVA2_DecodeBufferDesc.ahk" { DXVA2_DecodeBufferDesc }
#Import ".\DXVA2_DecodeExtensionData.ahk" { DXVA2_DecodeExtensionData }

/**
 * Contains parameters for the IDirectXVideoDecoder::Execute method.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_decodeexecuteparams
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_DecodeExecuteParams {
    #StructPack 8

    /**
     * Number of compressed buffers.
     */
    NumCompBuffers : UInt32

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_decodebufferdesc">DXVA2_DecodeBufferDesc</a> structures that describe the compressed buffers. The number of elements in the array is given by the <b>NumCompBuffers</b> member.
     */
    pCompressedBuffers : DXVA2_DecodeBufferDesc.Ptr

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_decodeextensiondata">DXVA2_DecodeExtensionData</a> structure that contains private data. Set this member to <b>NULL</b> unless you need to send private data to or from the driver.
     */
    pExtensionData : DXVA2_DecodeExtensionData.Ptr

}
