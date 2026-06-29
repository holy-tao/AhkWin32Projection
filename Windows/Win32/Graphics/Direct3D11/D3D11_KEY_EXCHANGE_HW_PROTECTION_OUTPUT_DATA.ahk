#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Represents key exchange output data for hardware content protection.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_output_data
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA {
    #StructPack 8

    /**
     * The size of the private data reserved for IHV usage. This size is determined from the <i>pPrivateOutputSize</i> parameter returned by the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/nf-d3d11_1-id3d11videodevice1-getcryptosessionprivatedatasize">ID3D11VideoDevice1::GetCryptoSessionPrivateDataSize</a> function.
     */
    PrivateDataSize : UInt32

    /**
     * The maximum size of data that the driver can return in the output buffer. The last byte that it can write to is <b>pbOutput</b>[<b>PrivateDataSize</b> + <b>MaxHWProtectionDataSize</b> – 1].
     */
    MaxHWProtectionDataSize : UInt32

    /**
     * The size of the output data written by the driver.
     */
    HWProtectionDataSize : UInt32

    /**
     * The number of 100 nanosecond units spent transporting the data.
     */
    TransportTime : Int64

    /**
     * The number of 100 nanosecond units spent executing the content protection command.
     */
    ExecutionTime : Int64

    /**
     * If <b>PrivateDataSize</b> is greater than 0,  pbInput[0] – <b>pbOutput</b>[<b>PrivateDataSize</b> - 1] is reserved for IHV use.
     * 
     * <b>pbOutput</b>[<b>PrivateDataSize</b>] – <b>pbOutput</b>[<b>HWProtectionDataSize</b> + <b>PrivateDataSize</b> - 1] contains the input data for the DRM command. The format and size of the DRM command is defined by the DRM specification.
     */
    pbOutput : Int8[4]

}
