#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents key exchange output data for hardware content protection.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_output_data
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA extends Win32Struct
{
    static sizeof => 40

    static packingSize => 8

    /**
     * The size of the private data reserved for IHV usage. This size is determined from the <i>pPrivateOutputSize</i> parameter returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-getcryptosessionprivatedatasize">ID3D11VideoDevice1::GetCryptoSessionPrivateDataSize</a> function.
     * @type {Integer}
     */
    PrivateDataSize {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * The maximum size of data that the driver can return in the output buffer. The last byte that it can write to is <b>pbOutput</b>[<b>PrivateDataSize</b> + <b>MaxHWProtectionDataSize</b> – 1].
     * @type {Integer}
     */
    MaxHWProtectionDataSize {
        get => NumGet(this, 4, "uint")
        set => NumPut("uint", value, this, 4)
    }

    /**
     * The size of the output data written by the driver.
     * @type {Integer}
     */
    HWProtectionDataSize {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }

    /**
     * The number of 100 nanosecond units spent transporting the data.
     * @type {Integer}
     */
    TransportTime {
        get => NumGet(this, 16, "uint")
        set => NumPut("uint", value, this, 16)
    }

    /**
     * The number of 100 nanosecond units spent executing the content protection command.
     * @type {Integer}
     */
    ExecutionTime {
        get => NumGet(this, 24, "uint")
        set => NumPut("uint", value, this, 24)
    }

    /**
     * If <b>PrivateDataSize</b> is greater than 0,  pbInput[0] – <b>pbOutput</b>[<b>PrivateDataSize</b> - 1] is reserved for IHV use.
     * 
     * <b>pbOutput</b>[<b>PrivateDataSize</b>] – <b>pbOutput</b>[<b>HWProtectionDataSize</b> + <b>PrivateDataSize</b> - 1] contains the input data for the DRM command. The format and size of the DRM command is defined by the DRM specification.
     * @type {Array<Byte>}
     */
    pbOutput{
        get {
            if(!this.HasProp("__pbOutputProxyArray"))
                this.__pbOutputProxyArray := Win32FixedArray(this.ptr + 32, 1, Primitive, "char")
            return this.__pbOutputProxyArray
        }
    }
}
