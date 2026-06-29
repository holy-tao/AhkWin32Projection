#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DDMOTIONCOMPCALLBACKS {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    GetMoCompGuids : IntPtr

    GetMoCompFormats : IntPtr

    CreateMoComp : IntPtr

    GetMoCompBuffInfo : IntPtr

    GetInternalMoCompInfo : IntPtr

    BeginMoCompFrame : IntPtr

    EndMoCompFrame : IntPtr

    RenderMoComp : IntPtr

    QueryMoCompStatus : IntPtr

    DestroyMoComp : IntPtr

}
