#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies Desktop Window Manager (DWM) blur-behind properties. Used by the DwmEnableBlurBehindWindow function.
 * @see https://learn.microsoft.com/windows/win32/api/dwmapi/ns-dwmapi-dwm_blurbehind
 * @namespace Windows.Win32.Graphics.Dwm
 * @version v4.0.30319
 */
class DWM_BLURBEHIND extends Win32Struct
{
    static sizeof => 20

    static packingSize => 1

    /**
     * A bitwise combination of <a href="https://docs.microsoft.com/windows/desktop/dwm/dwm-bb-constants">DWM Blur Behind</a> constant values that indicates which of the members of this structure have been set.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * <b>TRUE</b> to register the window handle to DWM blur behind; <b>FALSE</b> to unregister the window handle from DWM blur behind.
     * @type {Integer}
     */
    fEnable {
        get => NumGet(this, 4, "int")
        set => NumPut("int", value, this, 4)
    }

    /**
     * The region within the client area where the blur behind will be applied. A <b>NULL</b> value will apply the blur behind the entire client area.
     * @type {Pointer<Ptr>}
     */
    hRgnBlur {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * <b>TRUE</b> if the window's colorization should transition to match the maximized windows; otherwise, <b>FALSE</b>.
     * @type {Integer}
     */
    fTransitionOnMaximized {
        get => NumGet(this, 16, "int")
        set => NumPut("int", value, this, 16)
    }
}
