#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * Used with IDXGIFactoryMedia::CreateDecodeSwapChainForCompositionSurfaceHandle to describe a decode swap chain.
 * @see https://learn.microsoft.com/windows/win32/api/dxgi1_3/ns-dxgi1_3-dxgi_decode_swap_chain_desc
 * @namespace Windows.Win32.Graphics.Dxgi
 */
export default struct DXGI_DECODE_SWAP_CHAIN_DESC {
    #StructPack 4

    /**
     * Type: <b><a href="https://docs.microsoft.com/windows/win32/WinProg/windows-data-types">UINT</a></b>
     * 
     * Can be 0, or a combination of **DXGI_SWAP_CHAIN_FLAG_FULLSCREEN_VIDEO** and/or **DXGI_SWAP_CHAIN_FLAG_YUV_VIDEO**. Those named values are members of the <a href="https://docs.microsoft.com/windows/win32/api/dxgi/ne-dxgi-dxgi_swap_chain_flag">DXGI_SWAP_CHAIN_FLAG</a> enumerated type, and you can combine them by using a bitwise OR operation. The resulting value specifies options for decode swap-chain behavior.
     */
    Flags : UInt32

}
