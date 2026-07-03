#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.Printing
 */
export default struct NOTIFICATION_CONFIG_1 {
    #StructPack 8

    cbSize : UInt32 := this.Size

    fdwFlags : UInt32

    pfnNotifyCallback : IntPtr

    pContext : IntPtr

}
