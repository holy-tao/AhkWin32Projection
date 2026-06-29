#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Contains private data for the IDirectXVideoDecoder::Execute method.
 * @remarks
 * This structure corresponds to parameters of the <b>IAMVideoAccelerator::Execute</b> method in DirectX Video Acceleration (DXVA) version 1.
 * @see https://learn.microsoft.com/windows/win32/api/dxva2api/ns-dxva2api-dxva2_decodeextensiondata
 * @namespace Windows.Win32.Media.MediaFoundation
 */
export default struct DXVA2_DecodeExtensionData {
    #StructPack 8

    /**
     * Function number. This can be zero if this argument is the default or is ignored.
     */
    Function : UInt32

    /**
     * Pointer to private input data passed to the driver.
     */
    pPrivateInputData : IntPtr

    /**
     * Length of the private input data, in bytes.
     */
    PrivateInputDataSize : UInt32

    /**
     * Pointer to private output data passed from the driver to the decoder.
     */
    pPrivateOutputData : IntPtr

    /**
     * Size of the private output data, in bytes.
     */
    PrivateOutputDataSize : UInt32

}
