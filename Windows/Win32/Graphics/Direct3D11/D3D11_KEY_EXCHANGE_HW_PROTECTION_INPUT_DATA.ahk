#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents key exchange input data for hardware content protection.
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_input_data
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA extends Win32Struct
{
    static sizeof => 12

    static packingSize => 4

    /**
     * The size of the private data reserved for IHV usage. This size is determined from the <i>pPrivateInputSize</i> parameter returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-getcryptosessionprivatedatasize">ID3D11VideoDevice1::GetCryptoSessionPrivateDataSize</a> function.
     * @type {Integer}
     */
    PrivateDataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The size of the DRM command data.
     * @type {Integer}
     */
    HWProtectionDataSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * If <b>PrivateDataSize</b> is greater than 0,  pbInput[0] – <b>pbInput</b>[<b>PrivateDataSize</b> - 1] is reserved for IHV use.
     * 
     * <b>pbInput</b>[<b>PrivateDataSize</b>] – <b>pbInput</b>[<b>HWProtectionDataSize</b> + <b>PrivateDataSize</b> - 1] contains the input data for the DRM command. The format and size of the DRM command is defined by the DRM specification.
     * @type {Array<Byte>}
     */
    pbInput{
        get {
            if(!this.HasProp("__pbInputProxyArray"))
                this.__pbInputProxyArray := Win32FixedArray(this.ptr + 8, 4, Primitive, "char")
            return this.__pbInputProxyArray
        }
    }
}
