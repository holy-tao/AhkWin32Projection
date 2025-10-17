#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk

/**
 * Specifies the defect management state to be set.
 * @see https://docs.microsoft.com/windows/win32/api//winioctl/ns-winioctl-file_set_defect_mgmt_buffer
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FILE_SET_DEFECT_MGMT_BUFFER extends Win32Struct
{
    static sizeof => 1

    static packingSize => 1

    /**
     * If <b>TRUE</b>, indicates that defect management is disabled.
     * @type {BOOLEAN}
     */
    Disable {
        get => NumGet(this, 0, "char")
        set => NumPut("char", value, this, 0)
    }
}
