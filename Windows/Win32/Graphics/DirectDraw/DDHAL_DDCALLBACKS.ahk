#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DDCALLBACKS {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    DestroyDriver : IntPtr

    CreateSurface : IntPtr

    SetColorKey : IntPtr

    SetMode : IntPtr

    WaitForVerticalBlank : IntPtr

    CanCreateSurface : IntPtr

    CreatePalette : IntPtr

    GetScanLine : IntPtr

    SetExclusiveMode : IntPtr

    FlipToGDISurface : IntPtr

}
