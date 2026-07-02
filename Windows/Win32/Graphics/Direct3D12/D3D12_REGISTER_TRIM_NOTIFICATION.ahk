#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_PFN_TRIM_NOTIFICATION_CALLBACK.ahk" { D3D12_PFN_TRIM_NOTIFICATION_CALLBACK }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_REGISTER_TRIM_NOTIFICATION {
    #StructPack 8

    pfnCallback : D3D12_PFN_TRIM_NOTIFICATION_CALLBACK

    pContext : IntPtr

    CallbackCookie : UInt32

}
