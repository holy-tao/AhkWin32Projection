#Requires AutoHotkey v2.1-alpha.26+ 64-bit

/**
 * The DDGETIRQINFO structure contains interrupt information for the video miniport driver.
 * @see https://learn.microsoft.com/windows/win32/api/dxmini/ns-dxmini-ddgetirqinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 */
export default struct DDGETIRQINFO {
    #StructPack 4

    /**
     * Specifies the interrupt management status.
     */
    dwFlags : UInt32

}
