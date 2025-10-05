#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Used with IDXGIFactoryMedia::CreateDecodeSwapChainForCompositionSurfaceHandle to describe a decode swap chain.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/ns-dxgi1_3-dxgi_decode_swap_chain_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 * @version v4.0.30319
 */
class DXGI_DECODE_SWAP_CHAIN_DESC extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT</a></b>
     * 
     * Can be 0, or a combination of **DXGI_SWAP_CHAIN_FLAG_FULLSCREEN_VIDEO** and/or **DXGI_SWAP_CHAIN_FLAG_YUV_VIDEO**. Those named values are members of the <a href="https://docs.microsoft.com/windows/win32/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG</a> enumerated type, and you can combine them by using a bitwise OR operation. The resulting value specifies options for decode swap-chain behavior.
     * @type {Integer}
     */
    Flags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
