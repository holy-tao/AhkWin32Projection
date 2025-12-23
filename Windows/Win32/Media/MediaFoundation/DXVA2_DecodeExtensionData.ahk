#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains private data for the IDirectXVideoDecoder::Execute method.
 * @remarks
 * This structure corresponds to parameters of the <b>IAMVideoAccelerator::Execute</b> method in DirectX Video Acceleration (DXVA) version 1.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_decodeextensiondata
 * @namespace Windows.Win32.Media.MediaFoundation
 * @version v4.0.30319
 */
class DXVA2_DecodeExtensionData extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * Function number. This can be zero if this argument is the default or is ignored.
     * @type {Integer}
     */
    Function {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to private input data passed to the driver.
     * @type {Pointer<Void>}
     */
    pPrivateInputData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Length of the private input data, in bytes.
     * @type {Integer}
     */
    PrivateInputDataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * Pointer to private output data passed from the driver to the decoder.
     * @type {Pointer<Void>}
     */
    pPrivateOutputData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * Size of the private output data, in bytes.
     * @type {Integer}
     */
    PrivateOutputDataSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }
}
