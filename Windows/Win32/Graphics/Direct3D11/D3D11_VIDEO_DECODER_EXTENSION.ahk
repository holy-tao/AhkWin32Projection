#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Contains driver-specific data for the ID3D11VideoContext::DecoderExtension method.
 * @remarks
 * 
  * The exact meaning of each structure member depends on the value of <b>Function</b>.
  * 
  * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11/ns-d3d11-d3d11_video_decoder_extension
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_VIDEO_DECODER_EXTENSION extends Win32Struct
{
    static sizeof => 48

    static packingSize => 8

    /**
     * The function number. This number identifies the operation to perform. Currently no function numbers are defined.
     * @type {Integer}
     */
    Function {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A pointer to a buffer that contains input data for the driver.
     * @type {Pointer<Void>}
     */
    pPrivateInputData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * The size of the <b>pPrivateInputData</b> buffer, in bytes.
     * @type {Integer}
     */
    PrivateInputDataSize {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * A pointer to a buffer that the driver can use to write output data.
     * @type {Pointer<Void>}
     */
    pPrivateOutputData {
        get => NumGet(this, 24, "ptr")
        set => NumPut("ptr", value, this, 24)
    }

    /**
     * The size of the <b>pPrivateOutputData</b> buffer, in bytes.
     * @type {Integer}
     */
    PrivateOutputDataSize {
        get => NumGet(this, 32, "uint")
        set => NumPut("uint", value, this, 32)
    }

    /**
     * The number of elements in the <b>ppResourceList</b> array. If <b>ppResourceList</b> is <b>NULL</b>, set <b>ResourceCount</b> to zero.
     * @type {Integer}
     */
    ResourceCount {
        get => NumGet(this, 36, "uint")
        set => NumPut("uint", value, this, 36)
    }

    /**
     * The address of an array of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11resource">ID3D11Resource</a> pointers. Use this member to pass Direct3D resources to the driver.
     * @type {Pointer<ID3D11Resource>}
     */
    ppResourceList {
        get => NumGet(this, 40, "ptr")
        set => NumPut("ptr", value, this, 40)
    }
}
