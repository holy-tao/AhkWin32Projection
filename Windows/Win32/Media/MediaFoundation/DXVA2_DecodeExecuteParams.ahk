#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains parameters for the IDirectXVideoDecoder::Execute method.
 * @see https://docs.microsoft.com/windows/win32/api//dxva2api/ns-dxva2api-dxva2_decodeexecuteparams
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_DecodeExecuteParams extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Number of compressed buffers.
     * @type {Integer}
     */
    NumCompBuffers {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to an array of <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_decodebufferdesc">DXVA2_DecodeBufferDesc</a> structures that describe the compressed buffers. The number of elements in the array is given by the <b>NumCompBuffers</b> member.
     * @type {Pointer<DXVA2_DecodeBufferDesc>}
     */
    pCompressedBuffers {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a <a href="https://docs.microsoft.com/windows/desktop/api/dxva2api/ns-dxva2api-dxva2_decodeextensiondata">DXVA2_DecodeExtensionData</a> structure that contains private data. Set this member to <b>NULL</b> unless you need to send private data to or from the driver.
     * @type {Pointer<DXVA2_DecodeExtensionData>}
     */
    pExtensionData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
