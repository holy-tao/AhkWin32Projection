#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The DDGETCURRENTAUTOFLIPININFO structure contains the video port extensions (VPE) object information.
 * @see https://docs.microsoft.com/windows/win32/api//dxmini/ns-dxmini-ddgetcurrentautoflipininfo
 * @namespace Windows.Win32.Graphics.DirectDraw
 * @version v4.0.30319
 */
class DDGETCURRENTAUTOFLIPININFO extends Win32Struct
{
    static sizeof => 8

    static packingSize => 8

    /**
     * Points to a <a href="https://docs.microsoft.com/windows/desktop/api/dxmini/ns-dxmini-ddvideoportdata">DDVIDEOPORTDATA</a> structure that contains the VPE object information.
     * @type {Pointer<DDVIDEOPORTDATA>}
     */
    lpVideoPortData {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }
}
