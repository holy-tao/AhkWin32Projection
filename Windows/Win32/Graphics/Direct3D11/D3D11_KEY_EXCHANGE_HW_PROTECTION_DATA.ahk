#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Represents key exchange data for hardware content protection.
 * @remarks
 * 
 * A pointer to this structure is passed in the <i>pData</i> parameter of <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nf-d3d11-id3d11videocontext-negotiatecryptosessionkeyexchange">ID3D11VideoContext::NegotiateCryptoSessionKeyExchange</a> method when the <a href="https://docs.microsoft.com/windows/desktop/api/d3d11/nn-d3d11-id3d11cryptosession">ID3D11CryptoSession</a> is creating using the <b>D3D11_KEY_EXCHANGE_HW_PROTECTION</b> key exchange type.
 * 
 * 
 * @see https://docs.microsoft.com/windows/win32/api//d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_data
 * @namespace Windows.Win32.Graphics.Direct3D11
 * @version v4.0.30319
 */
class D3D11_KEY_EXCHANGE_HW_PROTECTION_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * The function ID of the DRM command. The values and meanings of the function ID are defined by the DRM specification.
     * @type {Integer}
     */
    HWProtectionFunctionID {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Pointer to a buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_input_data">D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA</a> structure that specifies memory reserved for IHV use and the input data for the DRM command.
     * @type {Pointer<D3D11_KEY_EXCHANGE_HW_PROTECTION_INPUT_DATA>}
     */
    pInputData {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * Pointer to a buffer containing a <a href="https://docs.microsoft.com/windows/desktop/api/d3d11_1/ns-d3d11_1-d3d11_key_exchange_hw_protection_output_data">D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA</a> structure that specifies memory reserved for IHV use and the input data for the DRM command.
     * @type {Pointer<D3D11_KEY_EXCHANGE_HW_PROTECTION_OUTPUT_DATA>}
     */
    pOutputData {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }

    /**
     * The result of the hardware DRM command.
     * @type {HRESULT}
     */
    Status {
        get => NumGet(this, 24, "int")
        set => NumPut("int", value, this, 24)
    }
}
