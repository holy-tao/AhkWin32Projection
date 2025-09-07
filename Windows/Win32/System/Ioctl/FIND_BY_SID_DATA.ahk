#Requires AutoHotkey v2.0.0 64-bit
#Include ..\..\..\..\Win32Struct.ahk
#Include ..\..\Security\SID_IDENTIFIER_AUTHORITY.ahk
#Include ..\..\Security\SID.ahk

/**
 * Contains data for the FSCTL_FIND_FILES_BY_SID control code.
 * @see https://learn.microsoft.com/windows/win32/api/winioctl/ns-winioctl-find_by_sid_data
 * @namespace Windows.Win32.System.Ioctl
 * @version v4.0.30319
 */
class FIND_BY_SID_DATA extends Win32Struct
{
    static sizeof => 32

    static packingSize => 8

    /**
     * Indicates whether to restart the search. This member should be 1 on first call, so the search will start 
     *       from the root. For subsequent calls, this member should be zero so the search will resume at the point where it 
     *       stopped.
     * @type {Integer}
     */
    Restart {
        get => NumGet(this, 0, "uint")
        set => NumPut("uint", value, this, 0)
    }

    /**
     * A <a href="https://docs.microsoft.com/windows/desktop/api/winnt/ns-winnt-sid">SID</a> structure that specifies the desired creator 
     *       owner.
     * @type {SID}
     */
    Sid{
        get {
            if(!this.HasProp("__Sid"))
                this.__Sid := SID(this.ptr + 8)
            return this.__Sid
        }
    }
}
