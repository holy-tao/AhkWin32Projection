#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\ID3D11Resource.ahk" { ID3D11Resource }

/**
 * Contains driver-specific data for the ID3D11VideoContext::DecoderExtension method.
 * @remarks
 * The exact meaning of each structure member depends on the value of <b>Function</b>.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11/ns-d3d11-d3d11_video_decoder_extension
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_VIDEO_DECODER_EXTENSION {
    #StructPack 8

    /**
     * The function number. This number identifies the operation to perform. Currently no function numbers are defined.
     */
    Function : UInt32

    /**
     * A pointer to a buffer that contains input data for the driver.
     */
    pPrivateInputData : IntPtr

    /**
     * The size of the <b>pPrivateInputData</b> buffer, in bytes.
     */
    PrivateInputDataSize : UInt32

    /**
     * A pointer to a buffer that the driver can use to write output data.
     */
    pPrivateOutputData : IntPtr

    /**
     * The size of the <b>pPrivateOutputData</b> buffer, in bytes.
     */
    PrivateOutputDataSize : UInt32

    /**
     * The number of elements in the <b>ppResourceList</b> array. If <b>ppResourceList</b> is <b>NULL</b>, set <b>ResourceCount</b> to zero.
     */
    ResourceCount : UInt32

    /**
     * The address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> pointers. Use this member to pass Direct3D resources to the driver.
     */
    ppResourceList : ID3D11Resource.Ptr

}
