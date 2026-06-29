#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA.ahk" { D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA }
#Import ".\D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA.ahk" { D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA }
#Import "..\..\Foundation\HRESULT.ahk" { HRESULT }

/**
 * Represents key exchange data for hardware content protection.
 * @remarks
 * A pointer to this structure is passed in the <i>pData</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-negotiatecryptosessionkeyexchange">ID3D11VideoContext::NegotiateCryptoSessionKeyExchange</a> method when the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> is creating using the <b>D3D11_KEY_EXCHANGE_HW_PROTECTION</b> key exchange type.
 * @see https://learn.microsoft.com/windows/win32/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_data
 * @namespace Windows.Win32.Graphics.Direct3D11
 */
export default struct D3D11_KEY_EXCHANGE_HW_PROTECTION_DATA {
    #StructPack 8

    /**
     * The function ID of the DRM command. The values and meanings of the function ID are defined by the DRM specification.
     */
    HWProtectionFunctionID : UInt32

    /**
     * Pointer to a buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_input_data">D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA</a> structure that specifies memory reserved for IHV use and the input data for the DRM command.
     */
    pInputData : D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA.Ptr

    /**
     * Pointer to a buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_output_data">D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA</a> structure that specifies memory reserved for IHV use and the input data for the DRM command.
     */
    pOutputData : D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA.Ptr

    /**
     * The result of the hardware DRM command.
     */
    Status : HRESULT

}
