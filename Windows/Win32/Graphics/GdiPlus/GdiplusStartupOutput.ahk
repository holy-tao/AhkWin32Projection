#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.GdiPlus
 */
export default struct GdiplusStartupOutput {
    #StructPack 8

    NotificationHook : IntPtr

    NotificationUnhook : IntPtr

}
