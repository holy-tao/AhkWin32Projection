#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DDSURFACECALLBACKS {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    DestroySurface : IntPtr

    Flip : IntPtr

    SetClipList : IntPtr

    Lock : IntPtr

    Unlock : IntPtr

    Blt : IntPtr

    SetColorKey : IntPtr

    AddAttachedSurface : IntPtr

    GetBltStatus : IntPtr

    GetFlipStatus : IntPtr

    UpdateOverlay : IntPtr

    SetOverlayPosition : IntPtr

    reserved4 : IntPtr

    SetPalette : IntPtr

}
