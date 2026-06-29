#Requires AutoHotkey v2.1-alpha.26+ 64-bit
#Import ".\D3D12_TRIM_NOTIFICATION_FLAGS.ahk" { D3D12_TRIM_NOTIFICATION_FLAGS }

/**
 * @namespace Windows.Win32.Graphics.Direct3D12
 */
export default struct D3D12_TRIM_NOTIFICATION {
    #StructPack 8

    pContext : IntPtr

    Flags : D3D12_TRIM_NOTIFICATION_FLAGS

    NumBytesToTrim : Int64

}
