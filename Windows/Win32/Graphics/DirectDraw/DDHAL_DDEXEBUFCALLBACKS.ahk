#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDHAL_DDEXEBUFCALLBACKS {
    #StructPack 8

    dwSize : UInt32

    dwFlags : UInt32

    CanCreateExecuteBuffer : IntPtr

    CreateExecuteBuffer : IntPtr

    DestroyExecuteBuffer : IntPtr

    LockExecuteBuffer : IntPtr

    UnlockExecuteBuffer : IntPtr

}
