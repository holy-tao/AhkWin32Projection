#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * The ICSETSTATUSPROC structure contains status information used with the ICM_SET_STATUS_PROC message.
 * @see https://docs.microsoft.com/windows/win32/api//vfw/ns-vfw-icsetstatusproc
 * @namespace Windows.Win32.Media.Multimedia
 * @version v4.0.30319
 */
class ICSETSTATUSPROC extends Win32Struct
{
    static sizeof => 24

    static packingSize => 8

    /**
     * Reserved; set to zero.
     * @type {Integer}
     */
    dwFlags {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * Parameter that contains a constant to pass to the status procedure.
     * @type {Pointer}
     */
    lParam {
        get => NumGet(this, 8, "ptr")
        set => NumPut("ptr", value, this, 8)
    }

    /**
     * 
     * @type {Pointer}
     */
    Status {
        get => NumGet(this, 16, "ptr")
        set => NumPut("ptr", value, this, 16)
    }
}
