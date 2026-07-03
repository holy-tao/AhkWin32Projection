#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_REGISTER_TRIM_NOTIFICATION {
    #StructPack 8

    pfnCallback : IntPtr

    pContext : IntPtr

    CallbackCookie : UInt32

}
