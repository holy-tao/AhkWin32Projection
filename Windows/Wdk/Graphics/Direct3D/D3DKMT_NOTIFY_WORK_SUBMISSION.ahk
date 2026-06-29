#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Wdk.Graphics.Direct3D
 */
export default struct D3DKMT_NOTIFY_WORK_SUBMISSION {
    #StructPack 8

    hHwQueue : UInt32

    Flags : IntPtr

}
