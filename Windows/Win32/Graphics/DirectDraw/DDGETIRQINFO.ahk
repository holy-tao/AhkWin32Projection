#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDGETIRQINFO structure contains interrupt information for the video miniport driver.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddgetirqinfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDGETIRQINFO extends Win32Struct
{
    static sizeof => 4

    static packingSize => 4

    /**
     * Specifies the interrupt management status.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }
}
