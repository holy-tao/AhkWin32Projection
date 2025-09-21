#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Accelerator table structure. Used by IPreviewHandlerFrame::GetWindowContext.
 * @see https://learn.microsoft.com/windows/win32/api/shobjidl_core/ns-shobjidl_core-previewhandlerframeinfo
 * @namespace Windows.Win32.UI.Shell
 * @version v4.0.30319
 */
class PREVIEWHANDLERFRAMEINFO extends Win32Struct
{
    static sizeof => 16

    static packingSize => 8

    /**
     * Type: <b>HACCEL</b>
     * 
     * A handle to the accelerator table.
     * @type {Pointer<Void>}
     */
    haccel {
        get => NumGet(this, 0, "ptr")
        set => NumPut("ptr", value, this, 0)
    }

    /**
     * Type: <b>UINT</b>
     * 
     * The number of entries in the accelerator table.
     * @type {Integer}
     */
    cAccelEntries {
        get => NumGet(this, 8, "uint")
        set => NumPut("uint", value, this, 8)
    }
}
