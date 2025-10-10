#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The GdiplusStartup function uses the GdiplusStartupOutput structure to return (in its output parameter) a pointer to a hook function and a pointer to an unhook function.
 * @see https://docs.microsoft.com/windows/win32/api//gdiplusinit/ns-gdiplusinit-gdiplusstartupoutput
 * @namespace Windows.Win32.Graphics.GdiPlus
 * @version v4.0.30319
 */
class GdiplusStartupOutput extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>NotificationHookProc</b>
     * 
     * Receives a pointer to a hook function.
     * @type {Pointer}
     */
    NotificationHook {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>NotificationUnhookProc</b>
     * 
     * Receives a pointer to an unhook function.
     * @type {Pointer}
     */
    NotificationUnhook {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }
}
